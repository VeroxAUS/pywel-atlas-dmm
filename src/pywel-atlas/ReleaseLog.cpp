// =============================================================================
// Pywel Atlas - the short player log (ReleaseLog.cpp)
// =============================================================================
//
// WHAT THIS FILE IS
//   Writes pywel-atlas.log in %LOCALAPPDATA%\PywelAtlas (see ReleaseLog.h).
//   The file is started fresh on the first line of each game session, so it
//   only ever holds the current session. Each line is written and flushed at
//   once, so it survives a game crash.
// =============================================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <shlobj.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>
#include "ReleaseLog.h"

namespace {

// Guards the file handle and the writes; SRWLOCK_INIT needs no start-up call.
SRWLOCK logLock = SRWLOCK_INIT;
HANDLE logFile = INVALID_HANDLE_VALUE;
// True once opening the file was tried, so a failure is not retried per line.
bool openTried = false;

// Opens (and empties) pywel-atlas.log. Called with logLock held.
void OpenLog() {
    openTried = true;
    wchar_t path[MAX_PATH] = {};
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path)) ||
        wcscat_s(path, L"\\PywelAtlas") != 0) {
        return;
    }
    CreateDirectoryW(path, nullptr);
    if (wcscat_s(path, L"\\pywel-atlas.log") != 0) {
        return;
    }
    logFile = CreateFileW(path, GENERIC_WRITE, FILE_SHARE_READ, nullptr, CREATE_ALWAYS,
        FILE_ATTRIBUTE_NORMAL, nullptr);
}

} // namespace

// Writes one line with the local time in front ("12:25:10 ...").
void PywelReleaseLog(const char* format, ...) {
    char line[512];
    SYSTEMTIME now = {};
    GetLocalTime(&now);
    int used = _snprintf_s(line, _TRUNCATE, "%02u:%02u:%02u ", static_cast<unsigned>(now.wHour),
        static_cast<unsigned>(now.wMinute), static_cast<unsigned>(now.wSecond));
    if (used < 0) {
        used = 0;
    }
    va_list arguments;
    va_start(arguments, format);
    // A line longer than the buffer is cut short instead of stopping the game.
    _vsnprintf_s(line + used, sizeof(line) - used, _TRUNCATE, format, arguments);
    va_end(arguments);

    AcquireSRWLockExclusive(&logLock);
    if (!openTried) {
        OpenLog();
    }
    if (logFile != INVALID_HANDLE_VALUE) {
        DWORD written = 0;
        WriteFile(logFile, line, static_cast<DWORD>(strlen(line)), &written, nullptr);
        WriteFile(logFile, "\r\n", 2, &written, nullptr);
        FlushFileBuffers(logFile);
    }
    ReleaseSRWLockExclusive(&logLock);
}
