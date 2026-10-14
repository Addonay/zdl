//! Child process creation, stdio wiring, waiting, killing and output capture, as
//! SDL_process.c and src/process/posix/SDL_posixprocess.c. Built directly over
//! `std.process.spawn`, which supplies fork/exec, pipes, environment replacement,
//! working directories and `/dev/null`. This module adds only SDL semantics that
//! std lacks or words differently:
//!
//! - Stream modes follow SDL: stdin defaults to ignored, stdout and stderr to
//!   inherited; `pipe` creates a parent-side pipe; `file` redirects to an open file.
//! - `stderr_to_stdout` shares stdout's target with stderr. It is supported when
//!   stdout is inherited, ignored or a file. A piped stdout is rejected with
//!   `error.Unsupported`, because std cannot duplicate a pipe end it created.
//! - Background processes get inherited streams redirected to `/dev/null` and run
//!   in their own process group (`pgid = 0`). SDL instead double-forks into a new
//!   session with setsid(2), which std does not expose. The child remains owned
//!   by the `Process` handle and is reaped by `wait` or `deinit`.
//! - Non-blocking wait and SIGTERM/SIGKILL kill use raw `std.os.linux` calls, so
//!   they never block (std's `Child.kill` always waits).
//!
//! Ownership: a `Process` owns its parent-side pipe ends, closing them on wait or
//! `deinit`. `deinit` never kills the child; like SDL it reaps only if the child
//! has already exited, so a still-running child continues without being waited on.
const std = @import("std");
const linux = std.os.linux;

/// How one standard stream of the child is connected.
pub const Stdio = union(enum) {
    /// Share the parent's stream.
    inherit,
    /// Connect to `/dev/null` (SDL's NULL mode).
    ignore,
    /// Create a pipe; the parent end is exposed by `Process.stdin`/`stdout`/`stderr`.
    pipe,
    /// Connect to an already open parent file. The file is not closed by the process.
    file: std.Io.File,
};

/// Spawn parameters. `argv[0]` is resolved through the parent's PATH.
pub const Options = struct {
    /// Command and arguments. Must be nonempty with a nonempty `argv[0]`.
    argv: []const []const u8,
    /// Replacement environment. Null inherits nothing; pass the parent's map to copy it.
    env: ?*const std.process.Environ.Map = null,
    /// Working directory for the child. Null keeps the parent's directory.
    cwd: ?[]const u8 = null,
    /// Standard input. Defaults to `.ignore`, as SDL does.
    stdin: Stdio = .ignore,
    /// Standard output. Defaults to `.inherit`.
    stdout: Stdio = .inherit,
    /// Standard error. Null means the default (`.inherit`) unless `stderr_to_stdout`.
    stderr: ?Stdio = null,
    /// Sends the child's stderr to the same target as its stdout. Ignored when
    /// `stderr` is set explicitly, as in SDL.
    stderr_to_stdout: bool = false,
    /// Runs in the background: inherited streams become `/dev/null` and the child
    /// gets its own process group.
    background: bool = false,
};

/// Errors from spawning. `Unsupported` covers the stdout-pipe-to-stderr case.
pub const SpawnError = std.process.SpawnError || error{
    InvalidArguments,
    Unsupported,
};

/// Terminal state of a child. `exited` carries the exit code; `signaled` the
/// terminating signal number.
pub const Term = std.process.Child.Term;

/// SDL's exit-code convention: the exit code for a normal exit, the negated signal
/// number for a signal death, and -255 for other stop states.
pub fn sdl_exit_code(term: Term) i32 {
    return switch (term) {
        .exited => |code| code,
        .signal => |sig| -@as(i32, @intCast(@backingInt(sig))),
        else => -255,
    };
}

