// =============================================================================
// Pywel Atlas - the short player log (ReleaseLog.cpp)
// =============================================================================
//
// WHAT THIS FILE IS
//   Writes pywel-atlas.log in %LOCALAPPDATA%\PywelAtlas (see ReleaseLog.h).
//   Each line is written and flushed at once, so it survives a game crash.
//
//   0.29.0 (release logging):
//   - The first line of a session renames the last session's log to
//     pywel-atlas.previous.log instead of emptying it, so the log of a
//     session that crashed is still there after a restart. A log stops at
//     1 MB (one line says so); crash records are still written after that.
//   - PywelReleaseLogStart writes a header: mod version and build kind, the
//     game's file version and size, Windows version, where the mod sits in
//     memory, and the other mods (.asi / .dll from outside Windows) loaded.
//   - Recent events: PywelReleaseEvent keeps the last 256 detail lines in
//     memory. The crash record and the bug report write them out; with the
//     panel's Detailed log option on they also go to the log at once.
//   - Crash record: a vectored exception handler that reacts to a crash
//     (access violation and the like) whose address is inside
//     PywelAtlas.asi. It writes the exception, the offset in the mod, the
//     thread's part, up to 16 return addresses as module+offset, and the
//     last 32 recent events, then a minidump through dbghelp
//     (pywel-atlas-crash-<date>-<time>.dmp; the newest 3 are kept), and
//     hands the crash on to the game unchanged. With the PDB build.ps1
//     keeps for each release, the offsets and the dump give the exact
//     source line. A crash elsewhere with the mod on the first 16 frames of
//     the stack gets the same record lines without a dump (at most 3 per
//     session, since the game may handle it). Fast-fail crashes (/GS,
//     0xc0000409) end the process without passing through here.
//   - Bug report: the panel's Support tab writes one text file with all of
//     this (never a save file) and shows it in Explorer.
//
//   0.29.1 (test 13/14, "the log is not written to that often"):
//   - PywelReleaseNote: an event that always goes to the log too (panel
//     filter rows, the route switch, Legendary Animal tracking).
//   - PywelReleaseDetail: with Detailed log on, the parts' own development
//     log lines go to the log as well (privacy filter and their own budget,
//     kDetailLimit).
// =============================================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <shlobj.h>
#include <shellapi.h>
#include <dbghelp.h>
#include <psapi.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ReleaseLog.h"

namespace {

// --- The log file ---------------------------------------------------------------

// Guards the file handle and the writes; SRWLOCK_INIT needs no start-up call.
SRWLOCK logLock = SRWLOCK_INIT;
HANDLE logFile = INVALID_HANDLE_VALUE;
// True once opening the file was tried, so a failure is not retried per line.
bool openTried = false;
// Bytes written this session; ordinary lines stop at kLogLimit.
DWORD logBytes = 0;
bool logFullNoted = false;
constexpr DWORD kLogLimit = 1024 * 1024;
// 0.29.1: bytes of development log lines (PywelReleaseDetail) per session.
constexpr LONG kDetailLimit = 512 * 1024;
volatile LONG detailBytes = 0;
// %LOCALAPPDATA%\PywelAtlas (empty if unavailable).
wchar_t folder[MAX_PATH] = {};

// Fills `folder` once. Called with logLock held or before any thread uses it.
bool LogFolder() {
    if (folder[0]) {
        return true;
    }
    wchar_t path[MAX_PATH] = {};
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path)) ||
        wcscat_s(path, L"\\PywelAtlas") != 0) {
        return false;
    }
    CreateDirectoryW(path, nullptr);
    wcscpy_s(folder, path);
    return true;
}

// Full path of a file in the log folder (false if unavailable).
bool FolderFile(const wchar_t* name, wchar_t (&path)[MAX_PATH]) {
    return folder[0] && swprintf_s(path, L"%ls\\%ls", folder, name) > 0;
}

// Opens pywel-atlas.log for this session; the last session's file becomes
// pywel-atlas.previous.log (0.29.0). Called with logLock held.
void OpenLog() {
    openTried = true;
    wchar_t path[MAX_PATH] = {};
    wchar_t previous[MAX_PATH] = {};
    if (!LogFolder() || !FolderFile(L"pywel-atlas.log", path) ||
        !FolderFile(L"pywel-atlas.previous.log", previous)) {
        return;
    }
    MoveFileExW(path, previous, MOVEFILE_REPLACE_EXISTING);
    logFile = CreateFileW(path, GENERIC_WRITE, FILE_SHARE_READ, nullptr, CREATE_ALWAYS,
        FILE_ATTRIBUTE_NORMAL, nullptr);
}

