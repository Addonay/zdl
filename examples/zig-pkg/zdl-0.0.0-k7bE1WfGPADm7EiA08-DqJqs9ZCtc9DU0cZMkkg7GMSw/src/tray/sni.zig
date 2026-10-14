//! Status tray export over D-Bus: the freedesktop StatusNotifierItem protocol
//! (`org.kde.StatusNotifierItem` at `/StatusNotifierItem`) and the menu served
//! by the `com.canonical.dbusmenu` interface at `/StatusNotifierItem/menu`.
//! Ports SDL's `src/tray/unix/SDL_dbustray.c` and the menu half of
//! `src/core/linux/SDL_dbus.c`, using the zdl libdbus binding.
//!
//! Lifecycle: `Item.open` connects a private session connection, checks that a
//! StatusNotifierWatcher with a registered host is present, claims a unique
//! well-known name (`org.kde.StatusNotifierItem-<pid>-<instance>`, as SDL does)
//! and registers it with the watcher. The caller then calls `process` regularly
//! (for example once per frame, or with a timeout in an event loop). `process`
//! announces pending model changes as signals, then answers every queued
//! request. Nothing runs on a hidden thread, and no libdbus callbacks are
//! registered: incoming method calls are read from the connection queue and
//! routed here by object path. `Item.close` drops the connection, which makes
//! the watcher forget the item.
//!
//! Object routing: `/StatusNotifierItem` serves the item properties and
//! `ContextMenu`/`Activate`/`SecondaryActivate`/`Scroll`; `/StatusNotifierItem/menu`
//! serves dbusmenu. Every method call gets a reply, with
//! `org.freedesktop.DBus.Error.UnknownObject`/`UnknownMethod` for requests this
//! port does not implement.
//!
//! Wire conventions: `IconPixmap` pixels are the model's ARGB8 byte order
//! (A, R, G, B per pixel), which the StatusNotifierItem specification requires.
//! SDL sent its native packed ARGB32 memory, which is B, G, R, A on little-endian
//! hosts, so its icons arrive with swapped channels on spec-following hosts. This
//! port emits the specified order (a deliberate difference from SDL).
//!
//! Deliberate differences from SDL in this file:
//! - The `Menu` property is `/StatusNotifierItem/menu` while the root menu has
//!   entries and `/NO_DBUSMENU` otherwise, computed from the model. SDL exported
//!   and retracted the menu object as entries came and went, which amounts to the
//!   same thing.
//! - `GetLayout` reports the requested parent id and its properties. SDL always
//!   reported id 0 as the root, even for a submenu request.
//! - `AboutToShow` runs the right-click handler only for the root menu (id 0).
//! - Property changes are announced with `ItemsPropertiesUpdated` instead of a
//!   full `LayoutUpdated`; structural changes still send `LayoutUpdated`.
//! - `Id` is the caller's `Options.id`; SDL used the application id from its
//!   metadata.
//! - No Flatpak-specific name (`<app id>.trayN`) is used; the sandbox case is
//!   left to a later port of `SDL_GetSandbox`.

const std = @import("std");
const linux = std.os.linux;
const Allocator = std.mem.Allocator;

const connection = @import("../linux/dbus/connection.zig");
const message = @import("../linux/dbus/message.zig");
const value = @import("../linux/dbus/value.zig");
const surface = @import("../video/surface.zig");
const model = @import("model.zig");
const Connection = connection.Connection;
const Message = message.Message;
const Value = value.Value;

/// Errors from the tray export. Libdbus and bus failures keep their names.
pub const Error = connection.Error || surface.Error || Allocator.Error || error{
    /// No StatusNotifierWatcher is running, or no host is registered with it.
    NoStatusNotifierHost,
    /// The watcher or a peer answered with a body of the wrong shape.
    UnexpectedReply,
    /// A request arrived with arguments this port does not accept.
    MalformedRequest,
};

/// Identity of one tray item.
pub const Options = struct {
    /// Stable application id reported as the StatusNotifierItem `Id` property,
    /// e.g. "org.example.App". It is copied.
    id: []const u8 = "zdl",
    /// Distinguishes several items in one process: the well-known name becomes
    /// `org.kde.StatusNotifierItem-<pid>-<instance>`.
    instance: u32 = 1,
};

