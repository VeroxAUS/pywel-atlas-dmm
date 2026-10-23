<#
Build the diagnostic ASI with the existing Visual Studio C++ tools.
Compiler intermediates stay under build/; the distributable goes under dist/.

What this script is
-------------------
This builds the earlier research probes in src/marker-bell. Each probe is one
"ASI" file: a Windows DLL (a code library) that a mod manager such as DMM
loads into the game Crimson Desert when the game starts. These probes are
experiments used to study the game's map and save loading. They are not the
current mod; the current save-detection work lives in src/save-detection and
has its own build.

Pick one probe with -Mode. Every mode compiles MinHook first. MinHook is a
small third-party library (vendored under vendor/minhook) that lets our code
"hook" a game function: it redirects calls to that function through our own
code, which can watch the call and then pass it on to the original.

Build modes (all write into dist/ under the repository root)
------------------------------------------------------------
  Categories (default)
      Runs two Python helpers first that generate embedded data (a default
      marker definition and verified "Bell" identities). Then compiles
      NativeMapCategoryProbe.cpp together with NativeMarkerDefinition.cpp and
      NativeSaveReader.cpp.
      Produces dist/native-map-proof/PywelAtlasMapProbe.asi
  Inspect
      Compiles NativeMapInspect.cpp (map icon inspection and a display-only
      test chest).
      Produces dist/native-map-proof/PywelAtlasMapProbe.asi
  Preview
      Compiles NativeMapPreview.cpp (temporarily shows one map icon at a
      shifted position).
      Produces dist/native-map-proof/PywelAtlasMapProbe.asi
  Ownership
      Compiles NativeMapProbe.cpp (experiments on which map controller owns
      an icon).
      Produces dist/native-map-proof/PywelAtlasMapProbe.asi
  SaveLoad
      Compiles NativeSaveLoadProbe.cpp, the older v0.35 save-load observation
      probe (kept separate from the newer copy in src/save-detection).
      Produces dist/native-save-detection-v0.35/PywelAtlasSaveDetectionProbe.asi

Note: Categories, Inspect, Preview and Ownership all write the same file name
into the same folder, so each such build replaces the previous one.
Every mode also copies the MinHook license next to the ASI; every mode except
SaveLoad also copies the pycrimson license.

Example:  .\build.ps1 -Mode Inspect
#>
# -Mode chooses which probe to build (see the list above). Default: Categories.
param(
    [ValidateSet('Categories', 'Inspect', 'Preview', 'Ownership', 'SaveLoad')]
    [string]$Mode = 'Categories'
)
# Stop at the first error instead of carrying on with a half-finished build.
$ErrorActionPreference = 'Stop'

# ---------------------------------------------------------------------------
# Folder layout: where sources are read from and where outputs are written.
# ---------------------------------------------------------------------------
$sourceDirectory = $PSScriptRoot
# Repository root (two levels up from src/marker-bell).
$workspace = (Resolve-Path (Join-Path $sourceDirectory '../..')).Path
# Separate from src/save-detection so the two proofs never share objects.
$buildDirectory = Join-Path $workspace 'build/marker-bell'
$destination = Join-Path $workspace 'dist/native-map-proof'
if ($Mode -eq 'SaveLoad') {
    # This tree's SaveLoad source is the older v0.35 probe; keep it apart
    # from the current src/save-detection output.
    $destination = Join-Path $workspace 'dist/native-save-detection-v0.35'
}
# Visual Studio's script that sets up the 64-bit C++ compiler environment.
$vcvars = 'C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvars64.bat'

# ---------------------------------------------------------------------------
# Categories only: generate embedded data files with two Python helpers.
# ---------------------------------------------------------------------------
if ($Mode -eq 'Categories') {
    $python = 'C:/Users/Thomas/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'
    & $python -B (Join-Path $sourceDirectory 'prepare_marker_default.py')
    if ($LASTEXITCODE -ne 0) { throw 'Could not embed the default marker definition' }
    & $python -B (Join-Path $sourceDirectory 'prepare_bell_links.py')
    if ($LASTEXITCODE -ne 0) { throw 'Could not embed verified Bell identities' }
    # v0.56: the Greymane Shrine list read by NativeSaveReader.cpp.
    & $python -B (Join-Path $sourceDirectory 'prepare_shrine_links.py')
    if ($LASTEXITCODE -ne 0) { throw 'Could not embed the Greymane Shrine list' }
    # v0.58: the treasure chest list read by NativeSaveReader.cpp.
    & $python -B (Join-Path $sourceDirectory 'prepare_chest_links.py')
    if ($LASTEXITCODE -ne 0) { throw 'Could not embed the treasure chest list' }
    # v0.79: the surface Abyss Nexus list read by NativeSaveReader.cpp.
    & $python -B (Join-Path $sourceDirectory 'prepare_nexus_links.py')
    if ($LASTEXITCODE -ne 0) { throw 'Could not embed the Abyss Nexus list' }
}

