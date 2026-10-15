//! PulseAudio connection, server defaults, device enumeration and hotplug events.
//! Ported from audio/pulseaudio/SDL_pulseaudio.c: ConnectToPulseServer,
//! DisconnectFromPulseServer, PULSEAUDIO_DetectDevices, HotplugCallback,
//! HotplugThread and the default-device bookkeeping.
//!
//! Threading: libpulse's threaded mainloop owns one thread. `Context.open`
//! starts it and `Context.deinit` stops and joins it; zdl creates no other thread.
//! Every libpulse call zdl makes holds the mainloop lock (`Shared.lock`). Callbacks
//! run on that thread with the lock held and only record results into `Shared` or
//! a caller's stack `Request`, then wake waiters. Waiting (`Shared.wait`) releases
//! the lock while blocked, as pa_threaded_mainloop_wait does.
//!
//! Deliberate differences from SDL: no globals (SDL's pulseaudio_context,
//! default_sink_path and include_monitors become fields of `Shared`); hotplug
//! changes are queued as `Event`s and returned by `poll_events` instead of calling
//! SDL_AddAudioDevice from a helper thread; the application name, icon and monitor
//! policy are explicit `Options` instead of SDL hints. Every owned result uses the
//! allocator given to `open` and is released by its own `deinit`.
const std = @import("std");
const builtin = @import("builtin");
const audio = @import("../processing.zig");
const binding = @import("binding.zig");
const Diagnostic = @import("../../core/diagnostics.zig").Diagnostic;

/// PA_CHANNELS_MAX: the largest channel count a libpulse map can describe.
const binding_channel_limit = 32;

/// Loader for libpulse. Must outlive every Context made from it and must not
/// move while a Context borrows it.
pub const Library = struct {
    /// Implementation detail: the private binding. Not part of the stable API.
    native: binding.Library,

    /// Loads the system libpulse (needs libc in the application's root module).
    /// A missing library or symbol is `error.Unavailable`.
    pub fn open() error{Unavailable}!Library {
        return .{ .native = binding.Library.open() catch return error.Unavailable };
    }

    /// Unloads the shared object. Every Context must already be deinitialized.
    pub fn deinit(self: *Library) void {
        self.native.deinit();
        self.* = undefined;
    }
};
/// Speaker position of one channel, as libpulse names it (non-exhaustive).
pub const Position = binding.ChannelPosition;

/// Connection, enumeration and hotplug failures. Recoverable server states are
/// not hidden: a closed connection is `Disconnected`, not a partial success.
pub const Error = audio.Error || std.mem.Allocator.Error || error{
    /// libpulse is missing, or the server could not be reached or refused the
    /// connection (the common backend error; see `logical.Unavailable`).
    Unavailable,
    /// A libpulse object (mainloop, proplist, context) could not be created.
    ConnectionFailed,
    /// The connection or stream went away while an operation was pending.
    Disconnected,
    /// libpulse refused to start an operation (for example subscriptions).
    OperationFailed,
    /// A stream could not be created, connected or driven.
    StreamFailed,
    /// No data or space is available yet; retry after waiting.
    WouldBlock,
    /// Options are inconsistent (empty name, zero buffer, unsupported channels).
    InvalidConfiguration,
};

/// Whether a device plays (sink) or records (source).
pub const Direction = enum { playback, capture };

/// Connection parameters. `application_name` and `icon_name` are sent to the
/// server; a monitor source is listed only with `include_monitors`.
pub const Options = struct {
    application_name: [:0]const u8,
    icon_name: [:0]const u8 = "applications-games",
    include_monitors: bool = false,
    /// Optional text sink for failure reasons, borrowed for the Context lifetime.
    diagnostic: ?*Diagnostic = null,
};

/// Converts every PulseAudio PCM format represented by `audio.Format`.
pub fn format_from_pulse(format: binding.SampleFormat) ?audio.Format {
    return switch (format) {
        .unsigned8 => .unsigned8,
        .signed16_le => .signed16_le,
        .signed16_be => .signed16_be,
        .signed24_le => .signed24_le,
        .signed24_be => .signed24_be,
        .signed24_32_le => .signed24_32_le,
        .signed24_32_be => .signed24_32_be,
        .signed32_le => .signed32_le,
        .signed32_be => .signed32_be,
        .float32_le => .float32_le,
        .float32_be => .float32_be,
        .alaw => .alaw,
        .ulaw => .mulaw,
        else => null,
    };
}

/// Native-endian float32, used when a signed 8-bit request has no PulseAudio
/// equivalent. This is the first supported entry in SDL's closest-format list.
pub fn native_float32() audio.Format {
    return if (builtin.target.cpu.arch.endian() == .big) .float32_be else .float32_le;
}

