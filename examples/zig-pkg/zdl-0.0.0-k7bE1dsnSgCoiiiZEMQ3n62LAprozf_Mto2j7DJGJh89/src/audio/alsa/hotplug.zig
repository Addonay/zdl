//! Explicit hotplug and default-device change detection for ALSA endpoints.
//!
//! SDL's ALSA backend (audio/alsa/SDL_alsa_audio.c, ALSA_HotplugIteration)
//! has no kernel event source it can rely on. Without udev it re-enumerates
//! the cards and PCM devices on a timer, compares the result with the previous
//! pass, and reports additions and removals. Here that loop is an explicit
//! `Watcher.poll_changes` call: nothing sleeps, no thread is started, and the
//! caller chooses the cadence. SDL's default interval is about five seconds;
//! polling more often only adds enumeration cost.
//!
//! Identity: an endpoint is identified by its ALSA hint name. A change of its
//! playback or capture capability is reported as a removal plus an addition,
//! because the device can no longer be used as it was opened.
//!
//! Default: the endpoint `device.default_endpoint` would choose. A change in
//! that choice is reported as `Changes.default`, with null meaning "none".
//!
//! Ownership: the watcher owns its last snapshot and default name. It borrows
//! the `device.Library`, which must outlive it. `Changes` owns its copies.
//! Not synchronized; poll from one owner.
const std = @import("std");
const device = @import("device.zig");

/// Failures of enumeration and of copying results.
pub const Error = device.Error;

/// Owned difference between two enumerations. Free with `deinit`.
pub const Changes = struct {
    allocator: std.mem.Allocator,
    /// Endpoints present now that were absent or differently capable before.
    added: []device.Endpoint,
    /// Names of endpoints that vanished or changed capability.
    removed: [][:0]u8,
    /// Set when the default endpoint changed. Inner name is null when no
    /// endpoint is left to be the default.
    default: ?Default = null,

    /// Result of a default-endpoint change.
    pub const Default = struct {
        name: ?[:0]u8,
    };

    /// True when nothing changed since the previous poll.
    pub fn is_empty(self: *const Changes) bool {
        return self.added.len == 0 and self.removed.len == 0 and self.default == null;
    }

    pub fn deinit(self: *Changes) void {
        for (self.added) |endpoint| free_endpoint(self.allocator, endpoint);
        self.allocator.free(self.added);
        for (self.removed) |name| self.allocator.free(name);
        self.allocator.free(self.removed);
        if (self.default) |change| if (change.name) |name| self.allocator.free(name);
        self.* = undefined;
    }
};

/// Keeps the last enumeration and reports what changed on each poll.
pub const Watcher = struct {
    allocator: std.mem.Allocator,
    library: *device.Library,
    current: device.DeviceList,

    /// Takes the initial snapshot. Changes start from this state, so the first
    /// poll reports only differences that happen after `open`.
    pub fn open(allocator: std.mem.Allocator, library: *device.Library) Error!Watcher {
        const list = try library.enumerate(allocator);
        return .{ .allocator = allocator, .library = library, .current = list };
    }

    /// Frees the snapshot. The library is not touched.
    pub fn deinit(self: *Watcher) void {
        self.current.deinit();
        self.* = undefined;
    }

    /// Enumerates again and returns the difference from the previous snapshot,
    /// which then becomes the new baseline. On failure the baseline is kept, so
    /// the next successful poll reports the same change again.
    pub fn poll_changes(self: *Watcher) Error!Changes {
        var fresh = try self.library.enumerate(self.allocator);
        errdefer fresh.deinit();

        var added: std.ArrayList(device.Endpoint) = .empty;
        errdefer {
            for (added.items) |endpoint| free_endpoint(self.allocator, endpoint);
            added.deinit(self.allocator);
        }
        var removed: std.ArrayList([:0]u8) = .empty;
        errdefer {
            for (removed.items) |name| self.allocator.free(name);
            removed.deinit(self.allocator);
        }
        for (self.current.items) |old| {
            if (find(fresh.items, old.name)) |new| {
                if (same_capability(old, new)) continue;
            }
            try removed.append(self.allocator, try self.allocator.dupeSentinel(u8, old.name, 0));
        }
        for (fresh.items) |new| {
            if (find(self.current.items, new.name)) |old| {
                if (same_capability(old, new)) continue;
            }
            try added.append(self.allocator, try copy_endpoint(self.allocator, new));
        }

        var changes: Changes = .{ .allocator = self.allocator, .added = &.{}, .removed = &.{} };
        errdefer changes.deinit();
        const old_default = choose_default(self.current.items);
        const new_default = choose_default(fresh.items);
        if (!same_default(old_default, new_default)) {
            changes.default = .{ .name = if (new_default) |endpoint| try self.allocator.dupeSentinel(u8, endpoint.name, 0) else null };
        }
        changes.added = try added.toOwnedSlice(self.allocator);
        changes.removed = try removed.toOwnedSlice(self.allocator);

        // Commit: nothing below can fail, so the baseline moves only on success.
        self.current.deinit();
        self.current = fresh;
        return changes;
    }
};

/// Same choice as `audio.device.default_endpoint`: "default" when it can play,
/// otherwise the first playback-capable endpoint. Kept here so the ALSA layer
/// does not depend on the logical device layer.
fn choose_default(endpoints: []const device.Endpoint) ?device.Endpoint {
    var first: ?device.Endpoint = null;
    for (endpoints) |endpoint| {
        if (!endpoint.supports_playback) continue;
        if (std.mem.eql(u8, endpoint.name, "default")) return endpoint;
        if (first == null) first = endpoint;
    }
    return first;
}

fn find(endpoints: []const device.Endpoint, name: []const u8) ?device.Endpoint {
    for (endpoints) |endpoint| {
        if (std.mem.eql(u8, endpoint.name, name)) return endpoint;
    }
    return null;
}

fn same_capability(a: device.Endpoint, b: device.Endpoint) bool {
    return a.supports_playback == b.supports_playback and a.supports_capture == b.supports_capture;
}

fn same_default(old: ?device.Endpoint, fresh: ?device.Endpoint) bool {
    if (old == null and fresh == null) return true;
    if (old == null or fresh == null) return false;
    return std.mem.eql(u8, old.?.name, fresh.?.name);
}

fn copy_endpoint(allocator: std.mem.Allocator, endpoint: device.Endpoint) std.mem.Allocator.Error!device.Endpoint {
    const name = try allocator.dupeSentinel(u8, endpoint.name, 0);
    errdefer allocator.free(name);
    const description = try allocator.dupe(u8, endpoint.description);
    return .{
        .name = name,
        .description = description,
        .supports_playback = endpoint.supports_playback,
        .supports_capture = endpoint.supports_capture,
    };
}

fn free_endpoint(allocator: std.mem.Allocator, endpoint: device.Endpoint) void {
    allocator.free(endpoint.name);
    allocator.free(endpoint.description);
}

test "ALSA default selection prefers the alias and skips capture-only entries" {
    const endpoints = [_]device.Endpoint{
        .{ .name = "capture-only", .description = "input", .supports_playback = false, .supports_capture = true },
        .{ .name = "speaker-a", .description = "first output", .supports_playback = true, .supports_capture = false },
        .{ .name = "default", .description = "configured output", .supports_playback = true, .supports_capture = true },
    };
    try std.testing.expectEqualStrings("default", choose_default(&endpoints).?.name);
    try std.testing.expectEqualStrings("speaker-a", choose_default(endpoints[0..2]).?.name);
    try std.testing.expect(choose_default(endpoints[0..1]) == null);
}
