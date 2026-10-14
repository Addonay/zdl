//! PipeWire connection, registry enumeration and hotplug events.
//!
//! Model (SDL_pipewire.c, hotplug and default-device handling):
//!   - A `Connection` owns one PipeWire thread loop, one context, one core
//!     connection and the registry. PipeWire runs its own thread for the loop;
//!     this is the library's documented threading model, not a hidden zdl
//!     thread, and no zdl state is touched from it outside the loop lock.
//!   - Sinks and sources are `Audio/Sink` and `Audio/Source` nodes. Their
//!     names and descriptions come from the node's registry properties.
//!   - The default sink and source come from the "default" metadata object,
//!     keys `default.audio.sink` and `default.audio.source`, whose values are
//!     JSON objects with a `name` member (SDL's get_name_from_json).
//!   - `Connection.open` waits for PipeWire's initial registry dump, so the
//!     snapshot from `devices` is complete when open returns.
//!   - After the initial dump, every add, remove and default change is queued.
//!     The caller reads them with `poll_events`; no callback is exposed.
//!
//! Synchronization: all state in `Shared` is read or written only while the
//! thread loop lock is held. Public methods take the lock; PipeWire callbacks
//! already run with it held. Do not call public methods from inside a callback.
//!
//! Ownership: a `Connection` borrows the `Library`, which must outlive
//! it. Streams created from the connection must be destroyed before it.
const std = @import("std");
const binding = @import("binding.zig");

/// Loader for libpipewire-0.3. Must outlive every `Connection` made from it and
/// must not move while a Connection borrows it.
pub const Library = struct {
    /// Implementation detail: the private binding. Not part of the stable API.
    native: binding.Library,

    /// Loads libpipewire-0.3 and initializes PipeWire (needs libc in the
    /// application's root module). A missing library or symbol is
    /// `error.Unavailable`.
    pub fn open() error{Unavailable}!Library {
        return .{ .native = binding.Library.open() catch return error.Unavailable };
    }

    /// Unloads the shared object. Every Connection must already be deinitialized.
    /// Does not call pw_deinit: other users of the process may rely on PipeWire.
    pub fn deinit(self: *Library) void {
        self.native.deinit();
        self.* = undefined;
    }
};

/// Failures of connecting and of events. PipeWire result codes are collapsed
/// into `binding.Error` values, and allocation failure is reported as usual.
pub const Error = binding.Error || std.mem.Allocator.Error || error{
    /// libpipewire is missing, or no daemon answered (core connect failed or the
    /// initial registry dump did not arrive in time). See `logical.Unavailable`.
    Unavailable,
    /// The client name does not fit the fixed connection-name buffer.
    Overflow,
};

/// Direction of a physical endpoint as PipeWire classifies it.
pub const Class = enum { sink, source };

/// One sink or source node. Strings are owned by the containing list or event.
pub const Device = struct {
    id: u32,
    class: Class,
    /// PipeWire `node.name`; stable across sessions and usable as a target.
    name: []u8,
    /// Human-readable `node.description`, falling back to the node nick or name.
    description: []u8,
};

/// Owned snapshot of devices. Free with `deinit`.
pub const DeviceList = struct {
    allocator: std.mem.Allocator,
    items: []Device,

    pub fn deinit(self: *DeviceList) void {
        for (self.items) |device| free_device(self.allocator, device);
        self.allocator.free(self.items);
        self.* = undefined;
    }
};

/// A change observed after the initial snapshot. Payloads are owned by the list.
pub const Event = union(enum) {
    /// A sink or source appeared.
    device_added: Device,
    /// The node with this id disappeared.
    device_removed: u32,
    /// The default sink or source changed. `name` is empty when the default
    /// was cleared.
    default_changed: DefaultChange,
};

pub const DefaultChange = struct {
    class: Class,
    name: []u8,
};

/// Events accumulated since the previous `poll_events`. Free with `deinit`.
pub const EventList = struct {
    allocator: std.mem.Allocator,
    items: []Event,

    pub fn deinit(self: *EventList) void {
        for (self.items) |event| switch (event) {
            .device_added => |device| free_device(self.allocator, device),
            .default_changed => |change| self.allocator.free(change.name),
            .device_removed => {},
        };
        self.allocator.free(self.items);
        self.* = undefined;
    }
};

/// Options for `Connection.open`.
pub const Options = struct {
    /// Shown by PipeWire tools as the client name. Copied with a NUL.
    application_name: []const u8 = "zdl",
    /// How long to wait for the initial registry dump, in whole seconds.
    timeout_seconds: u31 = 5,
};

const Node = struct {
    class: Class,
    name: []u8,
    description: []u8,
};

