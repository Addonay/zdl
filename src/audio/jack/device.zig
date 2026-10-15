//! Logical playback and capture over JACK, a port-level port of SDL_jackaudio.c
//! with the shape of `audio.device.Output` / `Input` (ALSA) and the PipeWire
//! devices.
//!
//! Terms:
//!   - A device is a JACK client that exposes physical audio ports. `enumerate`
//!     groups physical audio ports by the client name before ':' (so `system`
//!     with `playback_1` and `playback_2` is one stereo device). Deliberate
//!     difference: SDL exposes only one default JACK device.
//!   - `Output(layout)` opens its own JACK client named `Options.client_name`,
//!     registers `layout.channels()` output ports named `zdl_output_N`, and
//!     connects port N to the device's Nth physical playback port in JACK's
//!     order. If the device has fewer ports, the surplus channels stay
//!     unconnected and their audio is discarded by JACK.
//!   - `Input(layout)` is the capture mirror: ports `zdl_input_N` receive the
//!     device's physical capture ports.
//!   - Output streams bind by pointer; the caller keeps them alive while bound
//!     and unbinds them before `deinit`. Bound streams must produce the output
//!     spec exactly, as with the ALSA and PipeWire outputs.
//!
//! Format and timing:
//!   JACK fixes the format: 32-bit float in native byte order, one buffer per
//!   port. `spec()` reports the server sample rate from open or the last
//!   `refresh`, and the device's fixed channel count. `period_frames()` is the live period, and changes
//!   when JACK changes its buffer size. After rate, buffer-size or port events,
//!   the owner calls `refresh` to reconfigure bound streams and remap physical
//!   ports in place without replacing the JACK client.
//!
//! Realtime path:
//!   JACK calls `process` on its own realtime thread. Each device keeps a
//!   single-producer/single-consumer byte ring (ring.zig) between that thread
//!   and the caller's `pump`. The callback copies only between the ring and
//!   the port buffers: it allocates nothing, takes no lock, makes no syscall and
//!   reports failures through atomics. Output's callback is the ring consumer
//!   and writes silence when the ring is empty (an underrun). Input's callback
//!   is the producer and drops a cycle when the ring is full (an overrun).
//!   `pump` never blocks; `wait` polls with a 1 ms sleep up to the timeout.
//!
//! Events: `poll_event` returns JACK-side notifications (xruns, shutdown,
//! sample-rate, buffer-size and port-registration changes) from callback atomics.
//! Repeated xruns are coalesced into a count between polls. Shutdown makes
//! `pump` and `wait` fail with `error.Disconnected`.
//!
//! Ownership: each device owns its JACK client, port registrations, endpoint
//! name, ring, realtime state and scratch. It borrows the `Library`,
//! which must outlive it. Not synchronized: one owner thread calls the device
//! methods. Only the realtime callback runs on JACK's thread.
const std = @import("std");
const builtin = @import("builtin");
const audio = @import("../processing.zig");
const binding = @import("binding.zig");
const ring = @import("ring.zig");
const logical = @import("../logical.zig");

/// Default ring capacity request in sample frames, matching the other backends.
pub const default_buffer_frames: usize = 2048;

/// Sample format used by every JACK port: native-endian 32-bit float.
pub const native_format: audio.Format = if (native_endian == .little) .float32_le else .float32_be;

const native_endian = builtin.cpu.arch.endian();
const sample_bytes = @sizeOf(f32);
const poll_interval_milliseconds: u32 = 1;

/// Failures of enumeration, opening, binding and pumping.
/// Loader for libjack. Must outlive every device made from it and must not
/// move while one borrows it.
pub const Library = struct {
    /// Implementation detail: the private binding. Not part of the stable API.
    native: binding.Library,

    /// Loads libjack.so.0 (needs libc in the application's root module). A
    /// missing library or symbol is `error.Unavailable`; so is a missing server
    /// later, at `enumerate` / `Output.open` / `Input.open`.
    pub fn open() error{Unavailable}!Library {
        return .{ .native = try binding.Library.open() };
    }

    /// Unloads the library. Does not stop the JACK server. All devices must
    /// already be deinitialized.
    pub fn deinit(self: *Library) void {
        self.native.deinit();
        self.* = undefined;
    }
};

pub const Error = binding.Error || logical.Error || ring.Error || error{
    /// The client has no physical audio ports for the requested direction.
    NoPhysicalPorts,
    /// The requested device name is not one of the enumerated devices.
    UnknownDevice,
    /// `buffer_frames` was zero.
    InvalidBufferFrames,
    /// The server shut down or the client was removed; the device is unusable.
    Disconnected,
    /// The ring cannot take a whole period yet, or playback is still draining.
    WouldBlock,
};