const watcher_service: [:0]const u8 = "org.kde.StatusNotifierWatcher";
const watcher_path: [:0]const u8 = "/StatusNotifierWatcher";
const watcher_iface: [:0]const u8 = "org.kde.StatusNotifierWatcher";
const item_path: [:0]const u8 = "/StatusNotifierItem";
const item_iface: [:0]const u8 = "org.kde.StatusNotifierItem";
const menu_path: [:0]const u8 = "/StatusNotifierItem/menu";
const menu_iface: [:0]const u8 = "com.canonical.dbusmenu";
const properties_iface: [:0]const u8 = "org.freedesktop.DBus.Properties";
const introspectable_iface: [:0]const u8 = "org.freedesktop.DBus.Introspectable";
const peer_iface: [:0]const u8 = "org.freedesktop.DBus.Peer";
const no_menu_path: [:0]const u8 = "/NO_DBUSMENU";
/// Reply timeout for registration and property queries.
const call_timeout_ms: i32 = 5_000;
/// Recursion depth used when GetLayout asks for unlimited depth (-1), as SDL does.
const unlimited_depth: i32 = 100;

const error_unknown_method: [:0]const u8 = "org.freedesktop.DBus.Error.UnknownMethod";
const error_unknown_object: [:0]const u8 = "org.freedesktop.DBus.Error.UnknownObject";
const error_unknown_property: [:0]const u8 = "org.freedesktop.DBus.Error.UnknownProperty";
const error_invalid_args: [:0]const u8 = "org.freedesktop.DBus.Error.InvalidArgs";
const error_item_not_found: [:0]const u8 = "com.canonical.dbusmenu.Error";

/// Item properties in the order GetAll reports them.
const item_property_names = [_][]const u8{ "Category", "Id", "Title", "Status", "WindowId", "IconName", "ItemIsMenu", "Menu", "IconPixmap", "ToolTip" };
/// Menu entry properties reported by GetLayout and GetGroupProperties.
const entry_property_names = [_][]const u8{ "label", "type", "enabled", "visible", "toggle-type", "toggle-state", "children-display" };

const item_introspect =
    \\<!DOCTYPE node PUBLIC "-//freedesktop//DTD D-BUS Object Introspection 1.0//EN" "http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd">
    \\<node>
    \\  <interface name="org.kde.StatusNotifierItem">
    \\    <property name="Category" type="s" access="read"/>
    \\    <property name="Id" type="s" access="read"/>
    \\    <property name="Title" type="s" access="read"/>
    \\    <property name="Status" type="s" access="read"/>
    \\    <property name="WindowId" type="i" access="read"/>
    \\    <property name="IconThemePath" type="s" access="read"/>
    \\    <property name="Menu" type="o" access="read"/>
    \\    <property name="ItemIsMenu" type="b" access="read"/>
    \\    <property name="IconName" type="s" access="read"/>
    \\    <property name="IconPixmap" type="a(iiay)" access="read"/>
    \\    <property name="ToolTip" type="(sa(iiay)ss)" access="read"/>
    \\    <method name="ProvideXdgActivationToken"><arg name="token" type="s" direction="in"/></method>
    \\    <method name="ContextMenu"><arg name="x" type="i" direction="in"/><arg name="y" type="i" direction="in"/></method>
    \\    <method name="Activate"><arg name="x" type="i" direction="in"/><arg name="y" type="i" direction="in"/></method>
    \\    <method name="SecondaryActivate"><arg name="x" type="i" direction="in"/><arg name="y" type="i" direction="in"/></method>
    \\    <method name="Scroll"><arg name="delta" type="i" direction="in"/><arg name="orientation" type="s" direction="in"/></method>
    \\    <signal name="NewTitle"/>
    \\    <signal name="NewIcon"/>
    \\    <signal name="NewAttentionIcon"/>
    \\    <signal name="NewOverlayIcon"/>
    \\    <signal name="NewMenu"/>
    \\    <signal name="NewToolTip"/>
    \\    <signal name="NewStatus"><arg name="status" type="s"/></signal>
    \\  </interface>
    \\</node>
;

