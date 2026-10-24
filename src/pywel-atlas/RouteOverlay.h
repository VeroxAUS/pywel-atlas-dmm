// =============================================================================
// Pywel Atlas - route line overlay and panel section (RouteOverlay.h, v0.104)
// =============================================================================
//
// What this file is for:
//   FilterPanel.cpp draws the panel inside the game's frames with Dear ImGui.
//   These functions let it also draw the planned route line (on the world map
//   and the minimap) and show the panel's Route section. They run on the
//   presenting thread, inside FilterPanel.cpp's ImGui frame.
// =============================================================================
#pragma once
#include "vendor/imgui/imgui.h"

// Turns a colour into the frame's encoding (HDR10 when the image is HDR).
using PywelColourFn = ImU32 (*)(const ImVec4& colour);

// True when the route line has something to draw this frame (route on, a
// plan, and a map whose snapshot is younger than 200 ms).
bool PywelRouteOverlayWanted();
// Draws the route line on `draw` (ImGui's foreground list) for a back buffer
// of `width` x `height` pixels.
void PywelRouteDrawOverlay(ImDrawList* draw, float width, float height, PywelColourFn colour);
// The panel's Route section (inside the panel window).
void PywelRouteBuildPanelSection();
