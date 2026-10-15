//! Private libjack binding for the JACK backend (client API of jack/jack.h).
//!
//! This is the only file in the JACK backend that declares C-shaped items:
//! function-pointer tables, opaque JACK handles and `callconv(.c)` callbacks.
//! libjack.so.0 is opened with std.DynLib and every symbol is resolved by name
//! in `Library.open`, so importing zdl never requires JACK. Constants are the
//! values of jack/types.h (JackOptions, JackPortFlags, JACK_DEFAULT_AUDIO_TYPE).
//!
//! Callbacks run on JACK's realtime thread. `Callbacks(Target)` generates the
//! trampolines: each one converts the registered pointer back to `*Target` and
//! calls a typed method. Targets must implement, and those methods must not
//! allocate, lock, block or fail:
//!   - `jack_process(self: *Target, frames: u32) void`
//!   - `jack_xrun(self: *Target) void`
//!   - `jack_shutdown(self: *Target) void`
//!   - `jack_sample_rate(self: *Target, rate: u32) void`
//!   - `jack_buffer_size(self: *Target, frames: u32) void`
//! Only `Client.install` registers them, and the target must outlive the
//! client's activation.
const std = @import("std");
const builtin = @import("builtin");

/// Failures of loading and of JACK calls that report a status.
pub const Error = std.mem.Allocator.Error || error{
    /// libjack is missing or lacks a symbol, or no JACK server accepted the
    /// client (not running, or the name was refused).
    Unavailable,
    /// JACK refused to register a port with the requested name and flags.
    PortRegisterFailed,
    /// JACK refused one of the process, xrun, rate or buffer-size callbacks.
    CallbackFailed,
    ActivateFailed,
    ConnectFailed,
    /// A port named by JACK could not be looked up again.
    PortUnavailable,
};

/// Opaque `jack_client_t`. Zig code never inspects it.
pub const ClientHandle = opaque {};
/// Opaque `jack_port_t`. Zig code never inspects it.
pub const PortHandle = opaque {};

/// JackOptions bit `JackNoStartServer`: never launch a server on our behalf.
pub const option_no_start_server: c_int = 0x01;
/// JackPortFlags `JackPortIsInput`: the port receives data from the graph.
pub const port_is_input: c_ulong = 0x1;
/// JackPortFlags `JackPortIsOutput`: the port supplies data to the graph.
pub const port_is_output: c_ulong = 0x2;
/// JackPortFlags `JackPortIsPhysical`: the port is a hardware connector.
pub const port_is_physical: c_ulong = 0x4;
/// JACK's audio port type. Ports of this type carry 32-bit float samples.
pub const audio_type: [:0]const u8 = "32 bit float mono audio";

const Functions = struct {
    client_open: *const fn ([*:0]const u8, c_int, ?*c_int, ...) callconv(.c) ?*ClientHandle,
    client_close: *const fn (*ClientHandle) callconv(.c) c_int,
    activate: *const fn (*ClientHandle) callconv(.c) c_int,
    deactivate: *const fn (*ClientHandle) callconv(.c) c_int,
    on_shutdown: *const fn (*ClientHandle, *const fn (?*anyopaque) callconv(.c) void, ?*anyopaque) callconv(.c) void,
    set_process_callback: *const fn (*ClientHandle, *const fn (u32, ?*anyopaque) callconv(.c) c_int, ?*anyopaque) callconv(.c) c_int,
    set_xrun_callback: *const fn (*ClientHandle, *const fn (?*anyopaque) callconv(.c) c_int, ?*anyopaque) callconv(.c) c_int,
    set_sample_rate_callback: *const fn (*ClientHandle, *const fn (u32, ?*anyopaque) callconv(.c) c_int, ?*anyopaque) callconv(.c) c_int,
    set_buffer_size_callback: *const fn (*ClientHandle, *const fn (u32, ?*anyopaque) callconv(.c) c_int, ?*anyopaque) callconv(.c) c_int,
    set_port_registration_callback: ?*const fn (*ClientHandle, *const fn (u32, c_int, ?*anyopaque) callconv(.c) void, ?*anyopaque) callconv(.c) c_int,
    get_sample_rate: *const fn (*ClientHandle) callconv(.c) u32,
    get_buffer_size: *const fn (*ClientHandle) callconv(.c) u32,
    port_register: *const fn (*ClientHandle, [*:0]const u8, [*:0]const u8, c_ulong, c_ulong) callconv(.c) ?*PortHandle,
    port_by_name: *const fn (*ClientHandle, [*:0]const u8) callconv(.c) ?*PortHandle,
    port_name: *const fn (*const PortHandle) callconv(.c) ?[*:0]const u8,
    port_type: *const fn (*const PortHandle) callconv(.c) ?[*:0]const u8,
    port_connected_to: ?*const fn (*const PortHandle, [*:0]const u8) callconv(.c) c_int,
    port_get_buffer: *const fn (*PortHandle, u32) callconv(.c) ?*anyopaque,
    get_ports: *const fn (*ClientHandle, ?[*:0]const u8, ?[*:0]const u8, c_ulong) callconv(.c) ?[*:null]?[*:0]const u8,
    connect: *const fn (*ClientHandle, [*:0]const u8, [*:0]const u8) callconv(.c) c_int,
    disconnect: *const fn (*ClientHandle, [*:0]const u8, [*:0]const u8) callconv(.c) c_int,
    free: *const fn (?*anyopaque) callconv(.c) void,
};

