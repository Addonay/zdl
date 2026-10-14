//! Application metadata (SDL_SetAppMetadata / SDL_SetAppMetadataProperty /
//! SDL_GetAppMetadataProperty in SDL.c) as an owned value instead of entries in
//! a process-global property set. Backends that want the app's name or
//! reverse-DNS identifier (window class, audio stream names, portals, tray
//! icons) take a `*const Metadata` or the strings it yields.
//!
//! Lookup order for `get`, as SDL: for `name` and `identifier` a nonempty
//! `SDL_APP_NAME` / `SDL_APP_ID` hint wins; then the stored nonempty value; then
//! defaults: `name` falls back to the executable name given at `init` (SDL asks
//! the platform for it) and then to "SDL Application"; `type` to
//! "application". All other properties have no default. Deliberate difference:
//! SDL's Ubuntu Touch app-id/version fallbacks are not ported.
//!
//! Strings are copied on `set`. Results are borrowed and become invalid when
//! that property is next set or the value is deinitialized. Not synchronized.
const std = @import("std");
const Allocator = std.mem.Allocator;
const hints_mod = @import("../core/hints.zig");

/// The seven properties SDL defines.
pub const Property = enum {
    name,
    version,
    identifier,
    creator,
    copyright,
    url,
    type,

    /// SDL's property key, e.g. "SDL.app.metadata.name".
    pub fn key(self: Property) []const u8 {
        return switch (self) {
            .name => "SDL.app.metadata.name",
            .version => "SDL.app.metadata.version",
            .identifier => "SDL.app.metadata.identifier",
            .creator => "SDL.app.metadata.creator",
            .copyright => "SDL.app.metadata.copyright",
            .url => "SDL.app.metadata.url",
            .type => "SDL.app.metadata.type",
        };
    }

    /// Parses an SDL property key; null if it is not an app metadata key.
    pub fn from_key(text: []const u8) ?Property {
        inline for (comptime std.enums.values(Property)) |property| {
            if (std.mem.eql(u8, text, property.key())) return property;
        }
        return null;
    }
};

/// Default of `Property.name` when the executable name is also unknown.
pub const default_name = "SDL Application";
/// Default of `Property.type`.
pub const default_type = "application";

pub const Metadata = struct {
    allocator: Allocator,
    /// Fallback application name, normally `exe_name_from_path(argv[0])`.
    /// Borrowed; must outlive this value.
    exe_name: ?[]const u8 = null,
    values: [property_count]?[]u8 = @splat(null),

    const property_count = std.enums.values(Property).len;

    pub fn init(allocator: Allocator) Metadata {
        return .{ .allocator = allocator };
    }

    pub fn deinit(self: *Metadata) void {
        for (self.values) |maybe| if (maybe) |text| self.allocator.free(text);
        self.* = undefined;
    }

    /// SDL_SetAppMetadata: name, version and identifier together. Null clears.
    /// Allocation failure may leave earlier properties of the call updated.
    pub fn set_basic(self: *Metadata, name: ?[]const u8, version: ?[]const u8, identifier: ?[]const u8) Allocator.Error!void {
        try self.set(.name, name);
        try self.set(.version, version);
        try self.set(.identifier, identifier);
    }

    /// SDL_SetAppMetadataProperty. A null value removes the stored property.
    pub fn set(self: *Metadata, property: Property, value: ?[]const u8) Allocator.Error!void {
        const slot = &self.values[@backingInt(property)];
        const copy: ?[]u8 = if (value) |text| try self.allocator.dupe(u8, text) else null;
        if (slot.*) |old| self.allocator.free(old);
        slot.* = copy;
    }

    /// The value as the application set it, ignoring hints and defaults.
    pub fn stored(self: *const Metadata, property: Property) ?[]const u8 {
        return self.values[@backingInt(property)];
    }

    /// SDL_GetAppMetadataProperty. `hints` (optional) supplies SDL_APP_NAME and
    /// SDL_APP_ID overrides.
    pub fn get(self: *const Metadata, property: Property, hints: ?*const hints_mod.Hints) ?[]const u8 {
        if (hints) |table| {
            const hinted = switch (property) {
                .name => table.get(hints_mod.names.app_name),
                .identifier => table.get(hints_mod.names.app_id),
                else => null,
            };
            if (hinted) |text| if (text.len > 0) return text;
        }
        if (self.stored(property)) |text| if (text.len > 0) return text;
        return switch (property) {
            .name => self.exe_name orelse default_name,
            .type => default_type,
            else => null,
        };
    }
};

