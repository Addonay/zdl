//! Asynchronous file I/O with explicit completion queues.
//!
//! Native port of SDL's asyncio (`src/io/SDL_asyncio.c`, the io_uring backend
//! and the generic fallback). An `AsyncFile` names an open descriptor; work is
//! submitted to a `Queue` that owns the completion side. Results are fetched
//! without blocking with `get_result`, or with `wait_result`, which can sleep and
//! is woken by `signal`.
//!
//! Deliberate differences from SDL:
//! - io_uring is driven through `std.os.linux.IoUring`, not liburing. The backend
//!   is chosen when the queue is created; a queue never silently falls back.
//! - The generic backend executes each transfer synchronously in the submitting
//!   thread (while holding the queue lock) and reports it through the queue. It
//!   starts no thread pool.
//! - Reads and writes use `pread`/`pwrite` at the requested offset, so requests
//!   on one file need no lock around a shared seek position.
//! - A flush uses `fdatasync` on both backends. SDL's generic path flushed only
//!   stdio buffers, which does not reach physical media.
//! - `Outcome.file` is null for close and `load_file` outcomes, instead of a
//!   pointer that is invalid once the file has been freed.
//! - Waits take nanoseconds, and `null` means wait indefinitely.
//! - SDL has no public cancellation call, so none is exposed here. The
//!   `canceled` result is reported when the kernel cancels a request.
//! - Once an SQE is accepted, submission returns a ticket even if entering the
//!   kernel fails. Unconsumed SQEs become failure outcomes; consumed SQEs retain
//!   their normal kernel completion. Every accepted borrow has an outcome.
//! - Wait deadlines and wakeups use ppoll and private per-waiter eventfds, not
//!   SQEs. Waits therefore consume no ring slots and leave no timers to retire.
//!
//! Ownership: a `Queue` owns its ring, its completed results and any `load_file`
//! buffers not yet fetched. `AsyncFile` values are heap-allocated with the
//! allocator given to `open`; `close` hands ownership to the queue, and the
//! file is freed when its close outcome is fetched. Destroying a queue waits for
//! all in-flight requests to finish, as SDL does, and frees their results.
//! Queues and files must not move while requests or waiters are active.

const std = @import("std");
const linux = std.os.linux;
const posix = std.posix;
const Allocator = std.mem.Allocator;
const DoublyLinkedList = std.DoublyLinkedList;
const SpinLock = @import("../thread/sync.zig").SpinLock;

/// Completion backend chosen at queue creation.
pub const Backend = enum {
    /// Kernel io_uring through `std.os.linux.IoUring`. Requires the FSYNC,
    /// CLOSE, READ and WRITE opcodes.
    io_uring,
    /// Synchronous execution in the submitting thread.
    generic,
};

/// File opening modes. These are SDL's mode strings without the binary suffix.
pub const Mode = enum {
    /// "r": an existing file, read only.
    read,
    /// "w": creates or truncates the file, write only.
    write,
    /// "r+": an existing file, readable and writable.
    read_write,
    /// "w+": creates or truncates the file, readable and writable.
    read_write_truncate,

    /// Maps SDL's mode strings to a mode. Returns null for any other string.
    pub fn parse(text: []const u8) ?Mode {
        if (std.mem.eql(u8, text, "r")) return .read;
        if (std.mem.eql(u8, text, "w")) return .write;
        if (std.mem.eql(u8, text, "r+")) return .read_write;
        if (std.mem.eql(u8, text, "w+")) return .read_write_truncate;
        return null;
    }

    fn open_flags(mode: Mode) posix.O {
        return switch (mode) {
            .read => .{ .ACCMODE = .RDONLY, .CLOEXEC = true },
            .write => .{ .ACCMODE = .WRONLY, .CREAT = true, .TRUNC = true, .CLOEXEC = true },
            .read_write => .{ .ACCMODE = .RDWR, .CLOEXEC = true },
            .read_write_truncate => .{ .ACCMODE = .RDWR, .CREAT = true, .TRUNC = true, .CLOEXEC = true },
        };
    }
};

/// The kind of request a result belongs to.
pub const TaskKind = enum { read, write, close };

/// Final state of a request. `failure` carries the errno that stopped it.
pub const Result = union(enum) {
    complete,
    failure: linux.E,
    canceled,
};

/// Identifies one submitted request within its queue. Tickets increase per queue.
pub const Ticket = struct {
    id: u64,
};

