// Ghidra script: export every function's decompiled C, a function table and
// a string table to plain text files so they can be searched with grep.
//
// What it does:
//     Runs inside Ghidra's headless analyzer after the game executable has
//     been imported and auto-analyzed. It decompiles every function in the
//     program (using all CPU cores) and writes the results into one text file
//     per 1 MiB of address space, so a single grep over the folder searches
//     the whole game. It also writes functions.tsv (one line per function)
//     strings.tsv (one line per string the analysis found) and symbols.tsv
//     (one line per named label, such as a class's virtual function table).
//
// Key terms:
//     RVA ("relative virtual address") - an offset inside the game executable
//         counted from the start of the loaded image. The rest of this
//         project names game code by RVA, so every exported line carries one.
//     Decompiled C - Ghidra's reconstruction of a function as C-like source.
//         Names such as FUN_1400e13cf0 are made up from the address; types
//         and local names are guesses. Only the control flow and the
//         constants are reliable.
//
// Arguments (analyzeHeadless ... -postScript ExportDecompiled.java <outDir>):
//     outDir - folder to write into. Created if missing.
//
// Output:
//     <outDir>/functions.tsv        rva, size, name, namespace, convention
//     <outDir>/strings.tsv          rva, data type, text (escaped)
//     <outDir>/symbols.tsv          rva, name, namespace, symbol type
//     <outDir>/decomp/rva_<hex>.c   decompiled functions, grouped by RVA >> 20
//@category PywelAtlas

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ghidra.app.decompiler.DecompInterface;
import ghidra.app.decompiler.DecompileOptions;
import ghidra.app.decompiler.DecompileResults;
import ghidra.app.decompiler.DecompiledFunction;
import ghidra.app.decompiler.parallel.DecompileConfigurer;
import ghidra.app.decompiler.parallel.DecompilerCallback;
import ghidra.app.decompiler.parallel.ParallelDecompiler;
import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.Address;
import ghidra.program.model.data.AbstractStringDataType;
import ghidra.program.model.data.DataType;
import ghidra.program.model.listing.Data;
import ghidra.program.model.listing.DataIterator;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionIterator;
import ghidra.program.model.symbol.Namespace;
import ghidra.program.model.symbol.SourceType;
import ghidra.program.model.symbol.Symbol;
import ghidra.program.model.symbol.SymbolIterator;
import ghidra.program.model.symbol.SymbolType;
import ghidra.util.task.TaskMonitor;

public class ExportDecompiled extends GhidraScript {

  // One output chunk covers 2^20 bytes (1 MiB) of address space.
  private static final int CHUNK_SHIFT = 20;

  // Open writers for the chunk files, keyed by chunk index. Access is
  // synchronized because decompiler results arrive from worker threads.
  private final Map<Long, Writer> chunkWriters = new HashMap<>();

  private long imageBase;
  private Path decompDir;

  @Override
  protected void run() throws Exception {
    String[] args = getScriptArgs();
    if (args.length < 1) {
      printerr("usage: ExportDecompiled.java <outDir>");
      return;
    }

    Path outDir = Paths.get(args[0]);
    decompDir = outDir.resolve("decomp");
    Files.createDirectories(decompDir);

    imageBase = currentProgram.getImageBase().getOffset();
    println("Image base 0x" + Long.toHexString(imageBase));

    exportFunctionTable(outDir.resolve("functions.tsv"));
    exportStrings(outDir.resolve("strings.tsv"));
    exportSymbols(outDir.resolve("symbols.tsv"));
    exportDecompiledCode();

    println("Export finished: " + outDir);
  }

  // Converts a program address to the RVA convention used by the rest of
  // this project.
  private long rvaOf(Address address) {
    return address.getOffset() - imageBase;
  }

  // Writes one line per function: where it is, how big it is and what Ghidra
  // calls it. The namespace column shows the C++ class when RTTI named it.
  private void exportFunctionTable(Path file) throws IOException {
    try (Writer writer = newWriter(file)) {
      writer.write("rva\tsize\tname\tnamespace\tcalling_convention\tparams\n");

      FunctionIterator functions = currentProgram.getListing().getFunctions(true);
      long count = 0;

      while (functions.hasNext() && !monitor.isCancelled()) {
        Function function = functions.next();
        Namespace namespace = function.getParentNamespace();
        String namespaceName = namespace.isGlobal() ? "" : namespace.getName(true);

        writer.write(String.format(
            "%x\t%d\t%s\t%s\t%s\t%d\n",
            rvaOf(function.getEntryPoint()),
            function.getBody().getNumAddresses(),
            function.getName(),
            namespaceName,
            String.valueOf(function.getCallingConventionName()),
            function.getParameterCount()));
        count++;
      }

      println("functions.tsv: " + count + " functions");
    }
  }

