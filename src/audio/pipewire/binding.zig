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
    properties_free: *const fn (*Properties) callconv(.c) void,
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
    /// Frees properties that have not been transferred to a native object.
    pub fn properties_free(self: *Library, props: *Properties) void {
        self.functions.properties_free(props);
    }
    /// Sets one property. Both strings are copied by PipeWire.
    pub fn properties_set(self: *Library, props: *Properties, key: [:0]const u8, value: [:0]const u8) Error!void {
        if (self.functions.properties_set(props, key.ptr, value.ptr) < 0) return error.Failed;
    }

    /// Creates a stream on `loop`. Ownership of `props` passes to PipeWire,
    /// including when creation fails; callers must not free it after this call.
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
        // Older providers may fill only their supported prefix of pw_time.
        var result: StreamTime = std.mem.zeroes(StreamTime);
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

// Test-only provider functions stay in this private binding so no C calling
// convention leaks into stream/context APIs. Nothing here loads a real daemon.
const StreamFixture = struct {
    const Failure = enum { none, properties, loop, constructor, connect, negotiation };
    var failure: Failure = .none;
    var property_failure: usize = 0;
    var property_sets: usize = 0;
    var property_frees: usize = 0;
    var property_transfers: usize = 0;
    var locks: usize = 0;
    var disconnects: usize = 0;
    var destroys: usize = 0;
    var signals: usize = 0;
    var callback_data: ?*anyopaque = null;
    var callbacks: ?*const StreamEvents = null;

    fn reset(fail: Failure, property: usize) void {
        failure = fail;
        property_failure = property;
        property_sets = 0;
        property_frees = 0;
        property_transfers = 0;
        locks = 0;
        disconnects = 0;
        destroys = 0;
        signals = 0;
        callback_data = null;
        callbacks = null;
    }
    fn lock(_: *ThreadLoop) callconv(.c) void {
        std.debug.assert(locks == 0);
        locks += 1;
    }
    fn unlock(_: *ThreadLoop) callconv(.c) void {
        std.debug.assert(locks == 1);
        locks -= 1;
    }
    fn signal(_: *ThreadLoop, _: bool) callconv(.c) void {
        std.debug.assert(locks == 1);
        signals += 1;
    }
    fn loop(_: *ThreadLoop) callconv(.c) ?*Loop {
        return if (failure == .loop) null else @ptrFromInt(0x1000);
    }
    fn properties(_: [*:0]const u8) callconv(.c) ?*Properties {
        return if (failure == .properties) null else @ptrFromInt(0x2000);
    }
    fn free_properties(_: *Properties) callconv(.c) void {
        std.debug.assert(locks == 1 and property_transfers == 0);
        property_frees += 1;
    }
    fn set_property(_: *Properties, _: [*:0]const u8, _: [*:0]const u8) callconv(.c) c_int {
        std.debug.assert(locks == 1);
        property_sets += 1;
        return if (property_sets == property_failure) -12 else 1;
    }
    fn new_stream(_: *Loop, _: [*:0]const u8, _: ?*Properties, events: *const StreamEvents, data: ?*anyopaque) callconv(.c) ?*Stream {
        std.debug.assert(locks == 1);
        property_transfers += 1; // Native ownership includes constructor failure.
        if (failure == .constructor) return null;
        callbacks = events;
        callback_data = data;
        const state = stream.State.from_callback(data);
        if (failure == .negotiation) state.failed = true else state.negotiated = state.requested;
        return @ptrFromInt(0x3000);
    }
    fn connect(_: *Stream, _: c_int, _: u32, _: u32, _: ?[*]const *const anyopaque, _: u32) callconv(.c) c_int {
        std.debug.assert(locks == 1);
        return if (failure == .connect) -5 else 0;
    }
    fn disconnect(_: *Stream) callconv(.c) c_int {
        std.debug.assert(locks == 1);
        disconnects += 1;
        return 0;
    }
    fn destroy(_: *Stream) callconv(.c) void {
        std.debug.assert(locks == 1);
        // A synchronous native teardown callback must still see live state/ring.
        const state = stream.State.from_callback(callback_data);
        state.ring[0] = 0xa5;
        callbacks.?.state_changed(callback_data, stream_state_streaming, stream_state_error, null);
        callback_data = null;
        callbacks = null;
        destroys += 1;
    }
    fn library() Library {
        var result: Library = undefined; // Handle/unused functions are never read.
        result.functions.thread_loop_lock = lock;
        result.functions.thread_loop_unlock = unlock;
        result.functions.thread_loop_signal = signal;
        result.functions.thread_loop_get_loop = loop;
        result.functions.properties_new_string = properties;
        result.functions.properties_free = free_properties;
        result.functions.properties_set = set_property;
        result.functions.stream_new_simple = new_stream;
        result.functions.stream_connect = connect;
        result.functions.stream_disconnect = disconnect;
        result.functions.stream_destroy = destroy;
        return result;
    }
    fn exercise(allocator: std.mem.Allocator, fail: Failure, property: usize) !void {
        reset(fail, property);
        var native = library();
        var shared: context.Shared = undefined;
        shared.thread = @ptrFromInt(0x4000);
        var connection: context.Connection = .{ .allocator = allocator, .library = &native, .shared = &shared };
        const result = stream.Stream.open(allocator, &connection, .{
            .direction = .playback,
            .spec = .{ .format = .float32_le, .channels = 2, .sample_rate = 48000 },
            .target = "test sink",
        });
        if (fail == .none and property == 0) {
            var opened = try result;
            try std.testing.expectEqual(@as(usize, 0), locks);
            opened.deinit();
        } else {
            var unexpected = result catch |err| {
                if (err == error.OutOfMemory) return err;
                const expected: anyerror = if (property != 0 or fail == .connect)
                    error.Failed
                else if (fail == .negotiation) error.StreamFailed else error.OutOfObjects;
                try std.testing.expectEqual(expected, err);
                try check_cleanup(fail, property);
                return;
            };
            unexpected.deinit();
            return error.ExpectedFailure;
        }
        try check_cleanup(fail, property);
    }
    fn check_cleanup(fail: Failure, property: usize) !void {
        try std.testing.expectEqual(@as(usize, 0), locks);
        const transferred = property == 0 and fail != .properties and fail != .loop;
        try std.testing.expectEqual(@as(usize, @intFromBool(transferred)), property_transfers);
        try std.testing.expectEqual(@as(usize, @intFromBool(!transferred and fail != .properties)), property_frees);
        const created = transferred and fail != .constructor;
        try std.testing.expectEqual(@as(usize, @intFromBool(created)), disconnects);
        try std.testing.expectEqual(@as(usize, @intFromBool(created)), destroys);
        try std.testing.expectEqual(@as(usize, @intFromBool(created)), signals);
        try std.testing.expect(callback_data == null and callbacks == null);
    }
};

