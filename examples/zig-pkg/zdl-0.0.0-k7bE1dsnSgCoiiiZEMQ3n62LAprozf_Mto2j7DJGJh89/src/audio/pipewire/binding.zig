//! Private libpipewire-0.3 binding. This is the only file in the PipeWire
//! backend that declares C layouts, C function pointers or C callbacks.
//!
//! The library is loaded at runtime with std.DynLib (libpipewire-0.3.so.0), so
//! importing zdl never requires PipeWire. Every symbol is resolved by name in
//! `Library.open`; a missing symbol fails the open rather than a later call.
//!
//! Exported functions are called directly. Several PipeWire API calls are
//! static inline wrappers in the headers (`pw_registry_add_listener`,
//! `pw_registry_bind`); they dispatch through the `spa_interface` vtable, so
//! `Library.registry_add_listener` and `Library.registry_bind` reproduce that
//! dispatch explicitly (spa/utils/hook.h, pipewire/core.h).
//!
//! Callbacks run on PipeWire's thread-loop thread while the loop lock is held.
//! Their trampolines forward to typed Zig methods (`context.Shared`,
//! `stream.State`) through the `data` pointer that was registered with them.
//! Zig code must therefore touch that state only under `Library.lock`.
const std = @import("std");
const context = @import("context.zig");
const stream = @import("stream.zig");

/// Failures of loading and of PipeWire calls that report a result code.
pub const Error = std.DynLib.Error || error{
    MissingSymbol,
    /// PipeWire returned a failure code from the requested operation.
    Failed,
    /// A wait expired before the awaited event arrived.
    Timeout,
    /// PipeWire returned null where an object was required.
    OutOfObjects,
};

/// Opaque PipeWire objects. The Zig code never inspects their contents.
pub const ThreadLoop = opaque {};
pub const Loop = opaque {};
pub const Core = opaque {};
pub const Registry = opaque {};
pub const Proxy = opaque {};
pub const Properties = opaque {};
pub const Context = opaque {};
pub const Stream = opaque {};

/// `struct pw_time` from pipewire/stream.h. For raw audio, delay, queued and
/// buffered are expressed in frames at `rate`.
pub const StreamTime = extern struct {
    now: i64,
    rate: extern struct { num: u32, den: u32 },
    ticks: u64,
    delay: i64,
    queued: u64,
    buffered: u64,
    queued_buffers: u32,
    available_buffers: u32,
    size: u64,
};
comptime {
    if (@sizeOf(StreamTime) != 64 or @alignOf(StreamTime) != 8) @compileError("pw_time ABI layout mismatch");
}

/// Absolute time in CLOCK_MONOTONIC. Construct once
/// per finite wait and reuse after every signal, including spurious ones.
pub const Deadline = struct {
    time: std.c.timespec,
};

/// Storage for a `spa_hook` listener node. PipeWire links it into an intrusive
/// list, so the address must stay stable until the listener is removed. The
/// 48-byte size is from spa/utils/hook.h; the words are never read from Zig.
pub const Hook = struct {
    words: [6]usize = @splat(0),
};

/// PipeWire's `struct pw_buffer` for a stream buffer (pipewire/buffers.h).
pub const Buffer = extern struct {
    spa_buffer: ?*SpaBuffer,
    user_data: ?*anyopaque,
    size: u64,
    requested: u64,
    time: u64,
};

const SpaBuffer = extern struct {
    n_metas: u32,
    n_datas: u32,
    metas: ?*anyopaque,
    datas: ?[*]SpaData,
};

const SpaData = extern struct {
    kind: u32,
    flags: u32,
    fd: i64,
    map_offset: u32,
    max_size: u32,
    data: ?[*]u8,
    chunk: ?*SpaChunk,
};

const SpaChunk = extern struct {
    offset: u32,
    size: u32,
    stride: i32,
    flags: i32,
};

/// `struct spa_dict` (spa/utils/dict.h); items are `{key, value}` C strings.
const RawDict = extern struct {
    flags: u32,
    n_items: u32,
    items: ?[*]const RawItem,
};
const RawItem = extern struct {
    key: ?[*:0]const u8,
    value: ?[*:0]const u8,
};