/// The memory a request transfers. `read` and `write` borrow caller memory, which
/// must stay valid until the request's outcome is fetched. `loaded` is owned by
/// the caller once a `load_file` outcome is fetched and must be freed with the
/// queue's allocator. It has a zero sentinel at `[requested]`; a short read leaves
/// the bytes past `bytes_transferred` zeroed.
pub const Buffer = union(enum) {
    none,
    read: []u8,
    write: []const u8,
    loaded: [:0]u8,
};

/// Errors before accepting a request: no borrow or file ownership is retained.
/// Kernel submission errors after acceptance are delivered through the outcome.
/// `SubmitFailed` is retained for source compatibility but is no longer returned.
pub const SubmitError = error{
    SubmissionQueueFull,
    RequestTooLarge,
    OffsetOutOfRange,
    FileClosing,
    SubmitFailed,
    OutOfMemory,
};

pub const OpenError = posix.OpenError || error{ NameTooLong, OutOfMemory };
pub const SizeError = error{SizeUnavailable};
pub const LoadError = OpenError || SizeError || SubmitError || error{FileTooLarge};

/// Submission and completion ring capacity, matching SDL's liburing backend.
const ring_entries: u16 = 128;
const ring_capacity: u32 = ring_entries;

const required_ops = [_]linux.IORING_OP{ .FSYNC, .CLOSE, .READ, .WRITE };

/// Queue of requests for user values of type `User`.
pub fn Queue(comptime User: type) type {
    return Runtime(User).QueueImpl;
}

/// An open file whose requests report to `Queue(User)`.
pub fn AsyncFile(comptime User: type) type {
    return Runtime(User).FileImpl;
}

/// A finished request, as returned by `get_result` and `wait_result`.
pub fn Outcome(comptime User: type) type {
    return Runtime(User).OutcomeImpl;
}

