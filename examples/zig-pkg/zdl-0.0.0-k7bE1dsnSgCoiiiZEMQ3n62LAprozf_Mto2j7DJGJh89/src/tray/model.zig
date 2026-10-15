//! Platform-independent status tray model: a tray icon with a tooltip and icon
//! pixels, three click handlers, and a menu tree of entries (buttons,
//! checkboxes and separators, with optional submenus). Ports the model parts of
//! SDL's `src/tray/SDL_tray_utils.c` and `include/SDL3/SDL_tray.h`; the D-Bus
//! export lives in `sni.zig`.
//!
//! Ownership: `Tray(Context).create` returns a heap-allocated tray that owns its
//! whole tree. Menus and entries are allocated individually, so `*Menu` and
//! `*Entry` pointers stay valid until the entry is removed or the tray is
//! destroyed. A removed entry frees its own submenu tree. Labels, the tooltip
//! and the icon are copied, so callers may free their inputs after each call.
//!
//! Callbacks: every callback carries a typed `Context` value (no `void*`
//! userdata). All entries and click handlers of one tray share one `Context`
//! type, chosen when the tray is instantiated, e.g. `Tray(*App)`. Callbacks run
//! synchronously when the backend dispatches a D-Bus call; nothing is queued.
//!
//! Change tracking: every mutation records what the backend must announce in
//! `Tray.changes`; `Tray.acknowledge` clears it after the backend has emitted
//! the signals. The tray has no threads and no global state.
//!
//! Deliberate differences from SDL:
//! - The root menu always exists (SDL needs `SDL_CreateTrayMenu` first).
//! - `pos` means "insert at index pos" (`null` appends). SDL's
//!   `SDL_ListInsertAtPosition` inserts one place early for every `pos >= 2`
//!   (for example pos 2 lands at index 1); this model keeps the documented
//!   contract instead.
//! - SDL's `SDL_TRAYENTRY_SUBMENU` flag is not needed: `Entry.create_submenu`
//!   prepares the submenu.
//! - Positions beyond the end are an error instead of appending silently.
//! - Click callbacks return nothing. SDL's boolean return was ignored by the
//!   D-Bus driver, so it carried no behavior.

const std = @import("std");
const Allocator = std.mem.Allocator;
const surface = @import("../video/surface.zig");

pub const Error = surface.Error || error{
    /// The insertion index is larger than the number of entries.
    IndexOutOfRange,
    /// The entry already has a submenu.
    SubmenuExists,
    /// Separators have no label; `set_label` cannot give them one.
    SeparatorHasNoLabel,
    /// The operation applies only to checkbox entries.
    NotCheckbox,
    /// Entry ids are 31-bit (dbusmenu uses `i`) and were all used up.
    IdsExhausted,
};

/// Kinds of menu entry, fixed when the entry is created.
pub const EntryKind = enum {
    /// A plain entry that runs its action when activated.
    button,
    /// An entry with a toggled check state; activation flips `checked`.
    checkbox,
    /// A non-interactive divider with no label.
    separator,
};

/// Creation options for a menu entry. Separators ignore them.
pub const EntryOptions = struct {
    /// Make the entry a checkbox (SDL_TRAYENTRY_CHECKBOX).
    checkbox: bool = false,
    /// Initial check state, meaningful for checkboxes (SDL_TRAYENTRY_CHECKED).
    checked: bool = false,
    /// Initial enabled state (SDL_TRAYENTRY_DISABLED is the inverse).
    enabled: bool = true,
};

/// A typed callback with its context value. `Target` is the object passed to
/// the function (`*Entry(...)` for actions, `*Tray(...)` for click handlers).
pub fn Callback(comptime Context: type, comptime Target: type) type {
    return struct {
        const Self = @This();

        context: Context,
        function: *const fn (context: Context, target: Target) void,

        pub fn invoke(self: Self, target: Target) void {
            self.function(self.context, target);
        }
    };
}