/// Read-only view of a registry object's properties.
pub const Props = struct {
    raw: ?*const RawDict,

    /// Value for `key`, or null when absent. The slice borrows PipeWire memory
    /// and is valid only during the callback that supplied it.
    pub fn get(self: Props, key: []const u8) ?[]const u8 {
        const dict = self.raw orelse return null;
        const items = dict.items orelse return null;
        for (items[0..dict.n_items]) |item| {
            const item_key = std.mem.span(item.key orelse continue);
            if (std.mem.eql(u8, item_key, key)) return std.mem.span(item.value orelse return null);
        }
        return null;
    }
};

/// Event tables handed to PipeWire. Versions are the header constants. Fields
/// that the backend does not use are left null, which PipeWire tolerates.
const CoreEvents = extern struct {
    version: u32 = 1,
    info: ?*const anyopaque = null,
    done: ?*const fn (?*anyopaque, u32, c_int) callconv(.c) void = null,
    ping: ?*const anyopaque = null,
    error_event: ?*const anyopaque = null,
    remove_id: ?*const anyopaque = null,
    bound_id: ?*const anyopaque = null,
    add_mem: ?*const anyopaque = null,
    remove_mem: ?*const anyopaque = null,
    bound_props: ?*const anyopaque = null,
};

const RegistryEvents = extern struct {
    version: u32 = 0,
    global: ?*const fn (?*anyopaque, u32, u32, ?[*:0]const u8, u32, ?*const RawDict) callconv(.c) void = null,
    global_remove: ?*const fn (?*anyopaque, u32) callconv(.c) void = null,
};

const RegistryMethods = extern struct {
    version: u32,
    add_listener: *const fn (?*anyopaque, *Hook, *const RegistryEvents, ?*anyopaque) callconv(.c) c_int,
    bind: *const fn (?*anyopaque, u32, [*:0]const u8, u32, usize) callconv(.c) ?*Proxy,
    destroy: *const fn (?*anyopaque, u32) callconv(.c) c_int,
};

const NodeMethods = extern struct {
    version: u32,
    add_listener: ?*const anyopaque,
    subscribe_params: ?*const anyopaque,
    enum_params: *const fn (?*anyopaque, c_int, u32, u32, u32, ?*const anyopaque) callconv(.c) c_int,
};

/// `struct spa_interface` header; the callbacks pair follows at offset 16.
const SpaInterface = extern struct {
    kind: ?*anyopaque,
    version: u32,
    funcs: ?*const anyopaque,
    data: ?*anyopaque,
};

const Source = opaque {};

/// Prefix of pw_loop (pipewire/loop.h), used to dispatch SPA timer methods.
const RawLoop = extern struct {
    system: ?*anyopaque,
    loop: ?*anyopaque,
    control: ?*anyopaque,
    utils: *SpaInterface,
};

/// spa_loop_utils_methods version 0. Unused slots retain their pointer layout.
const LoopUtilsMethods = extern struct {
    version: u32,
    add_io: ?*const anyopaque,
    update_io: ?*const anyopaque,
    add_idle: ?*const anyopaque,
    enable_idle: ?*const anyopaque,
    add_event: ?*const anyopaque,
    signal_event: ?*const anyopaque,
    add_timer: ?*const fn (?*anyopaque, *const fn (?*anyopaque, u64) callconv(.c) void, ?*anyopaque) callconv(.c) ?*Source,
    update_timer: ?*const fn (?*anyopaque, *Source, ?*std.c.timespec, ?*std.c.timespec, bool) callconv(.c) c_int,
    add_signal: ?*const anyopaque,
    destroy_source: ?*const fn (?*anyopaque, *Source) callconv(.c) void,
};

const TimerWake = struct {
    library: *Library,
    thread: *ThreadLoop,
    fired: bool = false,
};

