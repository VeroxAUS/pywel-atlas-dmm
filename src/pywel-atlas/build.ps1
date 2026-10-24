<#
Build the combined Pywel Atlas mod (one ASI) with the existing Visual Studio
C++ tools. Compiler intermediates stay under build/; the distributable goes
under dist/.

What this script does
---------------------
Builds PywelAtlas.asi, the single mod file DMM loads into Crimson Desert. It
joins the save-detection part (src/save-detection) and the map-marker part
(src/marker-bell) without changing either part's behaviour. An ".asi" is a
Windows DLL (code library) with a different extension so mod loaders find it.

Steps:
  1. Regenerate the marker part's embedded data with its Python helpers
     (default marker, Bell list, Greymane Shrine list)
     (build-time only; the mod itself never runs Python).
  2. Load the Visual Studio 64-bit C++ compiler settings into this window.
  3. Compile MinHook (the small library that installs hooks) once.
  4. Compile both parts with PYWEL_ATLAS_COMBINED defined, plus the shared
     marker-definition and Bell-reader files, and link one .asi.
  5. Copy the MinHook and pycrimson licenses and the README next to it.

Test build (-Test): builds PywelAtlasTest.asi instead, the same mod plus the
test-only teleporter (TestTeleporter.cpp, PYWEL_ATLAS_TELEPORT defined). It
goes to dist/pywel-atlas-test/ and is never part of the normal release.

Output:  dist/pywel-atlas/  (temporary compiler files: build/pywel-atlas/)
         dist/pywel-atlas-test/ with -Test (build/pywel-atlas-test/)
Usage:   .\src\pywel-atlas\build.ps1 [-Test]
Requires Visual Studio 2022 (Community) with the C++ tools installed.
#>
param(
    # Build the test-only teleporter build instead of the release mod.
    [switch]$Test
)
# Stop at the first error instead of carrying on with a half-finished build.
$ErrorActionPreference = 'Stop'

# --- Folder layout -----------------------------------------------------------
$sourceDirectory = $PSScriptRoot
# Repository root (two levels up from src/pywel-atlas).
$workspace = (Resolve-Path (Join-Path $sourceDirectory '../..')).Path
$saveDetection = Join-Path $workspace 'src/save-detection'
$markerBell = Join-Path $workspace 'src/marker-bell'
if ($Test) {
    $buildDirectory = Join-Path $workspace 'build/pywel-atlas-test'
    $destination = Join-Path $workspace 'dist/pywel-atlas-test'
    $asiName = 'PywelAtlasTest.asi'
    $readmeName = 'PywelAtlasTest-README.md'
} else {
    $buildDirectory = Join-Path $workspace 'build/pywel-atlas'
    $destination = Join-Path $workspace 'dist/pywel-atlas'
    $asiName = 'PywelAtlas.asi'
    $readmeName = 'PywelAtlas-README.md'
}
# Visual Studio's script that sets up the 64-bit C++ compiler.
$vcvars = 'C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvars64.bat'