/// Changes the backend has not announced yet. `properties` lists entry ids whose
/// properties changed without a structural change; it is borrowed until the next
/// mutation or `acknowledge`.
pub const Changes = struct {
    icon: bool,
    tooltip: bool,
    /// The entry structure changed (insert, remove, submenu creation).
    layout: bool,
    properties: []const u32,

    pub fn any(self: Changes) bool {
        return self.icon or self.tooltip or self.layout or self.properties.len != 0;
    }
};

/// The tray: one icon, one tooltip, three click handlers and the root menu.
pub fn Tray(comptime Context: type) type {
    return struct {
        const Self = @This();

        allocator: Allocator,
        root: *Menu(Context),
        tooltip_text: ?[]u8 = null,
        /// Owned ARGB8 copy of the icon (`.argb8` is byte order A, R, G, B, which is
        /// the StatusNotifierItem network order, so the backend needs no swizzle).
        icon_pixels: ?surface.Surface = null,
        left_click: ?Callback(Context, *Self) = null,
        right_click: ?Callback(Context, *Self) = null,
        middle_click: ?Callback(Context, *Self) = null,
        /// Monotonic dbusmenu layout revision; bumped on every structural change.
        layout_revision: u32 = 1,
        next_id: u32 = 1,
        pending_icon: bool = false,
        pending_tooltip: bool = false,
        pending_layout: bool = false,
        pending_properties: std.ArrayList(u32) = .empty,

        /// Allocates an empty tray with no icon, tooltip or entries.
        pub fn create(allocator: Allocator) Allocator.Error!*Self {
            const self = try allocator.create(Self);
            errdefer allocator.destroy(self);
            const root = try allocator.create(Menu(Context));
            root.* = .{ .tray = self, .parent = null };
            self.* = .{ .allocator = allocator, .root = root };
            return self;
        }

        /// Frees the menu tree, icon, tooltip and this tray. Entry and menu
        /// pointers obtained from it become invalid.
        pub fn destroy(self: *Self) void {
            const gpa = self.allocator;
            self.root.deinit_tree();
            gpa.destroy(self.root);
            if (self.tooltip_text) |text| gpa.free(text);
            if (self.icon_pixels) |*pixels_held| pixels_held.deinit();
            self.pending_properties.deinit(gpa);
            gpa.destroy(self);
        }

        /// The root menu. Its entries form the menu shown by the desktop.
        pub fn menu(self: *const Self) *Menu(Context) {
            return self.root;
        }

        /// Copies `source` to ARGB8 and replaces the icon. Null removes the icon.
        /// Any source format and palette is accepted; conversion uses the
        /// surface module's byte-color precision.
        pub fn set_icon(self: *Self, source: ?surface.View) surface.Error!void {
            const converted: ?surface.Surface = if (source) |view|
                try surface.Surface.convert(self.allocator, view, .argb8, null)
            else
                null;
            if (self.icon_pixels) |*previous| previous.deinit();
            self.icon_pixels = converted;
            self.pending_icon = true;
        }

        /// The borrowed ARGB8 icon, valid until the next `set_icon`.
        pub fn icon(self: *const Self) ?surface.View {
            return if (self.icon_pixels) |icon_surface| icon_surface.view else null;
        }

        /// Copies the tooltip text. Null clears it.
        pub fn set_tooltip(self: *Self, text: ?[]const u8) Allocator.Error!void {
            const copy: ?[]u8 = if (text) |t| try self.allocator.dupe(u8, t) else null;
            if (self.tooltip_text) |old| self.allocator.free(old);
            self.tooltip_text = copy;
            self.pending_tooltip = true;
        }

        /// The borrowed tooltip text, or null when none is set.
        pub fn tooltip(self: *const Self) ?[]const u8 {
            return self.tooltip_text;
        }

        pub fn set_left_click(self: *Self, handler: ?Callback(Context, *Self)) void {
            self.left_click = handler;
        }

        pub fn set_right_click(self: *Self, handler: ?Callback(Context, *Self)) void {
            self.right_click = handler;
        }

        pub fn set_middle_click(self: *Self, handler: ?Callback(Context, *Self)) void {
            self.middle_click = handler;
        }

        /// Finds the entry with dbusmenu id `id` anywhere in the tree.
        pub fn find_entry(self: *Self, id: u32) ?*Entry(Context) {
            return self.root.find(id);
        }

        /// The pending change set. `properties` is borrowed until the next mutation.
        pub fn changes(self: *const Self) Changes {
            return .{
                .icon = self.pending_icon,
                .tooltip = self.pending_tooltip,
                .layout = self.pending_layout,
                .properties = self.pending_properties.items,
            };
        }

        /// Clears the pending change set after the backend announced it.
        pub fn acknowledge(self: *Self) void {
            self.pending_icon = false;
            self.pending_tooltip = false;
            self.pending_layout = false;
            self.pending_properties.clearRetainingCapacity();
        }

        fn allocate_id(self: *Self) Error!u32 {
            // dbusmenu uses 32-bit signed ids; 0 is reserved for the root.
            if (self.next_id >= std.math.maxInt(i32)) return error.IdsExhausted;
            const id = self.next_id;
            self.next_id += 1;
            return id;
        }

        fn mark_layout(self: *Self) void {
            self.pending_layout = true;
            self.layout_revision +%= 1;
        }

        fn mark_property(self: *Self, id: u32) Allocator.Error!void {
            if (self.pending_layout) return;
            for (self.pending_properties.items) |existing| {
                if (existing == id) return;
            }
            try self.pending_properties.append(self.allocator, id);
        }
    };
}