const menu_introspect =
    \\<?xml version="1.0"?><node name="/"><interface name="com.canonical.dbusmenu"><property name="Version" type="u" access="read"></property><property name="TextDirection" type="s" access="read"></property><property name="Status" type="s" access="read"></property><property name="IconThemePath" type="as" access="read"></property><method name="GetLayout"><arg type="i" name="parentId" direction="in"></arg><arg type="i" name="recursionDepth" direction="in"></arg><arg type="as" name="propertyNames" direction="in"></arg><arg type="u" name="revision" direction="out"></arg><arg type="(ia{sv}av)" name="layout" direction="out"></arg></method><method name="GetGroupProperties"><arg type="ai" name="ids" direction="in"></arg><arg type="as" name="propertyNames" direction="in"></arg><arg type="a(ia{sv})" name="properties" direction="out"></arg></method><method name="GetProperty"><arg type="i" name="id" direction="in"></arg><arg type="s" name="name" direction="in"></arg><arg type="v" name="value" direction="out"></arg></method><method name="Event"><arg type="i" name="id" direction="in"></arg><arg type="s" name="eventId" direction="in"></arg><arg type="v" name="data" direction="in"></arg><arg type="u" name="timestamp" direction="in"></arg></method><method name="EventGroup"><arg type="a(isvu)" name="events" direction="in"></arg><arg type="ai" name="idErrors" direction="out"></arg></method><method name="AboutToShow"><arg type="i" name="id" direction="in"></arg><arg type="b" name="needUpdate" direction="out"></arg></method><method name="AboutToShowGroup"><arg type="ai" name="ids" direction="in"></arg><arg type="ai" name="updatesNeeded" direction="out"></arg><arg type="ai" name="idErrors" direction="out"></arg></method><signal name="ItemsPropertiesUpdated"><arg type="a(ia{sv})" name="updatedProps" direction="out"/><arg type="a(ias)" name="removedProps" direction="out"/></signal><signal name="LayoutUpdated"><arg type="u" name="revision" direction="out"></arg><arg type="i" name="parent" direction="out"></arg></signal><signal name="ItemActivationRequested"><arg type="i" name="id" direction="out"></arg><arg type="u" name="timestamp" direction="out"></arg></signal></interface></node>
;