# --- Step 1: regenerate the marker part's embedded data ----------------------
$python = 'C:/Users/Thomas/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'
& $python -B (Join-Path $markerBell 'prepare_marker_default.py')
if ($LASTEXITCODE -ne 0) { throw 'Could not embed the default marker definition' }
& $python -B (Join-Path $markerBell 'prepare_bell_links.py')
if ($LASTEXITCODE -ne 0) { throw 'Could not embed verified Bell identities' }
# v0.56: the Greymane Shrine list (save reader and shrine markers).
& $python -B (Join-Path $markerBell 'prepare_shrine_links.py')
if ($LASTEXITCODE -ne 0) { throw 'Could not embed the Greymane Shrine list' }
# v0.58: the treasure chests of the game's dedicated chest levels.
& $python -B (Join-Path $markerBell 'prepare_chest_links.py')
if ($LASTEXITCODE -ne 0) { throw 'Could not embed the treasure chest list' }
# v0.79: the surface Abyss Nexus list.
& $python -B (Join-Path $markerBell 'prepare_nexus_links.py')
if ($LASTEXITCODE -ne 0) { throw 'Could not embed the Abyss Nexus list' }
# v0.88: the Sealed Abyss Artifact list.
& $python -B (Join-Path $markerBell 'prepare_sealed_artifact_links.py')
if ($LASTEXITCODE -ne 0) { throw 'Could not embed the Sealed Abyss Artifact list' }
# v0.95: the Abyss-island Nexus list (its 2 housing Nexuses go to the surface list above).
& $python -B (Join-Path $markerBell 'prepare_island_nexus_links.py')
if ($LASTEXITCODE -ne 0) { throw 'Could not embed the Abyss-island Nexus list' }
# v0.105: the Abyss Cresset list (cresset markers and the save reader's quest pass).
& $python -B (Join-Path $markerBell 'prepare_cresset_links.py')
if ($LASTEXITCODE -ne 0) { throw 'Could not embed the Abyss Cresset list' }
# v0.114: the Constellation list (constellation markers and the save reader's quest pass).
& $python -B (Join-Path $markerBell 'prepare_constellation_links.py')
if ($LASTEXITCODE -ne 0) { throw 'Could not embed the Constellation list' }
# v0.108: the unique gear list (unique gear markers and the save reader's quest and field passes).
& $python -B (Join-Path $markerBell 'prepare_unique_gear_links.py')
if ($LASTEXITCODE -ne 0) { throw 'Could not embed the unique gear list' }
# v0.111: the world map's road network for the route line, read from the
# user's own game install (road-graph.h; game data, so not committed). It
# needs the research Python, whose lz4 module reads the game's packs.
$researchPython = Join-Path $workspace 'research/vendor/.venv/Scripts/python.exe'
& $researchPython -B (Join-Path $sourceDirectory 'prepare_road_graph.py')
if ($LASTEXITCODE -ne 0) { throw 'Could not build the road network (road-graph.h)' }
# v0.117: every marker category must have an even size in the UI add-on
# (MARKER_SIZES in build_ui_patch.py); stops the build if one is missing.
& $researchPython -B (Join-Path $workspace 'src/pywel-atlas-ui/build_ui_patch.py') --check
if ($LASTEXITCODE -ne 0) { throw 'A marker category has no size in build_ui_patch.py (MARKER_SIZES)' }
if ($Test) {
    # Test build only: the teleporter's named target list.
    & $python -B (Join-Path $sourceDirectory 'prepare_teleport_targets.py')
    if ($LASTEXITCODE -ne 0) { throw 'Could not build the teleport target list' }
}