// Writes `text` plus a line end. `always` (crash records) ignores the 1 MB
// limit. Called with logLock held (or, in a crash, without it).
void WriteRaw(const char* text, bool always) {
    if (!openTried) {
        OpenLog();
    }
    if (logFile == INVALID_HANDLE_VALUE) {
        return;
    }
    DWORD length = static_cast<DWORD>(strlen(text));
    if (!always && logBytes + length > kLogLimit) {
        if (!logFullNoted) {
            logFullNoted = true;
            const char* full = "-- pywel-atlas.log reached 1 MB; further ordinary lines are left out "
                "(crash records are still written) --\r\n";
            DWORD written = 0;
            WriteFile(logFile, full, static_cast<DWORD>(strlen(full)), &written, nullptr);
        }
        return;
    }
    DWORD written = 0;
    WriteFile(logFile, text, length, &written, nullptr);
    WriteFile(logFile, "\r\n", 2, &written, nullptr);
    FlushFileBuffers(logFile);
    logBytes += length + 2;
}

// Formats "hh:mm:ss " + the text into `line`.
void FormatLine(char (&line)[512], const char* format, va_list arguments) {
    SYSTEMTIME now = {};
    GetLocalTime(&now);
    int used = _snprintf_s(line, _TRUNCATE, "%02u:%02u:%02u ", static_cast<unsigned>(now.wHour),
        static_cast<unsigned>(now.wMinute), static_cast<unsigned>(now.wSecond));
    if (used < 0) {
        used = 0;
    }
    // A line longer than the buffer is cut short instead of stopping the game.
    _vsnprintf_s(line + used, sizeof(line) - used, _TRUNCATE, format, arguments);
}

// Writes an already formatted line under the lock.
void WriteLine(const char* line, bool always = false) {
    AcquireSRWLockExclusive(&logLock);
    WriteRaw(line, always);
    ReleaseSRWLockExclusive(&logLock);
}

// --- Session facts (header) -------------------------------------------------------

char modVersion[32] = "?";
// Only development builds hold this text (the release check looks for it).
#ifdef PYWEL_ATLAS_DEV
constexpr const char* kBuildKind = " (development build)";
#else
constexpr const char* kBuildKind = "";
#endif
char gameVersion[128] = "unknown";
// The header lines, also copied into the bug report.
char header[4096] = {};
uintptr_t moduleBase = 0;
uintptr_t moduleEnd = 0;

// Adds one header line (log and `header`).
void HeaderLine(const char* format, ...) {
    char line[512];
    va_list arguments;
    va_start(arguments, format);
    FormatLine(line, format, arguments);
    va_end(arguments);
    WriteLine(line);
    strncat_s(header, line, _TRUNCATE);
    strncat_s(header, "\r\n", _TRUNCATE);
}

// The game's file version and size, from its .exe ("1.0.3.12, 182353920 bytes, 2026-10-20").
void ReadGameVersion() {
    wchar_t exe[MAX_PATH] = {};
    if (!GetModuleFileNameW(nullptr, exe, MAX_PATH)) {
        return;
    }
    char version[48] = "no version info";
    DWORD ignored = 0;
    DWORD size = GetFileVersionInfoSizeW(exe, &ignored);
    static BYTE info[16384];
    VS_FIXEDFILEINFO* fixed = nullptr;
    UINT fixedSize = 0;
    if (size && size <= sizeof(info) && GetFileVersionInfoW(exe, 0, size, info) &&
        VerQueryValueW(info, L"\\", reinterpret_cast<void**>(&fixed), &fixedSize) && fixed) {
        sprintf_s(version, "%u.%u.%u.%u", HIWORD(fixed->dwFileVersionMS), LOWORD(fixed->dwFileVersionMS),
            HIWORD(fixed->dwFileVersionLS), LOWORD(fixed->dwFileVersionLS));
    }
    WIN32_FILE_ATTRIBUTE_DATA attributes = {};
    SYSTEMTIME written = {};
    unsigned long long bytes = 0;
    if (GetFileAttributesExW(exe, GetFileExInfoStandard, &attributes)) {
        bytes = (static_cast<unsigned long long>(attributes.nFileSizeHigh) << 32) | attributes.nFileSizeLow;
        FileTimeToSystemTime(&attributes.ftLastWriteTime, &written);
    }
    const wchar_t* name = wcsrchr(exe, L'\\');
    sprintf_s(gameVersion, "%ls %s, %llu bytes, %04u-%02u-%02u", name ? name + 1 : exe, version, bytes,
        static_cast<unsigned>(written.wYear), static_cast<unsigned>(written.wMonth),
        static_cast<unsigned>(written.wDay));
}

// Windows version through RtlGetVersion (GetVersionEx reports 6.2 to
// programs without a manifest entry).
void WindowsVersion(char (&text)[64]) {
    using RtlGetVersionFunction = LONG(WINAPI*)(OSVERSIONINFOW*);
    OSVERSIONINFOW version = {};
    version.dwOSVersionInfoSize = sizeof(version);
    auto rtlGetVersion = reinterpret_cast<RtlGetVersionFunction>(
        GetProcAddress(GetModuleHandleW(L"ntdll.dll"), "RtlGetVersion"));
    if (rtlGetVersion && rtlGetVersion(&version) == 0) {
        sprintf_s(text, "%lu.%lu build %lu", version.dwMajorVersion, version.dwMinorVersion, version.dwBuildNumber);
    } else {
        strcpy_s(text, "unknown");
    }
}