/// Which way audio flows for a device, from the application's point of view.
pub const Direction = enum { playback, capture };

/// Opening parameters.
pub const Options = struct {
    /// JACK client name. Required; JACK may append a suffix if it is taken.
    client_name: [:0]const u8,
    /// Device name from `enumerate` (its client name). Null selects the device
    /// named "system" when present, otherwise the first one in JACK's order.
    endpoint: ?[]const u8 = null,
    /// Requested ring capacity in frames. Raised to two server periods if smaller.
    buffer_frames: usize = default_buffer_frames,
};

/// Asynchronous notification from JACK, returned by `poll_event`.
pub const Event = union(enum) {
    /// JACK reported this many xruns (missed cycles) since the previous poll.
    xrun: u32,
    /// The server changed its sample rate; `refresh` applies it to the device.
    sample_rate_changed: u32,
    /// The server changed its buffer size; `period_frames` reports the new value.
    buffer_size_changed: u32,
    /// The JACK server shut down or dropped the client.
    shutdown,
    /// A JACK port changed; call `refresh` to reconcile the endpoint mapping.
    ports_changed,
};

/// One physical device: the physical audio ports of one JACK client.
pub const Device = struct {
    /// JACK client name of the ports (the text before ':').
    name: [:0]u8,
    /// Physical audio port names in JACK's order. Channel N uses `ports[N]`.
    ports: std.ArrayList([:0]u8),
};

/// Owned device enumeration. Entries and their strings are freed by `deinit`.
pub const DeviceList = struct {
    allocator: std.mem.Allocator,
    items: []Device,

    /// Frees every device, port name and the list itself.
    pub fn deinit(self: *DeviceList) void {
        for (self.items) |*device| {
            for (device.ports.items) |port| self.allocator.free(port);
            device.ports.deinit(self.allocator);
            self.allocator.free(device.name);
        }
        self.allocator.free(self.items);
        self.* = undefined;
    }
};

/// Lists the physical audio devices for `direction` on a temporary JACK client
/// named `client_name`. The client is closed before returning, and the result
/// owns all of its strings.
pub fn enumerate(allocator: std.mem.Allocator, library: *Library, client_name: [:0]const u8, direction: Direction) Error!DeviceList {
    var client = try binding.Client.open(&library.native, client_name);
    defer client.close();
    return list_devices(allocator, &client, direction);
}

fn list_devices(allocator: std.mem.Allocator, client: *binding.Client, direction: Direction) Error!DeviceList {
    const side: c_ulong = switch (direction) {
        .playback => binding.port_is_input,
        .capture => binding.port_is_output,
    };
    const names = try client.list_ports(allocator, binding.port_is_physical | side);
    defer {
        for (names) |name| allocator.free(name);
        allocator.free(names);
    }

    var devices: std.ArrayList(Device) = .empty;
    errdefer free_devices(allocator, &devices);
    for (names) |port| {
        if (!client.port_is_audio(port)) continue;
        const separator = std.mem.indexOfScalar(u8, port, ':') orelse port.len;
        const owner = port[0..separator];
        const index = find_device(devices.items, owner) orelse blk: {
            const name = try allocator.dupeSentinel(u8, owner, 0);
            errdefer allocator.free(name);
            try devices.append(allocator, .{ .name = name, .ports = .empty });
            break :blk devices.items.len - 1;
        };
        const copy = try allocator.dupeSentinel(u8, port, 0);
        errdefer allocator.free(copy);
        try devices.items[index].ports.append(allocator, copy);
    }
    return .{ .allocator = allocator, .items = try devices.toOwnedSlice(allocator) };
}

fn free_devices(allocator: std.mem.Allocator, devices: *std.ArrayList(Device)) void {
    for (devices.items) |*device| {
        for (device.ports.items) |port| allocator.free(port);
        device.ports.deinit(allocator);
        allocator.free(device.name);
    }
    devices.deinit(allocator);
}

fn find_device(devices: []const Device, name: []const u8) ?usize {
    for (devices, 0..) |device, index| {
        if (std.mem.eql(u8, device.name, name)) return index;
    }
    return null;
}

fn select_device(devices: []const Device, endpoint: ?[]const u8) Error!*const Device {
    if (endpoint) |wanted| {
        const index = find_device(devices, wanted) orelse return error.UnknownDevice;
        return &devices[index];
    }
    if (find_device(devices, "system")) |index| return &devices[index];
    if (devices.len == 0) return error.NoPhysicalPorts;
    return &devices[0];
}

fn free_port_names(comptime channels: usize, allocator: std.mem.Allocator, names: *[channels]?[:0]u8) void {
    for (names) |maybe_name| if (maybe_name) |name| allocator.free(name);
}