fn Runtime(comptime User: type) type {
    return struct {
        /// A finished request. Read and write outcomes are valid until the file
        /// is closed and its close outcome is fetched; the caller owns `loaded`
        /// buffers.
        pub const OutcomeImpl = struct {
            ticket: Ticket,
            kind: TaskKind,
            result: Result,
            /// The file a read or write used. Null for close and `load_file` outcomes.
            file: ?*FileImpl,
            buffer: Buffer,
            offset: u64,
            bytes_requested: usize,
            bytes_transferred: usize,
            user: User,
        };

        /// One submitted request. The node links it into the owning queue's
        /// completed list or into a file's deferred-close slot.
        const Task = struct {
            node: DoublyLinkedList.Node = .{},
            queue: *QueueImpl,
            file: *FileImpl,
            kind: TaskKind,
            ticket: Ticket,
            buffer: Buffer,
            offset: u64,
            requested: usize,
            transferred: usize = 0,
            result: Result = .complete,
            /// Kernel completions still expected for the current phase.
            cqes_outstanding: u8 = 1,
            /// A flushing close submits CLOSE only after the FSYNC completion.
            flushing: bool = false,
            flush: bool = false,
            /// Set by `load_file`; the outcome is not delivered.
            oneshot: bool = false,
            /// Suppresses the internal close outcome of a whole-file load.
            discard: bool = false,
            /// A close SQE rejected before kernel consumption must still close
            /// the fd after any earlier flush phase has completed.
            fallback_close: bool = false,
            user: User,
        };

        /// An open descriptor. Requests may be in flight until the close request
        /// completes. Lock order: queue lock, then file lock.
        pub const FileImpl = struct {
            allocator: Allocator,
            fd: linux.fd_t,
            lock: SpinLock = .{},
            /// Read and write requests not yet fetched by a queue user.
            pending: usize = 0,
            close_requested: bool = false,
            /// A close waiting for `pending` to reach zero. The fetch that
            /// releases the last request submits it.
            closing_task: ?*Task = null,

            /// Opens `path` with `mode`. The file object is allocated with `allocator`.
            pub fn open(allocator: Allocator, path: []const u8, mode: Mode) OpenError!*FileImpl {
                var path_z = try posix.toPosixPath(path);
                const fd = try posix.openatZ(linux.AT.FDCWD, &path_z, mode.open_flags(), 0o644);
                const file = allocator.create(FileImpl) catch |err| {
                    _ = linux.close(fd);
                    return err;
                };
                file.* = .{ .allocator = allocator, .fd = fd };
                return file;
            }

            /// Returns the file size in bytes. This is a synchronous metadata query.
            pub fn size(self: *const FileImpl) SizeError!u64 {
                var stat: linux.Statx = undefined;
                const rc = linux.statx(self.fd, "", linux.AT.EMPTY_PATH, .{ .SIZE = true }, &stat);
                if (linux.errno(rc) != .SUCCESS) return error.SizeUnavailable;
                return stat.size;
            }

            /// Starts reading into `buf` at `offset`. The read may transfer fewer
            /// bytes than requested at end of file. `buf` must stay valid until the
            /// outcome is fetched.
            pub fn read(self: *FileImpl, queue: *QueueImpl, buf: []u8, offset: u64, user: User) SubmitError!Ticket {
                const task = try queue.make_task(self, .read, .{ .read = buf }, offset, buf.len, user, false);
                return queue.submit_task(task, null);
            }

            /// Starts writing `buf` at `offset`. A short transfer is a failure.
            pub fn write(self: *FileImpl, queue: *QueueImpl, buf: []const u8, offset: u64, user: User) SubmitError!Ticket {
                const task = try queue.make_task(self, .write, .{ .write = buf }, offset, buf.len, user, false);
                return queue.submit_task(task, null);
            }

            /// Closes the file after every earlier request on it has been fetched.
            /// With `flush`, the data is written to storage before the close.
            /// The file object is freed when the close outcome is fetched.
            pub fn close(self: *FileImpl, queue: *QueueImpl, flush: bool, user: User) SubmitError!Ticket {
                const task = try queue.make_close_task(self, flush, false, user);
                return queue.submit_task(task, null);
            }

            fn release_unqueued(self: *FileImpl) void {
                _ = linux.close(self.fd);
                self.allocator.destroy(self);
            }
        };

        /// A set of in-flight requests and their finished results.
        pub const QueueImpl = struct {
            allocator: Allocator,
            backend: Backend,
            lock: SpinLock = .{},
            ring: ?linux.IoUring = null,
            /// SQEs queued whose completion has not been consumed from the ring.
            ring_outstanding: u32 = 0,
            /// Requests submitted and not yet fetched or discarded. Destroying the
            /// queue waits until this is zero.
            inflight: usize = 0,
            next_id: u64 = 1,
            completed: DoublyLinkedList = .{},
            /// Deferred closes ready to submit once a ring slot becomes free.
            ready_closes: DoublyLinkedList = .{},
            /// Registered stack-owned waiters. Each has an independent wake fd,
            /// so one consumer cannot consume another waiter's signal.
            waiters: DoublyLinkedList = .{},
            /// Incremented by `signal`; waiters that see a change return null.
            signal_epoch: u32 = 0,
            /// Futex word for generic waits and the fd-exhaustion fallback.
            /// Changed under `lock` before waking registered waiters.
            generation: std.atomic.Value(u32) = .init(0),

            const Waiter = struct {
                node: DoublyLinkedList.Node = .{},
                fd: linux.fd_t,
            };

            /// Creates a queue on `backend`. The io_uring backend returns
            /// `error.UnsupportedBackend` if the kernel lacks a required opcode.
            pub fn init(allocator: Allocator, backend: Backend) !QueueImpl {
                var queue: QueueImpl = .{ .allocator = allocator, .backend = backend };
                if (backend == .io_uring) {
                    var ring = try linux.IoUring.init(ring_entries, 0);
                    errdefer ring.deinit();
                    const probe = try ring.get_probe();
                    for (required_ops) |op| {
                        if (!probe.is_supported(op)) return error.UnsupportedBackend;
                    }
                    queue.ring = ring;
                }
                return queue;
            }

            /// Waits for every in-flight request, then releases the ring. Results
            /// that were never fetched are discarded, and their `load_file`
            /// buffers are freed. Files not closed before this call stay open.
            pub fn deinit(self: *QueueImpl) void {
                while (self.inflight > 0) {
                    const outcome = self.wait_inner(null, true) orelse continue;
                    if (is_loaded(outcome.buffer)) self.allocator.free(outcome.buffer.loaded);
                }
                if (self.ring) |*ring| ring.deinit();
                self.* = undefined;
            }

            /// Returns one finished request without blocking, or null if none is ready.
            pub fn get_result(self: *QueueImpl) ?OutcomeImpl {
                var deferred: DoublyLinkedList = .{};
                self.lock.lock();
                if (self.ring != null) self.drain_locked();
                const task = self.take_locked(&deferred);
                self.lock.unlock();
                submit_deferred(&deferred);
                return if (task) |t| self.finish(t) else null;
            }

            /// Waits up to `timeout_ns` nanoseconds for a finished request, or
            /// indefinitely for `null`. Returns null on timeout, when `signal` was
            /// called after the wait began, or when the queue is driven by a
            /// backend that cannot report a result. Several waiters may compete for
            /// one result.
            pub fn wait_result(self: *QueueImpl, timeout_ns: ?u64) ?OutcomeImpl {
                return self.wait_inner(timeout_ns, false);
            }

            /// `idle_returns` makes the wait return null as soon as nothing remains
            /// in flight, which `deinit` needs after discarding the last request.
            fn wait_inner(self: *QueueImpl, timeout_ns: ?u64, idle_returns: bool) ?OutcomeImpl {
                const deadline: ?u64 = if (timeout_ns) |t| monotonic_ns() +| t else null;
                self.lock.lock();
                const epoch = self.signal_epoch;
                self.lock.unlock();
                // Capture the signal epoch before fd setup, so a signal during
                // setup is still observed before registration/blocking.
                // Allocation failure uses a futex fallback checking the ring each ms.
                const wake_fd = if (self.ring != null) make_wake_fd() else -1;
                defer if (wake_fd >= 0) {
                    _ = linux.close(wake_fd);
                };
                var waiter: Waiter = .{ .fd = wake_fd };
                while (true) {
                    var deferred: DoublyLinkedList = .{};
                    self.lock.lock();
                    if (self.ring != null) self.drain_locked();
                    const task = self.take_locked(&deferred);
                    const left = remaining(deadline);
                    const expired = if (left) |l| l == 0 else false;
                    const signaled = self.signal_epoch != epoch;
                    if (task) |t| {
                        self.lock.unlock();
                        submit_deferred(&deferred);
                        return self.finish(t);
                    }
                    const idle = idle_returns and self.inflight == 0;
                    if (signaled or expired or idle) {
                        self.lock.unlock();
                        submit_deferred(&deferred);
                        return null;
                    }
                    const expected = self.generation.load(.acquire);
                    if (wake_fd >= 0) self.waiters.append(&waiter.node);
                    self.lock.unlock();
                    submit_deferred(&deferred);
                    if (wake_fd >= 0) {
                        // Recompute after releasing the lock/dispatching deferred
                        // work, so that setup time does not extend the deadline.
                        block_ring(self.ring_ptr().fd, wake_fd, remaining(deadline));
                        self.lock.lock();
                        self.waiters.remove(&waiter.node);
                        drain_wake_fd(wake_fd);
                        self.lock.unlock();
                    } else {
                        const now_left = remaining(deadline);
                        const sleep_ns = if (self.ring != null)
                            @min(now_left orelse std.time.ns_per_ms, std.time.ns_per_ms)
                        else
                            now_left;
                        block_futex(&self.generation.raw, expected, sleep_ns);
                    }
                }
            }

            /// Wakes every thread blocked in `wait_result` on this queue. Their
            /// calls return null unless a result is ready.
            pub fn signal(self: *QueueImpl) void {
                self.lock.lock();
                defer self.lock.unlock();
                self.signal_epoch +%= 1;
                self.wake_locked();
            }

            /// Reads the whole file at `path` into a zero-terminated buffer. The
            /// read outcome carries the buffer, which the caller frees with the
            /// queue's allocator; `bytes_transferred` gives the data length. The file
            /// is closed automatically and no close outcome is delivered.
            pub fn load_file(self: *QueueImpl, path: []const u8, user: User) LoadError!Ticket {
                const file = try FileImpl.open(self.allocator, path, .read);
                const size = file.size() catch |err| {
                    file.release_unqueued();
                    return err;
                };
                const len = std.math.cast(usize, size) orelse {
                    file.release_unqueued();
                    return error.FileTooLarge;
                };
                const buffer = self.allocator.allocSentinel(u8, len, 0) catch |err| {
                    file.release_unqueued();
                    return err;
                };
                @memset(buffer, 0);
                const read = self.make_task(file, .read, .{ .loaded = buffer }, 0, len, user, true) catch |err| {
                    self.allocator.free(buffer);
                    file.release_unqueued();
                    return err;
                };
                const close = self.make_close_task(file, false, true, user) catch |err| {
                    self.allocator.destroy(read);
                    self.allocator.free(buffer);
                    file.release_unqueued();
                    return err;
                };
                return self.submit_task(read, close) catch |err| {
                    // A returned error means neither task was accepted.
                    self.allocator.free(buffer);
                    file.release_unqueued();
                    return err;
                };
            }

            fn make_task(self: *QueueImpl, file: *FileImpl, kind: TaskKind, buffer: Buffer, offset: u64, len: usize, user: User, oneshot: bool) SubmitError!*Task {
                if (self.backend == .io_uring and len > std.math.maxInt(u32)) return error.RequestTooLarge;
                if (offset > std.math.maxInt(i64) or @as(u64, len) > std.math.maxInt(i64) - offset) return error.OffsetOutOfRange;
                const task = try self.allocator.create(Task);
                task.* = .{
                    .queue = self,
                    .file = file,
                    .kind = kind,
                    .ticket = .{ .id = 0 },
                    .buffer = buffer,
                    .offset = offset,
                    .requested = len,
                    .user = user,
                    .oneshot = oneshot,
                };
                return task;
            }

            fn make_close_task(self: *QueueImpl, file: *FileImpl, flush: bool, oneshot: bool, user: User) SubmitError!*Task {
                const task = try self.allocator.create(Task);
                task.* = .{
                    .queue = self,
                    .file = file,
                    .kind = .close,
                    .ticket = .{ .id = 0 },
                    .buffer = .none,
                    .offset = 0,
                    .requested = 0,
                    .flush = flush,
                    .oneshot = oneshot,
                    .discard = oneshot,
                    .user = user,
                };
                return task;
            }

            /// Queues `task`, and `close` when given, under the queue and file locks.
            /// On success the task is in flight, and synchronous (generic)
            /// execution has been done or is about to be done outside the lock.
            fn submit_task(self: *QueueImpl, task: *Task, close: ?*Task) SubmitError!Ticket {
                const file = task.file;
                self.lock.lock();
                file.lock.lock();
                const run_now = self.enqueue_locked(task, close) catch |err| {
                    file.lock.unlock();
                    self.lock.unlock();
                    self.allocator.destroy(task);
                    if (close) |c| self.allocator.destroy(c);
                    return err;
                };
                const ticket = task.ticket;
                file.lock.unlock();
                if (run_now) {
                    run_sync(task);
                    self.push_completed_locked(task);
                }
                self.lock.unlock();
                return ticket;
            }

            /// Performs the state changes and ring submission for `task`, with both
            /// locks held. Returns true when the generic backend must run the task
            /// synchronously. Returned errors leave no state changed.
            fn enqueue_locked(self: *QueueImpl, task: *Task, close: ?*Task) SubmitError!bool {
                const file = task.file;
                if (file.close_requested) return error.FileClosing;
                if (task.kind == .close) {
                    task.ticket = self.next_ticket();
                    if (file.pending > 0) {
                        // Deferred until the last earlier request is fetched.
                        file.close_requested = true;
                        file.closing_task = task;
                        self.inflight += 1;
                        return false;
                    }
                    if (self.ring != null and self.ring_outstanding + task.cqes_outstanding > ring_capacity) {
                        return error.SubmissionQueueFull;
                    }
                    file.close_requested = true;
                    self.inflight += 1;
                    if (self.ring == null) return true;
                    self.submit_close_sqes(task);
                    return false;
                }

                task.ticket = self.next_ticket();
                if (self.ring != null) {
                    if (self.ring_outstanding >= ring_capacity) return error.SubmissionQueueFull;
                    const ring = self.ring_ptr();
                    const user_data = @intFromPtr(task);
                    _ = (if (task.kind == .read)
                        ring.read(user_data, file.fd, .{ .buffer = read_slice(task.buffer) }, task.offset)
                    else
                        ring.write(user_data, file.fd, write_slice(task.buffer), task.offset)) catch return error.SubmissionQueueFull;
                    file.pending += 1;
                    self.inflight += 1;
                    self.ring_outstanding += 1;
                    if (close) |c| self.register_close(file, c);
                    self.submit_ring_locked();
                    return false;
                }
                file.pending += 1;
                self.inflight += 1;
                if (close) |c| self.register_close(file, c);
                return true;
            }

            /// Makes `close` the file's deferred close. Called after a request was
            /// counted in `pending`, so the close cannot be submitted early.
            fn register_close(self: *QueueImpl, file: *FileImpl, close: *Task) void {
                close.ticket = self.next_ticket();
                file.close_requested = true;
                file.closing_task = close;
                self.inflight += 1;
            }

            /// Submits one phase of close. A separate flush CQE gates the close,
            /// because a short enter can split even hard-linked SQEs across
            /// submission boundaries. Caller ensures one free ring slot.
            fn submit_close_sqes(self: *QueueImpl, task: *Task) void {
                const ring = self.ring_ptr();
                const user_data = @intFromPtr(task);
                const fd = task.file.fd;
                task.cqes_outstanding = 1;
                task.flushing = task.flush;
                if (task.flushing) {
                    _ = ring.fsync(user_data, fd, linux.IORING_FSYNC_DATASYNC) catch unreachable;
                } else {
                    _ = ring.close(user_data, fd) catch unreachable;
                }
                self.ring_outstanding += 1;
                self.submit_ring_locked();
            }

            /// Starts a ready close, or queues it until a ring slot becomes free.
            /// io_uring waits never fall back to a synchronous flush on saturation.
            fn dispatch_deferred_close_locked(self: *QueueImpl, task: *Task) void {
                if (self.ring == null) {
                    close_sync(task);
                    self.push_completed_locked(task);
                } else if (self.ring_outstanding == ring_capacity) {
                    self.ready_closes.append(&task.node);
                } else {
                    self.submit_close_sqes(task);
                }
            }

            fn dispatch_ready_closes_locked(self: *QueueImpl) void {
                while (self.ring_outstanding < ring_capacity) {
                    const node = self.ready_closes.popFirst() orelse return;
                    const task: *Task = @fieldParentPtr("node", node);
                    self.submit_close_sqes(task);
                }
            }

            fn submit_deferred(deferred: *DoublyLinkedList) void {
                while (deferred.popFirst()) |node| {
                    const task: *Task = @fieldParentPtr("node", node);
                    const owner = task.queue;
                    owner.lock.lock();
                    owner.dispatch_deferred_close_locked(task);
                    owner.lock.unlock();
                }
            }

            /// Moves one finished request out of the completed list, skipping
            /// discarded ones. Bookkeeping that may submit another queue's close is
            /// appended to `deferred`, to run after this lock is released.
            fn take_locked(self: *QueueImpl, deferred: *DoublyLinkedList) ?*Task {
                while (self.completed.popFirst()) |node| {
                    const task: *Task = @fieldParentPtr("node", node);
                    self.inflight -= 1;
                    retire_locked(task, deferred);
                    if (task.discard) {
                        if (is_loaded(task.buffer)) self.allocator.free(task.buffer.loaded);
                        self.allocator.destroy(task);
                        continue;
                    }
                    return task;
                }
                return null;
            }

            fn finish(self: *QueueImpl, task: *Task) OutcomeImpl {
                if (is_loaded(task.buffer) and task.transferred < task.requested) {
                    @memset(task.buffer.loaded[task.transferred..task.requested], 0);
                }
                const outcome: OutcomeImpl = .{
                    .ticket = task.ticket,
                    .kind = task.kind,
                    .result = task.result,
                    .file = if (task.kind == .close or task.oneshot) null else task.file,
                    .buffer = task.buffer,
                    .offset = task.offset,
                    .bytes_requested = task.requested,
                    .bytes_transferred = task.transferred,
                    .user = task.user,
                };
                self.allocator.destroy(task);
                return outcome;
            }

            fn push_completed_locked(self: *QueueImpl, task: *Task) void {
                self.completed.append(&task.node);
                self.wake_locked();
            }

            fn next_ticket(self: *QueueImpl) Ticket {
                const id = self.next_id;
                self.next_id += 1;
                return .{ .id = id };
            }

            fn ring_ptr(self: *QueueImpl) *linux.IoUring {
                return &self.ring.?;
            }

            /// Wakes every registered waiter under the same lock as the state
            /// check and registration. Eventfds remain readable until their owner
            /// returns from ppoll; futex compares the generation before sleeping.
            fn wake_locked(self: *QueueImpl) void {
                _ = self.generation.fetchAdd(1, .release);
                _ = linux.futex_3arg(&self.generation.raw, .{ .cmd = .WAKE, .private = true }, std.math.maxInt(i32));
                var node = self.waiters.first;
                while (node) |n| : (node = n.next) {
                    const waiter: *Waiter = @fieldParentPtr("node", n);
                    const one: u64 = 1;
                    while (true) {
                        const rc = linux.write(waiter.fd, std.mem.asBytes(&one).ptr, @sizeOf(u64));
                        if (linux.errno(rc) != .INTR) break;
                    }
                }
            }

            /// Only this lock holder enters the ring; SQPOLL is never enabled.
            /// On failure, the kernel SQ head separates consumed operations from
            /// safe-to-retire borrows. Retract only the unconsumed tail and turn
            /// it into ordinary failure completions, never a hidden accepted borrow.
            fn submit_ring_locked(self: *QueueImpl) void {
                const ring = self.ring_ptr();
                var pending = ring.flush_sq();
                while (pending != 0) {
                    const rc = linux.io_uring_enter(ring.fd, pending, 0, 0, null);
                    const e = linux.errno(rc);
                    if (e == .INTR) continue;
                    if (e == .SUCCESS and rc > 0) {
                        pending = ring.sq_ready();
                        continue;
                    }
                    const failure: linux.E = if (e == .SUCCESS) .IO else e;
                    const head = @atomicLoad(u32, ring.sq.head, .acquire);
                    const tail = ring.sq.sqe_tail;
                    // Copy before rollback permits subsequent dispatches to use
                    // these slots, while consumed SQEs still complete normally.
                    var rejected: [ring_entries]linux.io_uring_sqe = undefined;
                    var count: usize = 0;
                    var index = head;
                    while (index != tail) : (index +%= 1) {
                        rejected[count] = ring.sq.sqes[ring.sq.array[index & ring.sq.mask]];
                        count += 1;
                    }
                    @atomicStore(u32, ring.sq.tail, head, .release);
                    ring.sq.sqe_head = head;
                    ring.sq.sqe_tail = head;
                    for (rejected[0..count]) |sqe| {
                        const task: *Task = @ptrFromInt(sqe.user_data);
                        if (sqe.opcode == .CLOSE) task.fallback_close = true;
                        self.handle_cqe_locked(.{
                            .user_data = sqe.user_data,
                            .res = -@as(i32, @backingInt(failure)),
                            .flags = 0,
                        });
                    }
                    return;
                }
            }

            /// Consumes every ready completion from the ring. Caller holds `lock`.
            fn drain_locked(self: *QueueImpl) void {
                const ring = self.ring_ptr();
                var cqes: [32]linux.io_uring_cqe = undefined;
                while (true) {
                    const count = ring.copy_cqes(&cqes, 0) catch return;
                    if (count == 0) {
                        self.dispatch_ready_closes_locked();
                        return;
                    }
                    for (cqes[0..count]) |cqe| self.handle_cqe_locked(cqe);
                }
            }

            fn handle_cqe_locked(self: *QueueImpl, cqe: linux.io_uring_cqe) void {
                self.ring_outstanding -= 1;
                const task: *Task = @ptrFromInt(cqe.user_data);
                task.cqes_outstanding -= 1;
                if (cqe.res < 0) {
                    const e = errno_from_res(cqe.res);
                    if (e == .CANCELED) {
                        set_canceled(task);
                    } else {
                        set_failure(task, e);
                    }
                } else switch (task.kind) {
                    .read => task.transferred = @intCast(cqe.res),
                    .write => {
                        task.transferred = @intCast(cqe.res);
                        if (task.transferred < task.requested) set_failure(task, .IO);
                    },
                    .close => {},
                }
                if (task.cqes_outstanding == 0) {
                    if (task.flushing) {
                        // Close even when flushing failed or was canceled. This
                        // phase freed a ring slot, so close can be submitted now.
                        task.flush = false;
                        self.submit_close_sqes(task);
                        return;
                    }
                    if (task.kind == .close and cqe.res == -@as(i32, @backingInt(linux.E.CANCELED))) {
                        task.fallback_close = true;
                    }
                    if (task.fallback_close) close_sync(task);
                    self.push_completed_locked(task);
                }
            }
        };

        fn retire_locked(task: *Task, deferred: *DoublyLinkedList) void {
            const file = task.file;
            if (task.kind == .close) {
                // No request remains on the file, and the close is complete.
                file.allocator.destroy(file);
                return;
            }
            file.lock.lock();
            file.pending -= 1;
            if (file.pending == 0) {
                if (file.closing_task) |close_task| {
                    file.closing_task = null;
                    deferred.append(&close_task.node);
                }
            }
            file.lock.unlock();
        }
    };
}