// The other mods in the game: every loaded module from outside the Windows
// folder, except the game's .exe and this mod (names only, no folders).
void OtherMods(char* text, size_t size) {
    text[0] = 0;
    HMODULE modules[1024];
    DWORD needed = 0;
    if (!EnumProcessModules(GetCurrentProcess(), modules, sizeof(modules), &needed)) {
        strcpy_s(text, size, "(could not list)");
        return;
    }
    wchar_t windows[MAX_PATH] = {};
    UINT windowsLength = GetWindowsDirectoryW(windows, MAX_PATH);
    unsigned count = needed / sizeof(HMODULE) < _countof(modules) ? needed / sizeof(HMODULE) : _countof(modules);
    for (unsigned index = 1; index < count; ++index) { // 0 is the game's .exe.
        if (reinterpret_cast<uintptr_t>(modules[index]) == moduleBase) {
            continue;
        }
        wchar_t path[MAX_PATH] = {};
        if (!GetModuleFileNameW(modules[index], path, MAX_PATH) ||
            (windowsLength && _wcsnicmp(path, windows, windowsLength) == 0)) {
            continue;
        }
        const wchar_t* name = wcsrchr(path, L'\\');
        char part[MAX_PATH + 4];
        sprintf_s(part, "%s%ls", text[0] ? ", " : "", name ? name + 1 : path);
        strncat_s(text, size, part, _TRUNCATE);
    }
    if (!text[0]) {
        strcpy_s(text, size, "none");
    }
}

// --- Threads ------------------------------------------------------------------------

struct ThreadName {
    volatile LONG id;
    const char* part;
};
ThreadName threadNames[16] = {};
volatile LONG threadNameCount = 0;

const char* ThreadPart(DWORD id) {
    LONG count = InterlockedCompareExchange(&threadNameCount, 0, 0);
    for (LONG index = 0; index < count && index < 16; ++index) {
        if (static_cast<DWORD>(threadNames[index].id) == id && threadNames[index].part) {
            return threadNames[index].part;
        }
    }
    return "a game thread running Pywel Atlas code (a hook)";
}

// --- Recent events --------------------------------------------------------------------

struct Event {
    SYSTEMTIME time;
    char part[16];
    char text[232];
};
constexpr unsigned kEventCount = 256;
Event events[kEventCount] = {};
unsigned eventNext = 0; // Total events so far; slot = eventNext % kEventCount.
SRWLOCK eventLock = SRWLOCK_INIT;
volatile LONG detailed = 0;

// Formats the event `back` places before the newest (0 = newest) into
// `line`; false if there is none.
bool FormatEvent(unsigned back, char (&line)[300]) {
    if (back >= eventNext || back >= kEventCount) {
        return false;
    }
    const Event& event = events[(eventNext - 1 - back) % kEventCount];
    sprintf_s(line, "  %02u:%02u:%02u.%03u [%s] %s", static_cast<unsigned>(event.time.wHour),
        static_cast<unsigned>(event.time.wMinute), static_cast<unsigned>(event.time.wSecond),
        static_cast<unsigned>(event.time.wMilliseconds), event.part, event.text);
    return true;
}

// --- Repeating errors -------------------------------------------------------------------

struct Repeat {
    const char* key;
    unsigned written;
    unsigned skipped;
    ULONGLONG nextSummary;
};
Repeat repeats[32] = {};
SRWLOCK repeatLock = SRWLOCK_INIT;
constexpr unsigned kRepeatFull = 5;
constexpr ULONGLONG kRepeatSummaryMs = 60 * 1000;

// --- Crash record --------------------------------------------------------------------------

using MiniDumpWriteDumpFunction = BOOL(WINAPI*)(HANDLE, DWORD, HANDLE, MINIDUMP_TYPE,
    PMINIDUMP_EXCEPTION_INFORMATION, PMINIDUMP_USER_STREAM_INFORMATION, PMINIDUMP_CALLBACK_INFORMATION);
MiniDumpWriteDumpFunction miniDumpWriteDump = nullptr;
volatile LONG crashRecorded = 0; // A crash inside the mod was recorded (once per session).
volatile LONG stackRecords = 0; // Crashes elsewhere with the mod on the stack (at most 3).
volatile LONG inCrashHandler = 0; // A fault inside the handler itself is passed straight on.
constexpr unsigned kCrashFrames = 16;

