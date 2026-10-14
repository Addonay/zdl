//! Private libpulse binding. This is the only file in the PulseAudio port that
//! declares C types, calls through C function pointers or defines C callbacks.
//! Public modules (context.zig, playback.zig, capture.zig) expose idiomatic Zig
//! values; the pointers and enum/struct layouts below never leave this package.
//!
//! libpulse is loaded at runtime with `std.DynLib` ("libpulse.so.0"), following
//! the ALSA loader pattern: one table of function pointers resolved by name, so
//! zdl does not link libpulse at build time. Optional entry points are fields of
//! optional type and stay null when the installed library lacks them.
//!
//! Layouts and values come from the libpulse 17 headers (pulse/def.h, sample.h,
//! channelmap.h, introspect.h, proplist.h). Enum values that libpulse returns are
//! declared as non-exhaustive enums so unknown server values remain representable.
//!
//! Callbacks are C-ABI functions invoked on libpulse's threaded mainloop thread
//! with the mainloop lock held. Each one only copies what it is given into Zig
//! state (`context.Shared` or a caller's `context.Request`) and wakes waiters.
//! Userdata is always one of those Zig objects, never application memory.
const std = @import("std");
const builtin = @import("builtin");
const pulse_context = @import("context.zig");

pub const Mainloop = opaque {};
pub const MainloopApi = opaque {};
pub const PaContext = opaque {};
pub const StreamHandle = opaque {};
pub const Operation = opaque {};
pub const Proplist = opaque {};

/// pa_sample_format_t (sample.h).
pub const SampleFormat = enum(i32) {
    invalid = -1,
    unsigned8 = 0,
    alaw = 1,
    ulaw = 2,
    signed16_le = 3,
    signed16_be = 4,
    float32_le = 5,
    float32_be = 6,
    signed32_le = 7,
    signed32_be = 8,
    signed24_le = 9,
    signed24_be = 10,
    signed24_32_le = 11,
    signed24_32_be = 12,
    _,
};

/// pa_channel_position_t (channelmap.h). Only the positions zdl maps are named;
/// AUX, top and other positions are represented by their raw values.
pub const ChannelPosition = enum(i32) {
    invalid = -1,
    mono = 0,
    front_left = 1,
    front_right = 2,
    front_center = 3,
    rear_center = 4,
    rear_left = 5,
    rear_right = 6,
    lfe = 7,
    front_left_of_center = 8,
    front_right_of_center = 9,
    side_left = 10,
    side_right = 11,
    _,
};

/// pa_context_state_t (def.h).
pub const ContextState = enum(i32) {
    unconnected = 0,
    connecting = 1,
    authorizing = 2,
    setting_name = 3,
    ready = 4,
    failed = 5,
    terminated = 6,
    _,

    /// PA_CONTEXT_IS_GOOD: the context is still usable or on its way to ready.
    pub fn is_good(self: ContextState) bool {
        return switch (self) {
            .connecting, .authorizing, .setting_name, .ready => true,
            else => false,
        };
    }
};

/// pa_stream_state_t (def.h).
pub const StreamState = enum(i32) {
    unconnected = 0,
    creating = 1,
    ready = 2,
    failed = 3,
    terminated = 4,
    _,

    /// PA_STREAM_IS_GOOD: the stream is being created or is ready.
    pub fn is_good(self: StreamState) bool {
        return switch (self) {
            .creating, .ready => true,
            else => false,
        };
    }
};

/// pa_operation_state_t (def.h).
pub const OperationState = enum(i32) {
    running = 0,
    done = 1,
    cancelled = 2,
    _,
};