fn timer_wake(data: ?*anyopaque, expirations: u64) callconv(.c) void {
    _ = expirations;
    const wake: *TimerWake = @ptrCast(@alignCast(data.?));
    wake.fired = true;
    wake.library.signal(wake.thread);
}

fn monotonic_time() Error!std.c.timespec {
    const linux = std.os.linux;
    var now: std.c.timespec = undefined;
    if (linux.errno(linux.clock_gettime(.MONOTONIC, &now)) != .SUCCESS) return error.Failed;
    return now;
}

const MetadataEvents = extern struct {
    version: u32 = 0,
    property: *const fn (?*anyopaque, u32, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) c_int,
};

pub const NodeEvents = extern struct {
    version: u32 = 0,
    info: ?*const anyopaque = null,
    param: *const fn (?*anyopaque, c_int, u32, u32, u32, ?*const anyopaque) callconv(.c) void,
};

const StreamEvents = extern struct {
    version: u32 = 2,
    destroy: ?*const anyopaque = null,
    state_changed: *const fn (?*anyopaque, c_int, c_int, ?[*:0]const u8) callconv(.c) void,
    control_info: ?*const anyopaque = null,
    io_changed: ?*const anyopaque = null,
    param_changed: *const fn (?*anyopaque, u32, ?*const anyopaque) callconv(.c) void,
    add_buffer: ?*const anyopaque = null,
    remove_buffer: ?*const anyopaque = null,
    process: *const fn (?*anyopaque) callconv(.c) void,
    drained: ?*const anyopaque = null,
    command: ?*const anyopaque = null,
    trigger_done: ?*const anyopaque = null,
};

// Positional values from pw_stream_direction and pw_stream_flags.
pub const direction_input: c_int = 0;
pub const direction_output: c_int = 1;
pub const id_any: u32 = 0xffff_ffff;
pub const stream_flag_autoconnect: u32 = 1 << 0;
pub const stream_flag_map_buffers: u32 = 1 << 2;
pub const stream_state_error: c_int = -1;
pub const stream_state_unconnected: c_int = 0;
pub const stream_state_connecting: c_int = 1;
pub const stream_state_paused: c_int = 2;
pub const stream_state_streaming: c_int = 3;

/// PW_VERSION_REGISTRY, PW_VERSION_METADATA and SPA_PARAM_Format are passed to
/// PipeWire when binding objects.
pub const version_registry: u32 = 3;
pub const version_metadata: u32 = 3;
pub const version_node: u32 = 3;

const Functions = struct {
    init: *const fn (?*c_int, ?*anyopaque) callconv(.c) void,
    thread_loop_new: *const fn ([*:0]const u8, ?*anyopaque) callconv(.c) ?*ThreadLoop,
    thread_loop_destroy: *const fn (*ThreadLoop) callconv(.c) void,
    thread_loop_start: *const fn (*ThreadLoop) callconv(.c) c_int,
    thread_loop_stop: *const fn (*ThreadLoop) callconv(.c) void,
    thread_loop_get_loop: *const fn (*ThreadLoop) callconv(.c) ?*Loop,
    thread_loop_lock: *const fn (*ThreadLoop) callconv(.c) void,
    thread_loop_unlock: *const fn (*ThreadLoop) callconv(.c) void,
    thread_loop_signal: *const fn (*ThreadLoop, bool) callconv(.c) void,
    thread_loop_wait: *const fn (*ThreadLoop) callconv(.c) void,
    thread_loop_timed_wait: *const fn (*ThreadLoop, c_int) callconv(.c) c_int,
    context_new: *const fn (*Loop, ?*Properties, usize) callconv(.c) ?*Context,
    context_destroy: *const fn (*Context) callconv(.c) void,
    context_connect: *const fn (*Context, ?*Properties, usize) callconv(.c) ?*Core,
    core_disconnect: *const fn (*Core) callconv(.c) c_int,
    core_get_registry: *const fn (*Core, u32, usize) callconv(.c) ?*Registry,
    core_add_listener: *const fn (*Core, *Hook, *const CoreEvents, ?*anyopaque) callconv(.c) c_int,
    core_sync: *const fn (*Core, u32, c_int) callconv(.c) c_int,
    proxy_add_object_listener: *const fn (*Proxy, *Hook, *const anyopaque, ?*anyopaque) callconv(.c) void,
    proxy_destroy: *const fn (*Proxy) callconv(.c) void,
    properties_new_string: *const fn ([*:0]const u8) callconv(.c) ?*Properties,
    properties_set: *const fn (*Properties, [*:0]const u8, [*:0]const u8) callconv(.c) c_int,
    stream_new_simple: *const fn (*Loop, [*:0]const u8, ?*Properties, *const StreamEvents, ?*anyopaque) callconv(.c) ?*Stream,
    stream_destroy: *const fn (*Stream) callconv(.c) void,
    stream_connect: *const fn (*Stream, c_int, u32, u32, ?[*]const *const anyopaque, u32) callconv(.c) c_int,
    stream_disconnect: *const fn (*Stream) callconv(.c) c_int,
    stream_set_active: *const fn (*Stream, bool) callconv(.c) c_int,
    stream_get_time_n: *const fn (*Stream, *StreamTime, usize) callconv(.c) c_int,
    stream_dequeue_buffer: *const fn (*Stream) callconv(.c) ?*Buffer,
    stream_queue_buffer: *const fn (*Stream, *Buffer) callconv(.c) c_int,
};