const char* ExceptionName(DWORD code) {
    switch (code) {
    case EXCEPTION_ACCESS_VIOLATION: return "access violation";
    case EXCEPTION_IN_PAGE_ERROR: return "in-page error";
    case EXCEPTION_ILLEGAL_INSTRUCTION: return "illegal instruction";
    case EXCEPTION_PRIV_INSTRUCTION: return "privileged instruction";
    case EXCEPTION_INT_DIVIDE_BY_ZERO: return "integer divide by zero";
    case EXCEPTION_INT_OVERFLOW: return "integer overflow";
    case EXCEPTION_STACK_OVERFLOW: return "stack overflow";
    case EXCEPTION_DATATYPE_MISALIGNMENT: return "misaligned data";
    case EXCEPTION_ARRAY_BOUNDS_EXCEEDED: return "array bounds exceeded";
    case 0xC0000374: return "heap corruption";
    default: return nullptr; // Not a crash (C++ exceptions, debugger messages...).
    }
}

// "PywelAtlas.asi+0x1a2b3" or "CrimsonDesert.exe+0x..." for a code address.
void DescribeAddress(DWORD64 address, char* text, size_t size) {
    void* base = nullptr;
    if (!RtlPcToFileHeader(reinterpret_cast<void*>(address), &base) || !base) {
        sprintf_s(text, size, "0x%llx", static_cast<unsigned long long>(address));
        return;
    }
    char path[MAX_PATH] = {};
    const char* name = "?";
    if (GetModuleFileNameA(static_cast<HMODULE>(base), path, MAX_PATH)) {
        const char* slash = strrchr(path, '\\');
        name = slash ? slash + 1 : path;
    }
    sprintf_s(text, size, "%s+0x%llx", name,
        static_cast<unsigned long long>(address - reinterpret_cast<uintptr_t>(base)));
}

// Return addresses from the crash's own register state (x64 unwind data).
unsigned WalkStack(const CONTEXT& start, DWORD64 (&frames)[kCrashFrames]) {
    CONTEXT context = start;
    unsigned count = 0;
    while (count < kCrashFrames && context.Rip) {
        frames[count++] = context.Rip;
        DWORD64 imageBase = 0;
        PRUNTIME_FUNCTION function = RtlLookupFunctionEntry(context.Rip, &imageBase, nullptr);
        if (!function) {
            // A leaf function: the return address is on top of the stack.
            if (IsBadReadPtr(reinterpret_cast<void*>(context.Rsp), sizeof(DWORD64))) {
                break;
            }
            context.Rip = *reinterpret_cast<DWORD64*>(context.Rsp);
            context.Rsp += sizeof(DWORD64);
            continue;
        }
        void* handlerData = nullptr;
        DWORD64 establisher = 0;
        RtlVirtualUnwind(UNW_FLAG_NHANDLER, imageBase, context.Rip, function, &context, &handlerData,
            &establisher, nullptr);
    }
    return count;
}

bool InModule(DWORD64 address) {
    return address >= moduleBase && address < moduleEnd;
}

