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
//
//   0.29.0: the log keeps the previous session (pywel-atlas.previous.log),
//   starts with a header (versions, Windows, other mods), and the parts
//   write milestones (save read, marker counts) with context. Detail goes
//   to a memory of recent events instead of the file; the crash record, the
//   crash dump (pywel-atlas-crash-<date>-<time>.dmp) and the panel's bug
//   report (PywelAtlas-bug-report-<date>-<time>.txt) write it out.
// =============================================================================
#pragma once

// Writes one line to pywel-atlas.log, printf style, with the local time in
// front. Safe from any thread; a line that is too long is cut short.
void PywelReleaseLog(const char* format, ...);

// 0.29.0: start of the session, called first by PywelAtlas.cpp's start-up
// thread: keeps the last session's log as pywel-atlas.previous.log, writes
// the header and installs the crash record. `module` is PywelAtlas.asi.
void PywelReleaseLogStart(void* module, const char* version);
// The mod's version text ("0.29.1"), for the panel's Support tab.
const char* PywelReleaseVersion();
// The game's file version text ("1.0.3.12, 182,353,920 bytes"), for the panel.
const char* PywelReleaseGameVersion();
// Names a thread for the crash record ("save detection"), by its id.
void PywelReleaseNameThread(unsigned long threadId, const char* part);

// A detail line for the recent-events memory (the last 256 events, kept in
// memory only). The crash record and the bug report write them out; with
// the Detailed log option on, each event also goes to the log at once.
// `part` is a short name such as "save" or "markers".
void PywelReleaseEvent(const char* part, const char* format, ...);
// The panel's Detailed log option (off at every start).
bool PywelReleaseDetailed();
void PywelSetReleaseDetailed(bool on);

// 0.29.1: an event that also always goes to the log (test 13: a filter row
// or the route switched in the panel left no line unless Detailed log was
// on). Same arguments as PywelReleaseEvent.
void PywelReleaseNote(const char* part, const char* format, ...);
// 0.29.1: one line of a part's own development log (native-map-categories,
// native-save-detection, route, filter-panel). With Detailed log on it goes
// to pywel-atlas.log as "[part] line", unless it names a folder, a user or
// an account (those stay out of the player log); at most kDetailLimit
// bytes of them per session (ReleaseLog.cpp), so ordinary lines keep room
// under the 1 MB limit. Nothing is kept in the recent-events memory.
void PywelReleaseDetail(const char* part, const char* line);

// For errors that can repeat (a marker that keeps failing): the first 5
// lines with the same `key` are written in full, then at most one line a
// minute saying how many more there were. `key` must be a string literal.
void PywelReleaseLogRepeat(const char* key, const char* format, ...);

// The panel's Support tab: writes PywelAtlas-bug-report-<date>-<time>.txt
// (header, both logs, recent events, filters.ini, keybinds.ini, crash dump
// names; never a save file) on its own thread, then shows it in Explorer.
void PywelReleaseCreateBugReport();
// Text for the panel about the last Create bug report ("" until then).
void PywelReleaseBugReportStatus(char* text, unsigned size);
// Opens %LOCALAPPDATA%\PywelAtlas in Explorer.
void PywelReleaseOpenLogFolder();