/// Loaded libpipewire-0.3 with every required symbol resolved. Keep it alive
/// while any object created from it exists. Close only after those objects are
/// destroyed; `deinit` does not call pw_deinit, because other users of the
/// process may still rely on PipeWire being initialized.
pub const Library = struct {
    handle: std.DynLib,
    functions: Functions,

    /// Opens `libpipewire-0.3.so.0` and initializes PipeWire's global state. Like
    /// the other audio backends, this needs libc in the application root.
    pub fn open() Error!Library {
        var handle = try std.DynLib.open("libpipewire-0.3.so.0");
        errdefer handle.close();
        var functions: Functions = undefined;
        const info = @typeInfo(Functions).@"struct";
        inline for (info.field_names, info.field_types) |field_name, FieldType| {
            const name: [:0]const u8 = "pw_" ++ field_name;
            @field(functions, field_name) = handle.lookup(FieldType, name) orelse return error.MissingSymbol;
        }
        functions.init(null, null);
        return .{ .handle = handle, .functions = functions };
    }

    /// Closes the shared object. Invalidates all function pointers from it.
    pub fn deinit(self: *Library) void {
        self.handle.close();
        self.* = undefined;
    }

    pub fn thread_loop_new(self: *Library, name: [:0]const u8) Error!*ThreadLoop {
        return self.functions.thread_loop_new(name.ptr, null) orelse error.OutOfObjects;
    }
    pub fn thread_loop_destroy(self: *Library, loop: *ThreadLoop) void {
        self.functions.thread_loop_destroy(loop);
    }
    pub fn thread_loop_start(self: *Library, loop: *ThreadLoop) Error!void {
        if (self.functions.thread_loop_start(loop) < 0) return error.Failed;
    }
    pub fn thread_loop_stop(self: *Library, loop: *ThreadLoop) void {
        self.functions.thread_loop_stop(loop);
    }
    pub fn loop_of(self: *Library, thread: *ThreadLoop) Error!*Loop {
        return self.functions.thread_loop_get_loop(thread) orelse error.OutOfObjects;
    }
    /// Takes the loop lock; callbacks and wrapper calls must not nest it.
    pub fn lock(self: *Library, loop: *ThreadLoop) void {
        self.functions.thread_loop_lock(loop);
    }
    pub fn unlock(self: *Library, loop: *ThreadLoop) void {
        self.functions.thread_loop_unlock(loop);
    }
    /// Wakes waiters on the loop. `wait_for_accept` blocks until they have run.
    pub fn signal(self: *Library, loop: *ThreadLoop) void {
        self.functions.thread_loop_signal(loop, false);
    }
    /// Releases the lock and waits for a signal. Returns with the lock held.
    pub fn wait(self: *Library, loop: *ThreadLoop) void {
        self.functions.thread_loop_wait(loop);
    }
    /// Waits at most `seconds` (PipeWire's timed wait is whole seconds). Returns
    /// false when it timed out. The lock is held again on return.
    pub fn timed_wait(self: *Library, loop: *ThreadLoop, seconds: c_int) bool {
        return self.functions.thread_loop_timed_wait(loop, seconds) == 0;
    }

    /// Creates an absolute monotonic deadline at nanosecond precision.
    pub fn deadline(self: *Library, loop: *ThreadLoop, nanoseconds: i64) Error!Deadline {
        _ = self;
        _ = loop;
        if (nanoseconds < 0) return error.Failed;
        var time = try monotonic_time();
        time.sec = std.math.add(@TypeOf(time.sec), time.sec, @intCast(@divTrunc(nanoseconds, std.time.ns_per_s))) catch return error.Failed;
        time.nsec += @intCast(@rem(nanoseconds, std.time.ns_per_s));
        if (time.nsec >= std.time.ns_per_s) {
            time.sec = std.math.add(@TypeOf(time.sec), time.sec, 1) catch return error.Failed;
            time.nsec -= std.time.ns_per_s;
        }
        return .{ .time = time };
    }

    /// Checks actual elapsed time even if the loop is continuously signalled.
    pub fn expired(self: *Library, loop: *ThreadLoop, limit: Deadline) Error!bool {
        const now = try self.deadline(loop, 0);
        return now.time.sec > limit.time.sec or
            (now.time.sec == limit.time.sec and now.time.nsec >= limit.time.nsec);
    }

    /// Releases the lock until a signal or the original monotonic deadline.
    /// PipeWire's timed_wait_full uses CLOCK_REALTIME, so it cannot supply this
    /// guarantee. SPA timers use CLOCK_MONOTONIC and signal the regular wait.
    /// The source and its stack callback state are retired with the lock held
    /// on every exit. Returns false on timeout and reacquires the lock.
    pub fn wait_until(self: *Library, loop: *ThreadLoop, limit: Deadline) Error!bool {
        if (try self.expired(loop, limit)) return false;
        const raw: *RawLoop = @ptrCast(@alignCast(try self.loop_of(loop)));
        const interface = raw.utils;
        const methods: *const LoopUtilsMethods = @ptrCast(@alignCast(interface.funcs orelse return error.Failed));
        const add_timer = methods.add_timer orelse return error.Failed;
        const update_timer = methods.update_timer orelse return error.Failed;
        const destroy_source = methods.destroy_source orelse return error.Failed;
        var wake: TimerWake = .{ .library = self, .thread = loop };
        const source = add_timer(interface.data, timer_wake, &wake) orelse return error.OutOfObjects;
        defer destroy_source(interface.data, source);
        var absolute_time = limit.time;
        if (update_timer(interface.data, source, &absolute_time, null, true) < 0) return error.Failed;
        self.wait(loop);
        return !wake.fired and !try self.expired(loop, limit);
    }

    pub fn context_new(self: *Library, loop: *Loop) Error!*Context {
        return self.functions.context_new(loop, null, 0) orelse error.OutOfObjects;
    }
    pub fn context_destroy(self: *Library, ctx: *Context) void {
        self.functions.context_destroy(ctx);
    }
    pub fn context_connect(self: *Library, ctx: *Context) Error!*Core {
        return self.functions.context_connect(ctx, null, 0) orelse error.Failed;
    }
    pub fn core_disconnect(self: *Library, core: *Core) void {
        _ = self.functions.core_disconnect(core);
    }
    pub fn core_registry(self: *Library, core: *Core) Error!*Registry {
        return self.functions.core_get_registry(core, version_registry, 0) orelse error.OutOfObjects;
    }
    pub fn core_add_listener(self: *Library, core: *Core, hook: *Hook, events: *const CoreEvents, data: ?*anyopaque) Error!void {
        if (self.functions.core_add_listener(core, hook, events, data) < 0) return error.Failed;
    }
    /// Returns the sequence that must be matched by the core's done event.
    pub fn core_sync(self: *Library, core: *Core, seq: c_int) Error!c_int {
        const result = self.functions.core_sync(core, 0, seq);
        if (result < 0) return error.Failed;
        return result;
    }

    /// `pw_registry_add_listener` dispatched through the registry's vtable.
    pub fn registry_add_listener(self: *Library, registry: *Registry, hook: *Hook, events: *const RegistryEvents, data: ?*anyopaque) Error!void {
        _ = self;
        const methods, const object = registry_methods(registry);
        if (methods.add_listener(object, hook, events, data) < 0) return error.Failed;
    }

    /// `pw_registry_bind` dispatched through the registry's vtable.
    pub fn registry_bind(self: *Library, registry: *Registry, id: u32, type_name: [:0]const u8, version: u32) Error!*Proxy {
        _ = self;
        const methods, const object = registry_methods(registry);
        return methods.bind(object, id, type_name.ptr, version, 0) orelse error.OutOfObjects;
    }

    pub fn proxy_listener(self: *Library, proxy: *Proxy, hook: *Hook, events: *const MetadataEvents, data: ?*anyopaque) void {
        self.functions.proxy_add_object_listener(proxy, hook, events, data);
    }
    pub fn node_listener(self: *Library, proxy: *Proxy, hook: *Hook, events: *const NodeEvents, data: ?*anyopaque) void {
        self.functions.proxy_add_object_listener(proxy, hook, events, data);
    }
    /// Starts enumeration of a bound node's SPA_PARAM_EnumFormat pods.
    pub fn node_enum_formats(self: *Library, proxy: *Proxy) Error!void {
        _ = self;
        const interface: *SpaInterface = @ptrCast(@alignCast(proxy));
        const methods: *const NodeMethods = @ptrCast(@alignCast(interface.funcs.?));
        if (methods.enum_params(interface.data, 0, 3, 0, 0, null) < 0) return error.Failed;
    }
    pub fn proxy_destroy(self: *Library, proxy: *Proxy) void {
        self.functions.proxy_destroy(proxy);
    }

    pub fn properties(self: *Library) Error!*Properties {
        return self.functions.properties_new_string("") orelse error.OutOfObjects;
    }
    /// Sets one property. Both strings are copied by PipeWire.
    pub fn properties_set(self: *Library, props: *Properties, key: [:0]const u8, value: [:0]const u8) Error!void {
        if (self.functions.properties_set(props, key.ptr, value.ptr) < 0) return error.Failed;
    }

    /// Creates a stream on `loop`. Ownership of `props` passes to PipeWire.
    pub fn stream_new(self: *Library, loop: *Loop, name: [:0]const u8, props: *Properties, events: *const StreamEvents, data: ?*anyopaque) Error!*Stream {
        return self.functions.stream_new_simple(loop, name.ptr, props, events, data) orelse error.OutOfObjects;
    }
    pub fn stream_destroy(self: *Library, stream_object: *Stream) void {
        self.functions.stream_destroy(stream_object);
    }
    /// Connects with one EnumFormat param (a complete pod, 8-byte aligned).
    pub fn stream_connect(self: *Library, stream_object: *Stream, direction: c_int, target: u32, flags: u32, param: *const anyopaque) Error!void {
        const params: [1]*const anyopaque = .{param};
        if (self.functions.stream_connect(stream_object, direction, target, flags, &params, 1) < 0) return error.Failed;
    }
    pub fn stream_disconnect(self: *Library, stream_object: *Stream) void {
        _ = self.functions.stream_disconnect(stream_object);
    }
    pub fn stream_set_active(self: *Library, stream_object: *Stream, active: bool) Error!void {
        if (self.functions.stream_set_active(stream_object, active) < 0) return error.Failed;
    }
    pub fn stream_time(self: *Library, stream_object: *Stream) Error!StreamTime {
        var result: StreamTime = undefined;
        if (self.functions.stream_get_time_n(stream_object, &result, @sizeOf(StreamTime)) < 0) return error.Failed;
        return result;
    }
    /// Returns null when no buffer is available; pair with queue_buffer.
    pub fn stream_dequeue(self: *Library, stream_object: *Stream) ?*Buffer {
        return self.functions.stream_dequeue_buffer(stream_object);
    }
    pub fn stream_queue(self: *Library, stream_object: *Stream, buffer: *Buffer) Error!void {
        if (self.functions.stream_queue_buffer(stream_object, buffer) < 0) return error.Failed;
    }
};

