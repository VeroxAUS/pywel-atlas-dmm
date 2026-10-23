/*
 * Prepare the freshly imported game executable before Ghidra's automatic
 * analysis runs (a headless "pre-script").
 *
 * What it does:
 *   1. Marks the ".xtls" section as not executable and removes the functions
 *      the loader created inside it. That section is 250 MB of start-up code
 *      and junk; disassembling it is what blew the first full-analysis run
 *      past a 22 GB heap. All the functions this project hooks live in
 *      ".rsrc", which is where the game's real code is (the section names in
 *      this executable are misleading).
 *   2. Tells the disassembler to stay inside executable memory, so follow-on
 *      analysis cannot wander back into ".xtls".
 *   3. Turns off two analyzers we do not need for reading pseudo-C and that
 *      are the slowest on a binary this size: "Create Address Tables" (the
 *      one that ran out of memory) and "Scalar Operand References" (took
 *      over three hours on its own).
 *
 * Key terms:
 *   Section / memory block - a named region of the executable. Ghidra keeps
 *       one "memory block" per section.
 *   Analyzer - one pass of Ghidra's automatic analysis, switchable by name.
 *
 * Run: passed to analyzeHeadless with "-preScript PrepareImport.java" by
 *      research/scripts/ghidra/run-headless.ps1 (import step).
 */
//@category PywelAtlas

import java.util.ArrayList;
import java.util.List;

import ghidra.app.script.GhidraScript;
import ghidra.framework.options.Options;
import ghidra.program.disassemble.Disassembler;
import ghidra.program.model.address.Address;
import ghidra.program.model.address.AddressSetView;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionIterator;
import ghidra.program.model.listing.Program;
import ghidra.program.model.mem.MemoryBlock;

public class PrepareImport extends GhidraScript {

  // Sections whose contents must not be analyzed as code.
  private static final String[] SKIPPED_SECTIONS = { ".xtls" };

  // Analyzers switched off for this import (names as shown in Ghidra's
  // analysis options dialog).
  private static final String[] DISABLED_ANALYZERS = {
    "Create Address Tables",
    "Scalar Operand References",
  };

  @Override
  public void run() throws Exception {
    for (String sectionName : SKIPPED_SECTIONS) {
      excludeSection(sectionName);
    }

    // Keep every later disassembly inside executable blocks only.
    Options options = currentProgram.getOptions(Program.DISASSEMBLER_PROPERTIES);
    options.setBoolean(Disassembler.RESTRICT_DISASSEMBLY_TO_EXECUTE_MEMORY_PROPERTY, true);
    println("PrepareImport: disassembly restricted to executable memory");

    for (String analyzerName : DISABLED_ANALYZERS) {
      setAnalysisOption(currentProgram, analyzerName, "false");
      println("PrepareImport: analyzer off: " + analyzerName);
    }
  }

  // Makes one section non-executable and drops the loader's function
  // markers inside it, so analysis never starts disassembling there.
  private void excludeSection(String sectionName) {
    MemoryBlock block = currentProgram.getMemory().getBlock(sectionName);
    if (block == null) {
      println("PrepareImport: section not found, nothing to exclude: " + sectionName);
      return;
    }

    block.setExecute(false);

    // Collect the entry points first: removing functions while the iterator
    // is still walking the database would be unsafe.
    AddressSetView range = currentProgram.getAddressFactory().getAddressSet(block.getStart(), block.getEnd());
    FunctionIterator functions = currentProgram.getFunctionManager().getFunctions(range, true);
    List<Address> entryPoints = new ArrayList<>();
    while (functions.hasNext() && !monitor.isCancelled()) {
      Function function = functions.next();
      entryPoints.add(function.getEntryPoint());
    }

    int removed = 0;
    for (Address entryPoint : entryPoints) {
      if (currentProgram.getFunctionManager().removeFunction(entryPoint)) {
        removed++;
      }
    }

    println("PrepareImport: " + sectionName + " marked non-executable, " + removed + " loader functions removed");
  }
}