/// The format zdl asks PulseAudio for. Every zdl format maps to a PulseAudio
/// format except signed 8-bit, which falls back to native float32 like SDL.
pub fn committed_format(format: audio.Format) audio.Format {
    return switch (format) {
        .signed8 => native_float32(),
        else => format,
    };
}

/// PulseAudio sample format for a committed zdl format.
pub fn pulse_format(format: audio.Format) binding.SampleFormat {
    return switch (format) {
        .unsigned8 => .unsigned8,
        .signed8 => pulse_format(native_float32()),
        .signed16_le => .signed16_le,
        .signed16_be => .signed16_be,
        .signed24_le => .signed24_le,
        .signed24_be => .signed24_be,
        .signed24_32_le => .signed24_32_le,
        .signed24_32_be => .signed24_32_be,
        .signed32_le => .signed32_le,
        .signed32_be => .signed32_be,
        .float32_le => .float32_le,
        .float32_be => .float32_be,
        .alaw => .alaw,
        .mulaw => .ulaw,
    };
}

/// Channel map for a stream with `channels` channels, in SDL's order (SDL's
/// Pulse_map_1..8). Counts above 8 have no layout and are rejected.
pub fn channel_map(channels: u16) ?binding.ChannelMap {
    const positions: []const Position = switch (channels) {
        1 => &.{.mono},
        2 => &.{ .front_left, .front_right },
        3 => &.{ .front_left, .front_right, .lfe },
        4 => &.{ .front_left, .front_right, .rear_left, .rear_right },
        5 => &.{ .front_left, .front_right, .lfe, .rear_left, .rear_right },
        6 => &.{ .front_left, .front_right, .front_center, .lfe, .rear_left, .rear_right },
        7 => &.{ .front_left, .front_right, .front_center, .lfe, .rear_center, .side_left, .side_right },
        8 => &.{ .front_left, .front_right, .front_center, .lfe, .rear_left, .rear_right, .side_left, .side_right },
        else => return null,
    };
    var map: binding.ChannelMap = .{ .channels = @intCast(channels), .map = @splat(.invalid) };
    @memcpy(map.map[0..positions.len], positions);
    return map;
}

/// Everything a stream open needs. `attributes` is passed to libpulse as given.
pub const StreamSetup = struct {
    direction: Direction,
    spec: audio.Spec,
    name: [:0]const u8,
    device: ?[:0]const u8,
    attributes: binding.BufferAttr,
};

/// Stream handle plus the buffer attributes libpulse granted.
pub const OpenedStream = struct {
    handle: *binding.StreamHandle,
    attributes: binding.BufferAttr,
};

/// Buffer attributes for a stream whose server buffer is `frames` sample frames.
/// tlength is the buffer, prebuf the amount queued before playback starts (one
/// full buffer, the server default made explicit), and minreq the request size
/// (a quarter of the buffer, at least one frame). maxlength uses libpulse's
/// default (SDL's -1). fragsize is twice the buffer, as SDL requests it for capture.
pub fn buffer_attributes(spec: audio.Spec, frames: usize) Error!binding.BufferAttr {
    const frame_bytes = try spec.frame_size();
    const buffer_bytes = std.math.mul(usize, frames, frame_bytes) catch return error.Overflow;
    const quarter = (buffer_bytes / 4) / frame_bytes * frame_bytes;
    const minreq = @max(frame_bytes, quarter);
    return .{
        .maxlength = std.math.maxInt(u32),
        .tlength = std.math.cast(u32, buffer_bytes) orelse return error.Overflow,
        .prebuf = std.math.cast(u32, buffer_bytes) orelse return error.Overflow,
        .minreq = std.math.cast(u32, minreq) orelse return error.Overflow,
        .fragsize = std.math.cast(u32, std.math.mul(usize, buffer_bytes, 2) catch return error.Overflow) orelse return error.Overflow,
    };
}

/// Sleep for a whole number of milliseconds. Used only by finite-timeout waits.
pub fn sleep_milliseconds(milliseconds: u32) void {
    const request = std.os.linux.timespec{ .sec = 0, .nsec = @as(isize, milliseconds) * std.time.ns_per_ms };
    _ = std.os.linux.nanosleep(&request, null);
}

/// A sink or source as libpulse reported it, before copying into Zig storage.
/// The pointers are valid only inside the callback that produced the value.
pub const RawDevice = struct {
    index: u32,
    name: ?[*:0]const u8,
    description: ?[*:0]const u8,
    sample_spec: binding.SampleSpec,
    channel_map: binding.ChannelMap,
    volume: binding.CVolume,
    muted: bool,
    latency_microseconds: u64,
    /// Set for a monitor source: the index of the sink it records.
    monitor_of_sink: ?u32,
};

