//! Clipboard and primary-selection state for the Wayland backend (SDL's
//! SDL_waylandclipboard.c and SDL_waylanddatamanager.c, without drag-and-drop).
//!
//! Receiving: the compositor announces an offer object (`wl_data_offer` or
//! `zwp_primary_selection_offer_v1`), its MIME types, then makes it the current
//! selection. `Offer` records those types. Data is read through a `Pipe`: the
//! backend creates a pipe, hands the write end to the compositor with `receive`,
//! and keeps the read end non-blocking, so callers poll it.
//!
//! Sending: `Source` owns copies of the MIME/data entries the owner offered. When
//! the compositor asks for a MIME type, the window writes that entry's bytes into
//! the descriptor and closes it. Writes are blocking (see `write_all`).
//!
//! Deliberate difference from SDL: drag-and-drop offers are not tracked; the
//! data-device enter/motion/drop events are ignored.

const std = @import("std");
const linux = std.os.linux;
const Allocator = std.mem.Allocator;
const binding = @import("binding.zig");

/// Which selection a request refers to.
pub const Selection = enum { clipboard, primary };

/// One MIME type and its bytes, borrowed from the caller by `Window.set_selection`.
pub const Entry = struct {
    mime: []const u8,
    data: []const u8,
};

pub const Error = error{
    PipeFailed,
    ReadFailed,
    WriteFailed,
};

/// Result of a non-blocking read on a `Pipe`.
pub const Read = union(enum) {
    /// This many bytes were stored at the start of the buffer.
    bytes: usize,
    /// No data yet; poll the descriptor and try again.
    would_block,
    /// The sender closed its end; the transfer is complete.
    end_of_stream,
};

/// Read end of a selection transfer. The owner must `close` it; it does not
/// close itself. Reads never block once the descriptor is non-blocking.
pub const Pipe = struct {
    fd: i32,

    pub fn read(self: Pipe, buffer: []u8) Error!Read {
        const rc = linux.read(self.fd, buffer.ptr, buffer.len);
        return switch (linux.errno(rc)) {
            .SUCCESS => if (rc == 0) .end_of_stream else .{ .bytes = rc },
            .AGAIN, .INTR => .would_block,
            else => error.ReadFailed,
        };
    }

    pub fn close(self: *Pipe) void {
        _ = linux.close(self.fd);
        self.fd = -1;
    }
};

/// Creates a pipe with close-on-exec set on both ends. Returns (read, write).
pub fn make_pipe() Error![2]i32 {
    var fds: [2]i32 = undefined;
    if (linux.errno(linux.pipe2(&fds, .{ .CLOEXEC = true })) != .SUCCESS) return error.PipeFailed;
    return fds;
}

/// Puts `fd` into non-blocking mode.
pub fn set_nonblocking(fd: i32) Error!void {
    const flags = linux.fcntl(fd, linux.F.GETFL, 0);
    if (linux.errno(flags) != .SUCCESS) return error.PipeFailed;
    const nonblock: usize = @as(u32, @bitCast(linux.O{ .NONBLOCK = true }));
    if (linux.errno(linux.fcntl(fd, linux.F.SETFL, flags | nonblock)) != .SUCCESS) return error.PipeFailed;
}

/// Writes all of `data` to `fd` and closes it. Blocks until the receiver reads
/// enough to let the write finish; the descriptor is always closed.
pub fn write_all(fd: i32, data: []const u8) Error!void {
    defer _ = linux.close(fd);
    var offset: usize = 0;
    while (offset < data.len) {
        const rc = linux.write(fd, data.ptr + offset, data.len - offset);
        switch (linux.errno(rc)) {
            .SUCCESS => offset += rc,
            .INTR => continue,
            else => return error.WriteFailed,
        }
    }
}

/// A data offer announced by the compositor. `mimes` holds owned copies.
pub const Offer = struct {
    proxy: binding.Proxy,
    primary: bool,
    mimes: std.ArrayList([]u8) = .empty,

    pub fn deinit(self: *Offer, allocator: Allocator) void {
        for (self.mimes.items) |mime| allocator.free(mime);
        self.mimes.deinit(allocator);
    }
};

/// A selection this client owns: one owned copy per offered MIME type.
pub const Source = struct {
    proxy: binding.Proxy,
    primary: bool,
    entries: []Owned,

    pub const Owned = struct {
        mime: []u8,
        data: []u8,
    };

    /// Copies `entries` into owned storage. The caller keeps `proxy`.
    pub fn create(allocator: Allocator, proxy: binding.Proxy, primary: bool, entries: []const Entry) Allocator.Error!Source {
        const owned = try allocator.alloc(Owned, entries.len);
        var made: usize = 0;
        errdefer {
            for (owned[0..made]) |item| {
                allocator.free(item.mime);
                allocator.free(item.data);
            }
            allocator.free(owned);
        }
        for (entries) |entry| {
            const mime = try allocator.dupe(u8, entry.mime);
            errdefer allocator.free(mime);
            const data = try allocator.dupe(u8, entry.data);
            owned[made] = .{ .mime = mime, .data = data };
            made += 1;
        }
        return .{ .proxy = proxy, .primary = primary, .entries = owned };
    }

    pub fn deinit(self: *Source, allocator: Allocator) void {
        for (self.entries) |item| {
            allocator.free(item.mime);
            allocator.free(item.data);
        }
        allocator.free(self.entries);
        self.* = undefined;
    }

    /// Bytes for `mime`, or null when this source does not offer that type.
    pub fn find(self: *const Source, mime: []const u8) ?[]const u8 {
        for (self.entries) |item| {
            if (std.mem.eql(u8, item.mime, mime)) return item.data;
        }
        return null;
    }
};