// Writes the crash dump next to the logs; its file name goes to `name`.
// Only the newest 3 dumps are kept (older ones are deleted first).
bool WriteCrashDump(EXCEPTION_POINTERS* pointers, wchar_t (&name)[64], DWORD& error) {
    if (!miniDumpWriteDump || !folder[0]) {
        error = ERROR_PROC_NOT_FOUND;
        return false;
    }
    SYSTEMTIME now = {};
    GetLocalTime(&now);
    swprintf_s(name, L"pywel-atlas-crash-%04u%02u%02u-%02u%02u%02u.dmp", now.wYear, now.wMonth, now.wDay,
        now.wHour, now.wMinute, now.wSecond);
    wchar_t path[MAX_PATH] = {};
    if (!FolderFile(name, path)) {
        error = ERROR_BAD_PATHNAME;
        return false;
    }
    HANDLE file = CreateFileW(path, GENERIC_WRITE, 0, nullptr, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
    if (file == INVALID_HANDLE_VALUE) {
        error = GetLastError();
        return false;
    }
    MINIDUMP_EXCEPTION_INFORMATION exception = {};
    exception.ThreadId = GetCurrentThreadId();
    exception.ExceptionPointers = pointers;
    exception.ClientPointers = FALSE;
    BOOL ok = miniDumpWriteDump(GetCurrentProcess(), GetCurrentProcessId(), file,
        static_cast<MINIDUMP_TYPE>(MiniDumpNormal | MiniDumpWithThreadInfo | MiniDumpWithUnloadedModules),
        &exception, nullptr, nullptr);
    error = ok ? 0 : GetLastError();
    CloseHandle(file);
    if (!ok) {
        DeleteFileW(path);
    }
    return ok != FALSE;
}

// Deletes all but the newest `keep` crash dumps (start-up only).
void TrimCrashDumps(unsigned keep) {
    wchar_t pattern[MAX_PATH] = {};
    if (!FolderFile(L"pywel-atlas-crash-*.dmp", pattern)) {
        return;
    }
    // The names sort by time, so the newest are the largest names.
    wchar_t names[64][64] = {};
    unsigned count = 0;
    WIN32_FIND_DATAW found = {};
    HANDLE search = FindFirstFileW(pattern, &found);
    if (search == INVALID_HANDLE_VALUE) {
        return;
    }
    do {
        if (count < 64 && wcslen(found.cFileName) < 64) {
            wcscpy_s(names[count++], found.cFileName);
        }
    } while (FindNextFileW(search, &found));
    FindClose(search);
    qsort(names, count, sizeof(names[0]),
        [](const void* a, const void* b) { return wcscmp(static_cast<const wchar_t*>(b), static_cast<const wchar_t*>(a)); });
    for (unsigned index = keep; index < count; ++index) {
        wchar_t path[MAX_PATH] = {};
        if (FolderFile(names[index], path)) {
            DeleteFileW(path);
        }
    }
}

LONG RecordCrash(EXCEPTION_POINTERS* pointers, const char* kind);

// The vectored exception handler (0.29.0). Runs first for every exception
// in the process, so it returns at once unless the exception is a crash
// with this mod involved. It never handles the crash itself.
LONG CALLBACK CrashHandler(EXCEPTION_POINTERS* pointers) {
    const EXCEPTION_RECORD* record = pointers->ExceptionRecord;
    const char* kind = ExceptionName(record->ExceptionCode);
    if (!kind || !moduleBase || InterlockedCompareExchange(&inCrashHandler, 1, 0) != 0) {
        return EXCEPTION_CONTINUE_SEARCH;
    }
    LONG result = RecordCrash(pointers, kind);
    InterlockedExchange(&inCrashHandler, 0);
    return result;
}

// The crash record itself (see CrashHandler).
LONG RecordCrash(EXCEPTION_POINTERS* pointers, const char* kind) {
    const EXCEPTION_RECORD* record = pointers->ExceptionRecord;
    DWORD64 address = reinterpret_cast<DWORD64>(record->ExceptionAddress);
    bool inModule = InModule(address);
    bool stackOverflow = record->ExceptionCode == EXCEPTION_STACK_OVERFLOW;
    DWORD64 frames[kCrashFrames] = {};
    // A stack overflow leaves too little room to walk the stack or write a dump.
    unsigned frameCount = stackOverflow ? 0 : WalkStack(*pointers->ContextRecord, frames);
    bool onStack = false;
    for (unsigned index = 0; index < frameCount; ++index) {
        onStack = onStack || InModule(frames[index]);
    }
    if (inModule ? InterlockedExchange(&crashRecorded, 1) != 0
                 : !onStack || InterlockedIncrement(&stackRecords) > 3) {
        return EXCEPTION_CONTINUE_SEARCH;
    }
    // The crashing thread may hold the log lock: try it, else write anyway.
    bool locked = TryAcquireSRWLockExclusive(&logLock) != FALSE;
    char line[512];
    char where[160];
    DescribeAddress(address, where, sizeof(where));
    SYSTEMTIME now = {};
    GetLocalTime(&now);
    char detail[96] = "";
    if ((record->ExceptionCode == EXCEPTION_ACCESS_VIOLATION || record->ExceptionCode == EXCEPTION_IN_PAGE_ERROR) &&
        record->NumberParameters >= 2) {
        ULONG_PTR operation = record->ExceptionInformation[0];
        sprintf_s(detail, ", %s address 0x%llx", operation == 0 ? "reading" : operation == 1 ? "writing" : "running",
            static_cast<unsigned long long>(record->ExceptionInformation[1]));
    }
    sprintf_s(line, "%02u:%02u:%02u %s: exception 0x%08lx (%s%s) at %s on thread %lu (%s)",
        static_cast<unsigned>(now.wHour), static_cast<unsigned>(now.wMinute), static_cast<unsigned>(now.wSecond),
        inModule ? "CRASH in Pywel Atlas" : "Exception in the game with Pywel Atlas on the stack (the game may handle it)",
        record->ExceptionCode, kind, detail, where, GetCurrentThreadId(), ThreadPart(GetCurrentThreadId()));
    WriteRaw(line, true);
    sprintf_s(line, "  mod version %s%s, PywelAtlas.asi at 0x%llx; game %s", modVersion, kBuildKind,
        static_cast<unsigned long long>(moduleBase), gameVersion);
    WriteRaw(line, true);
    strcpy_s(line, "  stack:");
    for (unsigned index = 0; index < frameCount; ++index) {
        char frame[160];
        DescribeAddress(frames[index], frame, sizeof(frame));
        strncat_s(line, index ? " <- " : " ", _TRUNCATE);
        strncat_s(line, frame, _TRUNCATE);
    }
    if (!frameCount) {
        strncat_s(line, stackOverflow ? " (not walked: stack overflow)" : " (could not be walked)", _TRUNCATE);
    }
    WriteRaw(line, true);
    const CONTEXT& registers = *pointers->ContextRecord;
    sprintf_s(line, "  registers: rax=%llx rbx=%llx rcx=%llx rdx=%llx rsi=%llx rdi=%llx rbp=%llx rsp=%llx r8=%llx r9=%llx",
        registers.Rax, registers.Rbx, registers.Rcx, registers.Rdx, registers.Rsi, registers.Rdi, registers.Rbp,
        registers.Rsp, registers.R8, registers.R9);
    WriteRaw(line, true);
    // The last 32 recent events (try the lock; the crash may be inside one).
    bool eventsLocked = TryAcquireSRWLockShared(&eventLock) != FALSE;
    WriteRaw("  recent events (newest last):", true);
    for (unsigned back = 32; back-- > 0;) {
        char eventLine[300];
        if (FormatEvent(back, eventLine)) {
            WriteRaw(eventLine, true);
        }
    }
    if (eventsLocked) {
        ReleaseSRWLockShared(&eventLock);
    }
    if (inModule && !stackOverflow) {
        wchar_t name[64] = {};
        DWORD error = 0;
        if (WriteCrashDump(pointers, name, error)) {
            sprintf_s(line, "  crash dump: %ls (please attach it to the bug report)", name);
        } else {
            sprintf_s(line, "  crash dump could not be written (Windows error %lu)", error);
        }
        WriteRaw(line, true);
    }
    if (locked) {
        ReleaseSRWLockExclusive(&logLock);
    }
    // Hand the crash on unchanged (the game's own handler or Windows).
    return EXCEPTION_CONTINUE_SEARCH;
}

// --- Bug report ------------------------------------------------------------------------------

SRWLOCK reportLock = SRWLOCK_INIT;
char reportStatus[160] = {};
volatile LONG reportRunning = 0;

// Appends the file `name` from the log folder to the report (up to 1 MB).
void AppendFile(HANDLE report, const wchar_t* name) {
    char title[160];
    sprintf_s(title, "\r\n===== %ls =====\r\n", name);
    DWORD written = 0;
    WriteFile(report, title, static_cast<DWORD>(strlen(title)), &written, nullptr);
    wchar_t path[MAX_PATH] = {};
    HANDLE file = FolderFile(name, path) ? CreateFileW(path, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE |
        FILE_SHARE_DELETE, nullptr, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr) : INVALID_HANDLE_VALUE;
    if (file == INVALID_HANDLE_VALUE) {
        const char* none = "(not found)\r\n";
        WriteFile(report, none, static_cast<DWORD>(strlen(none)), &written, nullptr);
        return;
    }
    static char buffer[64 * 1024];
    DWORD total = 0;
    DWORD read = 0;
    while (total < kLogLimit && ReadFile(file, buffer, sizeof(buffer), &read, nullptr) && read) {
        WriteFile(report, buffer, read, &written, nullptr);
        total += read;
    }
    CloseHandle(file);
}

void WriteText(HANDLE report, const char* text) {
    DWORD written = 0;
    WriteFile(report, text, static_cast<DWORD>(strlen(text)), &written, nullptr);
}

void SetReportStatus(const char* format, ...) {
    AcquireSRWLockExclusive(&reportLock);
    va_list arguments;
    va_start(arguments, format);
    _vsnprintf_s(reportStatus, _TRUNCATE, format, arguments);
    va_end(arguments);
    ReleaseSRWLockExclusive(&reportLock);
}

// The bug report thread: writes the file, then selects it in Explorer.
DWORD WINAPI WriteBugReport(void*) {
    SYSTEMTIME now = {};
    GetLocalTime(&now);
    wchar_t name[64] = {};
    swprintf_s(name, L"PywelAtlas-bug-report-%04u%02u%02u-%02u%02u%02u.txt", now.wYear, now.wMonth, now.wDay,
        now.wHour, now.wMinute, now.wSecond);
    wchar_t path[MAX_PATH] = {};
    HANDLE report = FolderFile(name, path) ? CreateFileW(path, GENERIC_WRITE, 0, nullptr, CREATE_ALWAYS,
        FILE_ATTRIBUTE_NORMAL, nullptr) : INVALID_HANDLE_VALUE;
    if (report == INVALID_HANDLE_VALUE) {
        DWORD error = GetLastError();
        SetReportStatus("Could not write the bug report (Windows error %lu).", error);
        PywelReleaseLog("Bug report: could not create the file (Windows error %lu).", error);
        InterlockedExchange(&reportRunning, 0);
        return 0;
    }
    char line[2048];
    sprintf_s(line, "Pywel Atlas bug report, %04u-%02u-%02u %02u:%02u:%02u\r\n"
        "Attach this file to your bug report. It holds Pywel Atlas's logs and settings only, "
        "never a save file.\r\n\r\n===== session header =====\r\n",
        now.wYear, now.wMonth, now.wDay, now.wHour, now.wMinute, now.wSecond);
    WriteText(report, line);
    WriteText(report, header);
    sprintf_s(line, "Detailed log: %s\r\n", PywelReleaseDetailed() ? "on" : "off");
    WriteText(report, line);
    char mods[2048];
    OtherMods(mods, sizeof(mods));
    sprintf_s(line, "Mods loaded now: %s\r\n", mods);
    WriteText(report, line);
    WriteText(report, "\r\n===== recent events (newest last) =====\r\n");
    AcquireSRWLockShared(&eventLock);
    for (unsigned back = kEventCount; back-- > 0;) {
        char eventLine[300];
        if (FormatEvent(back, eventLine)) {
            WriteText(report, eventLine);
            WriteText(report, "\r\n");
        }
    }
    ReleaseSRWLockShared(&eventLock);
    AppendFile(report, L"pywel-atlas.log");
    AppendFile(report, L"pywel-atlas.previous.log");
    AppendFile(report, L"filters.ini");
    AppendFile(report, L"keybinds.ini");
    WriteText(report, "\r\n===== crash dumps =====\r\n");
    wchar_t pattern[MAX_PATH] = {};
    WIN32_FIND_DATAW found = {};
    HANDLE search = FolderFile(L"pywel-atlas-crash-*.dmp", pattern) ? FindFirstFileW(pattern, &found)
                                                                    : INVALID_HANDLE_VALUE;
    unsigned dumps = 0;
    if (search != INVALID_HANDLE_VALUE) {
        do {
            sprintf_s(line, "%ls (%lu bytes; please attach it too)\r\n", found.cFileName, found.nFileSizeLow);
            WriteText(report, line);
            ++dumps;
        } while (FindNextFileW(search, &found));
        FindClose(search);
    }
    if (!dumps) {
        WriteText(report, "none\r\n");
    }
    CloseHandle(report);
    PywelReleaseLog("Bug report written: %ls", name);
    SetReportStatus("Saved %ls in the log folder.", name);
    wchar_t parameters[MAX_PATH + 16] = {};
    swprintf_s(parameters, L"/select,\"%ls\"", path);
    ShellExecuteW(nullptr, L"open", L"explorer.exe", parameters, nullptr, SW_SHOWNORMAL);
    InterlockedExchange(&reportRunning, 0);
    return 0;
}

} // namespace