fn text(pointer: ?[*:0]const u8) []const u8 {
    return if (pointer) |value| std.mem.span(value) else "";
}

/// A playback or capture device with owned copies of its strings and map.
/// `name` is the identifier to pass as a stream's `device` option.
pub const Device = struct {
    direction: Direction,
    index: u32,
    name: [:0]u8,
    description: []u8,
    /// Null when the server's sample format has no zdl equivalent.
    format: ?audio.Format,
    sample_rate: u32,
    /// One position per channel, in the server's order.
    channel_map: []Position,
    /// Per-channel PulseAudio volume units; 65536 is PA_VOLUME_NORM.
    volume: []u32,
    muted: bool,
    /// Server-reported queue/device latency in microseconds.
    latency_microseconds: u64,

    pub fn channels(self: Device) u16 {
        return @intCast(self.channel_map.len);
    }

    /// Releases the owned strings and channel map. Consumes the value.
    pub fn deinit(self: *Device, allocator: std.mem.Allocator) void {
        allocator.free(self.name);
        allocator.free(self.description);
        allocator.free(self.channel_map);
        allocator.free(self.volume);
        self.* = undefined;
    }

    fn from_raw(allocator: std.mem.Allocator, direction: Direction, raw: RawDevice) std.mem.Allocator.Error!Device {
        const name = try allocator.dupeSentinel(u8, text(raw.name), 0);
        errdefer allocator.free(name);
        const description = try allocator.dupe(u8, text(raw.description));
        errdefer allocator.free(description);
        const count: usize = @min(raw.channel_map.channels, binding_channel_limit);
        const positions = try allocator.alloc(Position, count);
        errdefer allocator.free(positions);
        for (positions, raw.channel_map.map[0..count]) |*position, source| position.* = source;
        const volume = try allocator.alloc(u32, count);
        errdefer allocator.free(volume);
        @memcpy(volume, raw.volume.values[0..count]);
        return .{
            .direction = direction,
            .index = raw.index,
            .name = name,
            .description = description,
            .format = format_from_pulse(raw.sample_spec.format),
            .sample_rate = raw.sample_spec.rate,
            .channel_map = positions,
            .volume = volume,
            .muted = raw.muted,
            .latency_microseconds = raw.latency_microseconds,
        };
    }
};

/// Stable PulseAudio physical-device identity used when mapping server default
/// names back to the device indices in subscription events.
pub const DeviceHandle = struct {
    allocator: std.mem.Allocator,
    direction: Direction,
    index: u32,
    channels: u16,
    name: [:0]u8,

    pub fn deinit(self: *DeviceHandle) void {
        self.allocator.free(self.name);
        self.* = undefined;
    }
};

/// Owned device list from enumeration. Entries and the slice are freed by deinit.
pub const DeviceList = struct {
    allocator: std.mem.Allocator,
    items: []Device,

    pub fn deinit(self: *DeviceList) void {
        for (self.items) |*device| device.deinit(self.allocator);
        self.allocator.free(self.items);
        self.* = undefined;
    }
};

/// Default device names as the server reports them. Empty when none is set.
pub const ServerInfo = struct {
    allocator: std.mem.Allocator,
    default_sink: [:0]u8,
    default_source: [:0]u8,

    pub fn deinit(self: *ServerInfo) void {
        self.allocator.free(self.default_sink);
        self.allocator.free(self.default_source);
        self.* = undefined;
    }
};

/// Hotplug and default-device notifications delivered by `poll_events`.
/// `device_removed` carries only the index, which is the identity libpulse uses.
pub const Event = union(enum) {
    device_added: Device,
    device_changed: Device,
    device_removed: Removed,
    default_device_changed: DefaultDevice,

    pub const Removed = struct { direction: Direction, index: u32 };
    pub const DefaultDevice = struct { direction: Direction, name: [:0]u8 };

    /// Releases the owned payload. Consumes the value.
    pub fn deinit(self: *Event, allocator: std.mem.Allocator) void {
        switch (self.*) {
            .device_added, .device_changed => |*device| device.deinit(allocator),
            .device_removed => {},
            .default_device_changed => |default| allocator.free(default.name),
        }
        self.* = undefined;
    }
};

/// Owned batch of events returned by `Context.poll_events`.
pub const EventList = struct {
    allocator: std.mem.Allocator,
    items: []Event,

    pub fn deinit(self: *EventList) void {
        for (self.items) |*event| event.deinit(self.allocator);
        self.allocator.free(self.items);
        self.* = undefined;
    }
};