/// A menu level: an ordered list of entries. The root menu belongs to the tray;
/// submenus belong to the entry they hang from.
pub fn Menu(comptime Context: type) type {
    return struct {
        const Self = @This();

        tray: *Tray(Context),
        parent: ?*Entry(Context),
        items: std.ArrayList(*Entry(Context)) = .empty,

        /// The entries in display order. Borrowed until the next insert or remove.
        pub fn entries(self: *const Self) []const *Entry(Context) {
            return self.items.items;
        }

        /// The entry this menu hangs from, or null for the root menu.
        pub fn parent_entry(self: *const Self) ?*Entry(Context) {
            return self.parent;
        }

        /// Inserts an entry at `index` (null appends). A null label makes a
        /// separator. Labels are copied.
        pub fn insert(self: *Self, index: ?usize, label: ?[]const u8, options: EntryOptions) Error!*Entry(Context) {
            const tray_ref = self.tray;
            const position = index orelse self.items.items.len;
            if (position > self.items.items.len) return error.IndexOutOfRange;

            const gpa = tray_ref.allocator;
            const id = try tray_ref.allocate_id();
            const kind: EntryKind = if (label == null) .separator else if (options.checkbox) .checkbox else .button;
            const text = if (label) |t| try gpa.dupe(u8, t) else try gpa.dupe(u8, "");
            errdefer gpa.free(text);

            const entry = try gpa.create(Entry(Context));
            errdefer gpa.destroy(entry);
            entry.* = .{
                .id = id,
                .parent = self,
                .kind = kind,
                .label_text = text,
                .checked_state = options.checked,
                .enabled_state = options.enabled,
            };
            try self.items.insert(gpa, position, entry);
            tray_ref.mark_layout();
            return entry;
        }

        /// Frees every entry and submenu below this menu, keeping the menu itself.
        fn deinit_tree(self: *Self) void {
            const gpa = self.tray.allocator;
            for (self.items.items) |entry| entry.destroy(gpa);
            self.items.deinit(gpa);
            self.items = .empty;
        }

        fn find(self: *Self, id: u32) ?*Entry(Context) {
            for (self.items.items) |entry| {
                if (entry.id == id) return entry;
                if (entry.submenu_menu) |sub| {
                    if (sub.find(id)) |found| return found;
                }
            }
            return null;
        }
    };
}