/// Transfer result of a synchronous read or write.
const Transfer = struct {
    bytes: usize = 0,
    failure: ?linux.E = null,
};

fn read_slice(buffer: Buffer) []u8 {
    return switch (buffer) {
        .read => |s| s,
        .loaded => |s| s,
        else => unreachable,
    };
}

fn write_slice(buffer: Buffer) []const u8 {
    return switch (buffer) {
        .write => |s| s,
        else => unreachable,
    };
}

fn is_loaded(buffer: Buffer) bool {
    return std.meta.activeTag(buffer) == .loaded;
}

fn set_failure(task: anytype, e: linux.E) void {
    if (std.meta.activeTag(task.result) == .complete) task.result = .{ .failure = e };
}

fn set_canceled(task: anytype) void {
    if (std.meta.activeTag(task.result) == .complete) task.result = .canceled;
}

fn apply_transfer(task: anytype, t: Transfer) void {
    task.transferred = t.bytes;
    if (t.failure) |e| set_failure(task, e);
}

/// Runs a read or write synchronously. Reads stop at end of file, and writes
/// must transfer everything. Interrupted calls are retried.
fn run_sync(task: anytype) void {
    switch (task.kind) {
        .read => apply_transfer(task, read_fully(task.file.fd, read_slice(task.buffer), task.offset)),
        .write => apply_transfer(task, write_fully(task.file.fd, write_slice(task.buffer), task.offset)),
        .close => close_sync(task),
    }
}

