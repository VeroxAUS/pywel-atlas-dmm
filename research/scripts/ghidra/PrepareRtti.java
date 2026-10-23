/*
 * Let Ghidra's class-name (RTTI) analyzer find the game's C++ classes
 * (a headless "pre-script", run before a re-analysis of the saved project).
 *
 * Why: the section names in CrimsonDesert.exe are misleading. The section
 * called ".rdata" is really the writable data section (it holds the 15,931
 * class type descriptors), ".xdata" is really the read-only data section
 * (it holds the virtual function tables and their RTTI locators), and
 * ".rsrc" is really the code section (all 188,346 functions live there,
 * while the section called ".text" holds none). Ghidra's "Windows x86 PE
 * RTTI Analyzer" only searches memory blocks named ".data", ".rdata" and
 * ".text", and it only accepts a virtual function table whose entries point
 * into the block named ".text". So during the first analysis it found no
 * classes and recorded "RTTI Found = false", and that record also makes
 * every later run skip the analyzer in zero seconds. A second run with only
 * the data blocks renamed found all 15,165 locators but rejected every
 * table because the functions were in ".rsrc".
 *
 * What it does:
 *   1. Renames memory blocks so they carry the names the analyzer expects
 *      for their contents: ".rdata" to ".data", ".xdata" to ".rdata", the
 *      empty ".text" to ".text.orig" and ".rsrc" to ".text". Blocks are
 *      picked by their start address, not their current name, so the script
 *      can run again without renaming the wrong block. Only the names
 *      change; addresses and bytes stay the same, and the export names
 *      everything by address.
 *   2. Removes the "RTTI Found" record when it says "false", so the analyzer
 *      runs again. A "true" record is kept: the classes are already named.
 *   3. Confirms the compiler is Visual Studio (the analyzer's other gate).
 *      The loader already records "visualstudio:unknown", which passes.
 *
 * Key terms:
 *   RTTI - "run-time type information", the class-name records a C++
 *       compiler leaves in the executable. Ghidra uses them to name classes
 *       and their virtual function tables ("vftables").
 *   Memory block - Ghidra's copy of one section of the executable.
 *
 * Run: research/scripts/ghidra/run-headless.ps1 rtti
 *      (passed as "-preScript PrepareRtti.java" before a re-analysis).
 */
//@category PywelAtlas

import ghidra.app.script.GhidraScript;
import ghidra.app.util.opinion.PeLoader.CompilerOpinion.CompilerEnum;
import ghidra.framework.options.Options;
import ghidra.program.model.address.Address;
import ghidra.program.model.listing.Program;
import ghidra.program.model.mem.MemoryBlock;

public class PrepareRtti extends GhidraScript {

  // Program option the RTTI analyzer writes after its first run.
  private static final String RTTI_FOUND_OPTION = "RTTI Found";

  // Block renames as {block start address, original section name, name the
  // analyzer expects}. The start address identifies the block whatever it is
  // called now. The order matters: ".text" must be freed before ".rsrc"
  // takes that name.
  private static final Object[][] RENAMES = {
    { 0x146893000L, ".rdata", ".data" },
    { 0x1451eb000L, ".xdata", ".rdata" },
    { 0x156f10000L, ".text", ".text.orig" },
    { 0x140001000L, ".rsrc", ".text" },
  };

  @Override
  public void run() throws Exception {
    for (Object[] rename : RENAMES) {
      renameBlock((Long) rename[0], (String) rename[1], (String) rename[2]);
    }

    Options programInfo = currentProgram.getOptions(Program.PROGRAM_INFO);
    if (programInfo.contains(RTTI_FOUND_OPTION)) {
      if (programInfo.getBoolean(RTTI_FOUND_OPTION, false)) {
        println("PrepareRtti: '" + RTTI_FOUND_OPTION + "' is true, classes are already named; record kept");
      } else {
        programInfo.removeOption(RTTI_FOUND_OPTION);
        println("PrepareRtti: cleared the '" + RTTI_FOUND_OPTION + "' record so the analyzer reruns");
      }
    }

    String compiler = currentProgram.getCompiler();
    String wanted = CompilerEnum.VisualStudio.toString();
    if (!wanted.equals(compiler)) {
      currentProgram.setCompiler(wanted);
      println("PrepareRtti: compiler changed from '" + compiler + "' to '" + wanted + "'");
    } else {
      println("PrepareRtti: compiler is '" + compiler + "' (passes the RTTI analyzer's check)");
    }
  }

  // Renames the memory block that starts at the given address, or reports
  // why it could not. Skips blocks that already have the wanted name.
  private void renameBlock(long start, String originalName, String to) throws Exception {
    Address address = currentProgram.getAddressFactory().getDefaultAddressSpace().getAddress(start);
    MemoryBlock block = currentProgram.getMemory().getBlock(address);
    if (block == null || !block.getStart().equals(address)) {
      println("PrepareRtti: no block starts at " + address + " (expected " + originalName + "), nothing renamed");
      return;
    }

    String current = block.getName();
    if (to.equals(current)) {
      println("PrepareRtti: block at " + address + " (" + originalName + ") is already named '" + to + "'");
      return;
    }

    block.setName(to);
    println("PrepareRtti: block at " + address + " (" + originalName + ") renamed from '" + current + "' to '" + to + "'");
  }
}