// Writes one line with the local time in front ("12:25:10 ...").
void PywelReleaseLog(const char* format, ...) {
    char line[512];
    va_list arguments;
    va_start(arguments, format);
    FormatLine(line, format, arguments);
    va_end(arguments);
    WriteLine(line);
}

void PywelReleaseLogStart(void* module, const char* version) {
    strcpy_s(modVersion, version);
    MODULEINFO information = {};
    if (GetModuleInformation(GetCurrentProcess(), static_cast<HMODULE>(module), &information, sizeof(information))) {
        moduleBase = reinterpret_cast<uintptr_t>(information.lpBaseOfDll);
        moduleEnd = moduleBase + information.SizeOfImage;
    }
    ReadGameVersion();
    HeaderLine("Pywel Atlas %s%s starting", modVersion, kBuildKind);
    HeaderLine("Game: %s", gameVersion);
    char windows[64];
    WindowsVersion(windows);
    HeaderLine("Windows: %s; PywelAtlas.asi at 0x%llx (size %llu)", windows,
        static_cast<unsigned long long>(moduleBase), static_cast<unsigned long long>(moduleEnd - moduleBase));
    char mods[2048];
    OtherMods(mods, sizeof(mods));
    HeaderLine("Other mods loaded at start: %s", mods);
    // The crash record: dbghelp is loaded now, since loading a library
    // while the game is crashing is not safe.
    HMODULE dbghelp = LoadLibraryW(L"dbghelp.dll");
    miniDumpWriteDump = dbghelp ? reinterpret_cast<MiniDumpWriteDumpFunction>(
        GetProcAddress(dbghelp, "MiniDumpWriteDump")) : nullptr;
    AcquireSRWLockExclusive(&logLock);
    LogFolder();
    ReleaseSRWLockExclusive(&logLock);
    TrimCrashDumps(3);
    if (!AddVectoredExceptionHandler(1, CrashHandler)) {
        PywelReleaseLog("Crash record could not be set up; a crash would leave no record.");
    } else if (!miniDumpWriteDump) {
        PywelReleaseLog("Crash record set up without crash dumps (dbghelp.dll not available).");
    }
}