/// Subscription masks and event words (def.h). An event word is a facility
/// (low nibble) combined with an action (bits 4 and 5).
pub const subscription_mask_sink: u32 = 0x0001;
pub const subscription_mask_source: u32 = 0x0002;
pub const subscription_mask_server: u32 = 0x0080;
pub const event_facility_mask: u32 = 0x000f;
pub const event_facility_sink: u32 = 0x0000;
pub const event_facility_source: u32 = 0x0001;
pub const event_facility_server: u32 = 0x0007;
pub const event_type_mask: u32 = 0x0030;
pub const event_new: u32 = 0x0000;
pub const event_change: u32 = 0x0010;
pub const event_remove: u32 = 0x0020;

/// PA_STREAM_ADJUST_LATENCY: the server adapts tlength/minreq/fragsize to the
/// requested values instead of using its defaults (def.h).
pub const stream_flag_adjust_latency: u32 = 0x2000;
/// PA_INVALID_INDEX.
pub const invalid_index: u32 = 0xffff_ffff;
/// PA_SEEK_RELATIVE: write position is relative to the current write cursor.
pub const seek_relative: i32 = 0;

/// pa_sample_spec (sample.h): format, rate, channels, padded to 12 bytes.
pub const SampleSpec = extern struct {
    format: SampleFormat,
    rate: u32,
    channels: u8,
};

/// pa_channel_map (channelmap.h): PA_CHANNELS_MAX (32) positions.
pub const ChannelMap = extern struct {
    channels: u8,
    map: [32]ChannelPosition,
};

/// pa_cvolume (volume.h). Only needed to walk past the volume field of a source.
pub const CVolume = extern struct {
    channels: u8,
    values: [32]u32,
};

/// pa_buffer_attr (def.h). Sizes are bytes; `std.math.maxInt(u32)` is libpulse's -1.
pub const BufferAttr = extern struct {
    maxlength: u32,
    tlength: u32,
    prebuf: u32,
    minreq: u32,
    fragsize: u32,
};

/// Prefix of pa_sink_info (introspect.h). Fields after channel_map are never read.
pub const RawSinkInfo = extern struct {
    name: ?[*:0]const u8,
    index: u32,
    description: ?[*:0]const u8,
    sample_spec: SampleSpec,
    channel_map: ChannelMap,
};

/// Prefix of pa_source_info (introspect.h) through monitor_of_sink.
pub const RawSourceInfo = extern struct {
    name: ?[*:0]const u8,
    index: u32,
    description: ?[*:0]const u8,
    sample_spec: SampleSpec,
    channel_map: ChannelMap,
    owner_module: u32,
    volume: CVolume,
    mute: c_int,
    monitor_of_sink: u32,
};

/// Prefix of pa_server_info (introspect.h) through the default device names.
pub const RawServerInfo = extern struct {
    user_name: ?[*:0]const u8,
    host_name: ?[*:0]const u8,
    server_version: ?[*:0]const u8,
    server_name: ?[*:0]const u8,
    sample_spec: SampleSpec,
    default_sink_name: ?[*:0]const u8,
    default_source_name: ?[*:0]const u8,
};

pub const ContextNotify = *const fn (*PaContext, ?*anyopaque) callconv(.c) void;
pub const ContextSuccess = *const fn (*PaContext, c_int, ?*anyopaque) callconv(.c) void;
pub const SubscribeNotify = *const fn (*PaContext, u32, u32, ?*anyopaque) callconv(.c) void;
pub const SinkInfoNotify = *const fn (*PaContext, ?*const RawSinkInfo, c_int, ?*anyopaque) callconv(.c) void;
pub const SourceInfoNotify = *const fn (*PaContext, ?*const RawSourceInfo, c_int, ?*anyopaque) callconv(.c) void;
pub const ServerInfoNotify = *const fn (*PaContext, ?*const RawServerInfo, ?*anyopaque) callconv(.c) void;
pub const StreamNotify = *const fn (*StreamHandle, ?*anyopaque) callconv(.c) void;
pub const StreamRequest = *const fn (*StreamHandle, usize, ?*anyopaque) callconv(.c) void;
pub const StreamSuccess = *const fn (*StreamHandle, c_int, ?*anyopaque) callconv(.c) void;
pub const OperationNotify = *const fn (*Operation, ?*anyopaque) callconv(.c) void;