/// Connects changed local ports to a new physical mapping before disconnecting
/// old peers. On connection failure, newly added graph edges are rolled back.
fn reconcile_ports(comptime channels: usize, comptime direction: Direction, allocator: std.mem.Allocator, client: *binding.Client, local_ports: [channels]?*binding.PortHandle, previous: [channels]?[:0]u8, requested: []const [:0]u8) Error![channels]?[:0]u8 {
    var next: [channels]?[:0]u8 = @splat(null);
    errdefer free_port_names(channels, allocator, &next);
    var connected: [channels]bool = @splat(false);
    errdefer for (connected, 0..) |did_connect, index| {
        if (!did_connect) continue;
        const local = local_ports[index] orelse continue;
        const local_name = client.port_full_name(local) catch continue;
        const remote_name = next[index] orelse continue;
        switch (direction) {
            .playback => client.disconnect(local_name, remote_name.ptr),
            .capture => client.disconnect(remote_name.ptr, local_name),
        }
    };

    for (0..@min(channels, requested.len)) |index| {
        const name = try allocator.dupeSentinel(u8, requested[index], 0);
        next[index] = name;
        const local = local_ports[index] orelse return error.PortUnavailable;
        if (previous[index]) |old| {
            if (std.mem.eql(u8, old, name)) {
                const is_connected = client.port_connected_to(local, name.ptr);
                if (is_connected == null or is_connected == true) continue;
            }
        }
        const local_name = try client.port_full_name(local);
        switch (direction) {
            .playback => try client.connect(local_name, name.ptr),
            .capture => try client.connect(name.ptr, local_name),
        }
        connected[index] = true;
    }

    for (previous, 0..) |maybe_old, index| {
        const old = maybe_old orelse continue;
        if (next[index]) |replacement| if (std.mem.eql(u8, old, replacement)) continue;
        const local = local_ports[index] orelse continue;
        const local_name = client.port_full_name(local) catch continue;
        switch (direction) {
            .playback => client.disconnect(local_name, old.ptr),
            .capture => client.disconnect(old.ptr, local_name),
        }
    }
    return next;
}

/// Values shared between the owner and the JACK thread that do not need a ring.
/// The callback writes them with atomics; the owner polls them. `xruns_reported`
/// is touched only by the owner, in `poll`.
const Control = struct {
    /// Server period in frames, updated by the buffer-size callback.
    period: std.atomic.Value(u32),
    /// Set by the shutdown callback and never cleared.
    disconnected: std.atomic.Value(bool),
    /// Set once by the shutdown callback; cleared by `poll`.
    shutdown_pending: std.atomic.Value(bool),
    /// Count of xruns; the owner reports the difference since the last poll.
    xruns: std.atomic.Value(u32),
    xruns_reported: u32 = 0,
    /// New sample rate waiting for `poll` (0: none).
    rate_pending: std.atomic.Value(u32),
    /// New buffer size waiting for `poll` (0: none).
    buffer_pending: std.atomic.Value(u32),
    /// A physical or local JACK port was registered or unregistered.
    ports_changed_pending: std.atomic.Value(bool),
    /// Playback underruns (cycles without enough ring data) or capture overruns
    /// (cycles dropped because the ring was full). Incremented by the callback.
    ring_faults: std.atomic.Value(usize),

    fn init(period: u32) Control {
        return .{
            .period = .init(period),
            .disconnected = .init(false),
            .shutdown_pending = .init(false),
            .xruns = .init(0),
            .rate_pending = .init(0),
            .buffer_pending = .init(0),
            .ports_changed_pending = .init(false),
            .ring_faults = .init(0),
        };
    }

    fn is_disconnected(self: *const Control) bool {
        return self.disconnected.load(.acquire);
    }

    fn period_frames(self: *const Control) usize {
        return self.period.load(.acquire);
    }

    /// Owner-side: returns one pending notification, or null.
    fn poll(self: *Control) ?Event {
        if (self.shutdown_pending.swap(false, .acq_rel)) return .shutdown;
        const rate = self.rate_pending.swap(0, .acq_rel);
        if (rate != 0) return .{ .sample_rate_changed = rate };
        const period = self.buffer_pending.swap(0, .acq_rel);
        if (period != 0) return .{ .buffer_size_changed = period };
        if (self.ports_changed_pending.swap(false, .acq_rel)) return .ports_changed;
        const total = self.xruns.load(.acquire);
        if (total != self.xruns_reported) {
            const delta = total -% self.xruns_reported;
            self.xruns_reported = total;
            return .{ .xrun = delta };
        }
        return null;
    }
};