/// Internal test entry point, instantiated only by the libc-linked test root.
pub fn test_stream_lifetime() !void {
    for (1..7) |property| {
        try StreamFixture.exercise(std.testing.allocator, .none, property);
        try std.testing.checkAllAllocationFailures(std.testing.allocator, StreamFixture.exercise, .{ .none, property });
    }
    inline for (std.meta.tags(StreamFixture.Failure)) |failure| {
        try StreamFixture.exercise(std.testing.allocator, failure, 0);
        try std.testing.checkAllAllocationFailures(std.testing.allocator, StreamFixture.exercise, .{ failure, 0 });
    }
}

fn prefix_time(_: *Stream, result: *StreamTime, size: usize) callconv(.c) c_int {
    std.debug.assert(size == @sizeOf(StreamTime));
    // Model an older provider that only writes the original structure prefix.
    result.now = 42;
    result.rate = .{ .num = 1, .den = 48000 };
    result.ticks = 100;
    result.delay = 20;
    result.queued = 7;
    return 0;
}

/// Internal test entry point for size-negotiated provider results.
pub fn test_time_prefix() !void {
    var library: Library = undefined;
    library.functions.stream_get_time_n = prefix_time;
    const value = try library.stream_time(@ptrFromInt(0x1000));
    try std.testing.expectEqual(@as(i64, 42), value.now);
    try std.testing.expectEqual(@as(u64, 7), value.queued);
    try std.testing.expectEqual(@as(u64, 0), value.buffered);
    try std.testing.expectEqual(@as(u32, 0), value.queued_buffers);
    try std.testing.expectEqual(@as(u32, 0), value.available_buffers);
    try std.testing.expectEqual(@as(u64, 0), value.size);
}