fn registry_methods(registry: *Registry) struct { *const RegistryMethods, ?*anyopaque } {
    const interface: *SpaInterface = @ptrCast(@alignCast(registry));
    const methods: *const RegistryMethods = @ptrCast(@alignCast(interface.funcs.?));
    return .{ methods, interface.data };
}

/// Byte storage of a buffer's first data plane, for playback and capture.
/// `storage` spans the whole allocation; `chunk` is the valid region.
pub const DataPlane = struct {
    storage: []u8,
    chunk: *SpaChunk,
};

/// First data plane of a dequeued buffer, or null when PipeWire attached none.
pub fn buffer_plane(buffer: *Buffer) ?DataPlane {
    const spa = buffer.spa_buffer orelse return null;
    if (spa.n_datas == 0) return null;
    const planes = spa.datas orelse return null;
    const plane = &planes[0];
    const base = plane.data orelse return null;
    const chunk = plane.chunk orelse return null;
    return .{ .storage = base[0..plane.max_size], .chunk = chunk };
}

/// Requested frame count PipeWire asked for in `buffer.requested` (0 when unset).
pub fn buffer_requested(buffer: *const Buffer) u64 {
    return buffer.requested;
}

/// Reads the callback arguments as Zig values, then calls the owning type. These
/// trampolines are the only `callconv(.c)` functions in the backend.
fn core_done(data: ?*anyopaque, id: u32, seq: c_int) callconv(.c) void {
    context.Shared.from_callback(data).on_done(id, seq);
}