/// Function table for libpulse. Field names are the libpulse names without the
/// `pa_` prefix. Optional fields are looked up without failing the load.
pub const Functions = struct {
    get_library_version: *const fn () callconv(.c) [*:0]const u8,
    strerror: *const fn (c_int) callconv(.c) [*:0]const u8,

    proplist_new: *const fn () callconv(.c) ?*Proplist,
    proplist_free: *const fn (*Proplist) callconv(.c) void,
    proplist_sets: *const fn (*Proplist, [*:0]const u8, [*:0]const u8) callconv(.c) c_int,

    threaded_mainloop_new: *const fn () callconv(.c) ?*Mainloop,
    threaded_mainloop_set_name: ?*const fn (*Mainloop, [*:0]const u8) callconv(.c) void,
    threaded_mainloop_get_api: *const fn (*Mainloop) callconv(.c) *MainloopApi,
    threaded_mainloop_start: *const fn (*Mainloop) callconv(.c) c_int,
    threaded_mainloop_stop: *const fn (*Mainloop) callconv(.c) void,
    threaded_mainloop_lock: *const fn (*Mainloop) callconv(.c) void,
    threaded_mainloop_unlock: *const fn (*Mainloop) callconv(.c) void,
    threaded_mainloop_wait: *const fn (*Mainloop) callconv(.c) void,
    threaded_mainloop_signal: *const fn (*Mainloop, c_int) callconv(.c) void,
    threaded_mainloop_free: *const fn (*Mainloop) callconv(.c) void,

    operation_get_state: *const fn (*const Operation) callconv(.c) OperationState,
    operation_set_state_callback: *const fn (*Operation, OperationNotify, ?*anyopaque) callconv(.c) void,
    operation_cancel: *const fn (*Operation) callconv(.c) void,
    operation_unref: *const fn (*Operation) callconv(.c) void,

    context_new_with_proplist: *const fn (*MainloopApi, [*:0]const u8, *const Proplist) callconv(.c) ?*PaContext,
    context_set_state_callback: *const fn (*PaContext, ContextNotify, ?*anyopaque) callconv(.c) void,
    context_connect: *const fn (*PaContext, ?[*:0]const u8, u32, ?*anyopaque) callconv(.c) c_int,
    context_get_state: *const fn (*const PaContext) callconv(.c) ContextState,
    context_disconnect: *const fn (*PaContext) callconv(.c) void,
    context_unref: *const fn (*PaContext) callconv(.c) void,
    context_get_server_info: *const fn (*PaContext, ServerInfoNotify, ?*anyopaque) callconv(.c) ?*Operation,
    context_get_sink_info_list: *const fn (*PaContext, SinkInfoNotify, ?*anyopaque) callconv(.c) ?*Operation,
    context_get_source_info_list: *const fn (*PaContext, SourceInfoNotify, ?*anyopaque) callconv(.c) ?*Operation,
    context_get_sink_info_by_index: *const fn (*PaContext, u32, SinkInfoNotify, ?*anyopaque) callconv(.c) ?*Operation,
    context_get_source_info_by_index: *const fn (*PaContext, u32, SourceInfoNotify, ?*anyopaque) callconv(.c) ?*Operation,
    context_subscribe: *const fn (*PaContext, u32, ?ContextSuccess, ?*anyopaque) callconv(.c) ?*Operation,
    context_set_subscribe_callback: *const fn (*PaContext, ?SubscribeNotify, ?*anyopaque) callconv(.c) void,

    stream_new: *const fn (*PaContext, [*:0]const u8, *const SampleSpec, *const ChannelMap) callconv(.c) ?*StreamHandle,
    stream_set_state_callback: *const fn (*StreamHandle, StreamNotify, ?*anyopaque) callconv(.c) void,
    stream_set_write_callback: *const fn (*StreamHandle, StreamRequest, ?*anyopaque) callconv(.c) void,
    stream_set_read_callback: *const fn (*StreamHandle, StreamRequest, ?*anyopaque) callconv(.c) void,
    stream_connect_playback: *const fn (*StreamHandle, ?[*:0]const u8, ?*const BufferAttr, u32, ?*const CVolume, ?*StreamHandle) callconv(.c) c_int,
    stream_connect_record: *const fn (*StreamHandle, ?[*:0]const u8, ?*const BufferAttr, u32) callconv(.c) c_int,
    stream_disconnect: *const fn (*StreamHandle) callconv(.c) c_int,
    stream_unref: *const fn (*StreamHandle) callconv(.c) void,
    stream_get_state: *const fn (*const StreamHandle) callconv(.c) StreamState,
    stream_get_buffer_attr: *const fn (*StreamHandle) callconv(.c) ?*const BufferAttr,
    stream_writable_size: *const fn (*const StreamHandle) callconv(.c) usize,
    stream_readable_size: *const fn (*const StreamHandle) callconv(.c) usize,
    stream_write: *const fn (*StreamHandle, *const anyopaque, usize, ?*anyopaque, i64, i32) callconv(.c) c_int,
    stream_drain: *const fn (*StreamHandle, ?StreamSuccess, ?*anyopaque) callconv(.c) ?*Operation,
    stream_flush: *const fn (*StreamHandle, ?StreamSuccess, ?*anyopaque) callconv(.c) ?*Operation,
    stream_cork: *const fn (*StreamHandle, c_int, ?StreamSuccess, ?*anyopaque) callconv(.c) ?*Operation,
    stream_peek: *const fn (*StreamHandle, *?*const anyopaque, *usize) callconv(.c) c_int,
    stream_drop: *const fn (*StreamHandle) callconv(.c) c_int,
};