/// A StatusNotifierItem bound to one model tray. The tray is borrowed: it must
/// outlive the item, and the caller changes it between `process` calls.
pub fn Item(comptime Context: type) type {
    return struct {
        const Self = @This();
        const Tray = model.Tray(Context);

        gpa: Allocator,
        conn: Connection,
        tray: *Tray,
        service_name: [:0]u8,
        app_id: []u8,
        /// Whether the menu was advertised at the last announcement; the menu
        /// appears and disappears with its first and last entry.
        menu_visible: bool,

        /// Connects to the session bus, registers the item and returns it.
        /// `lib` must outlive the item. Errors leave nothing open.
        pub fn open(lib: *const connection.Library, gpa: Allocator, tray: *Tray, options: Options) Error!Self {
            var conn = try Connection.open(lib, .session);
            errdefer conn.close();

            if (!try host_registered(&conn, gpa)) return error.NoStatusNotifierHost;

            const service = try std.fmt.allocPrintSentinel(gpa, "org.kde.StatusNotifierItem-{d}-{d}", .{ linux.getpid(), options.instance }, 0);
            errdefer gpa.free(service);
            try conn.request_name(service, true);

            try register_with_watcher(&conn, gpa, service);

            const app_id = try gpa.dupe(u8, options.id);
            errdefer gpa.free(app_id);
            return .{
                .gpa = gpa,
                .conn = conn,
                .tray = tray,
                .service_name = service,
                .app_id = app_id,
                .menu_visible = menu_present(tray),
            };
        }

        /// Releases the bus connection and the item's names. The watcher drops
        /// the item when the connection closes. The tray is not touched.
        pub fn close(self: *Self) void {
            self.conn.close();
            self.gpa.free(self.service_name);
            self.gpa.free(self.app_id);
            self.* = undefined;
        }

        /// The well-known name this item owns, e.g. "org.kde.StatusNotifierItem-1234-1".
        pub fn name(self: *const Self) []const u8 {
            return self.service_name;
        }

        /// Sends the signals for pending tray changes, then answers queued
        /// requests. The first queue read waits up to `timeout_ms` (negative waits
        /// for traffic); later reads in the same call do not wait. Callbacks run
        /// on this thread, inside this call. Returns `error.Disconnected` if the bus
        /// connection is lost.
        pub fn process(self: *Self, timeout_ms: i32) Error!void {
            try self.announce_changes();
            var wait = timeout_ms;
            while (try self.conn.poll(wait)) |received| {
                wait = 0;
                var incoming = received;
                defer incoming.deinit();
                try self.dispatch(&incoming);
            }
        }

        fn menu_present(tray: *const Tray) bool {
            return tray.menu().entries().len != 0;
        }

        fn announce_changes(self: *Self) Error!void {
            const changes = self.tray.changes();
            const now = menu_present(self.tray);
            const flipped = now != self.menu_visible;
            if (!changes.any() and !flipped) return;

            var arena_state = std.heap.ArenaAllocator.init(self.gpa);
            defer arena_state.deinit();
            const arena = arena_state.allocator();

            if (changes.icon) try self.emit(item_path, item_iface, "NewIcon", &.{});
            if (changes.tooltip) try self.emit(item_path, item_iface, "NewToolTip", &.{});
            if (flipped) {
                self.menu_visible = now;
                try self.emit_menu_properties(arena);
                try self.emit(item_path, item_iface, "NewMenu", &.{});
            }
            if (changes.layout or flipped) {
                try self.emit(menu_path, menu_iface, "LayoutUpdated", &.{ .{ .uint32 = self.tray.layout_revision }, .{ .int32 = 0 } });
            } else if (changes.properties.len != 0) {
                try self.emit_items_properties(arena, changes.properties);
            }
            self.tray.acknowledge();
        }

        fn emit(self: *Self, path: [:0]const u8, iface: [:0]const u8, member: [:0]const u8, values: []const Value) Error!void {
            var signal = try Message.signal(self.conn.lib, path, iface, member);
            defer signal.deinit();
            try signal.append(self.gpa, values);
            _ = try self.conn.send(&signal);
        }

        fn emit_menu_properties(self: *Self, arena: Allocator) Error!void {
            const menu_value: []const u8 = if (self.menu_visible) menu_path else no_menu_path;
            const changed = try dict_array(arena, &.{
                try dict_entry(arena, "Menu", try variant(arena, "o", .{ .object_path = menu_value })),
                try dict_entry(arena, "ItemIsMenu", try variant(arena, "b", .{ .boolean = self.menu_visible })),
            });
            try self.emit(item_path, properties_iface, "PropertiesChanged", &.{
                .{ .string = item_iface },
                changed,
                .{ .array = .{ .element = "s", .items = &.{} } },
            });
        }

        fn emit_items_properties(self: *Self, arena: Allocator, ids: []const u32) Error!void {
            var updated: std.ArrayList(Value) = .empty;
            for (ids) |id| {
                const entry = self.tray.find_entry(id) orelse continue;
                const props = try entry_props(arena, entry, &entry_property_names);
                try updated.append(arena, .{ .structure = try arena.dupe(Value, &.{ .{ .int32 = @intCast(id) }, props }) });
            }
            try self.emit(menu_path, menu_iface, "ItemsPropertiesUpdated", &.{
                .{ .array = .{ .element = "(ia{sv})", .items = updated.items } },
                .{ .array = .{ .element = "(ias)", .items = &.{} } },
            });
        }

        fn dispatch(self: *Self, request: *Message) Error!void {
            if (request.kind() != .method_call) return;

            var arena_state = std.heap.ArenaAllocator.init(self.gpa);
            defer arena_state.deinit();
            const arena = arena_state.allocator();

            self.route(request, arena) catch |err| switch (err) {
                error.OutOfMemory, error.Disconnected => return err,
                else => return self.reply_error(request, error_invalid_args, "Malformed request"),
            };
        }

        fn route(self: *Self, request: *Message, arena: Allocator) Error!void {
            const iface = request.interface() orelse "";
            const member = request.member() orelse "";
            const path = request.path() orelse "";

            if (std.mem.eql(u8, iface, peer_iface)) {
                if (std.mem.eql(u8, member, "Ping")) return self.reply(request, &.{});
                return self.reply_error(request, error_unknown_method, "Unknown method");
            }
            if (std.mem.eql(u8, path, item_path)) return self.handle_item(request, iface, member, arena);
            if (std.mem.eql(u8, path, menu_path)) return self.handle_menu(request, iface, member, arena);
            return self.reply_error(request, error_unknown_object, "No such object");
        }

        fn handle_item(self: *Self, request: *Message, iface: []const u8, member: []const u8, arena: Allocator) Error!void {
            if (std.mem.eql(u8, iface, properties_iface)) {
                const args = try request.body(arena);
                if (std.mem.eql(u8, member, "Get")) {
                    const property = string_at(args, 1) orelse return error.MalformedRequest;
                    const found = (try self.item_property(arena, property)) orelse
                        return self.reply_error(request, error_unknown_property, "Unknown property");
                    return self.reply(request, &.{found});
                }
                if (std.mem.eql(u8, member, "GetAll")) {
                    var props: std.ArrayList(Value) = .empty;
                    for (item_property_names) |property| {
                        if (try self.item_property(arena, property)) |found| {
                            try props.append(arena, try dict_entry(arena, property, found));
                        }
                    }
                    return self.reply(request, &.{try dict_array(arena, props.items)});
                }
                return self.reply_error(request, error_unknown_method, "Unknown method");
            }
            if (std.mem.eql(u8, iface, introspectable_iface) and std.mem.eql(u8, member, "Introspect")) {
                return self.reply(request, &.{.{ .string = item_introspect }});
            }
            if (!std.mem.eql(u8, iface, item_iface)) return self.reply_error(request, error_unknown_method, "Unknown method");

            if (std.mem.eql(u8, member, "ContextMenu")) {
                try self.reply(request, &.{});
                if (self.tray.right_click) |handler| handler.invoke(self.tray);
            } else if (std.mem.eql(u8, member, "Activate")) {
                try self.reply(request, &.{});
                if (self.tray.left_click) |handler| handler.invoke(self.tray);
            } else if (std.mem.eql(u8, member, "SecondaryActivate")) {
                try self.reply(request, &.{});
                if (self.tray.middle_click) |handler| handler.invoke(self.tray);
            } else if (std.mem.eql(u8, member, "Scroll") or std.mem.eql(u8, member, "ProvideXdgActivationToken")) {
                // Accepted without effect: SDL had no scroll callback either.
                try self.reply(request, &.{});
            } else {
                return self.reply_error(request, error_unknown_method, "Unknown method");
            }
        }

        /// The variant for one item property, or null if the property is unknown
        /// or currently absent (IconPixmap and ToolTip exist only when set).
        fn item_property(self: *Self, arena: Allocator, property: []const u8) Error!?Value {
            if (std.mem.eql(u8, property, "Category")) return try variant(arena, "s", .{ .string = "ApplicationStatus" });
            if (std.mem.eql(u8, property, "Id")) return try variant(arena, "s", .{ .string = self.app_id });
            if (std.mem.eql(u8, property, "Title")) return try variant(arena, "s", .{ .string = "" });
            if (std.mem.eql(u8, property, "Status")) return try variant(arena, "s", .{ .string = "Active" });
            if (std.mem.eql(u8, property, "WindowId")) return try variant(arena, "i", .{ .int32 = 0 });
            if (std.mem.eql(u8, property, "IconName")) return try variant(arena, "s", .{ .string = "" });
            if (std.mem.eql(u8, property, "ItemIsMenu")) return try variant(arena, "b", .{ .boolean = menu_present(self.tray) });
            if (std.mem.eql(u8, property, "Menu")) {
                const path_text: []const u8 = if (menu_present(self.tray)) menu_path else no_menu_path;
                return try variant(arena, "o", .{ .object_path = path_text });
            }
            if (std.mem.eql(u8, property, "IconPixmap")) {
                const icon = self.tray.icon() orelse return null;
                return try variant(arena, "a(iiay)", try icon_pixmap(arena, icon));
            }
            if (std.mem.eql(u8, property, "ToolTip")) {
                const text = self.tray.tooltip() orelse return null;
                const body = try arena.dupe(Value, &.{
                    .{ .string = "" },
                    .{ .array = .{ .element = "(iiay)", .items = &.{} } },
                    .{ .string = text },
                    .{ .string = "" },
                });
                return try variant(arena, "(sa(iiay)ss)", .{ .structure = body });
            }
            return null;
        }

        fn handle_menu(self: *Self, request: *Message, iface: []const u8, member: []const u8, arena: Allocator) Error!void {
            if (std.mem.eql(u8, iface, properties_iface)) {
                const args = try request.body(arena);
                if (std.mem.eql(u8, member, "Get")) {
                    const interface_name = string_at(args, 0) orelse return error.MalformedRequest;
                    const property = string_at(args, 1) orelse return error.MalformedRequest;
                    if (!std.mem.eql(u8, interface_name, menu_iface)) return self.reply_error(request, error_unknown_property, "Unknown property");
                    const found = (try menu_property(arena, property)) orelse
                        return self.reply_error(request, error_unknown_property, "Unknown property");
                    return self.reply(request, &.{found});
                }
                if (std.mem.eql(u8, member, "GetAll")) {
                    const interface_name = string_at(args, 0) orelse return error.MalformedRequest;
                    if (!std.mem.eql(u8, interface_name, menu_iface)) return self.reply(request, &.{try dict_array(arena, &.{})});
                    const names = [_][]const u8{ "Version", "Status", "TextDirection", "IconThemePath" };
                    var props: std.ArrayList(Value) = .empty;
                    for (names) |property| {
                        if (try menu_property(arena, property)) |found| try props.append(arena, try dict_entry(arena, property, found));
                    }
                    return self.reply(request, &.{try dict_array(arena, props.items)});
                }
                return self.reply_error(request, error_unknown_method, "Unknown method");
            }
            if (std.mem.eql(u8, iface, introspectable_iface) and std.mem.eql(u8, member, "Introspect")) {
                return self.reply(request, &.{.{ .string = menu_introspect }});
            }
            if (!std.mem.eql(u8, iface, menu_iface)) return self.reply_error(request, error_unknown_method, "Unknown method");

            if (std.mem.eql(u8, member, "GetLayout")) return self.handle_get_layout(request, arena);
            if (std.mem.eql(u8, member, "GetGroupProperties")) return self.handle_get_group_properties(request, arena);
            if (std.mem.eql(u8, member, "GetProperty")) return self.handle_get_property(request, arena);
            if (std.mem.eql(u8, member, "Event")) {
                const args = try request.body(arena);
                const id = int32_at(args, 0) orelse return error.MalformedRequest;
                const event = string_at(args, 1) orelse return error.MalformedRequest;
                try self.reply(request, &.{});
                if (std.mem.eql(u8, event, "clicked")) try self.click(id);
                return;
            }
            if (std.mem.eql(u8, member, "EventGroup")) {
                const args = try request.body(arena);
                const events = array_items(args, 0) orelse return error.MalformedRequest;
                for (events) |event_value| {
                    const fields = switch (event_value) {
                        .structure => |members| members,
                        else => return error.MalformedRequest,
                    };
                    const id = int32_at(fields, 0) orelse return error.MalformedRequest;
                    const event = string_at(fields, 1) orelse return error.MalformedRequest;
                    if (std.mem.eql(u8, event, "clicked")) try self.click(id);
                }
                return self.reply(request, &.{.{ .array = .{ .element = "i", .items = &.{} } }});
            }
            if (std.mem.eql(u8, member, "AboutToShow")) {
                const args = try request.body(arena);
                const id = int32_at(args, 0) orelse return error.MalformedRequest;
                try self.reply(request, &.{.{ .boolean = false }});
                if (id == 0) if (self.tray.right_click) |handler| handler.invoke(self.tray);
                return;
            }
            if (std.mem.eql(u8, member, "AboutToShowGroup")) {
                return self.reply(request, &.{
                    .{ .array = .{ .element = "i", .items = &.{} } },
                    .{ .array = .{ .element = "i", .items = &.{} } },
                });
            }
            return self.reply_error(request, error_unknown_method, "Unknown method");
        }

        /// Activates the entry with `id` after replying to the request.
        fn click(self: *Self, id: i32) Error!void {
            const unsigned = std.math.cast(u32, id) orelse return;
            if (self.tray.find_entry(unsigned)) |entry| try entry.activate();
        }

        fn handle_get_layout(self: *Self, request: *Message, arena: Allocator) Error!void {
            const args = try request.body(arena);
            const parent_id = int32_at(args, 0) orelse return error.MalformedRequest;
            var depth = int32_at(args, 1) orelse return error.MalformedRequest;
            if (depth < 0) depth = unlimited_depth;

            var root_props: Value = try dict_array(arena, &.{});
            var children: []Value = &.{};
            if (parent_id == 0) {
                root_props = try dict_array(arena, &.{
                    try dict_entry(arena, "children-display", try variant(arena, "s", .{ .string = "submenu" })),
                });
                children = try child_variants(arena, self.tray.menu().entries(), depth);
            } else if (std.math.cast(u32, parent_id)) |unsigned| {
                if (self.tray.find_entry(unsigned)) |entry| {
                    root_props = try entry_props(arena, entry, &entry_property_names);
                    if (entry.submenu()) |sub| children = try child_variants(arena, sub.entries(), depth);
                }
            }
            const root = Value{ .structure = try arena.dupe(Value, &.{
                .{ .int32 = parent_id },
                root_props,
                .{ .array = .{ .element = "v", .items = children } },
            }) };
            return self.reply(request, &.{ .{ .uint32 = self.tray.layout_revision }, root });
        }

        fn handle_get_group_properties(self: *Self, request: *Message, arena: Allocator) Error!void {
            const args = try request.body(arena);
            const id_values = array_items(args, 0) orelse return error.MalformedRequest;
            const requested = try string_list(arena, array_items(args, 1) orelse return error.MalformedRequest);
            const names: []const []const u8 = if (requested.len == 0) &entry_property_names else requested;

            var out: std.ArrayList(Value) = .empty;
            for (id_values) |id_value| {
                const id = switch (id_value) {
                    .int32 => |raw| raw,
                    else => return error.MalformedRequest,
                };
                const unsigned = std.math.cast(u32, id) orelse continue;
                const entry = self.tray.find_entry(unsigned) orelse continue;
                const props = try entry_props(arena, entry, names);
                try out.append(arena, .{ .structure = try arena.dupe(Value, &.{ .{ .int32 = id }, props }) });
            }
            return self.reply(request, &.{.{ .array = .{ .element = "(ia{sv})", .items = out.items } }});
        }

        fn handle_get_property(self: *Self, request: *Message, arena: Allocator) Error!void {
            const args = try request.body(arena);
            const id = int32_at(args, 0) orelse return error.MalformedRequest;
            const property = string_at(args, 1) orelse return error.MalformedRequest;
            const unsigned = std.math.cast(u32, id) orelse
                return self.reply_error(request, error_item_not_found, "Item not found");
            const entry = self.tray.find_entry(unsigned) orelse
                return self.reply_error(request, error_item_not_found, "Item not found");
            const found = (try entry_property(arena, entry, property)) orelse try variant(arena, "s", .{ .string = "" });
            return self.reply(request, &.{found});
        }

        fn reply(self: *Self, request: *const Message, values: []const Value) Error!void {
            var answer = try Message.method_return(request);
            defer answer.deinit();
            try answer.append(self.gpa, values);
            _ = try self.conn.send(&answer);
        }

        fn reply_error(self: *Self, request: *const Message, error_name: [:0]const u8, text: [:0]const u8) Error!void {
            var answer = try Message.error_reply(request, error_name, text);
            defer answer.deinit();
            _ = try self.conn.send(&answer);
        }
    };
}