/// Heap-allocated state shared with PipeWire callbacks. The address must stay
/// stable because listener hooks link into PipeWire, hence the allocation.
pub const Shared = struct {
    allocator: std.mem.Allocator,
    library: *binding.Library,
    thread: *binding.ThreadLoop,
    loop: *binding.Loop,
    context: *binding.Context,
    core: *binding.Core,
    registry: *binding.Registry,
    core_hook: binding.Hook = .{},
    registry_hook: binding.Hook = .{},
    metadata_hook: binding.Hook = .{},
    metadata_proxy: ?*binding.Proxy = null,
    metadata_id: ?u32 = null,
    sync_sequence: c_int = 1,
    initial_done: bool = false,
    /// Set when an allocation failed inside a callback; the event is lost.
    lost_event: bool = false,
    nodes: std.AutoHashMapUnmanaged(u32, Node) = .empty,
    pending: std.ArrayList(Event) = .empty,
    default_sink: ?[]u8 = null,
    default_source: ?[]u8 = null,

    /// Recovers the shared state from a callback's `data` argument.
    pub fn from_callback(data: ?*anyopaque) *Shared {
        return @ptrCast(@alignCast(data.?));
    }

    /// Core `done` for the initial sync: wake the thread waiting in `open`.
    pub fn on_done(self: *Shared, id: u32, seq: c_int) void {
        if (id != 0 or seq != self.sync_sequence) return;
        self.initial_done = true;
        self.library.signal(self.thread);
    }

    /// Registry `global`: records sinks, sources and the default metadata.
    pub fn on_global(self: *Shared, id: u32, type_name: []const u8, props: binding.Props) void {
        if (std.mem.eql(u8, type_name, "PipeWire:Interface:Node")) {
            self.node_added(id, props);
        } else if (std.mem.eql(u8, type_name, "PipeWire:Interface:Metadata")) {
            self.metadata_added(id, props);
        }
    }

    /// Registry `global_remove`: forgets nodes and the default metadata.
    pub fn on_global_remove(self: *Shared, id: u32) void {
        if (self.nodes.fetchRemove(id)) |entry| {
            self.free_node(entry.value);
            if (self.initial_done) self.queue(.{ .device_removed = id });
        }
        if (self.metadata_id == id) {
            if (self.metadata_proxy) |proxy| self.library.proxy_destroy(proxy);
            self.metadata_proxy = null;
            self.metadata_id = null;
        }
    }

    /// Metadata `property`: tracks the default sink and source names.
    pub fn on_metadata(self: *Shared, subject: u32, key: []const u8, value: ?[]const u8) void {
        _ = subject;
        const class: Class = if (std.mem.eql(u8, key, "default.audio.sink"))
            .sink
        else if (std.mem.eql(u8, key, "default.audio.source"))
            .source
        else
            return;
        const slot = switch (class) {
            .sink => &self.default_sink,
            .source => &self.default_source,
        };
        const name = if (value) |text| parse_json_name(text) orelse "" else "";
        if (slot.*) |old| if (std.mem.eql(u8, old, name)) return;
        const owned = self.allocator.dupe(u8, name) catch {
            self.lost_event = true;
            return;
        };
        if (slot.*) |old| self.allocator.free(old);
        slot.* = owned;
        if (self.initial_done) self.queue(.{ .default_changed = .{ .class = class, .name = self.allocator.dupe(u8, name) catch {
            self.lost_event = true;
            return;
        } } });
    }

    fn node_added(self: *Shared, id: u32, props: binding.Props) void {
        const class_text = props.get("media.class") orelse return;
        const class: Class = if (std.mem.eql(u8, class_text, "Audio/Sink"))
            .sink
        else if (std.mem.eql(u8, class_text, "Audio/Source"))
            .source
        else
            return;
        const name_text = props.get("node.name") orelse return;
        const description_text = props.get("node.description") orelse props.get("node.nick") orelse name_text;
        const name = self.allocator.dupe(u8, name_text) catch return self.lost();
        const description = self.allocator.dupe(u8, description_text) catch {
            self.allocator.free(name);
            return self.lost();
        };
        const node: Node = .{ .class = class, .name = name, .description = description };
        const previous = self.nodes.fetchPut(self.allocator, id, node) catch {
            self.free_node(node);
            return self.lost();
        };
        if (previous) |old| self.free_node(old.value);
        if (self.initial_done) {
            const copy = copy_device(self.allocator, id, node) catch return self.lost();
            self.queue(.{ .device_added = copy });
        }
    }

    fn metadata_added(self: *Shared, id: u32, props: binding.Props) void {
        if (self.metadata_id != null) return;
        const name = props.get("metadata.name") orelse return;
        if (!std.mem.eql(u8, name, "default")) return;
        const proxy = self.library.registry_bind(self.registry, id, "PipeWire:Interface:Metadata", binding.version_metadata) catch return;
        self.library.proxy_listener(proxy, &self.metadata_hook, &binding.metadata_events, self);
        self.metadata_proxy = proxy;
        self.metadata_id = id;
    }

    fn queue(self: *Shared, event: Event) void {
        self.pending.append(self.allocator, event) catch {
            free_event(self.allocator, event);
            self.lost();
        };
    }

    fn lost(self: *Shared) void {
        self.lost_event = true;
    }

    fn free_node(self: *Shared, node: Node) void {
        self.allocator.free(node.name);
        self.allocator.free(node.description);
    }

    fn release(self: *Shared) void {
        var iterator = self.nodes.valueIterator();
        while (iterator.next()) |node| self.free_node(node.*);
        self.nodes.deinit(self.allocator);
        for (self.pending.items) |event| free_event(self.allocator, event);
        self.pending.deinit(self.allocator);
        if (self.default_sink) |name| self.allocator.free(name);
        if (self.default_source) |name| self.allocator.free(name);
    }
};

