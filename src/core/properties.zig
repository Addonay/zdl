//! Explicitly owned, typed property sets for dynamic object metadata.
//! Property IDs, global registries, void pointers and cleanup callbacks are
//! absent. Objects hold their own property set and own their resources directly.
//! A property set owns its names and string values, while resource values are
//! borrowed and retain the concrete type selected by the caller.
// Ported from SDL_properties.c; native ownership and errors replace the C ABI.
const std = @import("std");

/// Creates a heterogeneous property set. Use `void` when only primitive values
/// are needed. A concrete Resource type can be a pointer, handle or tagged union
/// of application resources; it is never erased to anyopaque.
///
/// Mutations are not synchronized. Share a set under the owning object's lock
/// if necessary; a hidden lock cannot make a borrowed string safe after return.
pub fn Properties(comptime Resource: type) type {
    return struct {
        const Self = @This();

        /// Strings are copied on insertion. Resource values are borrowed: their
        /// owners must remain alive while readers can access those properties.
        pub const Value = if (Resource == void) union(enum) {
            boolean: bool,
            integer: i64,
            float: f64,
            string: []const u8,
        } else union(enum) {
            boolean: bool,
            integer: i64,
            float: f64,
            string: []const u8,
            resource: Resource,
        };
        /// Tags select a concrete return type for get at compile time.
        pub const Kind = std.meta.Tag(Value);
        /// Allocation and lookup failures are returned to the caller directly.
        pub const Error = std.mem.Allocator.Error || error{ InvalidName, Missing, WrongType };
        const Map = std.StringHashMapUnmanaged(Value);

        allocator: std.mem.Allocator,
        map: Map = .empty,

        /// Creates an empty set without allocation. Do not copy it after its
        /// first insertion; clone explicitly and deinit before the allocator.
        pub fn init(allocator: std.mem.Allocator) Self {
            return .{ .allocator = allocator };
        }

        /// Frees owned names and strings. Borrowed resource values are untouched.
        /// Repeated calls are safe, and the set may be reused with its allocator.
        pub fn deinit(self: *Self) void {
            var entries = self.map.iterator();
            while (entries.next()) |entry| {
                self.allocator.free(entry.key_ptr.*);
                destroy_value(self.allocator, entry.value_ptr.*);
            }
            self.map.deinit(self.allocator);
            self.map = .empty;
        }

        /// Inserts or replaces a named value. Names must be nonempty slices.
        /// All required allocation happens before replacing an existing value,
        /// so failure preserves it. Source names/strings may refer into this set.
        pub fn set(self: *Self, name: []const u8, value: Value) Error!void {
            if (name.len == 0) return error.InvalidName;
            const owned_value = try duplicate_value(self.allocator, value);
            errdefer destroy_value(self.allocator, owned_value);
            if (self.map.getPtr(name)) |existing| {
                destroy_value(self.allocator, existing.*);
                existing.* = owned_value;
                return;
            }
            const owned_name = try self.allocator.dupe(u8, name);
            errdefer self.allocator.free(owned_name);
            try self.map.put(self.allocator, owned_name, owned_value);
        }

        /// Returns the selected payload type. Missing and mismatched properties
        /// are explicit errors; conversions and fallback values belong to the
        /// caller instead of silently coercing strings, booleans and numbers.
        /// Borrowed strings survive unrelated mutations, but not replacement or
        /// removal of that property, copy_from, or deinitialization of this set.
        pub fn get(self: *const Self, comptime kind: Kind, name: []const u8) error{ Missing, WrongType }!@FieldType(Value, @tagName(kind)) {
            const value = self.map.get(name) orelse return error.Missing;
            if (std.meta.activeTag(value) != kind) return error.WrongType;
            return @field(value, @tagName(kind));
        }

        /// Returns a borrowed tagged value for callers that inspect its kind at
        /// runtime. There is no allocation or cached string conversion involved.
        pub fn lookup(self: *const Self, name: []const u8) ?Value {
            return self.map.get(name);
        }

        /// Removes a property and releases its owned storage. False means the
        /// name was absent. Resource ownership remains with the external owner.
        pub fn remove(self: *Self, name: []const u8) bool {
            const removed = self.map.fetchRemove(name) orelse return false;
            self.allocator.free(removed.key);
            destroy_value(self.allocator, removed.value);
            return true;
        }

        /// Number of named entries; querying this never allocates.
        pub fn count(self: *const Self) usize {
            return self.map.count();
        }

        /// A detached copy with newly allocated names and strings. Resources
        /// remain borrowed; copying metadata does not clone the resources it names.
        pub fn clone(self: *const Self, allocator: std.mem.Allocator) Error!Self {
            var copy = Self.init(allocator);
            errdefer copy.deinit();
            var entries = self.map.iterator();
            while (entries.next()) |entry| try copy.set(entry.key_ptr.*, entry.value_ptr.*);
            return copy;
        }

        /// Copies all source entries into this set, preserving unrelated names.
        /// The operation is transactional: allocation failure leaves both sets
        /// unchanged. Self-copy is a no-op and performs no allocation.
        pub fn copy_from(self: *Self, source: *const Self) Error!void {
            if (self == source) return;
            var replacement = try self.clone(self.allocator);
            errdefer replacement.deinit();
            var entries = source.map.iterator();
            while (entries.next()) |entry| try replacement.set(entry.key_ptr.*, entry.value_ptr.*);
            var previous = self.*;
            self.* = replacement;
            previous.deinit();
        }

        /// A borrowed entry. Names and strings must not be freed or modified.
        pub const Entry = struct { name: []const u8, value: Value };
        /// Enumeration exposes values rather than mutable pointers into the map,
        /// which could bypass its string-ownership rules. Mutation invalidates it.
        pub const Iterator = struct {
            inner: Map.Iterator,
            pub fn next(self: *Iterator) ?Entry {
                const entry = self.inner.next() orelse return null;
                return .{ .name = entry.key_ptr.*, .value = entry.value_ptr.* };
            }
        };

        /// Enumerates entries in unspecified hash order, without allocation.
        pub fn iterator(self: *const Self) Iterator {
            return .{ .inner = self.map.iterator() };
        }

        fn duplicate_value(allocator: std.mem.Allocator, item: Value) std.mem.Allocator.Error!Value {
            return switch (item) {
                .string => |text| .{ .string = try allocator.dupe(u8, text) },
                else => item,
            };
        }
        fn destroy_value(allocator: std.mem.Allocator, item: Value) void {
            switch (item) {
                .string => |text| allocator.free(text),
                else => {},
            }
        }
    };
}