/// Optional developer check against independently translated installed headers.
/// This is deliberately instantiated only by src/pipewire_abi_check.zig: normal
/// consumers never import C headers or require development packages.
pub fn check_header_abi(comptime c: type) void {
    check_record(StreamTime, c.struct_pw_time, .{.{ "available_buffers", "avail_buffers" }}, false);
    check_record(Buffer, c.struct_pw_buffer, .{.{ "spa_buffer", "buffer" }}, true);
    check_record(SpaBuffer, c.struct_spa_buffer, .{}, false);
    check_record(SpaData, c.struct_spa_data, .{ .{ "kind", "type" }, .{ "map_offset", "mapoffset" }, .{ "max_size", "maxsize" } }, false);
    check_record(SpaChunk, c.struct_spa_chunk, .{}, false);
    check_record(RawDict, c.struct_spa_dict, .{}, false);
    check_record(RawItem, c.struct_spa_dict_item, .{}, false);
    check_record(CoreEvents, c.struct_pw_core_events, .{.{ "error_event", "error" }}, true);
    check_record(RegistryEvents, c.struct_pw_registry_events, .{}, true);
    check_record(RegistryMethods, c.struct_pw_registry_methods, .{}, true);
    check_record(NodeMethods, c.struct_pw_node_methods, .{}, true);
    check_record(RawLoop, c.struct_pw_loop, .{}, true);
    check_record(LoopUtilsMethods, c.struct_spa_loop_utils_methods, .{}, true);
    check_record(MetadataEvents, c.struct_pw_metadata_events, .{}, true);
    check_record(NodeEvents, c.struct_pw_node_events, .{}, true);
    check_record(StreamEvents, c.struct_pw_stream_events, .{}, true);
    if (@sizeOf(Hook) != @sizeOf(c.struct_spa_hook) or @alignOf(Hook) != @alignOf(c.struct_spa_hook))
        @compileError("PipeWire ABI mismatch: spa_hook storage");
    if (@sizeOf(SpaInterface) != @sizeOf(c.struct_spa_interface) or @alignOf(SpaInterface) != @alignOf(c.struct_spa_interface) or
        @offsetOf(SpaInterface, "kind") != @offsetOf(c.struct_spa_interface, "type") or
        @offsetOf(SpaInterface, "version") != @offsetOf(c.struct_spa_interface, "version") or
        @offsetOf(SpaInterface, "funcs") != @offsetOf(c.struct_spa_interface, "cb") + @offsetOf(c.struct_spa_callbacks, "funcs") or
        @offsetOf(SpaInterface, "data") != @offsetOf(c.struct_spa_interface, "cb") + @offsetOf(c.struct_spa_callbacks, "data"))
        @compileError("PipeWire ABI mismatch: spa_interface callbacks");
    if (direction_input != c.PW_DIRECTION_INPUT or direction_output != c.PW_DIRECTION_OUTPUT or
        stream_flag_autoconnect != c.PW_STREAM_FLAG_AUTOCONNECT or stream_flag_map_buffers != c.PW_STREAM_FLAG_MAP_BUFFERS or
        stream_state_error != c.PW_STREAM_STATE_ERROR or stream_state_unconnected != c.PW_STREAM_STATE_UNCONNECTED or
        stream_state_connecting != c.PW_STREAM_STATE_CONNECTING or stream_state_paused != c.PW_STREAM_STATE_PAUSED or
        stream_state_streaming != c.PW_STREAM_STATE_STREAMING or version_registry != c.PW_VERSION_REGISTRY or
        version_metadata != c.PW_VERSION_METADATA or version_node != c.PW_VERSION_NODE)
        @compileError("PipeWire ABI mismatch: protocol constants");
}

fn check_record(comptime Native: type, comptime Foreign: type, comptime renames: anytype, comptime prefix: bool) void {
    if (@alignOf(Native) != @alignOf(Foreign) or
        (if (prefix) @sizeOf(Native) > @sizeOf(Foreign) else @sizeOf(Native) != @sizeOf(Foreign)))
        @compileError("PipeWire ABI size/alignment mismatch: " ++ @typeName(Native));
    for (@typeInfo(Native).@"struct".field_names) |name| {
        const foreign_name = block: {
            for (renames) |pair| {
                if (std.mem.eql(u8, name, pair[0])) break :block pair[1];
            }
            break :block name;
        };
        if (@offsetOf(Native, name) != @offsetOf(Foreign, foreign_name) or
            @sizeOf(@FieldType(Native, name)) != @sizeOf(@FieldType(Foreign, foreign_name)))
            @compileError("PipeWire ABI field mismatch: " ++ @typeName(Native) ++ "." ++ name);
    }
}