/// Reads whether the watcher has a registered host. A missing watcher counts as
/// "no host", the same answer SDL gives after its ListNames probe.
fn host_registered(conn: *Connection, gpa: Allocator) Error!bool {
    var request = try Message.method_call(conn.lib, watcher_service, watcher_path, properties_iface, "Get");
    defer request.deinit();
    try request.append(gpa, &.{ .{ .string = watcher_iface }, .{ .string = "IsStatusNotifierHostRegistered" } });
    var reply = conn.call(&request, call_timeout_ms) catch |err| switch (err) {
        error.ServiceUnavailable => return false,
        else => return err,
    };
    defer reply.deinit();

    var arena_state = std.heap.ArenaAllocator.init(gpa);
    defer arena_state.deinit();
    const body = try reply.body(arena_state.allocator());
    if (body.len != 1) return error.UnexpectedReply;
    return switch (body[0]) {
        .variant => |boxed| switch (boxed.value.*) {
            .boolean => |flag| flag,
            else => error.UnexpectedReply,
        },
        else => error.UnexpectedReply,
    };
}

fn register_with_watcher(conn: *Connection, gpa: Allocator, service: [:0]const u8) Error!void {
    var request = try Message.method_call(conn.lib, watcher_service, watcher_path, watcher_iface, "RegisterStatusNotifierItem");
    defer request.deinit();
    try request.append(gpa, &.{.{ .string = service }});
    var reply = try conn.call(&request, call_timeout_ms);
    reply.deinit();
}