/// An opened libpulse shared object and its resolved function table. Load once
/// before connecting; close only after every Context using it has been deinit.
/// The table is plain data, so a Library may move before it is used.
pub const Library = struct {
    handle: std.DynLib,
    functions: Functions,

    pub const OpenError = std.DynLib.Error || error{MissingSymbol};

    /// Loads the system libpulse. Like the ALSA loader this needs libc in the
    /// application's root module for the dynamic loader; core zdl does not.
    pub fn open() OpenError!Library {
        if (builtin.target.os.tag != .linux) @compileError("PulseAudio is a Linux backend here");
        if (!builtin.link_libc) @compileError("PulseAudio loading requires application root_module.link_libc = true");
        var handle = try std.DynLib.open("libpulse.so.0");
        errdefer handle.close();
        var functions: Functions = undefined;
        const info = @typeInfo(Functions).@"struct";
        inline for (info.field_names, info.field_types) |name, FieldType| {
            const symbol: [:0]const u8 = "pa_" ++ name;
            if (comptime @typeInfo(FieldType) == .optional) {
                @field(functions, name) = handle.lookup(@typeInfo(FieldType).optional.child, symbol);
            } else {
                @field(functions, name) = handle.lookup(FieldType, symbol) orelse return error.MissingSymbol;
            }
        }
        return .{ .handle = handle, .functions = functions };
    }

    /// Unloads the shared object. All function pointers become invalid.
    pub fn deinit(self: *Library) void {
        self.handle.close();
        self.* = undefined;
    }
};

// ---------------------------------------------------------------------------
// Callbacks. Each runs on libpulse's mainloop thread with the lock held.
// ---------------------------------------------------------------------------

pub fn on_context_notify(_: *PaContext, userdata: ?*anyopaque) callconv(.c) void {
    pulse_context.Shared.from_userdata(userdata).wake();
}

pub fn on_operation_notify(_: *Operation, userdata: ?*anyopaque) callconv(.c) void {
    pulse_context.Shared.from_userdata(userdata).wake();
}

