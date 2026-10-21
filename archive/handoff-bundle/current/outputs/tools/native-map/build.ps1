<#
Build the diagnostic ASI with the existing Visual Studio C++ tools.
Compiler intermediates stay under work; the distributable goes under mods.
#>
param([ValidateSet('SaveLoad')][string]$Mode = 'SaveLoad')
$ErrorActionPreference = 'Stop'
$sourceDirectory = $PSScriptRoot
$workspace = (Resolve-Path (Join-Path $sourceDirectory '../../..')).Path
$buildDirectory = Join-Path $workspace 'work/native-map-build'
$destination = Join-Path $workspace 'outputs/mods/native-save-detection'
$vcvars = 'C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvars64.bat'

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
    $outputPath = Join-Path $destination 'PywelAtlasSaveDetectionProbe.asi'
    $applicationSources = @((Join-Path $sourceDirectory 'NativeSaveLoadProbe.cpp'))
    & cl.exe /nologo /O2 /MT /std:c++17 /EHsc /W4 /LD @applicationSources buffer.obj hook.obj trampoline.obj hde64.obj /link "/OUT:$outputPath" /IMPLIB:NativeMapProbe.lib shell32.lib user32.lib gdi32.lib runtimeobject.lib bcrypt.lib
    if ($LASTEXITCODE -ne 0) { throw 'Could not build the native map probe' }
    # Keep the vendored license beside every rebuilt distributable, including
    # after a user removes/reimports the staging folder through their manager.
    $licenseName = 'SaveDetection-MinHook-LICENSE.txt'
    Copy-Item -LiteralPath (Join-Path $sourceDirectory 'vendor/minhook/LICENSE.txt') -Destination (Join-Path $destination $licenseName) -Force
    Write-Output "Built $outputPath"
} finally {
    Pop-Location
}