# --- Step 2: prepare folders and load the compiler settings -------------------
New-Item -ItemType Directory -Force -Path $buildDirectory, $destination | Out-Null
# Import the compiler environment into this process (runs vcvars64.bat in cmd,
# prints the resulting settings with "set", copies each NAME=VALUE line).
$compilerEnvironment = & $env:ComSpec /c "`"$vcvars`" >nul && set"
if ($LASTEXITCODE -ne 0) { throw 'Could not initialize the C++ compiler' }
foreach ($line in $compilerEnvironment) {
    if ($line -match '^([^=]+)=(.*)$') {
        [Environment]::SetEnvironmentVariable($matches[1], $matches[2], 'Process')
    }
}

# Compile inside build/pywel-atlas, then always return to the original folder.
Push-Location $buildDirectory
try {
    # --- Step 3: compile MinHook (plain C) once ------------------------------
    # Both parts vendor identical MinHook copies; the save-detection copy is used.
    $vendorSources = @('buffer.c', 'hook.c', 'trampoline.c', 'hde/hde64.c')
    foreach ($relativePath in $vendorSources) {
        & cl.exe /nologo /O2 /MT /TC /c (Join-Path $saveDetection "vendor/minhook/src/$relativePath")
        if ($LASTEXITCODE -ne 0) { throw "Could not compile $relativePath" }
    }

    # --- Step 3b: compile Dear ImGui (third-party, MIT) once -------------------
    # Its own warning level (/W3), like MinHook; our code below uses /W4. The
    # same IMGUI_ defines are given to FilterPanel.cpp: no IME or shell helpers.
    $imguiDirectory = Join-Path $sourceDirectory 'vendor/imgui'
    $imguiDefines = @('/DIMGUI_DISABLE_WIN32_DEFAULT_IME_FUNCTIONS', '/DIMGUI_DISABLE_DEFAULT_SHELL_FUNCTIONS')
    $imguiSources = @('imgui.cpp', 'imgui_draw.cpp', 'imgui_tables.cpp', 'imgui_widgets.cpp',
        'backends/imgui_impl_dx12.cpp')
    foreach ($relativePath in $imguiSources) {
        & cl.exe /nologo /O2 /MT /std:c++17 /EHsc /W3 @imguiDefines "/I$imguiDirectory" /c (Join-Path $imguiDirectory $relativePath)
        if ($LASTEXITCODE -ne 0) { throw "Could not compile ImGui $relativePath" }
    }
    $imguiObjects = @('imgui.obj', 'imgui_draw.obj', 'imgui_tables.obj', 'imgui_widgets.obj', 'imgui_impl_dx12.obj')

    # --- Step 4: compile both parts and link one .asi ------------------------
    # /DPYWEL_ATLAS_COMBINED removes each part's own DllMain (PywelAtlas.cpp
    # owns it) and makes the parts share one MinHook initialization.
    $outputPath = Join-Path $destination $asiName
    $applicationSources = @(
        (Join-Path $sourceDirectory 'PywelAtlas.cpp'),
        (Join-Path $sourceDirectory 'TeleportObserve.cpp'),
        # v0.62: the in-game filter panel (Dear ImGui, drawn in the game's frame).
        (Join-Path $sourceDirectory 'FilterPanel.cpp'),
        # v0.104: the collectible route (planner, worker and snapshots, line overlay).
        (Join-Path $sourceDirectory 'RoutePlanner.cpp'),
        (Join-Path $sourceDirectory 'RouteSystem.cpp'),
        (Join-Path $sourceDirectory 'RouteOverlay.cpp'),
        # v0.111: roads, road-following legs and the world map's own canvas line.
        (Join-Path $sourceDirectory 'RoadGraph.cpp'),
        (Join-Path $sourceDirectory 'RouteLegs.cpp'),
        (Join-Path $sourceDirectory 'RouteCanvas.cpp'),
        # v0.119: rebindable keys (keybinds.ini and the panel's Keys section).
        (Join-Path $sourceDirectory 'Keybinds.cpp'),
        (Join-Path $saveDetection 'NativeSaveLoadProbe.cpp'),
        # v0.122: the map-marker part, split into files by job (no behaviour
        # change; MapMarkerShared.h lists what they share).
        (Join-Path $markerBell 'NativeMapCategoryProbe.cpp'),
        (Join-Path $markerBell 'MapHooks.cpp'),
        (Join-Path $markerBell 'MapCategories.cpp'),
        (Join-Path $markerBell 'MarkerService.cpp'),
        (Join-Path $markerBell 'MarkerState.cpp'),
        (Join-Path $markerBell 'IconDefinitions.cpp'),
        (Join-Path $markerBell 'MapDiagnostics.cpp'),
        (Join-Path $markerBell 'MinimapMarkers.cpp'),
        (Join-Path $markerBell 'MapPublicApi.cpp'),
        (Join-Path $markerBell 'NativeMarkerDefinition.cpp'),
        (Join-Path $markerBell 'NativeSaveReader.cpp'))
    $defines = @('/DPYWEL_ATLAS_COMBINED')
    if ($Test) {
        # Test build only: add the teleporter and switch on its hook call.
        $applicationSources += (Join-Path $sourceDirectory 'TestTeleporter.cpp')
        $defines += '/DPYWEL_ATLAS_TELEPORT'
    }
    & cl.exe /nologo /O2 /MT /std:c++17 /EHsc /W4 /LD @defines @imguiDefines "/I$imguiDirectory" @applicationSources buffer.obj hook.obj trampoline.obj hde64.obj @imguiObjects /link "/OUT:$outputPath" /IMPLIB:PywelAtlas.lib shell32.lib user32.lib gdi32.lib runtimeobject.lib bcrypt.lib dxgi.lib d3dcompiler.lib
    if ($LASTEXITCODE -ne 0) { throw "Could not build $asiName" }

    # --- Step 5: copy licenses and README next to the .asi -------------------
    Copy-Item -LiteralPath (Join-Path $saveDetection 'vendor/minhook/LICENSE.txt') -Destination (Join-Path $destination 'PywelAtlas-MinHook-LICENSE.txt') -Force
    Copy-Item -LiteralPath (Join-Path $workspace 'third_party/python/pycrimson-LICENSE.txt') -Destination (Join-Path $destination 'pycrimson-LICENSE.txt') -Force
    Copy-Item -LiteralPath (Join-Path $workspace 'third_party/imgui/imgui-LICENSE.txt') -Destination (Join-Path $destination 'imgui-LICENSE.txt') -Force
    Copy-Item -LiteralPath (Join-Path $sourceDirectory $readmeName) -Destination $destination -Force
    Write-Output "Built $outputPath"
} finally {
    Pop-Location
}
