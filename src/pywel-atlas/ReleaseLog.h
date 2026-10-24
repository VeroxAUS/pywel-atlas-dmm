// =============================================================================
// Pywel Atlas - the short player log (ReleaseLog.h)
// =============================================================================
//
// WHAT THIS FILE IS
//   One function every part can call to write a line to
//   %LOCALAPPDATA%\PywelAtlas\pywel-atlas.log. It is the only log the
//   release build writes (v0.129): the version, whether each part started,
//   why a part refused to start (for example an unsupported game version),
//   and real errors. Nothing else goes in, so a player can send this file
//   with a bug report. The development builds still write their detailed
//   per-part logs as well (PYWEL_ATLAS_DEV, see build.ps1).
// =============================================================================
#pragma once

// Writes one line to pywel-atlas.log, printf style, with the local time in
// front. Safe from any thread; a line that is too long is cut short.
void PywelReleaseLog(const char* format, ...);
