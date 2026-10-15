//! Typed D-Bus values for encoding into and decoding from libdbus messages.
//!
//! `Value` mirrors the D-Bus type system: basic types, arrays, structs, dict
//! entries and variants. Encoding walks the value tree with libdbus iterators,
//! so libdbus validates signatures; decoding copies everything into the caller's
//! arena, so decoded values own their memory and outlive the message.
//!
//! Strings that libdbus receives must be NUL-terminated. Encoding copies them
//! into temporary NUL-terminated buffers from the allocator passed by the caller.

const std = @import("std");
const Allocator = std.mem.Allocator;

/// Encoding and decoding failures.
pub const Error = error{
    /// libdbus rejected a value (wrong signature, invalid object path, ...).
    InvalidValue,
    /// A decoded value has a type this model does not represent.
    UnsupportedType,
    OutOfMemory,
};

/// One D-Bus value.
pub const Value = union(enum) {
    byte: u8,
    boolean: bool,
    int16: i16,
    uint16: u16,
    int32: i32,
    uint32: u32,
    int64: i64,
    uint64: u64,
    double: f64,
    string: []const u8,
    object_path: []const u8,
    /// A complete type signature.
    signature: []const u8,
    /// A file descriptor number; the message carries it out of band (SCM_RIGHTS).
    unix_fd: i32,
    /// Elements of one type. `element` is the element's complete type
    /// signature. It is required to encode an empty array; decoded arrays set
    /// it from the first element when the array is not empty.
    array: Array,
    /// Struct members in order.
    structure: []const Value,
    dict_entry: DictEntry,
    /// The payload's complete type signature and its value.
    variant: Variant,

    pub const Array = struct {
        element: []const u8,
        items: []const Value,
    };

    pub const DictEntry = struct {
        key: *const Value,
        value: *const Value,
    };

    pub const Variant = struct {
        signature: []const u8,
        value: *const Value,
    };
};

/// Builder for `a{sv}` option dictionaries used by portal and notification calls.
/// Owns the storage that the built `Value` borrows, so it must outlive the message.
pub const VariantDict = struct {
    arena: std.heap.ArenaAllocator,
    entries: std.ArrayList(Value) = .empty,

    pub fn init(gpa: Allocator) VariantDict {
        return .{ .arena = std.heap.ArenaAllocator.init(gpa) };
    }

    pub fn deinit(self: *VariantDict) void {
        self.arena.deinit();
        self.* = undefined;
    }

    /// Adds `key` holding `payload`, which must have the complete type `payload_sig`.
    pub fn put(self: *VariantDict, key: []const u8, payload_sig: []const u8, payload: Value) Allocator.Error!void {
        const a = self.arena.allocator();
        const key_box = try a.create(Value);
        key_box.* = .{ .string = try a.dupe(u8, key) };
        const payload_box = try a.create(Value);
        payload_box.* = payload;
        const variant_box = try a.create(Value);
        variant_box.* = .{ .variant = .{ .signature = try a.dupe(u8, payload_sig), .value = payload_box } };
        try self.entries.append(a, .{ .dict_entry = .{ .key = key_box, .value = variant_box } });
    }

    pub fn put_string(self: *VariantDict, key: []const u8, text: []const u8) Allocator.Error!void {
        const a = self.arena.allocator();
        try self.put(key, "s", .{ .string = try a.dupe(u8, text) });
    }

    pub fn put_bool(self: *VariantDict, key: []const u8, flag: bool) Allocator.Error!void {
        try self.put(key, "b", .{ .boolean = flag });
    }

    /// Stores a byte string (`ay`), used for paths that the portal takes as
    /// NUL-terminated bytes. The terminating NUL is included, as the portal expects.
    pub fn put_path_bytes(self: *VariantDict, key: []const u8, path: []const u8) Allocator.Error!void {
        const a = self.arena.allocator();
        const items = try a.alloc(Value, path.len + 1);
        for (path, 0..) |c, i| items[i] = .{ .byte = c };
        items[path.len] = .{ .byte = 0 };
        try self.put(key, "ay", .{ .array = .{ .element = "y", .items = items } });
    }

    /// The `a{sv}` value. Borrows from this builder.
    pub fn value_of(self: *const VariantDict) Value {
        return .{ .array = .{ .element = "{sv}", .items = self.entries.items } };
    }
};

/// Length of the complete type at the start of `sig`; malformed input yields the whole slice.
pub fn complete_type_len(sig: []const u8) usize {
    if (sig.len == 0) return 0;
    var i: usize = 0;
    while (i < sig.len and sig[i] == 'a') i += 1;
    if (i >= sig.len) return sig.len;
    switch (sig[i]) {
        '(', '{' => {
            const open = sig[i];
            const close: u8 = if (open == '(') ')' else '}';
            var depth: usize = 0;
            var j = i;
            while (j < sig.len) : (j += 1) {
                if (sig[j] == open) depth += 1;
                if (sig[j] == close) {
                    depth -= 1;
                    if (depth == 0) return j + 1;
                }
            }
            return sig.len;
        },
        else => return i + 1,
    }
}