/// State shared between the caller and libpulse's callbacks. It is heap
/// allocated so callbacks keep a stable pointer while the Context value moves.
/// Fields touched by callbacks are only accessed with the mainloop lock held.
pub const Shared = struct {
    allocator: std.mem.Allocator,
    library: *binding.Library,
    mainloop: ?*binding.Mainloop = null,
    context: ?*binding.PaContext = null,
    diagnostic: ?*Diagnostic,
    include_monitors: bool,
    events: std.ArrayList(Event) = .empty,
    /// Set when a callback could not allocate; reported once by poll_events.
    overflowed: bool = false,
    /// Last default names, used to report only real changes.
    default_sink: ?[:0]u8 = null,
    default_source: ?[:0]u8 = null,

    /// Recovers the Shared pointer handed to libpulse as userdata.
    pub fn from_userdata(userdata: ?*anyopaque) *Shared {
        return @ptrCast(@alignCast(userdata.?));
    }

    /// Acquires the libpulse mainloop lock. Pair with `unlock`.
    pub fn lock(self: *Shared) void {
        self.library.functions.threaded_mainloop_lock(self.mainloop.?);
    }

    pub fn unlock(self: *Shared) void {
        self.library.functions.threaded_mainloop_unlock(self.mainloop.?);
    }

    /// Blocks until another callback wakes the mainloop. Caller holds the lock.
    pub fn wait(self: *Shared) void {
        self.library.functions.threaded_mainloop_wait(self.mainloop.?);
    }

    /// Wakes every thread waiting on the mainloop. Safe from callbacks.
    pub fn wake(self: *Shared) void {
        self.library.functions.threaded_mainloop_signal(self.mainloop.?, 0);
    }

    /// Waits while holding the lock on entry and exit until `ready` returns true.
    /// A null timeout waits indefinitely on libpulse's signal. A finite timeout
    /// releases the lock and polls once per millisecond, so the elapsed time is
    /// approximate. Returns false when the timeout expires first.
    pub fn wait_until(self: *Shared, timeout_milliseconds: ?u31, subject: anytype, comptime ready: fn (@TypeOf(subject)) Error!bool) Error!bool {
        var elapsed: u32 = 0;
        while (true) {
            if (try ready(subject)) return true;
            if (timeout_milliseconds) |limit| {
                if (elapsed >= limit) return false;
                self.unlock();
                sleep_milliseconds(1);
                self.lock();
                elapsed += 1;
            } else {
                self.wait();
            }
        }
    }

    /// Records a failure reason in the caller's diagnostic, if one was given.
    pub fn report(self: *Shared, comptime fmt: []const u8, args: anytype) void {
        if (self.diagnostic) |diagnostic| diagnostic.set(fmt, args) catch {};
    }

    /// Records libpulse's text for an error code.
    pub fn report_code(self: *Shared, prefix: []const u8, code: c_int) void {
        const message = std.mem.span(self.library.functions.strerror(code));
        self.report("{s}: {s}", .{ prefix, message });
    }

    pub fn context_state(self: *Shared) binding.ContextState {
        return self.library.functions.context_get_state(self.context.?);
    }

    /// Waits for a libpulse operation to finish, then releases it. Caller holds
    /// the lock. If the connection fails meanwhile the operation is cancelled.
    pub fn await_operation(self: *Shared, maybe_operation: ?*binding.Operation) Error!void {
        const functions = &self.library.functions;
        const operation = maybe_operation orelse {
            self.report("PulseAudio operation could not be started", .{});
            return error.OperationFailed;
        };
        functions.operation_set_state_callback(operation, binding.on_operation_notify, self);
        while (functions.operation_get_state(operation) == .running) {
            if (!self.context_state().is_good()) {
                functions.operation_cancel(operation);
                functions.operation_unref(operation);
                return error.Disconnected;
            }
            self.wait();
        }
        functions.operation_unref(operation);
    }

    /// Releases a fire-and-forget operation immediately. Callbacks it installed
    /// still run; they must not depend on the result.
    pub fn discard(self: *Shared, maybe_operation: ?*binding.Operation) void {
        if (maybe_operation) |operation| self.library.functions.operation_unref(operation);
    }

    /// Queues an event for poll_events. On allocation failure the event is
    /// released and the overflow flag is set instead.
    pub fn publish(self: *Shared, event: Event) void {
        self.events.append(self.allocator, event) catch {
            var lost = event;
            lost.deinit(self.allocator);
            self.overflowed = true;
        };
    }

    /// Converts a sink/source change into a queued event. Monitor sources are
    /// dropped unless the Context was opened with include_monitors.
    pub fn publish_device(self: *Shared, direction: Direction, change: DeviceChange, raw: RawDevice) void {
        if (direction == .capture and raw.monitor_of_sink != null and !self.include_monitors) return;
        const device = Device.from_raw(self.allocator, direction, raw) catch {
            self.overflowed = true;
            return;
        };
        self.publish(switch (change) {
            .added => .{ .device_added = device },
            .changed => .{ .device_changed = device },
        });
    }

    pub const DeviceChange = enum { added, changed };

    /// Handles one subscription event word from libpulse (device added, changed,
    /// removed or server changed). Lookups are issued as fire-and-forget
    /// operations whose callbacks queue the result.
    pub fn subscription(self: *Shared, event_word: u32, index: u32) void {
        defer self.wake();
        const context = self.context orelse return;
        const functions = &self.library.functions;
        const facility = event_word & binding.event_facility_mask;
        const action = event_word & binding.event_type_mask;
        const is_sink = facility == binding.event_facility_sink;
        const is_source = facility == binding.event_facility_source;
        const is_server = facility == binding.event_facility_server;
        switch (action) {
            binding.event_new => {
                if (is_sink) self.discard(functions.context_get_sink_info_by_index(context, index, binding.on_sink_added, self));
                if (is_source) self.discard(functions.context_get_source_info_by_index(context, index, binding.on_source_added, self));
            },
            binding.event_change => {
                if (is_server) self.discard(functions.context_get_server_info(context, binding.on_event_server_info, self));
                if (is_sink) self.discard(functions.context_get_sink_info_by_index(context, index, binding.on_sink_changed, self));
                if (is_source) self.discard(functions.context_get_source_info_by_index(context, index, binding.on_source_changed, self));
            },
            binding.event_remove => {
                if (is_sink) self.publish(.{ .device_removed = .{ .direction = .playback, .index = index } });
                if (is_source) self.publish(.{ .device_removed = .{ .direction = .capture, .index = index } });
            },
            else => {},
        }
    }

    /// Stores a default device name, returning true when it differs from the
    /// previous one. Caller holds the lock.
    fn store_default(self: *Shared, direction: Direction, name: []const u8) std.mem.Allocator.Error!bool {
        const slot = switch (direction) {
            .playback => &self.default_sink,
            .capture => &self.default_source,
        };
        if (slot.*) |current| {
            if (std.mem.eql(u8, current, name)) return false;
        }
        const copy = try self.allocator.dupeSentinel(u8, name, 0);
        if (slot.*) |old| self.allocator.free(old);
        slot.* = copy;
        return true;
    }

    /// Server-change events: queue a default-device event for each real change.
    pub fn defaults_changed(self: *Shared, sink: ?[*:0]const u8, source: ?[*:0]const u8) void {
        self.default_changed(.playback, text(sink));
        self.default_changed(.capture, text(source));
    }

    fn default_changed(self: *Shared, direction: Direction, name: []const u8) void {
        const changed = self.store_default(direction, name) catch {
            self.overflowed = true;
            return;
        };
        if (!changed) return;
        const copy = self.allocator.dupeSentinel(u8, name, 0) catch {
            self.overflowed = true;
            return;
        };
        self.publish(.{ .default_device_changed = .{ .direction = direction, .name = copy } });
    }

    /// Releases the mainloop and connection. Waits for the libpulse thread to
    /// stop before disconnecting, as SDL does, so no callback runs during teardown.
    pub fn teardown(self: *Shared) void {
        const functions = &self.library.functions;
        const mainloop = self.mainloop orelse return;
        functions.threaded_mainloop_stop(mainloop);
        if (self.context) |context| {
            functions.context_disconnect(context);
            functions.context_unref(context);
            self.context = null;
        }
        functions.threaded_mainloop_free(mainloop);
        self.mainloop = null;
    }

    /// Frees everything owned by Shared. Call only after teardown.
    pub fn destroy(self: *Shared) void {
        for (self.events.items) |*event| event.deinit(self.allocator);
        self.events.deinit(self.allocator);
        if (self.default_sink) |name| self.allocator.free(name);
        if (self.default_source) |name| self.allocator.free(name);
        self.allocator.destroy(self);
    }

    /// Creates and connects a playback or capture stream, waits until the server
    /// reports it ready and returns the buffer attributes actually granted. Caller
    /// must not hold the lock. The stream's state callback only wakes waiters.
    pub fn open_stream(self: *Shared, setup: StreamSetup) Error!OpenedStream {
        const map = channel_map(setup.spec.channels) orelse return error.InvalidChannels;
        const sample_spec = binding.SampleSpec{
            .format = pulse_format(setup.spec.format),
            .rate = setup.spec.sample_rate,
            .channels = @intCast(setup.spec.channels),
        };
        const functions = &self.library.functions;
        self.lock();
        defer self.unlock();
        const handle = functions.stream_new(self.context.?, setup.name.ptr, &sample_spec, &map) orelse {
            self.report("Could not set up PulseAudio stream", .{});
            return error.StreamFailed;
        };
        errdefer {
            _ = functions.stream_disconnect(handle);
            functions.stream_unref(handle);
        }
        functions.stream_set_state_callback(handle, binding.on_stream_notify, self);
        const device: ?[*:0]const u8 = if (setup.device) |name| name.ptr else null;
        const code = switch (setup.direction) {
            .playback => blk: {
                functions.stream_set_write_callback(handle, binding.on_stream_request, self);
                break :blk functions.stream_connect_playback(handle, device, &setup.attributes, binding.stream_flag_adjust_latency, null, null);
            },
            .capture => blk: {
                functions.stream_set_read_callback(handle, binding.on_stream_request, self);
                break :blk functions.stream_connect_record(handle, device, &setup.attributes, binding.stream_flag_adjust_latency);
            },
        };
        if (code < 0) {
            self.report_code("Could not connect PulseAudio stream", code);
            return error.StreamFailed;
        }
        var state = functions.stream_get_state(handle);
        while (state.is_good() and state != .ready) {
            self.wait();
            state = functions.stream_get_state(handle);
        }
        if (state != .ready) {
            self.report("Could not connect PulseAudio stream", .{});
            return error.StreamFailed;
        }
        const actual = functions.stream_get_buffer_attr(handle) orelse {
            self.report("Could not determine connected PulseAudio stream's buffer attributes", .{});
            return error.StreamFailed;
        };
        return .{ .handle = handle, .attributes = actual.* };
    }

    /// Starts the mainloop and connects the context. Errors leave the partially
    /// built state for `teardown` to release.
    fn start_and_connect(self: *Shared, options: Options) Error!void {
        const functions = &self.library.functions;
        const mainloop = functions.threaded_mainloop_new() orelse {
            self.report("pa_threaded_mainloop_new() failed", .{});
            return error.ConnectionFailed;
        };
        if (functions.threaded_mainloop_set_name) |set_name| set_name(mainloop, "PulseMainloop");
        if (functions.threaded_mainloop_start(mainloop) < 0) {
            functions.threaded_mainloop_free(mainloop);
            self.report("pa_threaded_mainloop_start() failed", .{});
            return error.ConnectionFailed;
        }
        self.mainloop = mainloop;

        self.lock();
        defer self.unlock();
        const api = functions.threaded_mainloop_get_api(mainloop);
        const proplist = functions.proplist_new() orelse {
            self.report("pa_proplist_new() failed", .{});
            return error.ConnectionFailed;
        };
        defer functions.proplist_free(proplist);
        _ = functions.proplist_sets(proplist, "application.icon_name", options.icon_name.ptr);

        const context = functions.context_new_with_proplist(api, options.application_name.ptr, proplist) orelse {
            self.report("pa_context_new_with_proplist() failed", .{});
            return error.ConnectionFailed;
        };
        self.context = context;
        functions.context_set_state_callback(context, binding.on_context_notify, self);
        const code = functions.context_connect(context, null, 0, null);
        if (code < 0) {
            self.report_code("Could not setup connection to PulseAudio", code);
            return error.Unavailable;
        }
        var state = functions.context_get_state(context);
        while (state.is_good() and state != .ready) {
            self.wait();
            state = functions.context_get_state(context);
        }
        if (state != .ready) {
            self.report("Could not connect to PulseAudio", .{});
            return error.Unavailable;
        }
    }
};