/// A spawned child process. Not copyable after spawning; pass by pointer.
pub const Process = struct {
    child: std.process.Child,
    background: bool,
    /// Termination status once reaped by `wait`; null while the child is running.
    term: ?Term = null,

    /// Parent-side write end of the child's stdin, if it was created with `.pipe`.
    pub fn stdin(self: *const Process) ?std.Io.File {
        return self.child.stdin;
    }

    /// Parent-side read end of the child's stdout, if it was created with `.pipe`.
    pub fn stdout(self: *const Process) ?std.Io.File {
        return self.child.stdout;
    }

    /// Parent-side read end of the child's stderr, if it was created with `.pipe`.
    pub fn stderr(self: *const Process) ?std.Io.File {
        return self.child.stderr;
    }

    /// Operating-system process id, or null after the child was reaped.
    pub fn pid(self: *const Process) ?std.posix.pid_t {
        return self.child.id;
    }

    /// Waits for termination. With `block` the call blocks until exit; without it the
    /// call returns null while the child still runs. Once reaped, the status is
    /// remembered, and every later call returns it without touching the kernel.
    pub fn wait(self: *Process, io: std.Io, block: bool) std.process.Child.WaitError!?Term {
        if (self.term) |term| return term;
        if (block) {
            const term = try self.child.wait(io);
            self.term = term;
            return term;
        }
        const id = self.child.id orelse return null;
        var status: i32 = 0;
        const rc = linux.waitpid(id, &status, linux.W.NOHANG);
        switch (linux.errno(rc)) {
            .SUCCESS => {},
            .INTR => return null,
            else => return error.Unexpected,
        }
        if (rc == 0) return null;
        const term = status_to_term(status);
        self.finish_reaped(io, term);
        return term;
    }

    /// Sends SIGTERM (`force = false`) or SIGKILL (`force = true`). Does not wait:
    /// call `wait` to observe the exit. Errors when the child is already reaped.
    pub fn kill(self: *Process, force: bool) error{ NotRunning, KillFailed }!void {
        const id = self.child.id orelse return error.NotRunning;
        const sig: linux.SIG = if (force) .KILL else .TERM;
        switch (linux.errno(linux.kill(id, sig))) {
            .SUCCESS => {},
            else => return error.KillFailed,
        }
    }

    /// Releases the parent's pipe ends and reaps the child if it has already exited.
    /// A still-running child is neither killed nor waited for; it stays a child of
    /// this process until it exits and the zombie is collected at process exit.
    pub fn deinit(self: *Process, io: std.Io) void {
        if (self.term == null) _ = self.wait(io, false) catch null;
        self.close_pipes(io);
        self.* = undefined;
    }

    fn finish_reaped(self: *Process, io: std.Io, term: Term) void {
        // std's blocking wait closes the pipes and clears the id; mirror that here
        // because the non-blocking path bypasses std.
        self.term = term;
        self.close_pipes(io);
        self.child.id = null;
    }

    fn close_pipes(self: *Process, io: std.Io) void {
        if (self.child.stdin) |file| file.close(io);
        if (self.child.stdout) |file| file.close(io);
        if (self.child.stderr) |file| file.close(io);
        self.child.stdin = null;
        self.child.stdout = null;
        self.child.stderr = null;
    }
};

/// Decodes a `waitpid` status word as the POSIX W* macros do: low 7 bits zero for
/// a normal exit (code in bits 8..15), 0x7f for a stop, otherwise a signal death.
fn status_to_term(status: i32) Term {
    const bits: u32 = @bitCast(status);
    const low = bits & 0x7f;
    if (low == 0) return .{ .exited = @truncate(bits >> 8) };
    if (low == 0x7f) return .{ .stopped = @fromBackingInt(@as(u8, @truncate(bits >> 8))) };
    return .{ .signal = @fromBackingInt(@as(u8, @truncate(low))) };
}

/// Starts a child process. The caller owns the returned `Process` and must call
/// `deinit` (or reap it with `wait`) before the process exits.
pub fn spawn(io: std.Io, options: Options) SpawnError!Process {
    if (options.argv.len == 0 or options.argv[0].len == 0) return error.InvalidArguments;

    var stdin_mode = options.stdin;
    var stdout_mode = options.stdout;
    var stderr_mode: Stdio = options.stderr orelse .inherit;

    if (options.background) {
        // Background children must not hold the terminal; inherited streams become null.
        if (stdin_mode == .inherit) stdin_mode = .ignore;
        if (stdout_mode == .inherit) stdout_mode = .ignore;
        if (stderr_mode == .inherit) stderr_mode = .ignore;
    }

    if (options.stderr == null and options.stderr_to_stdout) {
        stderr_mode = switch (stdout_mode) {
            .inherit => .{ .file = std.Io.File.stdout() },
            .ignore => .ignore,
            .file => |file| .{ .file = file },
            .pipe => return error.Unsupported,
        };
    }

    const child = try std.process.spawn(io, .{
        .argv = options.argv,
        .environ_map = options.env,
        .cwd = if (options.cwd) |path| .{ .path = path } else .inherit,
        .stdin = to_std(stdin_mode),
        .stdout = to_std(stdout_mode),
        .stderr = to_std(stderr_mode),
        .pgid = if (options.background) 0 else null,
    });
    return .{ .child = child, .background = options.background };
}

fn to_std(mode: Stdio) std.process.SpawnOptions.StdIo {
    return switch (mode) {
        .inherit => .inherit,
        .ignore => .ignore,
        .pipe => .pipe,
        .file => |file| .{ .file = file },
    };
}