/// Realtime state for one device with `channels` ports in one direction.
/// Its `jack_*` methods are the JACK callbacks (see binding.Callbacks).
/// Playback: the callback consumes the ring. Capture: it produces into the ring.
fn Shared(comptime channels: usize, comptime direction: Direction) type {
    return struct {
        const Self = @This();
        /// Bytes per interleaved frame: one float per channel.
        const frame_bytes = channels * sample_bytes;

        allocator: std.mem.Allocator,
        library: *const binding.Library,
        control: Control,
        /// Port handles, filled before activation. Null entries are silence.
        ports: [channels]?*binding.PortHandle = @splat(null),
        ring: ring.Ring,
        /// Callback-only interleaving buffer, as large as the ring.
        scratch: []u8,
        /// Playback owner requests a discard; the consumer acknowledges only
        /// after advancing its read counter. The owner does not pump while waiting.
        drop_requested: std.atomic.Value(bool) = .init(false),

        /// Allocates the ring and scratch for a device. `requested_frames` is
        /// raised to two periods so the callback always has a full cycle of slack.
        fn create(allocator: std.mem.Allocator, library: *const binding.Library, period: u32, requested_frames: usize) Error!*Self {
            const frames = @max(requested_frames, 2 * @as(usize, @max(period, 1)));
            const bytes = std.math.mul(usize, frames, frame_bytes) catch return error.Overflow;
            const self = try allocator.create(Self);
            errdefer allocator.destroy(self);
            var buffer = try ring.Ring.init(allocator, bytes);
            errdefer buffer.deinit();
            const scratch = try allocator.alloc(u8, buffer.capacity());
            self.* = .{
                .allocator = allocator,
                .library = library,
                .control = Control.init(period),
                .ring = buffer,
                .scratch = scratch,
            };
            return self;
        }

        fn destroy(self: *Self) void {
            const allocator = self.allocator;
            self.ring.deinit();
            allocator.free(self.scratch);
            allocator.destroy(self);
        }

        /// Ring capacity in whole frames (the buffer size the caller can rely on).
        fn capacity_frames(self: *const Self) usize {
            return self.ring.capacity() / frame_bytes;
        }

        fn scratch_frames(self: *const Self) usize {
            return self.scratch.len / frame_bytes;
        }

        /// JACK process callback. Runs on the realtime thread; see module docs.
        pub fn jack_process(self: *Self, frames: u32) void {
            switch (direction) {
                .playback => {
                    if (self.drop_requested.load(.acquire)) {
                        self.ring.discard();
                        self.drop_requested.store(false, .release);
                    }
                    self.play(frames);
                },
                .capture => self.record(frames),
            }
        }

        pub fn jack_xrun(self: *Self) void {
            _ = self.control.xruns.fetchAdd(1, .monotonic);
        }

        pub fn jack_shutdown(self: *Self) void {
            self.control.disconnected.store(true, .release);
            self.control.shutdown_pending.store(true, .release);
        }

        pub fn jack_sample_rate(self: *Self, rate: u32) void {
            self.control.rate_pending.store(rate, .release);
        }

        pub fn jack_buffer_size(self: *Self, frames: u32) void {
            self.control.period.store(frames, .release);
            self.control.buffer_pending.store(frames, .release);
        }

        pub fn jack_ports_changed(self: *Self) void {
            self.control.ports_changed_pending.store(true, .release);
        }

        /// Copies `frames` frames from the ring into the port buffers. Missing
        /// frames become silence and count as one ring fault for the cycle.
        fn play(self: *Self, frames: u32) void {
            const count: usize = frames;
            var buffers: [channels]?[*]f32 = undefined;
            for (self.ports, 0..) |maybe_port, index| {
                buffers[index] = if (maybe_port) |port| self.library.port_buffer(port, frames) else null;
            }
            var done: usize = 0;
            var short = false;
            while (done < count) {
                const part = @min(count - done, self.scratch_frames());
                const got = self.ring.pop(self.scratch[0 .. part * frame_bytes]) / frame_bytes;
                if (got < part) short = true;
                for (buffers, 0..) |maybe_out, channel| {
                    const out = maybe_out orelse continue;
                    for (0..part) |frame| {
                        out[done + frame] = if (frame < got) read_sample(self.scratch, (frame * channels + channel) * sample_bytes) else 0;
                    }
                }
                done += part;
            }
            if (short) _ = self.control.ring_faults.fetchAdd(1, .monotonic);
        }

        /// Interleaves `frames` frames from the port buffers into the ring. A
        /// chunk that does not fit is dropped whole, which keeps frames aligned.
        fn record(self: *Self, frames: u32) void {
            const count: usize = frames;
            var buffers: [channels]?[*]f32 = undefined;
            for (self.ports, 0..) |maybe_port, index| {
                buffers[index] = if (maybe_port) |port| self.library.port_buffer(port, frames) else null;
            }
            var done: usize = 0;
            while (done < count) {
                const part = @min(count - done, self.scratch_frames());
                for (buffers, 0..) |maybe_in, channel| {
                    for (0..part) |frame| {
                        const value: f32 = if (maybe_in) |in| in[done + frame] else 0;
                        write_sample(self.scratch, (frame * channels + channel) * sample_bytes, value);
                    }
                }
                if (!self.ring.push(self.scratch[0 .. part * frame_bytes])) {
                    _ = self.control.ring_faults.fetchAdd(1, .monotonic);
                }
                done += part;
            }
        }
    };
}