/// Extracts `name` from a JSON object such as `{"name":"alsa_output.pci"}`.
/// Only the simple form emitted by PipeWire is handled: a string member with no
/// escapes. Anything else yields null, which is treated as "no default".
pub fn parse_json_name(json: []const u8) ?[]const u8 {
    const key = "\"name\"";
    const at = std.mem.indexOf(u8, json, key) orelse return null;
    var cursor = at + key.len;
    while (cursor < json.len and (json[cursor] == ' ' or json[cursor] == ':' or json[cursor] == '\t')) : (cursor += 1) {}
    if (cursor >= json.len or json[cursor] != '"') return null;
    cursor += 1;
    const end = std.mem.indexOfScalarPos(u8, json, cursor, '"') orelse return null;
    if (std.mem.indexOfScalar(u8, json[cursor..end], '\\') != null) return null;
    return json[cursor..end];
}

/// A connected PipeWire client. Create with `open`; release with `deinit`.
pub const Connection = struct {
    allocator: std.mem.Allocator,
    library: *binding.Library,
    shared: *Shared,

    /// Starts the thread loop, connects to the daemon and waits for the
    /// initial registry dump. The library must be open for the whole lifetime.
    pub fn open(allocator: std.mem.Allocator, loader: *Library, options: Options) Error!Connection {
        const library = &loader.native;
        const shared = try allocator.create(Shared);
        errdefer allocator.destroy(shared);

        var name_buffer: [64]u8 = undefined;
        const text = std.fmt.bufPrint(name_buffer[0 .. name_buffer.len - 1], "zdl-pipewire-{s}", .{options.application_name}) catch return error.Overflow;
        name_buffer[text.len] = 0;
        const name = name_buffer[0..text.len :0];
        const loop_thread = try library.thread_loop_new(name);
        errdefer library.thread_loop_destroy(loop_thread);
        const loop_handle = try library.loop_of(loop_thread);
        const context = try library.context_new(loop_handle);
        errdefer library.context_destroy(context);
        const core = library.context_connect(context) catch return error.Unavailable;
        errdefer library.core_disconnect(core);
        const registry = try library.core_registry(core);

        shared.* = .{
            .allocator = allocator,
            .library = library,
            .thread = loop_thread,
            .loop = loop_handle,
            .context = context,
            .core = core,
            .registry = registry,
        };
        try library.core_add_listener(core, &shared.core_hook, &binding.core_events, shared);
        try library.registry_add_listener(registry, &shared.registry_hook, &binding.registry_events, shared);
        try library.thread_loop_start(loop_thread);
        errdefer {
            library.thread_loop_stop(loop_thread);
            shared.release();
        }

        library.lock(loop_thread);
        defer library.unlock(loop_thread);
        shared.sync_sequence = try library.core_sync(core, shared.sync_sequence);
        const deadline = try library.deadline(loop_thread, @as(i64, options.timeout_seconds) * std.time.ns_per_s);
        while (!shared.initial_done) {
            if (try library.expired(loop_thread, deadline)) return error.Unavailable;
            _ = try library.wait_until(loop_thread, deadline);
        }
        // Initial events are folded into the snapshot; only later ones queue.
        if (shared.lost_event) return error.OutOfMemory;
        return .{ .allocator = allocator, .library = library, .shared = shared };
    }

    /// Stops the loop, drops proxies and frees the connection. Destroy all
    /// streams first; the loop runs again only for the stop/join step.
    pub fn deinit(self: *Connection) void {
        const shared = self.shared;
        self.library.thread_loop_stop(shared.thread);
        if (shared.metadata_proxy) |proxy| self.library.proxy_destroy(proxy);
        self.library.core_disconnect(shared.core);
        self.library.context_destroy(shared.context);
        self.library.thread_loop_destroy(shared.thread);
        shared.release();
        self.allocator.destroy(shared);
        self.* = undefined;
    }

    /// Snapshot of current sinks and sources, copied out of the loop state.
    pub fn devices(self: *Connection, allocator: std.mem.Allocator) Error!DeviceList {
        self.lock();
        defer self.unlock();
        var list: std.ArrayList(Device) = .empty;
        errdefer {
            for (list.items) |device| free_device(allocator, device);
            list.deinit(allocator);
        }
        var iterator = self.shared.nodes.iterator();
        while (iterator.next()) |entry| {
            const copy = try copy_device(allocator, entry.key_ptr.*, entry.value_ptr.*);
            list.append(allocator, copy) catch {
                free_device(allocator, copy);
                return error.OutOfMemory;
            };
        }
        return .{ .allocator = allocator, .items = try list.toOwnedSlice(allocator) };
    }

    /// Name of the default sink or source, or null when none is set. The
    /// returned name is owned by the caller and usable as a stream target.
    pub fn default_device(self: *Connection, allocator: std.mem.Allocator, class: Class) Error!?[]u8 {
        self.lock();
        defer self.unlock();
        const name = switch (class) {
            .sink => self.shared.default_sink,
            .source => self.shared.default_source,
        } orelse return null;
        if (name.len == 0) return null;
        return try allocator.dupe(u8, name);
    }

    /// Takes the queued changes since the previous call. Events are reported in
    /// the order they arrived. Empty lists are normal and cost no allocation.
    pub fn poll_events(self: *Connection, allocator: std.mem.Allocator) Error!EventList {
        self.lock();
        defer self.unlock();
        if (self.shared.lost_event) {
            // Some changes were dropped while allocating; report the failure once.
            self.shared.lost_event = false;
            return error.OutOfMemory;
        }
        var list: std.ArrayList(Event) = .empty;
        errdefer {
            for (list.items) |event| free_event(allocator, event);
            list.deinit(allocator);
        }
        for (self.shared.pending.items) |event| {
            const copy = try copy_event(allocator, event);
            list.append(allocator, copy) catch {
                free_event(allocator, copy);
                return error.OutOfMemory;
            };
        }
        for (self.shared.pending.items) |event| free_event(self.shared.allocator, event);
        self.shared.pending.clearRetainingCapacity();
        return .{ .allocator = allocator, .items = try list.toOwnedSlice(allocator) };
    }

    /// The PipeWire thread loop, for creating streams on it. Hold `lock` while
    /// touching anything it owns.
    pub fn thread(self: *Connection) *binding.ThreadLoop {
        return self.shared.thread;
    }

    pub fn loop(self: *Connection) *binding.Loop {
        return self.shared.loop;
    }

    pub fn library_handle(self: *Connection) *binding.Library {
        return self.library;
    }

    /// Takes the loop lock. Streams use the same lock for their buffers.
    pub fn lock(self: *Connection) void {
        self.library.lock(self.shared.thread);
    }

    pub fn unlock(self: *Connection) void {
        self.library.unlock(self.shared.thread);
    }
};