/// Captured standard output and the child's exit status.
pub const Output = struct {
    /// Everything the child wrote to stdout. Owned by the caller's allocator.
    bytes: []u8,
    term: Term,
};

/// Errors from `read_all`.
pub const ReadAllError = std.mem.Allocator.Error || std.Io.Reader.LimitedAllocError || std.process.Child.WaitError || error{NoStdout};

/// Reads the child's stdout to end-of-file, waits for exit and returns both. The
/// process must have been spawned with `.stdout = .pipe`. Consumes the stdout pipe.
pub fn read_all(gpa: std.mem.Allocator, io: std.Io, process: *Process) ReadAllError!Output {
    const stdout_file = process.stdout() orelse return error.NoStdout;
    var buffer: [4096]u8 = undefined;
    var reader = stdout_file.reader(io, &buffer);
    const bytes = try reader.interface.allocRemaining(gpa, .unlimited);
    errdefer gpa.free(bytes);
    const term = (try process.wait(io, true)).?;
    return .{ .bytes = bytes, .term = term };
}

const testing = std.testing;

test "exit codes follow SDL's convention" {
    try testing.expectEqual(@as(i32, 7), sdl_exit_code(.{ .exited = 7 }));
    try testing.expectEqual(@as(i32, -9), sdl_exit_code(.{ .signal = .KILL }));
    try testing.expectEqual(@as(i32, -255), sdl_exit_code(.{ .unknown = 1 }));
}

test "waitpid status words decode like the W macros" {
    try testing.expectEqual(@as(u8, 3), status_to_term(3 << 8).exited);
    try testing.expectEqual(@as(i32, -15), sdl_exit_code(status_to_term(15)));
    try testing.expect(status_to_term((19 << 8) | 0x7f) == .stopped);
}

test "invalid arguments are rejected" {
    try testing.expectError(error.InvalidArguments, spawn(testing.io, .{ .argv = &.{} }));
    try testing.expectError(error.InvalidArguments, spawn(testing.io, .{ .argv = &.{""} }));
}

test "captures stdout and the exit status of a child" {
    if (@import("builtin").os.tag != .linux) return error.SkipZigTest;
    var env = std.process.Environ.Map.init(testing.allocator);
    defer env.deinit();
    var child = try spawn(testing.io, .{
        .argv = &.{ "/bin/sh", "-c", "printf hello; exit 3" },
        .env = &env,
        .stdout = .pipe,
    });
    defer child.deinit(testing.io);
    const output = try read_all(testing.allocator, testing.io, &child);
    defer testing.allocator.free(output.bytes);
    try testing.expectEqualStrings("hello", output.bytes);
    try testing.expectEqual(@as(i32, 3), sdl_exit_code(output.term));
    try testing.expect(child.pid() == null or child.term != null);
}

test "stderr can follow stdout and stdin can be piped" {
    if (@import("builtin").os.tag != .linux) return error.SkipZigTest;
    var env = std.process.Environ.Map.init(testing.allocator);
    defer env.deinit();
    // A piped stdout cannot be shared with stderr (documented limitation).
    try testing.expectError(error.Unsupported, spawn(testing.io, .{
        .argv = &.{ "/bin/sh", "-c", "true" },
        .env = &env,
        .stdout = .pipe,
        .stderr_to_stdout = true,
    }));

    var child = try spawn(testing.io, .{
        .argv = &.{"/bin/cat"},
        .env = &env,
        .stdin = .pipe,
        .stdout = .pipe,
    });
    defer child.deinit(testing.io);
    const input = child.stdin().?;
    try input.writeStreamingAll(testing.io, "round trip");
    input.close(testing.io);
    child.child.stdin = null;
    const output = try read_all(testing.allocator, testing.io, &child);
    defer testing.allocator.free(output.bytes);
    try testing.expectEqualStrings("round trip", output.bytes);
    try testing.expectEqual(@as(i32, 0), sdl_exit_code(output.term));
}

test "non-blocking wait and kill" {
    if (@import("builtin").os.tag != .linux) return error.SkipZigTest;
    var env = std.process.Environ.Map.init(testing.allocator);
    defer env.deinit();
    var child = try spawn(testing.io, .{
        .argv = &.{ "/bin/sh", "-c", "sleep 30" },
        .env = &env,
    });
    defer child.deinit(testing.io);
    try testing.expect((try child.wait(testing.io, false)) == null);
    try child.kill(true);
    const term = (try child.wait(testing.io, true)).?;
    try testing.expectEqual(@as(i32, -9), sdl_exit_code(term));
    try testing.expectError(error.NotRunning, child.kill(false));
    try testing.expectEqual(@as(i32, -9), sdl_exit_code((try child.wait(testing.io, false)).?));
}