fn read_sample(bytes: []const u8, at: usize) f32 {
    return @bitCast(std.mem.readInt(u32, bytes[at..][0..sample_bytes], native_endian));
}

fn write_sample(bytes: []u8, at: usize, value: f32) void {
    std.mem.writeInt(u32, bytes[at..][0..sample_bytes], @bitCast(value), native_endian);
}

/// Room for a prefix plus a decimal channel index and the terminator.
const port_name_capacity = 32;

/// Formats a NUL-terminated JACK port name into `buffer`. Prefixes are short
/// constants and indices are bounded by the channel count, so this cannot fail.
fn port_name(buffer: *[port_name_capacity]u8, prefix: []const u8, index: usize) [:0]const u8 {
    const text = std.fmt.bufPrint(buffer[0 .. port_name_capacity - 1], "{s}{d}", .{ prefix, index }) catch unreachable;
    buffer[text.len] = 0;
    return buffer[0..text.len :0];
}

fn sleep_milliseconds(milliseconds: u32) void {
    const request = std.os.linux.timespec{ .sec = 0, .nsec = @as(isize, milliseconds) * std.time.ns_per_ms };
    _ = std.os.linux.nanosleep(&request, null);
}

/// Logical playback output with the destination layout fixed at compile time.
pub fn Output(comptime layout: audio.Layout) type {
    const channels = layout.channels();
    const channel_count: u16 = @intCast(channels);
    const State = Shared(channels, .playback);
    const frame_bytes = channels * sample_bytes;
    return struct {
        const Self = @This();

        /// A bound stream, by pointer. Its destination layout equals `layout`.
        pub const Source = Mixer.Source;
        const Mixer = logical.Mixer(layout);

        allocator: std.mem.Allocator,
        name: [:0]u8,
        follows_default: bool,
        client: binding.Client,
        state: *State,
        remote_ports: [channels]?[:0]u8,
        spec_value: audio.Spec,
        /// Bound streams, gain, pause and mixing (scratch sized like the ring).
        mixer: Mixer,

        /// Opens a JACK client, registers the output ports, activates the client
        /// and connects the ports to the chosen device. The library is only
        /// borrowed; the endpoint name is copied.
        pub fn open(allocator: std.mem.Allocator, loader: *Library, options: Options) Error!Self {
            const library = &loader.native;
            if (options.buffer_frames == 0) return error.InvalidBufferFrames;
            var client = try binding.Client.open(library, options.client_name);
            errdefer client.close();
            var devices = try list_devices(allocator, &client, .playback);
            defer devices.deinit();
            const chosen = try select_device(devices.items, options.endpoint);

            const name = try allocator.dupeSentinel(u8, chosen.name, 0);
            errdefer allocator.free(name);
            const state = try State.create(allocator, library, client.buffer_size(), options.buffer_frames);
            errdefer state.destroy();
            for (&state.ports, 0..) |*slot, index| {
                var buffer: [port_name_capacity]u8 = undefined;
                slot.* = try client.register_port(port_name(&buffer, "zdl_output_", index), binding.port_is_output);
            }
            try client.install(State, state);
            try client.activate();
            errdefer client.deactivate();
            var remote_ports = try reconcile_ports(channels, .playback, allocator, &client, state.ports, @splat(null), chosen.ports.items);
            errdefer free_port_names(channels, allocator, &remote_ports);

            const spec_value: audio.Spec = .{ .format = native_format, .channels = channel_count, .sample_rate = client.sample_rate() };
            var mixer = try Mixer.init(allocator, spec_value, state.scratch.len);
            errdefer mixer.deinit();
            return .{
                .allocator = allocator,
                .name = name,
                .follows_default = options.endpoint == null,
                .client = client,
                .state = state,
                .remote_ports = remote_ports,
                .spec_value = spec_value,
                .mixer = mixer,
            };
        }

        /// Deactivates and closes the client (removing its ports), then frees
        /// owned storage. Bound streams are not touched; unbind them first.
        pub fn deinit(self: *Self) void {
            self.client.deactivate();
            self.client.close();
            self.state.destroy();
            self.mixer.deinit();
            free_port_names(channels, self.allocator, &self.remote_ports);
            self.allocator.free(self.name);
            self.* = undefined;
        }

        /// Name of the device this output is connected to (owned by the output).
        pub fn endpoint_name(self: *const Self) []const u8 {
            return self.name;
        }

        /// True when this output uses JACK's default (`system` or first client).
        pub fn opened_as_default(self: *const Self) bool {
            return self.follows_default;
        }

        /// Applies current JACK server rate and physical port layout in place.
        /// Call after handling sample-rate, buffer-size or ports-changed events.
        /// Bound producer queues survive the format boundary; stale ring audio
        /// is discarded before it could play at a different server rate.
        pub fn refresh(self: *Self) Error!void {
            if (self.state.control.is_disconnected()) return error.Disconnected;
            const new_rate = self.client.sample_rate();
            if (new_rate == 0) return error.Disconnected;
            if (new_rate != self.spec_value.sample_rate) {
                try self.drop();
                var replacement = self.spec_value;
                replacement.sample_rate = new_rate;
                try self.mixer.reconfigure(replacement, self.state.scratch.len);
                self.spec_value = replacement;
            }

            var devices = try list_devices(self.allocator, &self.client, .playback);
            defer devices.deinit();
            const chosen = try select_device(devices.items, if (self.follows_default) null else self.name);
            const changed_name = !std.mem.eql(u8, self.name, chosen.name);
            const new_name = if (changed_name) try self.allocator.dupeSentinel(u8, chosen.name, 0) else self.name;
            errdefer if (changed_name) self.allocator.free(new_name);
            const remote_ports = try reconcile_ports(channels, .playback, self.allocator, &self.client, self.state.ports, self.remote_ports, chosen.ports.items);

            var old_ports = self.remote_ports;
            self.remote_ports = remote_ports;
            if (changed_name) {
                const old_name = self.name;
                self.name = new_name;
                self.allocator.free(old_name);
            }
            free_port_names(channels, self.allocator, &old_ports);
        }

        /// Format/channel count fixed at open and sample rate from the last refresh.
        pub fn spec(self: *const Self) audio.Spec {
            return self.spec_value;
        }

        /// Ring capacity in frames: the latency bound between pump and JACK.
        pub fn buffer_frames(self: *const Self) usize {
            return self.state.capacity_frames();
        }

        /// The server's current period: the most frames one `pump` renders.
        pub fn period_frames(self: *const Self) usize {
            return self.state.control.period_frames();
        }

        /// Adds a stream to the mix. Its destination spec must equal `spec()`.
        pub fn bind(self: *Self, source: Source) Error!void {
            try self.mixer.bind(source);
        }

        /// Removes a bound stream; the last binding moves into its slot.
        pub fn unbind(self: *Self, source: Source) Error!void {
            try self.mixer.unbind(source);
        }

        /// Number of streams currently mixed into this output.
        pub fn bound_count(self: *const Self) usize {
            return self.mixer.bound_count();
        }

        /// Gain applied to the whole mix. Must be finite and in [0, 1].
        pub fn set_gain(self: *Self, gain: f32) Error!void {
            try self.mixer.set_gain(gain);
        }

        /// Paused outputs still write silence but do not pull from streams.
        pub fn set_paused(self: *Self, paused: bool) void {
            self.mixer.set_paused(paused);
        }

        /// Renders and enqueues up to one period, bounded by free ring space.
        /// Returns frames enqueued (0 when the ring is full). Never blocks.
        /// Fails with `Disconnected` after a server shutdown.
        pub fn pump(self: *Self) Error!usize {
            if (self.state.control.is_disconnected()) return error.Disconnected;
            const free = self.state.ring.writable_bytes() / frame_bytes;
            const frames = @min(free, self.period_frames(), self.state.scratch_frames());
            if (frames == 0) return 0;
            const count = frames * frame_bytes;
            if (!self.state.ring.push(try self.mixer.render(count))) return error.WouldBlock;
            return frames;
        }

        /// Waits until a full period (or the whole ring, if smaller) is free.
        /// Null waits indefinitely. Returns false on timeout.
        pub fn wait(self: *Self, timeout_milliseconds: ?u31) Error!bool {
            var waited: u32 = 0;
            while (true) {
                if (self.state.control.is_disconnected()) return error.Disconnected;
                const needed = @min(self.period_frames(), self.buffer_frames());
                if (self.state.ring.writable_bytes() / frame_bytes >= needed) return true;
                if (timeout_milliseconds) |limit| {
                    if (waited >= limit) return false;
                }
                sleep_milliseconds(poll_interval_milliseconds);
                waited += poll_interval_milliseconds;
            }
        }

        /// Succeeds when every enqueued frame has been taken by JACK. The last
        /// period may still be playing when this succeeds. Returns WouldBlock
        /// while frames remain.
        pub fn drain(self: *Self) Error!void {
            if (self.state.ring.readable_bytes() != 0) return error.WouldBlock;
        }

        /// Discards enqueued audio at the next process cycle, preserving JACK
        /// connections. Waits for the realtime consumer's acknowledgement; the
        /// callback performs only atomic operations and a consumer-side discard.
        /// A period already handed to JACK may still be playing when this returns.
        pub fn drop(self: *Self) Error!void {
            if (self.state.control.is_disconnected()) return error.Disconnected;
            self.state.drop_requested.store(true, .release);
            while (self.state.drop_requested.load(.acquire)) {
                if (self.state.control.is_disconnected()) return error.Disconnected;
                sleep_milliseconds(poll_interval_milliseconds);
            }
        }

        /// Next pending JACK notification, or null. See `Event`.
        pub fn poll_event(self: *Self) ?Event {
            return self.state.control.poll();
        }

        /// Number of cycles in which JACK ran short of audio (silence was written).
        pub fn underruns(self: *const Self) usize {
            return self.state.control.ring_faults.load(.monotonic);
        }
    };
}