# ---------------------------------------------------------------------------
# Prepare folders and load the C++ compiler settings.
# ---------------------------------------------------------------------------
New-Item -ItemType Directory -Force -Path $buildDirectory, $destination | Out-Null
# Import the compiler environment into this process; no helper window is opened.
# (It runs vcvars64.bat in cmd, prints all resulting environment variables with
# "set", and copies each NAME=VALUE line into this PowerShell process.)
$compilerEnvironment = & $env:ComSpec /c "`"$vcvars`" >nul && set"
if ($LASTEXITCODE -ne 0) { throw 'Could not initialize the C++ compiler' }
foreach ($line in $compilerEnvironment) {
    if ($line -match '^([^=]+)=(.*)$') {
        [Environment]::SetEnvironmentVariable($matches[1], $matches[2], 'Process')
    }
}

# ---------------------------------------------------------------------------
# Compile inside build/marker-bell, then always return to the original folder.
# ---------------------------------------------------------------------------
Push-Location $buildDirectory
try {
    # Step 1: compile the MinHook library sources (plain C) into .obj files.
    $vendorSources = @('buffer.c', 'hook.c', 'trampoline.c', 'hde/hde64.c')
    foreach ($relativePath in $vendorSources) {
        & cl.exe /nologo /O2 /MT /TC /c (Join-Path $sourceDirectory "vendor/minhook/src/$relativePath")
        if ($LASTEXITCODE -ne 0) { throw "Could not compile $relativePath" }
    }
    # Step 2: choose the output file name and the probe source for this mode.
    $binaryName = if ($Mode -eq 'SaveLoad') { 'PywelAtlasSaveDetectionProbe.asi' } else { 'PywelAtlasMapProbe.asi' }
    $outputPath = Join-Path $destination $binaryName
    $sourceName = switch ($Mode) {
        'Categories' { 'NativeMapCategoryProbe.cpp' }
        'Inspect' { 'NativeMapInspect.cpp' }
        'Preview' { 'NativeMapPreview.cpp' }
        'Ownership' { 'NativeMapProbe.cpp' }
        'SaveLoad' { 'NativeSaveLoadProbe.cpp' }
    }
    $applicationSources = @((Join-Path $sourceDirectory $sourceName))
    if ($Mode -eq 'Categories') {
        # The Categories probe also needs the marker definition and save reader.
        $applicationSources += Join-Path $sourceDirectory 'NativeMarkerDefinition.cpp'
        $applicationSources += Join-Path $sourceDirectory 'NativeSaveReader.cpp'
    }
    # Step 3: compile the probe (C++17, warning level 4) and link it with the
    # MinHook objects into one DLL (/LD). The DLL is written with an .asi name
    # so the mod loader picks it up. The .lib files are Windows system libraries.
    & cl.exe /nologo /O2 /MT /std:c++17 /EHsc /W4 /LD @applicationSources buffer.obj hook.obj trampoline.obj hde64.obj /link "/OUT:$outputPath" /IMPLIB:NativeMapProbe.lib shell32.lib user32.lib gdi32.lib runtimeobject.lib bcrypt.lib
    if ($LASTEXITCODE -ne 0) { throw 'Could not build the native map probe' }
    # Step 4: copy license files next to the built ASI.
    # Keep the vendored license beside every rebuilt distributable, including
    # after a user removes/reimports the staging folder through their manager.
    $licenseName = if ($Mode -eq 'SaveLoad') { 'SaveDetection-MinHook-LICENSE.txt' } else { 'MinHook-LICENSE.txt' }
    Copy-Item -LiteralPath (Join-Path $sourceDirectory 'vendor/minhook/LICENSE.txt') -Destination (Join-Path $destination $licenseName) -Force
    if ($Mode -ne 'SaveLoad') {
        Copy-Item -LiteralPath (Join-Path $workspace 'third_party/python/pycrimson-LICENSE.txt') -Destination (Join-Path $destination 'pycrimson-LICENSE.txt') -Force
    }
    Write-Output "Built $outputPath"
} finally {
    Pop-Location
}
