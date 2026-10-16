//! Bounded owner-thread action delivery, payload ownership and final receipts.
//! No worker, native callback ingress, reducer or automatic model execution.
const std = @import("std");
const identity = @import("../core/identity.zig");
const sem = @import("semantics.zig");
pub const Error = std.mem.Allocator.Error || error{
    DomainExhausted,
    QueueClosed,
    QueueFull,
    PayloadLimit,
    TicketExhausted,
    ForeignTicket,
    UnknownTicket,
    AlreadyFinalized,
    NotFinal,
    ReferenceLimit,
    DeliveryFinished,
};
pub const Ticket = struct { domain: identity.Domain, serial: u64 };
pub const CancelReason = enum { requested, queue_closed, abandoned };
pub const Outcome = union(enum) { handled: void, rejected: anyerror, cancelled: CancelReason };
pub const Status = union(enum) { pending: void, in_flight: void, final: Outcome };
pub const Options = struct {
    /// All allocated entries count, including final receipts and forgotten
    /// terminal entries still borrowed by a Delivery. No implicit eviction.
    max_entries: usize = 4096,
    max_payload_bytes: usize = 4 * 1024 * 1024,
    max_single_payload_bytes: usize = 1024 * 1024,
};
pub const Usage = struct { entries: usize, receipts: usize, payload_bytes: usize, pending: usize, in_flight: usize, final: usize };
const Entry = struct {
    references: usize = 1,
    ticket: Ticket,
    request: sem.Request,
    text: []const u8,
    status: Status = .pending,
    previous: ?*Entry = null,
    next: ?*Entry = null,
    fn release(self: *Entry, core: *Core) void {
        self.references -= 1;
        if (self.references == 0) {
            core.entries -= 1;
            core.payload_bytes -= self.text.len;
            std.debug.assert(self.status == .final);
            core.final -= 1;
            core.allocator.free(self.text);
            core.allocator.destroy(self);
        }
    }
};
const Core = struct {
    allocator: std.mem.Allocator,
    options: Options,
    domain: identity.Domain,
    references: usize = 1,
    next_ticket: u64 = 1,
    closed: bool = false,
    records: std.AutoHashMapUnmanaged(u64, *Entry) = .empty,
    head: ?*Entry = null,
    tail: ?*Entry = null,
    entries: usize = 0,
    payload_bytes: usize = 0,
    pending: usize = 0,
    in_flight: usize = 0,
    final: usize = 0,
    fn find(self: *Core, ticket: Ticket) Error!*Entry {
        if (ticket.domain != self.domain) return error.ForeignTicket;
        return self.records.get(ticket.serial) orelse error.UnknownTicket;
    }
    fn unlink(self: *Core, entry: *Entry) void {
        if (entry.previous) |previous| previous.next = entry.next else self.head = entry.next;
        if (entry.next) |next| next.previous = entry.previous else self.tail = entry.previous;
        entry.previous = null;
        entry.next = null;
    }
    fn finish(self: *Core, entry: *Entry, outcome: Outcome) Error!void {
        switch (entry.status) {
            .pending => {
                self.unlink(entry);
                self.pending -= 1;
            },
            .in_flight => self.in_flight -= 1,
            .final => return error.AlreadyFinalized,
        }
        entry.status = .{ .final = outcome };
        self.final += 1;
    }
    fn close(self: *Core) void {
        if (self.closed) return;
        self.closed = true;
        var iterator = self.records.valueIterator();
        while (iterator.next()) |entry| if (entry.*.status != .final) {
            self.finish(entry.*, .{ .cancelled = .queue_closed }) catch unreachable;
        };
    }
    fn release(self: *Core) void {
        self.references -= 1;
        if (self.references == 0) {
            std.debug.assert(self.closed);
            var iterator = self.records.valueIterator();
            while (iterator.next()) |entry| entry.*.release(self);
            self.records.deinit(self.allocator);
            std.debug.assert(self.entries == 0 and self.payload_bytes == 0);
            const allocator = self.allocator;
            allocator.destroy(self);
        }
    }
};
/// Owning payload lease. It keeps queue cleanup storage alive, not a scene or
/// mutable document. Request text borrows this lease until deinit. Completion
/// does not free the payload; forgetting its receipt cannot shorten this lease.
pub const Delivery = struct {
    core: ?*Core,
    entry: *Entry,
    id: Ticket,
    /// Process-local receipt identity, also readable after delivery cleanup.
    pub fn ticket(self: *const Delivery) Ticket {
        return self.id;
    }
    /// Request data borrows this owning lease, including after finalization.
    pub fn request(self: *const Delivery) Error!sem.Request {
        if (self.core == null) return error.DeliveryFinished;
        return self.entry.request;
    }
    /// Current receipt remains observable through a live lease after owner close.
    pub fn status(self: *const Delivery) Error!Status {
        if (self.core == null) return error.DeliveryFinished;
        return self.entry.status;
    }
    /// False after any final outcome or after delivery cleanup.
    pub fn active(self: *const Delivery) bool {
        return self.core != null and self.entry.status == .in_flight;
    }
    /// One terminal outcome only. Cancellation/close may already have finalized
    /// the ticket. The owner must not execute effects after active() is false.
    pub fn complete(self: *Delivery, outcome: Outcome) Error!void {
        const core = self.core orelse return error.DeliveryFinished;
        try core.finish(self.entry, outcome);
    }
    /// Unfinished delivery becomes cancelled/abandoned. Idempotent and safe after
    /// queue owner destruction. It never calls application/provider code.
    pub fn deinit(self: *Delivery) void {
        const core = self.core orelse return;
        if (self.entry.status != .final) core.finish(self.entry, .{ .cancelled = .abandoned }) catch unreachable;
        self.core = null;
        self.entry.release(core);
        core.release();
    }
};
/// Owns receipts and FIFO pending work. Move owned values; do not independently
/// deinitialize shallow copies. All calls/Delivery operations are serialized on
/// one owner thread, including cancellation and side-effect completion.
pub const Queue = struct {
    core: *Core,
    /// Creates a bounded owner domain; zero capacities explicitly disable work.
    pub fn init(allocator: std.mem.Allocator, options: Options) Error!Queue {
        const core = try allocator.create(Core);
        errdefer allocator.destroy(core);
        core.* = .{ .allocator = allocator, .options = options, .domain = try identity.issue_domain() };
        return .{ .core = core };
    }
    /// Copies retained text before acceptance. Enqueue is not semantic validation:
    /// call the live scene's action validator when taking the request.
    pub fn enqueue(self: *Queue, request: sem.Request) Error!Ticket {
        const core = self.core;
        if (core.closed) return error.QueueClosed;
        if (core.entries >= core.options.max_entries) return error.QueueFull;
        if (core.next_ticket == std.math.maxInt(u64)) return error.TicketExhausted;
        const input: []const u8 = switch (request.payload) {
            .replace_text => |value| value.text,
            else => &.{},
        };
        if (input.len > core.options.max_single_payload_bytes or input.len > core.options.max_payload_bytes - core.payload_bytes) return error.PayloadLimit;
        const text = try core.allocator.dupe(u8, input);
        errdefer core.allocator.free(text);
        const entry = try core.allocator.create(Entry);
        errdefer core.allocator.destroy(entry);
        var copied = request;
        if (copied.payload == .replace_text) copied.payload.replace_text.text = text;
        const ticket: Ticket = .{ .domain = core.domain, .serial = core.next_ticket };
        entry.* = .{ .ticket = ticket, .request = copied, .text = text, .previous = core.tail };
        try core.records.put(core.allocator, ticket.serial, entry);
        // No failure after acceptance. A failed attempt publishes no ticket.
        if (core.tail) |tail| tail.next = entry else core.head = entry;
        core.tail = entry;
        core.entries += 1;
        core.payload_bytes += text.len;
        core.pending += 1;
        core.next_ticket += 1;
        return ticket;
    }
    /// FIFO, at most one Delivery per ticket. No payload allocation occurs here.
    pub fn take(self: *Queue) Error!?Delivery {
        const core = self.core;
        if (core.closed) return error.QueueClosed;
        const entry = core.head orelse return null;
        if (core.references == std.math.maxInt(usize) or entry.references == std.math.maxInt(usize)) return error.ReferenceLimit;
        core.unlink(entry);
        core.pending -= 1;
        core.in_flight += 1;
        entry.status = .in_flight;
        entry.references += 1;
        core.references += 1;
        return .{ .core = core, .entry = entry, .id = entry.ticket };
    }
    /// Final receipts remain queryable after close, until explicitly forgotten.
    pub fn status(self: *const Queue, ticket: Ticket) Error!Status {
        return (try self.core.find(ticket)).status;
    }
    /// Logical cancellation only; it cannot undo effects already executed.
    pub fn cancel(self: *Queue, ticket: Ticket) Error!void {
        try self.core.finish(try self.core.find(ticket), .{ .cancelled = .requested });
    }
    /// Releases a terminal receipt, never pending/in-flight work. Outstanding
    /// Delivery memory continues counting against budgets until its lease ends.
    pub fn forget(self: *Queue, ticket: Ticket) Error!void {
        const entry = try self.core.find(ticket);
        if (entry.status != .final) return error.NotFinal;
        _ = self.core.records.remove(ticket.serial);
        entry.release(self.core);
    }
    /// Counts allocated entries/bytes, including forgotten but still leased data.
    pub fn usage(self: *const Queue) Usage {
        const c = self.core;
        return .{ .entries = c.entries, .receipts = c.records.count(), .payload_bytes = c.payload_bytes, .pending = c.pending, .in_flight = c.in_flight, .final = c.final };
    }
    /// No allocation or model effects; all accepted unfinished tickets become
    /// cancelled/queue_closed. Existing payload leases remain readable.
    pub fn close(self: *Queue) void {
        self.core.close();
    }
    /// Outstanding deliveries keep their cleanup core alive after owner deinit.
    pub fn deinit(self: *Queue) void {
        self.close();
        self.core.release();
        self.* = undefined;
    }
};

test "action queue ticket and reference exhaustion never wrap or consume work" {
    const t = std.testing;
    var queue = try Queue.init(t.allocator, .{});
    defer queue.deinit();
    const request: sem.Request = .{ .target = .{ .domain = @fromBackingInt(1), .serial = 1 }, .revision = 1, .payload = .activate };
    queue.core.next_ticket = std.math.maxInt(u64);
    try t.expectError(error.TicketExhausted, queue.enqueue(request));
    queue.core.next_ticket = 1;
    const ticket = try queue.enqueue(request);
    queue.core.references = std.math.maxInt(usize);
    try t.expectError(error.ReferenceLimit, queue.take());
    queue.core.references = 1;
    try t.expect((try queue.status(ticket)) == .pending);
    var delivery = (try queue.take()).?;
    defer delivery.deinit();
    try delivery.complete(.handled);
}