/// Logical capture input with the source layout fixed at compile time.
pub fn Input(comptime layout: audio.Layout) type {
    const channels = layout.channels();
    const channel_count: u16 = @intCast(channels);
    const State = Shared(channels, .capture);
    const frame_bytes = channels * sample_bytes;
    return struct {
        const Self = @This();

        /// A bound destination stream, by pointer. Its source layout is `layout`.
        pub const Source = Fanout.Source;
        const Fanout = logical.Fanout(layout);

        allocator: std.mem.Allocator,
        name: [:0]u8,
        follows_default: bool,
        client: binding.Client,
        state: *State,
        remote_ports: [channels]?[:0]u8,
        spec_value: audio.Spec,
        /// Bound destination streams and the owner-side copy of captured frames
        /// (sized like the ring).
        fanout: Fanout,

        /// Opens a JACK client with capture ports connected to the chosen device.
        pub fn open(allocator: std.mem.Allocator, loader: *Library, options: Options) Error!Self {
            const library = &loader.native;
            if (options.buffer_frames == 0) return error.InvalidBufferFrames;
            var client = try binding.Client.open(library, options.client_name);
            errdefer client.close();
            var devices = try list_devices(allocator, &client, .capture);
            defer devices.deinit();
            const chosen = try select_device(devices.items, options.endpoint);

            const name = try allocator.dupeSentinel(u8, chosen.name, 0);
            errdefer allocator.free(name);
            const state = try State.create(allocator, library, client.buffer_size(), options.buffer_frames);
            errdefer state.destroy();
            for (&state.ports, 0..) |*slot, index| {
                var buffer: [port_name_capacity]u8 = undefined;
                slot.* = try client.register_port(port_name(&buffer, "zdl_input_", index), binding.port_is_input);
            }
            try client.install(State, state);
            try client.activate();
            errdefer client.deactivate();
            var remote_ports = try reconcile_ports(channels, .capture, allocator, &client, state.ports, @splat(null), chosen.ports.items);
            errdefer free_port_names(channels, allocator, &remote_ports);

            const spec_value: audio.Spec = .{ .format = native_format, .channels = channel_count, .sample_rate = client.sample_rate() };
            var fanout = try Fanout.init(allocator, spec_value, state.scratch.len);
            errdefer fanout.deinit();
            return .{
                .allocator = allocator,
                .name = name,
                .follows_default = options.endpoint == null,
                .client = client,
                .state = state,
                .remote_ports = remote_ports,
                .spec_value = spec_value,
                .fanout = fanout,
            };
        }

        /// Deactivates and closes the client, then frees owned storage. Unbind
        /// streams first.
        pub fn deinit(self: *Self) void {
            self.client.deactivate();
            self.client.close();
            self.state.destroy();
            self.fanout.deinit();
            free_port_names(channels, self.allocator, &self.remote_ports);
            self.allocator.free(self.name);
            self.* = undefined;
        }

        /// Name of the device this input captures from (owned by the input).
        pub fn endpoint_name(self: *const Self) []const u8 {
            return self.name;
        }

        /// True when this input uses JACK's default (`system` or first client).
        pub fn opened_as_default(self: *const Self) bool {
            return self.follows_default;
        }

        /// Applies the current JACK rate and physical capture-port layout in
        /// place. Call after rate, buffer-size or ports-changed events.
        pub fn refresh(self: *Self) Error!void {
            if (self.state.control.is_disconnected()) return error.Disconnected;
            const new_rate = self.client.sample_rate();
            if (new_rate == 0) return error.Disconnected;
            if (new_rate != self.spec_value.sample_rate) {
                self.state.ring.discard();
                var replacement = self.spec_value;
                replacement.sample_rate = new_rate;
                try self.fanout.reconfigure(replacement, self.state.scratch.len);
                self.spec_value = replacement;
            }

            var devices = try list_devices(self.allocator, &self.client, .capture);
            defer devices.deinit();
            const chosen = try select_device(devices.items, if (self.follows_default) null else self.name);
            const changed_name = !std.mem.eql(u8, self.name, chosen.name);
            const new_name = if (changed_name) try self.allocator.dupeSentinel(u8, chosen.name, 0) else self.name;
            errdefer if (changed_name) self.allocator.free(new_name);
            const remote_ports = try reconcile_ports(channels, .capture, self.allocator, &self.client, self.state.ports, self.remote_ports, chosen.ports.items);

            var old_ports = self.remote_ports;
            self.remote_ports = remote_ports;
            if (changed_name) {
                const old_name = self.name;
                self.name = new_name;
                self.allocator.free(old_name);
            }
            free_port_names(channels, self.allocator, &old_ports);
        }

        /// Format/channel count fixed at open and sample rate from the last refresh.
        pub fn spec(self: *const Self) audio.Spec {
            return self.spec_value;
        }

        /// Ring capacity in frames.
        pub fn buffer_frames(self: *const Self) usize {
            return self.state.capacity_frames();
        }

        /// The server's current period: the most frames one `pump` reads.
        pub fn period_frames(self: *const Self) usize {
            return self.state.control.period_frames();
        }

        /// Adds a destination stream. Captured audio is written into it with the
        /// input's spec on each pump. The input keeps only the pointer.
        pub fn bind(self: *Self, source: Source) Error!void {
            try self.fanout.bind(source);
        }

        /// Removes a bound stream; the last binding moves into the freed slot.
        pub fn unbind(self: *Self, source: Source) Error!void {
            try self.fanout.unbind(source);
        }

        /// Number of bound destination streams.
        pub fn bound_count(self: *const Self) usize {
            return self.fanout.bound_count();
        }

        /// Reads up to one period of captured frames and writes them into every
        /// bound stream. Returns frames read (0 when nothing is buffered).
        /// Fails with `Disconnected` after a server shutdown once the ring is empty.
        pub fn pump(self: *Self) Error!usize {
            const available = self.state.ring.readable_bytes() / frame_bytes;
            const frames = @min(available, self.period_frames(), self.fanout.scratch.len / frame_bytes);
            if (frames == 0) {
                if (self.state.control.is_disconnected()) return error.Disconnected;
                return 0;
            }
            const got = self.state.ring.pop(self.fanout.scratch[0 .. frames * frame_bytes]);
            try self.fanout.distribute(self.fanout.scratch[0..got]);
            return got / frame_bytes;
        }

        /// Waits until a full period (or the whole ring, if smaller) is captured.
        /// Null waits indefinitely. Returns false on timeout.
        pub fn wait(self: *Self, timeout_milliseconds: ?u31) Error!bool {
            var waited: u32 = 0;
            while (true) {
                const needed = @min(self.period_frames(), self.buffer_frames());
                if (self.state.ring.readable_bytes() / frame_bytes >= needed) return true;
                if (self.state.control.is_disconnected()) return error.Disconnected;
                if (timeout_milliseconds) |limit| {
                    if (waited >= limit) return false;
                }
                sleep_milliseconds(poll_interval_milliseconds);
                waited += poll_interval_milliseconds;
            }
        }

        /// Discards buffered capture audio. The owner is the ring's consumer, so
        /// it can drop the readable bytes without stopping JACK.
        pub fn drop(self: *Self) Error!void {
            self.state.ring.discard();
        }

        /// Next pending JACK notification, or null. See `Event`.
        pub fn poll_event(self: *Self) ?Event {
            return self.state.control.poll();
        }

        /// Number of cycles whose audio was dropped because the ring was full.
        pub fn overruns(self: *const Self) usize {
            return self.state.control.ring_faults.load(.monotonic);
        }
    };
}

test "JACK control coalesces configuration and port change notifications" {
    var control = Control.init(128);
    control.rate_pending.store(48000, .release);
    control.buffer_pending.store(256, .release);
    control.ports_changed_pending.store(true, .release);
    try std.testing.expectEqual(@as(u32, 48000), control.poll().?.sample_rate_changed);
    try std.testing.expectEqual(@as(u32, 256), control.poll().?.buffer_size_changed);
    try std.testing.expect(control.poll().? == .ports_changed);
    try std.testing.expect(control.poll() == null);
}