  // Writes one line per defined string (ASCII, UTF-8 or UTF-16). Tabs and
  // newlines inside the text are escaped so each string stays on one line.
  private void exportStrings(Path file) throws IOException {
    try (Writer writer = newWriter(file)) {
      writer.write("rva\ttype\ttext\n");

      DataIterator dataIterator = currentProgram.getListing().getDefinedData(true);
      long count = 0;

      while (dataIterator.hasNext() && !monitor.isCancelled()) {
        Data data = dataIterator.next();
        DataType type = data.getBaseDataType();

        if (!(type instanceof AbstractStringDataType)) {
          continue;
        }

        Object value = data.getValue();
        if (!(value instanceof String)) {
          continue;
        }

        writer.write(String.format(
            "%x\t%s\t%s\n",
            rvaOf(data.getAddress()),
            type.getName(),
            escape((String) value)));
        count++;
      }

      println("strings.tsv: " + count + " strings");
    }
  }

  // Writes one line per named label that is not a function: class virtual
  // function tables ("vftable" inside the class namespace), RTTI records,
  // imports and named data. Labels Ghidra made up from an address (DAT_...,
  // LAB_...) are skipped; they carry no information beyond the RVA.
  private void exportSymbols(Path file) throws IOException {
    try (Writer writer = newWriter(file)) {
      writer.write("rva\tname\tnamespace\ttype\n");

      SymbolIterator symbols = currentProgram.getSymbolTable().getAllSymbols(false);
      long count = 0;

      while (symbols.hasNext() && !monitor.isCancelled()) {
        Symbol symbol = symbols.next();
        SymbolType type = symbol.getSymbolType();

        if (symbol.getSource() == SourceType.DEFAULT) {
          continue;
        }
        if (type == SymbolType.FUNCTION || !symbol.getAddress().isMemoryAddress()) {
          continue;
        }

        Namespace namespace = symbol.getParentNamespace();
        String namespaceName = namespace.isGlobal() ? "" : namespace.getName(true);

        writer.write(String.format(
            "%x\t%s\t%s\t%s\n",
            rvaOf(symbol.getAddress()),
            symbol.getName(),
            namespaceName,
            type.toString()));
        count++;
      }

      println("symbols.tsv: " + count + " symbols");
    }
  }

  // Decompiles every function on all cores and streams the C text into the
  // chunk files. A function that fails to decompile still gets a header line
  // with the error, so a missing function is visible rather than silent.
  private void exportDecompiledCode() throws Exception {
    List<Function> functions = new ArrayList<>();
    FunctionIterator iterator = currentProgram.getListing().getFunctions(true);
    while (iterator.hasNext()) {
      functions.add(iterator.next());
    }
    println("Decompiling " + functions.size() + " functions ...");

    DecompileConfigurer configurer = (DecompInterface decompiler) -> {
      decompiler.toggleCCode(true);
      decompiler.toggleSyntaxTree(false);
      decompiler.setSimplificationStyle("decompile");

      DecompileOptions options = new DecompileOptions();
      options.grabFromProgram(currentProgram);
      decompiler.setOptions(options);
    };

    DecompilerCallback<String> callback =
        new DecompilerCallback<String>(currentProgram, configurer) {
          @Override
          public String process(DecompileResults results, TaskMonitor taskMonitor) {
            Function function = results.getFunction();
            StringBuilder text = new StringBuilder();

            text.append(String.format(
                "// ===== FUNC rva=%x va=%x size=%d name=%s =====\n",
                rvaOf(function.getEntryPoint()),
                function.getEntryPoint().getOffset(),
                function.getBody().getNumAddresses(),
                function.getName(true)));

            DecompiledFunction decompiled = results.getDecompiledFunction();
            if (decompiled == null || !results.decompileCompleted()) {
              text.append("// decompile failed: ")
                  .append(results.getErrorMessage())
                  .append("\n");
            } else {
              text.append(decompiled.getC());
            }
            text.append("\n");

            writeChunk(rvaOf(function.getEntryPoint()), text.toString());
            return null;
          }
        };

    try {
      ParallelDecompiler.decompileFunctions(
          callback, currentProgram, functions.iterator(), (String ignored) -> {}, monitor);
    } finally {
      callback.dispose();
      closeChunkWriters();
    }
  }

  // Appends one function's text to the chunk file for its RVA range.
  private synchronized void writeChunk(long rva, String text) {
    long chunk = rva >> CHUNK_SHIFT;
    try {
      Writer writer = chunkWriters.get(chunk);
      if (writer == null) {
        Path file = decompDir.resolve(String.format("rva_%03x.c", chunk));
        writer = newWriter(file);
        chunkWriters.put(chunk, writer);
      }
      writer.write(text);
    } catch (IOException error) {
      printerr("write failed for rva " + Long.toHexString(rva) + ": " + error);
    }
  }

  // Flushes and closes every chunk file once decompilation is done.
  private synchronized void closeChunkWriters() throws IOException {
    for (Writer writer : chunkWriters.values()) {
      writer.close();
    }
    chunkWriters.clear();
  }

  // UTF-8 writer with a large buffer; these files are tens of megabytes.
  private static Writer newWriter(Path file) throws IOException {
    return new BufferedWriter(
        new OutputStreamWriter(Files.newOutputStream(file), StandardCharsets.UTF_8),
        1 << 20);
  }

  // Keeps one string per line in the TSV output.
  private static String escape(String text) {
    return text
        .replace("\\", "\\\\")
        .replace("\t", "\\t")
        .replace("\r", "\\r")
        .replace("\n", "\\n");
  }
}