fn read_fully(fd: linux.fd_t, buf: []u8, offset: u64) Transfer {
    var t: Transfer = .{};
    while (t.bytes < buf.len) {
        const pos = offset + @as(u64, t.bytes);
        const rc = linux.pread(fd, buf.ptr + t.bytes, buf.len - t.bytes, @intCast(pos));
        switch (linux.errno(rc)) {
            .SUCCESS => {
                if (rc == 0) return t;
                t.bytes += rc;
            },
            .INTR => {},
            else => |e| {
                t.failure = e;
                return t;
            },
        }
    }
    return t;
}

fn write_fully(fd: linux.fd_t, buf: []const u8, offset: u64) Transfer {
    var t: Transfer = .{};
    while (t.bytes < buf.len) {
        const pos = offset + @as(u64, t.bytes);
        const rc = linux.pwrite(fd, buf.ptr + t.bytes, buf.len - t.bytes, @intCast(pos));
        switch (linux.errno(rc)) {
            .SUCCESS => {
                if (rc == 0) {
                    t.failure = .IO;
                    return t;
                }
                t.bytes += rc;
            },
            .INTR => {},
            else => |e| {
                t.failure = e;
                return t;
            },
        }
    }
    return t;
}

/// Flushes if requested, then closes the descriptor. The close is attempted even
/// when the flush fails, as in SDL.
fn close_sync(task: anytype) void {
    const fd = task.file.fd;
    if (task.flush) {
        const e = linux.errno(linux.fdatasync(fd));
        if (e != .SUCCESS) set_failure(task, e);
    }
    const e = linux.errno(linux.close(fd));
    if (e != .SUCCESS) set_failure(task, e);
}