/// The file name part of an `argv[0]`-style path (after the last '/' or '\\'),
/// or null for an empty result.
pub fn exe_name_from_path(path: []const u8) ?[]const u8 {
    const start = if (std.mem.findScalarLast(u8, path, '/')) |i| i + 1 else 0;
    const alt = if (std.mem.findScalarLast(u8, path, '\\')) |i| i + 1 else 0;
    const name = path[@max(start, alt)..];
    return if (name.len == 0) null else name;
}

const testing = std.testing;

test "defaults and stored values" {
    var meta = Metadata.init(testing.allocator);
    defer meta.deinit();
    try testing.expectEqualStrings(default_name, meta.get(.name, null).?);
    try testing.expectEqualStrings("application", meta.get(.type, null).?);
    try testing.expectEqual(@as(?[]const u8, null), meta.get(.version, null));

    meta.exe_name = "mygame";
    try testing.expectEqualStrings("mygame", meta.get(.name, null).?);

    try meta.set_basic("My Game", "1.2", "com.example.game");
    try testing.expectEqualStrings("My Game", meta.get(.name, null).?);
    try testing.expectEqualStrings("1.2", meta.get(.version, null).?);
    try testing.expectEqualStrings("com.example.game", meta.get(.identifier, null).?);

    try meta.set(.name, "");
    try testing.expectEqualStrings("mygame", meta.get(.name, null).?); // empty falls through
    try meta.set(.name, null);
    try testing.expectEqual(@as(?[]const u8, null), meta.stored(.name));
    try meta.set(.type, "game");
    try meta.set(.type, "mediaplayer");
    try testing.expectEqualStrings("mediaplayer", meta.get(.type, null).?);
}

test "hints override name and identifier only" {
    var env = std.process.Environ.Map.init(testing.allocator);
    defer env.deinit();
    var hints = hints_mod.Hints.init(testing.allocator, &env);
    defer hints.deinit();
    var meta = Metadata.init(testing.allocator);
    defer meta.deinit();
    try meta.set_basic("Stored", "9", "org.stored");
    _ = try hints.set(hints_mod.names.app_name, "Hinted");
    _ = try hints.set(hints_mod.names.app_id, "org.hinted");
    try testing.expectEqualStrings("Hinted", meta.get(.name, &hints).?);
    try testing.expectEqualStrings("org.hinted", meta.get(.identifier, &hints).?);
    try testing.expectEqualStrings("9", meta.get(.version, &hints).?);
    _ = try hints.set(hints_mod.names.app_name, "");
    try testing.expectEqualStrings("Stored", meta.get(.name, &hints).?);
}

test "property keys round-trip" {
    for (std.enums.values(Property)) |property| {
        try testing.expectEqual(property, Property.from_key(property.key()).?);
    }
    try testing.expectEqual(@as(?Property, null), Property.from_key("SDL.app.metadata.bogus"));
}

test "executable name from a path" {
    try testing.expectEqualStrings("game", exe_name_from_path("/usr/bin/game").?);
    try testing.expectEqualStrings("game.exe", exe_name_from_path("C:\\x\\game.exe").?);
    try testing.expectEqualStrings("game", exe_name_from_path("game").?);
    try testing.expectEqual(@as(?[]const u8, null), exe_name_from_path("/usr/bin/"));
}