pub fn on_stream_notify(_: *StreamHandle, userdata: ?*anyopaque) callconv(.c) void {
    pulse_context.Shared.from_userdata(userdata).wake();
}

/// Read and write request callbacks only wake a waiter; the Stream code asks
/// libpulse for the writable or readable size itself.
pub fn on_stream_request(_: *StreamHandle, _: usize, userdata: ?*anyopaque) callconv(.c) void {
    pulse_context.Shared.from_userdata(userdata).wake();
}

pub fn on_subscription(_: *PaContext, event: u32, index: u32, userdata: ?*anyopaque) callconv(.c) void {
    pulse_context.Shared.from_userdata(userdata).subscription(event, index);
}

/// Event-driven device additions and changes: queued as Events.
pub fn on_sink_added(_: *PaContext, info: ?*const RawSinkInfo, _: c_int, userdata: ?*anyopaque) callconv(.c) void {
    const sink = info orelse return;
    pulse_context.Shared.from_userdata(userdata).publish_device(.playback, .added, sink_device(sink));
}

pub fn on_sink_changed(_: *PaContext, info: ?*const RawSinkInfo, _: c_int, userdata: ?*anyopaque) callconv(.c) void {
    const sink = info orelse return;
    pulse_context.Shared.from_userdata(userdata).publish_device(.playback, .changed, sink_device(sink));
}

pub fn on_source_added(_: *PaContext, info: ?*const RawSourceInfo, _: c_int, userdata: ?*anyopaque) callconv(.c) void {
    const source = info orelse return;
    pulse_context.Shared.from_userdata(userdata).publish_device(.capture, .added, source_device(source));
}

pub fn on_source_changed(_: *PaContext, info: ?*const RawSourceInfo, _: c_int, userdata: ?*anyopaque) callconv(.c) void {
    const source = info orelse return;
    pulse_context.Shared.from_userdata(userdata).publish_device(.capture, .changed, source_device(source));
}

/// Server-change events: compare default device names with the last known ones.
pub fn on_event_server_info(_: *PaContext, info: ?*const RawServerInfo, userdata: ?*anyopaque) callconv(.c) void {
    const server = info orelse return;
    pulse_context.Shared.from_userdata(userdata).defaults_changed(server.default_sink_name, server.default_source_name);
}

/// Enumeration callbacks: results collect into the caller's stack Request.
pub fn on_request_server_info(_: *PaContext, info: ?*const RawServerInfo, userdata: ?*anyopaque) callconv(.c) void {
    const server = info orelse return;
    pulse_context.Request.from_userdata(userdata).set_server(server.default_sink_name, server.default_source_name);
}

pub fn on_request_sink(_: *PaContext, info: ?*const RawSinkInfo, _: c_int, userdata: ?*anyopaque) callconv(.c) void {
    const sink = info orelse return;
    pulse_context.Request.from_userdata(userdata).add(.playback, sink_device(sink));
}

pub fn on_request_source(_: *PaContext, info: ?*const RawSourceInfo, _: c_int, userdata: ?*anyopaque) callconv(.c) void {
    const source = info orelse return;
    pulse_context.Request.from_userdata(userdata).add(.capture, source_device(source));
}

fn sink_device(info: *const RawSinkInfo) pulse_context.RawDevice {
    return .{
        .index = info.index,
        .name = info.name,
        .description = info.description,
        .sample_spec = info.sample_spec,
        .channel_map = info.channel_map,
        .monitor_of_sink = null,
    };
}

fn source_device(info: *const RawSourceInfo) pulse_context.RawDevice {
    return .{
        .index = info.index,
        .name = info.name,
        .description = info.description,
        .sample_spec = info.sample_spec,
        .channel_map = info.channel_map,
        .monitor_of_sink = if (info.monitor_of_sink == invalid_index) null else info.monitor_of_sink,
    };
}