/// Converts a negative kernel result into an errno, mapping unknown values to EIO.
fn errno_from_res(res: i32) linux.E {
    const magnitude: u16 = std.math.cast(u16, -res) orelse return .IO;
    return std.enums.fromInt(linux.E, magnitude) orelse .IO;
}

fn monotonic_ns() u64 {
    var ts: linux.timespec = undefined;
    _ = linux.clock_gettime(linux.CLOCK.MONOTONIC, &ts);
    return @as(u64, @intCast(ts.sec)) * std.time.ns_per_s + @as(u64, @intCast(ts.nsec));
}

/// Time left before `deadline` in nanoseconds (0 when expired). Null means no deadline.
fn remaining(deadline: ?u64) ?u64 {
    const d = deadline orelse return null;
    return d -| monotonic_ns();
}

fn block_futex(word: *const u32, expected: u32, left: ?u64) void {
    var ts: linux.timespec = undefined;
    var ts_ptr: ?*const linux.timespec = null;
    if (left) |ns| {
        ts = .{
            .sec = @intCast(ns / std.time.ns_per_s),
            .nsec = @intCast(ns % std.time.ns_per_s),
        };
        ts_ptr = &ts;
    }
    _ = linux.futex_4arg(word, .{ .cmd = .WAIT, .private = true }, expected, ts_ptr);
}