const char* PywelReleaseVersion() {
    return modVersion;
}

const char* PywelReleaseGameVersion() {
    return gameVersion;
}

void PywelReleaseNameThread(unsigned long threadId, const char* part) {
    LONG index = InterlockedIncrement(&threadNameCount) - 1;
    if (index < 16) {
        threadNames[index].part = part;
        InterlockedExchange(&threadNames[index].id, static_cast<LONG>(threadId));
    }
}

void PywelReleaseEvent(const char* part, const char* format, ...) {
    char text[232];
    va_list arguments;
    va_start(arguments, format);
    _vsnprintf_s(text, _TRUNCATE, format, arguments);
    va_end(arguments);
    AcquireSRWLockExclusive(&eventLock);
    Event& event = events[eventNext % kEventCount];
    GetLocalTime(&event.time);
    strncpy_s(event.part, part, _TRUNCATE);
    strcpy_s(event.text, text);
    ++eventNext;
    ReleaseSRWLockExclusive(&eventLock);
    if (PywelReleaseDetailed()) {
        PywelReleaseLog("[%s] %s", part, text);
    }
}

void PywelReleaseNote(const char* part, const char* format, ...) {
    char text[232];
    va_list arguments;
    va_start(arguments, format);
    _vsnprintf_s(text, _TRUNCATE, format, arguments);
    va_end(arguments);
    AcquireSRWLockExclusive(&eventLock);
    Event& event = events[eventNext % kEventCount];
    GetLocalTime(&event.time);
    strncpy_s(event.part, part, _TRUNCATE);
    strcpy_s(event.text, text);
    ++eventNext;
    ReleaseSRWLockExclusive(&eventLock);
    PywelReleaseLog("[%s] %s", part, text);
}