/// One menu item. Entries are owned by their menu and freed by `remove` or by
/// destroying the tray.
pub fn Entry(comptime Context: type) type {
    return struct {
        const Self = @This();

        /// dbusmenu item id, unique within the tray for its whole life.
        id: u32,
        parent: *Menu(Context),
        kind: EntryKind,
        label_text: []u8,
        checked_state: bool,
        enabled_state: bool,
        action: ?Callback(Context, *Self) = null,
        submenu_menu: ?*Menu(Context) = null,

        /// The menu containing this entry.
        pub fn menu(self: *const Self) *Menu(Context) {
            return self.parent;
        }

        pub fn kind_of(self: *const Self) EntryKind {
            return self.kind;
        }

        /// The label, or null for separators.
        pub fn label(self: *const Self) ?[]const u8 {
            return if (self.kind == .separator) null else self.label_text;
        }

        /// Replaces the label. Separators have none, so that is an error.
        pub fn set_label(self: *Self, text: []const u8) Error!void {
            if (self.kind == .separator) return error.SeparatorHasNoLabel;
            const tray_ref = self.parent.tray;
            const copy = try tray_ref.allocator.dupe(u8, text);
            tray_ref.allocator.free(self.label_text);
            self.label_text = copy;
            try tray_ref.mark_property(self.id);
        }

        pub fn checked(self: *const Self) bool {
            return self.checked_state;
        }

        /// Sets the check state of a checkbox entry.
        pub fn set_checked(self: *Self, value: bool) Error!void {
            if (self.kind != .checkbox) return error.NotCheckbox;
            self.checked_state = value;
            try self.parent.tray.mark_property(self.id);
        }

        pub fn enabled(self: *const Self) bool {
            return self.enabled_state;
        }

        pub fn set_enabled(self: *Self, value: bool) Allocator.Error!void {
            self.enabled_state = value;
            try self.parent.tray.mark_property(self.id);
        }

        /// Sets the action run on activation. Null clears it.
        pub fn set_action(self: *Self, callback: ?Callback(Context, *Self)) void {
            self.action = callback;
        }

        /// Activates the entry as a user click would: a checkbox flips its state
        /// first, then the action runs. Disabled entries are not activated by
        /// the backend; calling `activate` directly always runs the action.
        pub fn activate(self: *Self) Allocator.Error!void {
            if (self.kind == .checkbox) {
                self.checked_state = !self.checked_state;
                try self.parent.tray.mark_property(self.id);
            }
            if (self.action) |action| action.invoke(self);
        }

        /// The submenu, if one was created.
        pub fn submenu(self: *const Self) ?*Menu(Context) {
            return self.submenu_menu;
        }

        /// Creates the (empty) submenu of this entry.
        pub fn create_submenu(self: *Self) Error!*Menu(Context) {
            if (self.submenu_menu != null) return error.SubmenuExists;
            const tray_ref = self.parent.tray;
            const sub = try tray_ref.allocator.create(Menu(Context));
            errdefer tray_ref.allocator.destroy(sub);
            sub.* = .{ .tray = tray_ref, .parent = self };
            self.submenu_menu = sub;
            tray_ref.mark_layout();
            return sub;
        }

        /// Removes this entry and its submenu tree from its menu. `self` is invalid afterwards.
        pub fn remove(self: *Self) void {
            const parent_menu = self.parent;
            const tray_ref = parent_menu.tray;
            for (parent_menu.items.items, 0..) |candidate, index| {
                if (candidate == self) {
                    _ = parent_menu.items.orderedRemove(index);
                    break;
                }
            }
            self.destroy(tray_ref.allocator);
            tray_ref.mark_layout();
        }

        /// Frees this entry's storage and its submenu tree. Does not touch the
        /// parent list.
        fn destroy(self: *Self, gpa: Allocator) void {
            if (self.submenu_menu) |sub| {
                sub.deinit_tree();
                gpa.destroy(sub);
            }
            gpa.free(self.label_text);
            gpa.destroy(self);
        }
    };
}