/// Stack request whose lifetime spans one synchronous volume operation. The
/// callback runs under the PulseAudio loop lock and wakes `await_operation`.
pub const VolumeRequest = struct {
    shared: *Shared,
    success: ?bool = null,

    pub fn complete(self: *VolumeRequest, success: bool) void {
        self.success = success;
        self.shared.wake();
    }
};

/// Scratch state for one enumeration or server query. It lives on the caller's
/// stack for the duration of the wait, so libpulse callbacks may point at it.
pub const Request = struct {
    shared: *Shared,
    devices: std.ArrayList(Device) = .empty,
    server: ?ServerInfo = null,
    out_of_memory: bool = false,

    pub fn from_userdata(userdata: ?*anyopaque) *Request {
        return @ptrCast(@alignCast(userdata.?));
    }

    pub fn add(self: *Request, direction: Direction, raw: RawDevice) void {
        if (direction == .capture and raw.monitor_of_sink != null and !self.shared.include_monitors) return;
        const allocator = self.shared.allocator;
        var device = Device.from_raw(allocator, direction, raw) catch {
            self.out_of_memory = true;
            return;
        };
        self.devices.append(allocator, device) catch {
            device.deinit(allocator);
            self.out_of_memory = true;
        };
    }

    /// Copies the server defaults and refreshes the Shared baseline. Callers
    /// use this to learn the current default, not to receive change events.
    pub fn set_server(self: *Request, sink: ?[*:0]const u8, source: ?[*:0]const u8) void {
        const allocator = self.shared.allocator;
        const sink_copy = allocator.dupeSentinel(u8, text(sink), 0) catch {
            self.out_of_memory = true;
            return;
        };
        const source_copy = allocator.dupeSentinel(u8, text(source), 0) catch {
            allocator.free(sink_copy);
            self.out_of_memory = true;
            return;
        };
        self.server = .{ .allocator = allocator, .default_sink = sink_copy, .default_source = source_copy };
        _ = self.shared.store_default(.playback, text(sink)) catch {
            self.shared.overflowed = true;
        };
        _ = self.shared.store_default(.capture, text(source)) catch {
            self.shared.overflowed = true;
        };
    }

    pub fn deinit(self: *Request) void {
        const allocator = self.shared.allocator;
        for (self.devices.items) |*device| device.deinit(allocator);
        self.devices.deinit(allocator);
        if (self.server) |*server| server.deinit();
        self.server = null;
    }
};