namespace {
// True if `line` names a folder (a drive path or a user folder), a user or
// an account; such lines stay out of the player log.
bool PrivateLine(const char* line) {
    static const char* const kWords[] = {":\\", ":/", "user", "account", "steam", "root="};
    char lower[512];
    size_t length = strnlen(line, sizeof(lower) - 1);
    for (size_t index = 0; index < length; ++index) {
        char letter = line[index];
        lower[index] = letter >= 'A' && letter <= 'Z' ? static_cast<char>(letter - 'A' + 'a') : letter;
    }
    lower[length] = 0;
    for (const char* word : kWords) {
        if (strstr(lower, word)) {
            return true;
        }
    }
    return false;
}
} // namespace

void PywelReleaseDetail(const char* part, const char* line) {
    if (!line || !PywelReleaseDetailed() || PrivateLine(line)) {
        return;
    }
    LONG length = static_cast<LONG>(strnlen(line, 480)) + 16;
    LONG before = InterlockedExchangeAdd(&detailBytes, length);
    if (before >= kDetailLimit) {
        return;
    }
    if (before + length >= kDetailLimit) {
        PywelReleaseLog("-- detailed lines reached %ld KB this session; further ones are left out --",
            static_cast<long>(kDetailLimit / 1024));
        return;
    }
    // Cut at 480 characters: the log's line buffer holds 512 with the time.
    PywelReleaseLog("[%s] %.480s", part, line);
}

bool PywelReleaseDetailed() {
    return InterlockedCompareExchange(&detailed, 0, 0) != 0;
}

void PywelSetReleaseDetailed(bool on) {
    if ((InterlockedExchange(&detailed, on ? 1 : 0) != 0) != on) {
        PywelReleaseLog("Detailed log turned %s.", on ? "on" : "off");
    }
}

void PywelReleaseLogRepeat(const char* key, const char* format, ...) {
    ULONGLONG now = GetTickCount64();
    bool write = false;
    unsigned skipped = 0;
    AcquireSRWLockExclusive(&repeatLock);
    Repeat* slot = nullptr;
    for (Repeat& repeat : repeats) {
        if (repeat.key == key || !repeat.key) {
            slot = &repeat;
            break;
        }
    }
    if (slot) {
        slot->key = key;
        if (slot->written < kRepeatFull) {
            ++slot->written;
            write = true;
        } else if (now >= slot->nextSummary) {
            write = true;
            skipped = slot->skipped;
            slot->skipped = 0;
            slot->nextSummary = now + kRepeatSummaryMs;
        } else {
            ++slot->skipped;
        }
    } else {
        write = true; // Table full: never lose an error.
    }
    ReleaseSRWLockExclusive(&repeatLock);
    if (!write) {
        return;
    }
    char text[400];
    va_list arguments;
    va_start(arguments, format);
    _vsnprintf_s(text, _TRUNCATE, format, arguments);
    va_end(arguments);
    if (skipped) {
        PywelReleaseLog("%s (repeating: %u more like it in the last minute)", text, skipped);
    } else {
        PywelReleaseLog("%s", text);
    }
}

void PywelReleaseCreateBugReport() {
    if (InterlockedExchange(&reportRunning, 1) != 0) {
        return;
    }
    SetReportStatus("Writing the bug report...");
    HANDLE thread = CreateThread(nullptr, 0, WriteBugReport, nullptr, 0, nullptr);
    if (thread) {
        CloseHandle(thread);
    } else {
        SetReportStatus("Could not start writing the bug report.");
        InterlockedExchange(&reportRunning, 0);
    }
}

void PywelReleaseBugReportStatus(char* text, unsigned size) {
    AcquireSRWLockShared(&reportLock);
    strncpy_s(text, size, reportStatus, _TRUNCATE);
    ReleaseSRWLockShared(&reportLock);
}

void PywelReleaseOpenLogFolder() {
    AcquireSRWLockExclusive(&logLock);
    bool known = LogFolder();
    ReleaseSRWLockExclusive(&logLock);
    if (known) {
        ShellExecuteW(nullptr, L"open", folder, nullptr, nullptr, SW_SHOWNORMAL);
    }
}