/// Per-waiter wakeup independent of io_uring submission/completion capacity.
fn make_wake_fd() linux.fd_t {
    const rc = linux.eventfd(0, linux.EFD.CLOEXEC | linux.EFD.NONBLOCK);
    return if (linux.errno(rc) == .SUCCESS) @intCast(rc) else -1;
}

fn drain_wake_fd(fd: linux.fd_t) void {
    var counter: u64 = undefined;
    while (linux.errno(linux.read(fd, std.mem.asBytes(&counter).ptr, @sizeOf(u64))) == .INTR) {}
}

/// No kernel timer is submitted. CQ readiness and this waiter's persistent
/// wakeup share a single ppoll with the caller's remaining monotonic budget.
fn block_ring(ring_fd: linux.fd_t, wake_fd: linux.fd_t, left: ?u64) void {
    var fds: [2]linux.pollfd = .{
        .{ .fd = ring_fd, .events = linux.POLL.IN, .revents = 0 },
        .{ .fd = wake_fd, .events = linux.POLL.IN, .revents = 0 },
    };
    var ts: linux.timespec = undefined;
    var ts_ptr: ?*linux.timespec = null;
    if (left) |ns| {
        ts = .{ .sec = @intCast(ns / std.time.ns_per_s), .nsec = @intCast(ns % std.time.ns_per_s) };
        ts_ptr = &ts;
    }
    _ = linux.ppoll(&fds, fds.len, ts_ptr, null);
}
