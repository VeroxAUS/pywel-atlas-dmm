<#
Build the diagnostic ASI with the existing Visual Studio C++ tools.
Compiler intermediates stay under build/; the distributable goes under dist/.

What this script does
---------------------
Turns NativeSaveLoadProbe.cpp into PywelAtlasSaveDetectionProbe.asi, the mod
file DMM loads into Crimson Desert. An ".asi" is just a Windows DLL (a code
library) with a different file extension so mod loaders pick it up.

Steps:
  1. Load the Visual Studio 64-bit C++ compiler settings into this window.
  2. Compile MinHook (the small library that installs our hooks).
  3. Compile the probe and link everything into one .asi file.
  4. Copy the MinHook license and the README next to the .asi.

Output:  dist/native-save-detection/  (temporary compiler files: build/save-detection/)
Usage:   .\src\save-detection\build.ps1
Requires Visual Studio 2022 (Community) with the C++ tools installed.
#>
# Only one mode exists; the parameter is kept for compatibility.
param(
    [ValidateSet('SaveLoad')]
    [string]$Mode = 'SaveLoad'
)
# Stop at the first error instead of carrying on with a half-finished build.
$ErrorActionPreference = 'Stop'

# --- Folder layout -----------------------------------------------------------
$sourceDirectory = $PSScriptRoot
# Repository root (two levels up from src/save-detection).
$workspace = (Resolve-Path (Join-Path $sourceDirectory '../..')).Path
$buildDirectory = Join-Path $workspace 'build/save-detection'
$destination = Join-Path $workspace 'dist/native-save-detection'
# Visual Studio's script that sets up the 64-bit C++ compiler.
$vcvars = 'C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvars64.bat'

# --- Step 1: prepare folders and load the compiler settings -------------------
New-Item -ItemType Directory -Force -Path $buildDirectory, $destination | Out-Null
# Import the compiler environment into this process; no helper window is opened.
# (Runs vcvars64.bat in cmd, prints the resulting settings with "set", and
# copies each NAME=VALUE line into this PowerShell session.)
$compilerEnvironment = & $env:ComSpec /c "`"$vcvars`" >nul && set"
if ($LASTEXITCODE -ne 0) { throw 'Could not initialize the C++ compiler' }
foreach ($line in $compilerEnvironment) {
    if ($line -match '^([^=]+)=(.*)$') {
        [Environment]::SetEnvironmentVariable($matches[1], $matches[2], 'Process')
    }
}

# Compile inside build/save-detection, then always return to the original folder.
Push-Location $buildDirectory
try {
    # --- Step 2: compile the MinHook library (plain C) into .obj files --------
    $vendorSources = @('buffer.c', 'hook.c', 'trampoline.c', 'hde/hde64.c')
    foreach ($relativePath in $vendorSources) {
        & cl.exe /nologo /O2 /MT /TC /c (Join-Path $sourceDirectory "vendor/minhook/src/$relativePath")
        if ($LASTEXITCODE -ne 0) { throw "Could not compile $relativePath" }
    }

    # --- Step 3: compile the probe and link it into the .asi -----------------
    # Flags: /O2 optimise, /MT no separate runtime DLL needed, /std:c++17,
    # /W4 high warning level, /LD build a DLL. The .lib names at the end are
    # standard Windows libraries the probe uses.
    $outputPath = Join-Path $destination 'PywelAtlasSaveDetectionProbe.asi'
    $applicationSources = @((Join-Path $sourceDirectory 'NativeSaveLoadProbe.cpp'))
    & cl.exe /nologo /O2 /MT /std:c++17 /EHsc /W4 /LD @applicationSources buffer.obj hook.obj trampoline.obj hde64.obj /link "/OUT:$outputPath" /IMPLIB:NativeMapProbe.lib shell32.lib user32.lib gdi32.lib runtimeobject.lib bcrypt.lib
    if ($LASTEXITCODE -ne 0) { throw 'Could not build the native map probe' }

    # --- Step 4: copy the license and README next to the .asi ----------------
    # Keep the vendored license beside every rebuilt distributable, including
    # after a user removes/reimports the staging folder through their manager.
    $licenseName = 'SaveDetection-MinHook-LICENSE.txt'
    Copy-Item -LiteralPath (Join-Path $sourceDirectory 'vendor/minhook/LICENSE.txt') -Destination (Join-Path $destination $licenseName) -Force
    # The README is maintained beside the source; dist/ is rebuildable output.
    Copy-Item -LiteralPath (Join-Path $sourceDirectory 'SaveDetection-README.md') -Destination $destination -Force
    Write-Output "Built $outputPath"
} finally {
    Pop-Location
}