const ConnectionFixture = struct {
    var fail_sync: bool = false;
    var callback_state: ?*context.Shared = null;
    var stopped: bool = false;
    var locks: usize = 0;
    var disconnects: usize = 0;
    var methods: RegistryMethods = undefined;
    var interface: SpaInterface = undefined;

    fn thread_new(_: [*:0]const u8, _: ?*anyopaque) callconv(.c) ?*ThreadLoop {
        return @ptrFromInt(0x1000);
    }
    fn thread_destroy(_: *ThreadLoop) callconv(.c) void {
        std.debug.assert(stopped and disconnects == 1);
    }
    fn start(_: *ThreadLoop) callconv(.c) c_int {
        return 0;
    }
    fn stop(_: *ThreadLoop) callconv(.c) void {
        std.debug.assert(locks == 0 and !stopped);
        stopped = true;
    }
    fn loop(_: *ThreadLoop) callconv(.c) ?*Loop {
        return @ptrFromInt(0x2000);
    }
    fn lock(_: *ThreadLoop) callconv(.c) void {
        std.debug.assert(locks == 0);
        locks = 1;
    }
    fn unlock(_: *ThreadLoop) callconv(.c) void {
        std.debug.assert(locks == 1);
        locks = 0;
    }
    fn signal(_: *ThreadLoop, _: bool) callconv(.c) void {
        std.debug.assert(locks == 1);
    }
    fn new_context(_: *Loop, _: ?*Properties, _: usize) callconv(.c) ?*Context {
        return @ptrFromInt(0x3000);
    }
    fn destroy_context(_: *Context) callconv(.c) void {
        std.debug.assert(stopped and disconnects == 1);
    }
    fn connect(_: *Context, _: ?*Properties, _: usize) callconv(.c) ?*Core {
        return @ptrFromInt(0x4000);
    }
    fn disconnect(_: *Core) callconv(.c) c_int {
        std.debug.assert(stopped and locks == 0);
        // Native destruction can still inspect callback state. Storage must be
        // retired only after native objects/listeners are disconnected.
        const shared = callback_state.?;
        if (shared.default_sink) |name| std.debug.assert(std.mem.eql(u8, name, "fixture sink"));
        disconnects += 1;
        callback_state = null;
        return 0;
    }
    fn registry(_: *Core, _: u32, _: usize) callconv(.c) ?*Registry {
        return @ptrCast(&interface);
    }
    fn core_listener(_: *Core, _: *Hook, _: *const CoreEvents, data: ?*anyopaque) callconv(.c) c_int {
        callback_state = context.Shared.from_callback(data);
        return 0;
    }
    fn registry_listener(_: ?*anyopaque, _: *Hook, _: *const RegistryEvents, _: ?*anyopaque) callconv(.c) c_int {
        return 0;
    }
    fn sync(_: *Core, _: u32, sequence: c_int) callconv(.c) c_int {
        const shared = callback_state.?;
        shared.on_metadata(0, "default.audio.sink", "{\"name\":\"fixture sink\"}");
        shared.on_done(0, sequence);
        return if (fail_sync) -5 else sequence;
    }
    fn exercise(allocator: std.mem.Allocator, fail: bool) !void {
        fail_sync = fail;
        callback_state = null;
        stopped = false;
        locks = 0;
        disconnects = 0;
        methods = undefined;
        methods.add_listener = registry_listener;
        interface = .{ .kind = null, .version = 0, .funcs = &methods, .data = null };
        var loader: context.Library = undefined;
        const functions = &loader.native.functions;
        functions.thread_loop_new = thread_new;
        functions.thread_loop_destroy = thread_destroy;
        functions.thread_loop_start = start;
        functions.thread_loop_stop = stop;
        functions.thread_loop_get_loop = loop;
        functions.thread_loop_lock = lock;
        functions.thread_loop_unlock = unlock;
        functions.thread_loop_signal = signal;
        functions.context_new = new_context;
        functions.context_destroy = destroy_context;
        functions.context_connect = connect;
        functions.core_disconnect = disconnect;
        functions.core_get_registry = registry;
        functions.core_add_listener = core_listener;
        functions.core_sync = sync;
        const result = context.Connection.open(allocator, &loader, .{});
        if (fail) {
            var unexpected = result catch |err| {
                if (err == error.OutOfMemory) return err;
                try std.testing.expectEqual(error.Failed, err);
                try std.testing.expect(stopped and locks == 0 and disconnects == 1 and callback_state == null);
                return;
            };
            unexpected.deinit();
            return error.ExpectedFailure;
        }
        var connection = try result;
        connection.deinit();
        try std.testing.expect(stopped and locks == 0 and disconnects == 1 and callback_state == null);
    }
};

/// Internal test entry point for native-object-before-callback-storage teardown.
pub fn test_connection_lifetime() !void {
    try ConnectionFixture.exercise(std.testing.allocator, true);
    try ConnectionFixture.exercise(std.testing.allocator, false);
    try std.testing.checkAllAllocationFailures(std.testing.allocator, ConnectionFixture.exercise, .{false});
}
