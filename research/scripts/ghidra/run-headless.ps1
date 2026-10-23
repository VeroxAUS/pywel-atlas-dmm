<#
Run Ghidra's headless analyzer on the game executable and export the result.

What it does:
    Step "import"  - imports CrimsonDesert.exe into a Ghidra project on the
                     D drive, runs PrepareImport.java (skips the ".xtls"
                     junk section, disables two slow analyzers) and then
                     Ghidra's automatic analysis (find functions, follow
                     references, name C++ classes from RTTI). This is the
                     slow step; expect hours for a 384 MB executable. The
                     project database is kept, so it only has to run once
                     per game version.
    Step "rtti"    - re-analyzes the saved project after PrepareRtti.java
                     gives the data sections the names Ghidra's class-name
                     (RTTI) analyzer expects, so it names C++ classes and
                     virtual function tables. Needed once after "import"
                     because the executable's section names are misleading
                     and the first analysis found no classes.
    Step "export"  - opens the analyzed project and runs ExportDecompiled.java,
                     which writes grep-friendly text files (functions.tsv,
                     strings.tsv, decomp/*.c) into the export folder.
    Both steps are read-only for the game: nothing under the Steam folder
    is modified.

Key terms:
    Headless - Ghidra running without its window, driven by this script.
    Project  - Ghidra's own database folder (several GB for this game). It
               lives on D because C has little free space.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
Writes: D:/Modding/pywel-atlas-ghidra/<project>.rep, .../export, .../logs
Run:    powershell -File research/scripts/ghidra/run-headless.ps1 import
        powershell -File research/scripts/ghidra/run-headless.ps1 rtti
        powershell -File research/scripts/ghidra/run-headless.ps1 rtti -RenameOnly
            (only fixes the block names and saves; no re-analysis)
        powershell -File research/scripts/ghidra/run-headless.ps1 export
        (from the repository root)
#>

param(
  [Parameter(Mandatory = $true)]
  [ValidateSet('import', 'rtti', 'export')]
  [string]$Step,

  [string]$Ghidra = 'research/vendor/ghidra_12.2_PUBLIC',

  # Ghidra 12.2 needs JDK 25 or newer. The machine's own Java is JDK 21, so a
  # portable Temurin JDK 25 is unpacked next to Ghidra and used only here.
  [string]$Jdk = 'research/vendor/jdk-25',
  [string]$Exe = 'E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe',
  [string]$ProjectDir = 'D:/Modding/pywel-atlas-ghidra',
  [string]$ProjectName = 'CrimsonDesert',

  # Java heap for Ghidra. The machine has 32 GB; leave room for the OS.
  [string]$MaxMem = '22G',

  # For the "rtti" step: run PrepareRtti.java and save without re-analyzing.
  # Useful when only the block names need correcting (takes about a minute).
  [switch]$RenameOnly
)

$ErrorActionPreference = 'Stop'
$repoRoot = Resolve-Path (Join-Path $PSScriptRoot '../../..')
$ghidraRoot = Resolve-Path (Join-Path $repoRoot $Ghidra)
$headless = Join-Path $ghidraRoot 'support/analyzeHeadless.bat'
$scriptDir = Join-Path $repoRoot 'research/scripts/ghidra'
$logDir = Join-Path $ProjectDir 'logs'
$exportDir = Join-Path $ProjectDir 'export'

New-Item -ItemType Directory -Force $ProjectDir, $logDir, $exportDir | Out-Null

# analyzeHeadless.bat reads this variable for the Java heap size (its own
# default is only 2 GB, far too small for a 384 MB executable).
$env:GHIDRA_HEADLESS_MAXMEM = $MaxMem

# Point Ghidra's launcher at the portable JDK 25 for this process only; the
# user's system-wide JAVA_HOME is left untouched.
$env:JAVA_HOME = (Resolve-Path (Join-Path $repoRoot $Jdk)).Path

# Keep Ghidra's own settings, cache and temp folders out of AppData. When this
# script is started from a packaged (Store/MSIX) app such as the Claude desktop
# app, Windows silently redirects AppData writes to a per-app folder. JDK 25
# resolves that redirect for existing folders but not for new files, and
# Ghidra's script framework (Felix) then aborts with "The data file must be
# inside the data dir". Folders on D are not redirected.
$settingsDir = Join-Path $ProjectDir 'settings'
$cacheDir = Join-Path $ProjectDir 'cache'
$tempDir = Join-Path $ProjectDir 'temp'
New-Item -ItemType Directory -Force $settingsDir, $cacheDir, $tempDir | Out-Null
$env:GHIDRA_HEADLESS_JAVA_OPTIONS = (
  "-Dapplication.settingsdir=$settingsDir " +
  "-Dapplication.cachedir=$cacheDir " +
  "-Dapplication.tempdir=$tempDir " +
  "-Djava.io.tmpdir=$tempDir " +
  # The launcher's default of two garbage-collector threads is too few for a
  # 22 GB heap; later -XX flags override earlier ones.
  '-XX:ParallelGCThreads=8'
)

$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'

if ($Step -eq 'import') {
  $log = Join-Path $logDir "import-$stamp.log"
  Write-Host "Importing and analyzing $Exe (log: $log)"
  # PrepareImport.java runs before analysis: it keeps the junk-filled ".xtls"
  # section out of the disassembly and turns off the two analyzers that made
  # the first full run exhaust a 22 GB heap after eight hours.
  & $headless $ProjectDir $ProjectName `
    -import $Exe `
    -loader PeLoader `
    -scriptPath $scriptDir `
    -preScript PrepareImport.java `
    -analysisTimeoutPerFile 172800 `
    -log $log
}
elseif ($Step -eq 'rtti') {
  # The executable's ".rdata" is really the writable data section, ".xdata"
  # the read-only one and ".rsrc" the code, and the class-name (RTTI)
  # analyzer only looks in blocks named ".data"/".rdata"/".text".
  # PrepareRtti.java renames the blocks and clears the analyzer's "already
  # ran" record; the analysis that follows then names classes and vftables.
  # Takes about 20 minutes.
  $log = Join-Path $logDir "rtti-$stamp.log"
  $analysisArgs = @('-analysisTimeoutPerFile', '172800')
  if ($RenameOnly) {
    $analysisArgs = @('-noanalysis')
    Write-Host "Renaming the memory blocks only, no re-analysis (log: $log)"
  }
  else {
    Write-Host "Re-analyzing with the sections renamed for the RTTI pass (log: $log)"
  }
  & $headless $ProjectDir $ProjectName `
    -process 'CrimsonDesert.exe' `
    -scriptPath $scriptDir `
    -preScript PrepareRtti.java `
    @analysisArgs `
    -log $log
}
else {
  $log = Join-Path $logDir "export-$stamp.log"
  Write-Host "Exporting decompiled code to $exportDir (log: $log)"
  & $headless $ProjectDir $ProjectName `
    -process 'CrimsonDesert.exe' `
    -noanalysis `
    -readOnly `
    -scriptPath $scriptDir `
    -postScript ExportDecompiled.java $exportDir `
    -log $log
}

Write-Host "Step '$Step' finished with exit code $LASTEXITCODE"
exit $LASTEXITCODE