/// Loaded libjack.so.0 with every symbol resolved. Keep it alive while any
/// `Client` created from it is open. `deinit` does not stop the JACK server.
pub const Library = struct {
    handle: std.DynLib,
    functions: Functions,

    /// Opens `libjack.so.0`. Like the other system backends, this needs libc in
    /// the consuming application's root module for std's dynamic loader.
    pub fn open() error{Unavailable}!Library {
        if (builtin.target.os.tag != .linux) @compileError("the JACK backend is Linux-only in this port");
        if (!builtin.link_libc) @compileError("JACK loading requires application root_module.link_libc = true");
        var handle = std.DynLib.open("libjack.so.0") catch return error.Unavailable;
        errdefer handle.close();
        var functions: Functions = undefined;
        const info = @typeInfo(Functions).@"struct";
        inline for (info.field_names, info.field_types) |field_name, FieldType| {
            const name: [:0]const u8 = "jack_" ++ field_name;
            @field(functions, field_name) = handle.lookup(FieldType, name) orelse return error.Unavailable;
        }
        return .{ .handle = handle, .functions = functions };
    }

    /// Unloads the library. All clients and function pointers must be unused.
    pub fn deinit(self: *Library) void {
        self.handle.close();
        self.* = undefined;
    }

    /// Realtime-safe: the buffer JACK assigned to `port` for this cycle, or null
    /// when unavailable. The pointer is valid only inside the process callback.
    pub fn port_buffer(self: *const Library, port: *PortHandle, frames: u32) ?[*]f32 {
        const raw = self.functions.port_get_buffer(port, frames) orelse return null;
        return @ptrCast(@alignCast(raw));
    }
};

/// Generates the realtime trampolines for one `Target` type (see module docs).
/// Each trampoline is a private C-callable function that forwards to `Target`.
pub fn Callbacks(comptime Target: type) type {
    return struct {
        fn process(frames: u32, arg: ?*anyopaque) callconv(.c) c_int {
            const target: *Target = @ptrCast(@alignCast(arg.?));
            target.jack_process(frames);
            return 0;
        }

        fn xrun(arg: ?*anyopaque) callconv(.c) c_int {
            const target: *Target = @ptrCast(@alignCast(arg.?));
            target.jack_xrun();
            return 0;
        }

        fn shutdown(arg: ?*anyopaque) callconv(.c) void {
            const target: *Target = @ptrCast(@alignCast(arg.?));
            target.jack_shutdown();
        }

        fn sample_rate(frames: u32, arg: ?*anyopaque) callconv(.c) c_int {
            const target: *Target = @ptrCast(@alignCast(arg.?));
            target.jack_sample_rate(frames);
            return 0;
        }

        fn buffer_size(frames: u32, arg: ?*anyopaque) callconv(.c) c_int {
            const target: *Target = @ptrCast(@alignCast(arg.?));
            target.jack_buffer_size(frames);
            return 0;
        }

        fn port_registration(_: u32, _: c_int, arg: ?*anyopaque) callconv(.c) void {
            const target: *Target = @ptrCast(@alignCast(arg.?));
            target.jack_ports_changed();
        }
    };
}