fn registry_global(data: ?*anyopaque, id: u32, permissions: u32, type_name: ?[*:0]const u8, version: u32, props: ?*const RawDict) callconv(.c) void {
    _ = permissions;
    _ = version;
    const name = std.mem.span(type_name orelse return);
    context.Shared.from_callback(data).on_global(id, name, Props{ .raw = props });
}

fn registry_global_remove(data: ?*anyopaque, id: u32) callconv(.c) void {
    context.Shared.from_callback(data).on_global_remove(id);
}

fn metadata_property(data: ?*anyopaque, subject: u32, key: ?[*:0]const u8, type_name: ?[*:0]const u8, value: ?[*:0]const u8) callconv(.c) c_int {
    _ = type_name;
    const key_text = std.mem.span(key orelse return 0);
    const value_text: ?[]const u8 = if (value) |text| std.mem.span(text) else null;
    context.Shared.from_callback(data).on_metadata(subject, key_text, value_text);
    return 0;
}

fn stream_state(data: ?*anyopaque, old: c_int, state: c_int, error_text: ?[*:0]const u8) callconv(.c) void {
    _ = error_text;
    stream.State.from_callback(data).on_state(old, state);
}

fn stream_param(data: ?*anyopaque, id: u32, param: ?*const anyopaque) callconv(.c) void {
    stream.State.from_callback(data).on_param(id, param);
}

fn stream_process(data: ?*anyopaque) callconv(.c) void {
    stream.State.from_callback(data).on_process();
}

/// Tables with the callbacks above. Their addresses are stable (static data).
pub const core_events: CoreEvents = .{ .done = core_done };
pub const registry_events: RegistryEvents = .{ .global = registry_global, .global_remove = registry_global_remove };
pub const metadata_events: MetadataEvents = .{ .property = metadata_property };
pub const stream_events: StreamEvents = .{ .state_changed = stream_state, .param_changed = stream_param, .process = stream_process };

test "property lookup on an empty dictionary" {
    const props: Props = .{ .raw = null };
    try std.testing.expect(props.get("node.name") == null);
}