fn copy_device(allocator: std.mem.Allocator, id: u32, node: Node) std.mem.Allocator.Error!Device {
    const name = try allocator.dupe(u8, node.name);
    errdefer allocator.free(name);
    const description = try allocator.dupe(u8, node.description);
    return .{ .id = id, .class = node.class, .name = name, .description = description };
}

fn copy_event(allocator: std.mem.Allocator, event: Event) std.mem.Allocator.Error!Event {
    return switch (event) {
        .device_added => |device| .{ .device_added = try copy_device(allocator, device.id, .{ .class = device.class, .name = device.name, .description = device.description }) },
        .device_removed => |id| .{ .device_removed = id },
        .default_changed => |change| .{ .default_changed = .{ .class = change.class, .name = try allocator.dupe(u8, change.name) } },
    };
}

fn free_device(allocator: std.mem.Allocator, device: Device) void {
    allocator.free(device.name);
    allocator.free(device.description);
}

fn free_event(allocator: std.mem.Allocator, event: Event) void {
    switch (event) {
        .device_added => |device| free_device(allocator, device),
        .default_changed => |change| allocator.free(change.name),
        .device_removed => {},
    }
}

test "default name parsing" {
    try std.testing.expectEqualStrings("alsa_output.pci-0", parse_json_name("{ \"name\": \"alsa_output.pci-0\" }").?);
    try std.testing.expect(parse_json_name("{}") == null);
}