/// Boxes a value for the arena; the returned pointer lives as long as the arena.
fn box(arena: Allocator, item: Value) Allocator.Error!*const Value {
    const slot = try arena.create(Value);
    slot.* = item;
    return slot;
}

fn variant(arena: Allocator, signature: []const u8, payload: Value) Allocator.Error!Value {
    return .{ .variant = .{ .signature = signature, .value = try box(arena, payload) } };
}

fn dict_entry(arena: Allocator, key: []const u8, payload: Value) Allocator.Error!Value {
    return .{ .dict_entry = .{ .key = try box(arena, .{ .string = key }), .value = try box(arena, payload) } };
}

/// An `a{sv}` value over the given dictionary entries.
fn dict_array(arena: Allocator, entries: []const Value) Allocator.Error!Value {
    _ = arena;
    return .{ .array = .{ .element = "{sv}", .items = entries } };
}

/// The dbusmenu property dictionary of `entry` for the requested `names`;
/// unknown names are skipped.
fn entry_props(arena: Allocator, entry: anytype, names: []const []const u8) Error!Value {
    var props: std.ArrayList(Value) = .empty;
    for (names) |property| {
        if (try entry_property(arena, entry, property)) |found| {
            try props.append(arena, try dict_entry(arena, property, found));
        }
    }
    return dict_array(arena, props.items);
}

