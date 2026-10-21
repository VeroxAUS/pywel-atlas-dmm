<#
Build the diagnostic ASI with the existing Visual Studio C++ tools.
Compiler intermediates stay under build/; the distributable goes under dist/.
#>
param([ValidateSet('Categories', 'Inspect', 'Preview', 'Ownership', 'SaveLoad')][string]$Mode = 'Categories')
$ErrorActionPreference = 'Stop'
$sourceDirectory = $PSScriptRoot
$workspace = (Resolve-Path (Join-Path $sourceDirectory '../..')).Path
# Separate from src/save-detection so the two proofs never share objects.
$buildDirectory = Join-Path $workspace 'build/marker-bell'
$destination = Join-Path $workspace 'dist/native-map-proof'
if ($Mode -eq 'SaveLoad') {
    # This tree's SaveLoad source is the older v0.35 probe; keep it apart
    # from the current src/save-detection output.
    $destination = Join-Path $workspace 'dist/native-save-detection-v0.35'
}
$vcvars = 'C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvars64.bat'
if ($Mode -eq 'Categories') {
    $python = 'C:/Users/Thomas/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'
    & $python -B (Join-Path $sourceDirectory 'prepare_marker_default.py')
    if ($LASTEXITCODE -ne 0) { throw 'Could not embed the default marker definition' }
    & $python -B (Join-Path $sourceDirectory 'prepare_bell_links.py')
    if ($LASTEXITCODE -ne 0) { throw 'Could not embed verified Bell identities' }
}

New-Item -ItemType Directory -Force -Path $buildDirectory, $destination | Out-Null
# Import the compiler environment into this process; no helper window is opened.
$compilerEnvironment = & $env:ComSpec /c "`"$vcvars`" >nul && set"
if ($LASTEXITCODE -ne 0) { throw 'Could not initialize the C++ compiler' }
foreach ($line in $compilerEnvironment) {
    if ($line -match '^([^=]+)=(.*)$') {
        [Environment]::SetEnvironmentVariable($matches[1], $matches[2], 'Process')
    }
}

Push-Location $buildDirectory
try {
    $vendorSources = @('buffer.c', 'hook.c', 'trampoline.c', 'hde/hde64.c')
    foreach ($relativePath in $vendorSources) {
        & cl.exe /nologo /O2 /MT /TC /c (Join-Path $sourceDirectory "vendor/minhook/src/$relativePath")
        if ($LASTEXITCODE -ne 0) { throw "Could not compile $relativePath" }
    }
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
        $applicationSources += Join-Path $sourceDirectory 'NativeMarkerDefinition.cpp'
        $applicationSources += Join-Path $sourceDirectory 'NativeSaveReader.cpp'
    }
    & cl.exe /nologo /O2 /MT /std:c++17 /EHsc /W4 /LD @applicationSources buffer.obj hook.obj trampoline.obj hde64.obj /link "/OUT:$outputPath" /IMPLIB:NativeMapProbe.lib shell32.lib user32.lib gdi32.lib runtimeobject.lib bcrypt.lib
    if ($LASTEXITCODE -ne 0) { throw 'Could not build the native map probe' }
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