/// A connection to the PulseAudio server. Owns its mainloop thread, which is
/// joined by `deinit`. Streams made from a Context must be closed first, and the
/// Library must outlive the Context. The value may move; its state does not.
pub const Context = struct {
    shared: *Shared,

    /// Starts the mainloop and connects with `options.application_name`. Blocks
    /// until the server is ready or the attempt fails. Failure leaves nothing
    /// running and nothing allocated.
    pub fn open(allocator: std.mem.Allocator, library: *Library, options: Options) Error!Context {
        if (options.application_name.len == 0) return error.InvalidConfiguration;
        const shared = try allocator.create(Shared);
        shared.* = .{
            .allocator = allocator,
            .library = &library.native,
            .diagnostic = options.diagnostic,
            .include_monitors = options.include_monitors,
        };
        shared.start_and_connect(options) catch |err| {
            shared.teardown();
            shared.destroy();
            return err;
        };
        return .{ .shared = shared };
    }

    /// Disconnects, joins the mainloop thread and frees owned state. Pending
    /// events are discarded. Streams made from this Context must already be closed.
    pub fn deinit(self: *Context) void {
        self.shared.teardown();
        self.shared.destroy();
        self.* = undefined;
    }

    /// Default sink and source names reported by the server.
    pub fn server_info(self: *Context) Error!ServerInfo {
        const shared = self.shared;
        var request: Request = .{ .shared = shared };
        defer request.deinit();
        shared.lock();
        defer shared.unlock();
        const operation = shared.library.functions.context_get_server_info(shared.context.?, binding.on_request_server_info, &request);
        try shared.await_operation(operation);
        if (request.out_of_memory) return error.OutOfMemory;
        const info = request.server orelse return error.OperationFailed;
        request.server = null;
        return info;
    }

    /// Maps a server device name to its stable `(direction,index)` handle.
    /// Returns null if a hotplug race removed the device before enumeration.
    pub fn device_handle(self: *Context, allocator: std.mem.Allocator, direction: Direction, name: []const u8) Error!?DeviceHandle {
        var devices = switch (direction) {
            .playback => try self.playback_devices(),
            .capture => try self.capture_devices(),
        };
        defer devices.deinit();
        for (devices.items) |device| {
            if (!std.mem.eql(u8, device.name, name)) continue;
            return .{
                .allocator = allocator,
                .direction = direction,
                .index = device.index,
                .channels = device.channels(),
                .name = try allocator.dupeSentinel(u8, device.name, 0),
            };
        }
        return null;
    }

    /// Resolves the current server default to the `(direction,index)` handle
    /// used by PulseAudio device-change and removal notifications.
    pub fn default_device_handle(self: *Context, allocator: std.mem.Allocator, direction: Direction) Error!?DeviceHandle {
        var info = try self.server_info();
        defer info.deinit();
        const name: []const u8 = switch (direction) {
            .playback => info.default_sink,
            .capture => info.default_source,
        };
        if (name.len == 0) return null;
        return self.device_handle(allocator, direction, name);
    }

    /// Sets the physical sink or source volume by its PulseAudio device index.
    /// Gain is linear in [0, 1], where 1.0 is PulseAudio's normal volume.
    /// Applications should call this for direct user volume changes; use the
    /// logical device's `set_gain` for per-application attenuation.
    pub fn set_device_volume(self: *Context, handle: *const DeviceHandle, gain: f32) Error!void {
        if (!std.math.isFinite(gain) or gain < 0 or gain > 1) return error.InvalidGain;
        if (handle.channels == 0 or handle.channels > binding_channel_limit) return error.InvalidConfiguration;
        var volume: binding.CVolume = .{ .channels = @intCast(handle.channels), .values = @splat(0) };
        const raw_gain = self.shared.library.functions.sw_volume_from_linear(gain);
        if (self.shared.library.functions.cvolume_set(&volume, handle.channels, raw_gain) == null) return error.OperationFailed;
        var request: VolumeRequest = .{ .shared = self.shared };
        self.shared.lock();
        defer self.shared.unlock();
        const context_handle = self.shared.context.?;
        const operation = switch (handle.direction) {
            .playback => self.shared.library.functions.context_set_sink_volume_by_index(context_handle, handle.index, &volume, binding.on_volume_success, &request),
            .capture => self.shared.library.functions.context_set_source_volume_by_index(context_handle, handle.index, &volume, binding.on_volume_success, &request),
        };
        try self.shared.await_operation(operation);
        if (request.success != true) return error.OperationFailed;
    }

    /// Every playback device (sink) the server lists right now.
    pub fn playback_devices(self: *Context) Error!DeviceList {
        return self.list(.playback);
    }

    /// Every capture device (source). Monitor sources are included only when
    /// the Context was connected with `include_monitors`.
    pub fn capture_devices(self: *Context) Error!DeviceList {
        return self.list(.capture);
    }

    fn list(self: *Context, direction: Direction) Error!DeviceList {
        const shared = self.shared;
        var request: Request = .{ .shared = shared };
        defer request.deinit();
        shared.lock();
        defer shared.unlock();
        const functions = &shared.library.functions;
        const operation = switch (direction) {
            .playback => functions.context_get_sink_info_list(shared.context.?, binding.on_request_sink, &request),
            .capture => functions.context_get_source_info_list(shared.context.?, binding.on_request_source, &request),
        };
        try shared.await_operation(operation);
        if (request.out_of_memory) return error.OutOfMemory;
        const items = try request.devices.toOwnedSlice(shared.allocator);
        request.devices = .empty;
        return .{ .allocator = shared.allocator, .items = items };
    }

    /// Subscribes to sink, source and server changes. Events are queued until
    /// `poll_events` drains them. Nothing is delivered on another thread.
    pub fn subscribe(self: *Context) Error!void {
        const shared = self.shared;
        shared.lock();
        defer shared.unlock();
        const functions = &shared.library.functions;
        const mask = binding.subscription_mask_sink | binding.subscription_mask_source | binding.subscription_mask_server;
        functions.context_set_subscribe_callback(shared.context.?, binding.on_subscription, shared);
        const operation = functions.context_subscribe(shared.context.?, mask, null, null) orelse return error.OperationFailed;
        functions.operation_unref(operation);
    }

    /// Stops hotplug notifications. Events already queued remain available.
    pub fn unsubscribe(self: *Context) void {
        const shared = self.shared;
        shared.lock();
        defer shared.unlock();
        const functions = &shared.library.functions;
        functions.context_set_subscribe_callback(shared.context.?, null, null);
        shared.discard(functions.context_subscribe(shared.context.?, 0, null, null));
    }

    /// Takes every queued hotplug event. Returns `error.OutOfMemory` once if a
    /// callback had to drop events; the rest of the queue is still returned later.
    pub fn poll_events(self: *Context) Error!EventList {
        const shared = self.shared;
        shared.lock();
        defer shared.unlock();
        if (shared.overflowed) {
            shared.overflowed = false;
            return error.OutOfMemory;
        }
        const items = try shared.events.toOwnedSlice(shared.allocator);
        return .{ .allocator = shared.allocator, .items = items };
    }
};

test "Pulse sample formats preserve 24-bit and G.711 representations" {
    try std.testing.expectEqual(audio.Format.signed24_le, format_from_pulse(.signed24_le).?);
    try std.testing.expectEqual(audio.Format.signed24_be, format_from_pulse(.signed24_be).?);
    try std.testing.expectEqual(audio.Format.signed24_32_le, format_from_pulse(.signed24_32_le).?);
    try std.testing.expectEqual(audio.Format.alaw, format_from_pulse(.alaw).?);
    try std.testing.expectEqual(audio.Format.mulaw, format_from_pulse(.ulaw).?);
}