fn entry_property(arena: Allocator, entry: anytype, property: []const u8) Error!?Value {
    if (std.mem.eql(u8, property, "label")) return try variant(arena, "s", .{ .string = entry.label() orelse "" });
    if (std.mem.eql(u8, property, "type")) {
        const kind: []const u8 = if (entry.kind_of() == .separator) "separator" else "standard";
        return try variant(arena, "s", .{ .string = kind });
    }
    if (std.mem.eql(u8, property, "enabled")) return try variant(arena, "b", .{ .boolean = entry.enabled() });
    if (std.mem.eql(u8, property, "visible")) return try variant(arena, "b", .{ .boolean = true });
    if (std.mem.eql(u8, property, "toggle-type")) {
        const kind: []const u8 = if (entry.kind_of() == .checkbox) "checkmark" else "";
        return try variant(arena, "s", .{ .string = kind });
    }
    if (std.mem.eql(u8, property, "toggle-state")) return try variant(arena, "i", .{ .int32 = if (entry.checked()) 1 else 0 });
    if (std.mem.eql(u8, property, "children-display")) {
        const display: []const u8 = if (entry.submenu() != null) "submenu" else "";
        return try variant(arena, "s", .{ .string = display });
    }
    return null;
}

/// dbusmenu properties of the root-level menu (`Version`, `Status`, ...).
fn menu_property(arena: Allocator, property: []const u8) Error!?Value {
    if (std.mem.eql(u8, property, "Version")) return try variant(arena, "u", .{ .uint32 = 3 });
    if (std.mem.eql(u8, property, "Status")) return try variant(arena, "s", .{ .string = "normal" });
    if (std.mem.eql(u8, property, "TextDirection")) return try variant(arena, "s", .{ .string = "ltr" });
    if (std.mem.eql(u8, property, "IconThemePath")) {
        return try variant(arena, "as", .{ .array = .{ .element = "s", .items = &.{} } });
    }
    return null;
}