/// An open JACK client. It borrows the Library, which must outlive it. A
/// client is not synchronized; the owner calls its methods from one thread,
/// except for the realtime callbacks installed by `install`.
pub const Client = struct {
    library: *Library,
    raw: *ClientHandle,

    /// Connects to the server under `name` without starting one. JACK may
    /// rename the client if the name is taken.
    pub fn open(library: *Library, name: [:0]const u8) Error!Client {
        var status: c_int = 0;
        const raw = library.functions.client_open(name.ptr, option_no_start_server, &status) orelse return error.Unavailable;
        return .{ .library = library, .raw = raw };
    }

    /// Disconnects the client, which also removes every port it registered.
    /// Callers deactivate first if the process callback could still be running.
    pub fn close(self: *Client) void {
        _ = self.library.functions.client_close(self.raw);
        self.* = undefined;
    }

    /// Installs the realtime callbacks for `target` (see `Callbacks`). Must be
    /// called before `activate`, and the target must outlive the activation.
    pub fn install(self: *Client, comptime Target: type, target: *Target) Error!void {
        const hooks = Callbacks(Target);
        const functions = self.library.functions;
        if (functions.set_buffer_size_callback(self.raw, hooks.buffer_size, target) != 0) return error.CallbackFailed;
        if (functions.set_sample_rate_callback(self.raw, hooks.sample_rate, target) != 0) return error.CallbackFailed;
        if (functions.set_process_callback(self.raw, hooks.process, target) != 0) return error.CallbackFailed;
        if (functions.set_xrun_callback(self.raw, hooks.xrun, target) != 0) return error.CallbackFailed;
        if (functions.set_port_registration_callback) |set_port_registration| {
            if (set_port_registration(self.raw, hooks.port_registration, target) != 0) return error.CallbackFailed;
        }
        functions.on_shutdown(self.raw, hooks.shutdown, target);
    }

    /// Starts realtime processing. Ports may be connected only after this call.
    pub fn activate(self: *Client) Error!void {
        if (self.library.functions.activate(self.raw) != 0) return error.ActivateFailed;
    }

    /// Stops realtime processing. JACK guarantees the process callback does not
    /// run after this returns. Errors are ignored: the client is being torn down.
    pub fn deactivate(self: *Client) void {
        _ = self.library.functions.deactivate(self.raw);
    }

    /// Server sample rate in Hz.
    pub fn sample_rate(self: *const Client) u32 {
        return self.library.functions.get_sample_rate(self.raw);
    }

    /// Server period in frames.
    pub fn buffer_size(self: *const Client) u32 {
        return self.library.functions.get_buffer_size(self.raw);
    }

    /// Registers a 32-bit float port. `flags` is `port_is_input` or `port_is_output`.
    pub fn register_port(self: *Client, name: [:0]const u8, flags: c_ulong) Error!*PortHandle {
        return self.library.functions.port_register(self.raw, name.ptr, audio_type.ptr, flags, 0) orelse error.PortRegisterFailed;
    }

    /// Full "client:port" name of one of this client's (or any) ports. The
    /// returned string is owned by JACK and valid while the port exists.
    pub fn port_full_name(self: *const Client, port: *const PortHandle) Error![*:0]const u8 {
        return self.library.functions.port_name(port) orelse error.PortUnavailable;
    }

    /// Connects two full port names. Callers check the result; JACK reports
    /// unknown ports or wrong directions as a failure.
    pub fn connect(self: *Client, source: [*:0]const u8, destination: [*:0]const u8) Error!void {
        if (self.library.functions.connect(self.raw, source, destination) != 0) return error.ConnectFailed;
    }

    /// Disconnects two port names. A missing old connection is harmless when
    /// reconciling a device whose graph changed between enumeration and refresh.
    pub fn disconnect(self: *Client, source: [*:0]const u8, destination: [*:0]const u8) void {
        _ = self.library.functions.disconnect(self.raw, source, destination);
    }

    /// Whether `port` currently has a graph edge to the named port.
    pub fn port_connected_to(self: *const Client, port: *const PortHandle, other: [*:0]const u8) ?bool {
        const connected_to = self.library.functions.port_connected_to orelse return null;
        return connected_to(port, other) > 0;
    }

    /// True when the named port exists and its type is an audio type (ends in "audio").
    pub fn port_is_audio(self: *Client, name: [:0]const u8) bool {
        const port = self.library.functions.port_by_name(self.raw, name.ptr) orelse return false;
        const kind = self.library.functions.port_type(port) orelse return false;
        return std.mem.endsWith(u8, std.mem.span(kind), "audio");
    }

    /// Copies the full names of ports matching `flags` into owned strings.
    /// The caller frees the slice and each entry with `allocator`.
    pub fn list_ports(self: *Client, allocator: std.mem.Allocator, flags: c_ulong) Error![][:0]u8 {
        const list = self.library.functions.get_ports(self.raw, null, null, flags) orelse return try allocator.alloc([:0]u8, 0);
        defer self.library.functions.free(@ptrCast(list));
        var count: usize = 0;
        while (list[count] != null) : (count += 1) {}
        const names = try allocator.alloc([:0]u8, count);
        var copied: usize = 0;
        errdefer {
            for (names[0..copied]) |name| allocator.free(name);
            allocator.free(names);
        }
        while (copied < count) : (copied += 1) {
            names[copied] = try allocator.dupeSentinel(u8, std.mem.span(list[copied].?), 0);
        }
        return names;
    }
};
