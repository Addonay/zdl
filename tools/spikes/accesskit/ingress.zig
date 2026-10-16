//! Private bounded MPSC staging for native callbacks, not the public action queue.
//! Stable address + std.Io must outlive all producers. Quiesce provider handlers
//! before destroying the inbox; logical close alone cannot revoke their pointers.
const std = @import("std");
const ui = @import("zdl").ui;

pub fn Inbox(comptime capacity: usize, comptime max_text_bytes: usize) type {
    if (capacity == 0) @compileError("native inbox needs at least one slot");
    return struct {
        const Self = @This();
        pub const Error = error{ Closed, Full, TextLimit, InvalidUtf8, SerialExhausted, AlreadyResolved };
        pub const Counts = struct {
            staged: usize = 0,
            taken: usize = 0,
            closed: usize = 0,
            full: usize = 0,
            text_limit: usize = 0,
            invalid_utf8: usize = 0,
            exhausted: usize = 0,
            discarded_on_close: usize = 0,
            pending: usize = 0,
        };
        /// Owns inline bytes. Moving/copying this value cannot leave its request
        /// pointing at the source storage: request() binds text at its final address.
        /// One owner serializes admit/reject. Copying must not replay execution.
        pub const Item = struct {
            serial: u64,
            intent: ui.semantics.Request,
            text: [max_text_bytes]u8 = undefined,
            text_len: usize = 0,
            outcome: union(enum) { pending: void, admitted: ui.action_queue.Ticket, rejected: anyerror } = .pending,
            pub fn request(self: *const Item) ui.semantics.Request {
                var result = self.intent;
                if (result.payload == .replace_text) result.payload.replace_text.text = self.text[0..self.text_len];
                return result;
            }
            /// Queue pressure leaves this Item pending for owner retry/rejection.
            /// Successful admission is one-way and prevents a second enqueue.
            pub fn admit(self: *Item, queue: *ui.action_queue.Queue) !ui.action_queue.Ticket {
                if (self.outcome != .pending) return error.AlreadyResolved;
                const ticket = try queue.enqueue(self.request());
                self.outcome = .{ .admitted = ticket };
                return ticket;
            }
            pub fn reject(self: *Item, err: anyerror) Error!void {
                if (self.outcome != .pending) return error.AlreadyResolved;
                self.outcome = .{ .rejected = err };
            }
        };
        io: std.Io,
        mutex: std.Io.Mutex = .init,
        slots: [capacity]Item = undefined,
        head: usize = 0,
        count: usize = 0,
        closed: bool = false,
        next_serial: u64 = 1,
        counts: Counts = .{},
        /// No allocation, callbacks or native handles. Move to its stable address
        /// before publishing it to foreign threads.
        pub fn init(io: std.Io) Self {
            return .{ .io = io };
        }
        /// Caller supplies already mapped versioned semantic metadata. No scene,
        /// registration or document is accessed by foreign threads. Copies text
        /// in full or rejects it; never truncates or allocates in a callback.
        pub fn submit(self: *Self, input: ui.semantics.Request) Error!u64 {
            self.mutex.lockUncancelable(self.io);
            defer self.mutex.unlock(self.io);
            if (self.closed) {
                self.counts.closed +|= 1;
                return error.Closed;
            }
            const text = if (input.payload == .replace_text) input.payload.replace_text.text else "";
            if (text.len > max_text_bytes) {
                self.counts.text_limit +|= 1;
                return error.TextLimit;
            }
            if (!std.unicode.utf8ValidateSlice(text)) {
                self.counts.invalid_utf8 +|= 1;
                return error.InvalidUtf8;
            }
            if (self.count == capacity) {
                self.counts.full +|= 1;
                return error.Full;
            }
            if (self.next_serial == std.math.maxInt(u64)) {
                self.counts.exhausted +|= 1;
                return error.SerialExhausted;
            }
            const index = (self.head + self.count) % capacity;
            var value: Item = .{ .serial = self.next_serial, .intent = input, .text_len = text.len };
            if (value.intent.payload == .replace_text) value.intent.payload.replace_text.text = "";
            @memcpy(value.text[0..text.len], text);
            self.slots[index] = value;
            self.count += 1;
            self.counts.staged +|= 1;
            self.next_serial += 1;
            return value.serial;
        }
        /// Returned value owns its bytes, independent of inbox slot reuse/close.
        /// Only the UI owner takes/adopts Items; providers only submit.
        pub fn take(self: *Self) ?Item {
            self.mutex.lockUncancelable(self.io);
            defer self.mutex.unlock(self.io);
            if (self.count == 0) return null;
            const value = self.slots[self.head];
            self.head = (self.head + 1) % capacity;
            self.count -= 1;
            self.counts.taken +|= 1;
            return value;
        }
        /// Stops staging and discards buffered, unadmitted messages with an
        /// explicit count. Taken Items remain owner-owned: resolve/reject them
        /// and close the public action queue before executing any late effects.
        pub fn close(self: *Self) void {
            self.mutex.lockUncancelable(self.io);
            defer self.mutex.unlock(self.io);
            self.closed = true;
            self.counts.discarded_on_close +|= self.count;
            self.count = 0;
        }
        pub fn usage(self: *Self) Counts {
            self.mutex.lockUncancelable(self.io);
            defer self.mutex.unlock(self.io);
            var result = self.counts;
            result.pending = self.count;
            return result;
        }
    };
}