/// The `(ia{sv}av)` layout node for `entry`. Its children are included while
/// `depth` is positive, and each child gets `depth - 1`, matching SDL's
/// MenuAppendItem recursion.
fn layout_node(arena: Allocator, entry: anytype, depth: i32) Error!Value {
    const props = try entry_props(arena, entry, &entry_property_names);
    var children: []Value = &.{};
    if (depth > 0) {
        if (entry.submenu()) |sub| children = try child_variants(arena, sub.entries(), depth - 1);
    }
    return .{ .structure = try arena.dupe(Value, &.{
        .{ .int32 = @intCast(entry.id) },
        props,
        .{ .array = .{ .element = "v", .items = children } },
    }) };
}

/// Each entry as a `v` holding its `(ia{sv}av)` layout node.
fn child_variants(arena: Allocator, entries: anytype, depth: i32) Error![]Value {
    var out: std.ArrayList(Value) = .empty;
    for (entries) |entry| {
        try out.append(arena, try variant(arena, "(ia{sv}av)", try layout_node(arena, entry, depth)));
    }
    return out.items;
}

/// The `a(iiay)` IconPixmap value for an ARGB8 view: one icon, byte rows packed
/// without padding (`width * 4` bytes per row, A R G B order).
fn icon_pixmap(arena: Allocator, icon: surface.View) Error!Value {
    const width: usize = icon.width;
    const height: usize = icon.height;
    const bytes = try arena.alloc(Value, width * height * 4);
    for (0..height) |y| {
        const row = try icon.row(y);
        for (row[0 .. width * 4], 0..) |byte, x| {
            bytes[y * width * 4 + x] = .{ .byte = byte };
        }
    }
    const pixmap = try arena.dupe(Value, &.{
        .{ .int32 = @intCast(width) },
        .{ .int32 = @intCast(height) },
        .{ .array = .{ .element = "y", .items = bytes } },
    });
    const icons = try arena.dupe(Value, &.{.{ .structure = pixmap }});
    return .{ .array = .{ .element = "(iiay)", .items = icons } };
}

/// The i-th argument if it is a string.
fn string_at(args: []const Value, index: usize) ?[]const u8 {
    if (index >= args.len) return null;
    return switch (args[index]) {
        .string => |text| text,
        else => null,
    };
}

/// The i-th argument if it is an int32.
fn int32_at(args: []const Value, index: usize) ?i32 {
    if (index >= args.len) return null;
    return switch (args[index]) {
        .int32 => |raw| raw,
        else => null,
    };
}

/// The items of the i-th argument if it is an array.
fn array_items(args: []const Value, index: usize) ?[]const Value {
    if (index >= args.len) return null;
    return switch (args[index]) {
        .array => |arr| arr.items,
        else => null,
    };
}

/// Copies the string items of `values` into arena-owned slices.
fn string_list(arena: Allocator, values: []const Value) Error![]const []const u8 {
    const out = try arena.alloc([]const u8, values.len);
    for (values, 0..) |item, i| {
        out[i] = switch (item) {
            .string => |text| text,
            else => return error.MalformedRequest,
        };
    }
    return out;
}
