//! Output-report queue for one HIDAPI device (rumble, LEDs, effects).
//!
//! Port of SDL_hidapi_rumble.c with the thread removed. SDL sends queued
//! reports from a high-priority thread, sleeps 10 ms between writes so input
//! reads are not starved, and keeps one global queue guarded by a mutex. Here
//! each device owns its queue, which the registry drains explicitly during
//! `Registry.update`; the 10 ms pacing is not reproduced, so a burst of effect
//! packets is written back to back.
//!
//! Coalescing: a new report can overwrite the newest queued report instead of
//! being appended, which keeps a fast stream of rumble updates from building a
//! backlog. `Coalesce` names the rule explicitly. SDL's generic rule compares
//! the report length and ID byte; the PlayStation drivers compare the effect
//! enable bits, so that a pending LED change is not replaced by a rumble update.
//!
//! Ownership: the queue owns the copied report bytes. `deinit` releases them.
const std = @import("std");
const hidraw = @import("../../hid/hidraw.zig");

const Allocator = std.mem.Allocator;

/// Largest output report any driver sends. SDL uses 2 * USB_PACKET_LENGTH (128),
/// and the DualShock 4 Bluetooth report is 78 bytes.
pub const max_report_size = 128;

/// How a new report may replace the newest pending report.
pub const Coalesce = union(enum) {
    /// Always append.
    none,
    /// Replace when the length and the first byte (report ID) match.
    report_id,
    /// Replace when the two effect enable-bit bytes at `offset` and `offset+1`
    /// match. Used by DualSense effects, whose payload starts at offset 1 over
    /// USB and offset 3 over Bluetooth.
    effect_bits: usize,
};

/// One queued report.
pub const Request = struct {
    data: [max_report_size]u8,
    len: usize,

    fn slice(self: *const Request) []const u8 {
        return self.data[0..self.len];
    }
};

/// FIFO of pending output reports for one device.
pub const RumbleQueue = struct {
    pending: std.ArrayList(Request) = .empty,

    pub fn deinit(self: *RumbleQueue, allocator: Allocator) void {
        self.pending.deinit(allocator);
        self.* = undefined;
    }

    pub fn is_empty(self: *const RumbleQueue) bool {
        return self.pending.items.len == 0;
    }

    /// Queues `report`, or overwrites the newest pending report when `rule`
    /// allows it. Returns the report length, as SDL_HIDAPI_SendRumble does.
    /// Reports longer than `max_report_size` are rejected.
    pub fn push(self: *RumbleQueue, allocator: Allocator, report: []const u8, rule: Coalesce) error{ ReportTooLarge, OutOfMemory }!usize {
        if (report.len == 0 or report.len > max_report_size) return error.ReportTooLarge;
        if (self.pending.items.len > 0) {
            const newest = &self.pending.items[self.pending.items.len - 1];
            if (coalescable(newest.slice(), report, rule)) {
                @memcpy(newest.data[0..report.len], report);
                return report.len;
            }
        }
        var request: Request = .{ .data = undefined, .len = report.len };
        @memcpy(request.data[0..report.len], report);
        try self.pending.append(allocator, request);
        return report.len;
    }

    /// Writes every pending report to `device` in order and empties the queue.
    /// A failed write is reported after the remaining reports are attempted, so
    /// one bad packet does not drop the rest of the queue.
    pub fn flush(self: *RumbleQueue, device: *hidraw.Device) hidraw.Error!void {
        var first_error: ?hidraw.Error = null;
        for (self.pending.items) |*request| {
            _ = device.write(request.slice()) catch |err| {
                if (first_error == null) first_error = err;
            };
        }
        self.pending.clearRetainingCapacity();
        if (first_error) |err| return err;
    }

    fn coalescable(old: []const u8, new: []const u8, rule: Coalesce) bool {
        switch (rule) {
            .none => return false,
            .report_id => return old.len == new.len and old[0] == new[0],
            .effect_bits => |offset| {
                if (old.len != new.len or offset + 1 >= new.len) return false;
                return old[0] == new[0] and old[offset] == new[offset] and old[offset + 1] == new[offset + 1];
            },
        }
    }
};
