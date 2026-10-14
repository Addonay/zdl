//! D-Bus messages built on libdbus. A `Message` owns one libdbus message
//! reference; `deinit` releases it. Incoming messages come from
//! `Connection.receive` or a reply from `Connection.call`.
//!
//! Strings passed to constructors must be NUL-terminated (`[:0]const u8`), as
//! libdbus takes C strings. Strings returned by accessors are borrowed from the
//! message and valid until `deinit`.

const std = @import("std");
const Allocator = std.mem.Allocator;
const binding = @import("binding.zig");
const connection = @import("connection.zig");
const value = @import("value.zig");
const Value = value.Value;

pub const Error = value.Error || error{
    /// libdbus could not allocate the message.
    OutOfMemory,
    /// libdbus refused to serialize the arguments.
    InvalidValue,
};

/// The message type.
pub const Kind = enum {
    method_call,
    method_return,
    error_reply,
    signal,
    invalid,

    fn from_raw(code: c_int) Kind {
        return switch (code) {
            binding.message_method_call => .method_call,
            binding.message_method_return => .method_return,
            binding.message_error => .error_reply,
            binding.message_signal => .signal,
            else => .invalid,
        };
    }
};

pub const Message = struct {
    lib: *const connection.Library,
    raw: *binding.RawMessage,

    /// Creates a method call on bus name `bus_name` (null for a direct peer).
    pub fn method_call(lib: *const connection.Library, bus_name: ?[:0]const u8, object_path: [:0]const u8, interface_name: ?[:0]const u8, member_name: [:0]const u8) Error!Message {
        const raw = lib.libdbus.fns.dbus_message_new_method_call(if (bus_name) |d| d.ptr else null, object_path.ptr, if (interface_name) |i| i.ptr else null, member_name.ptr) orelse return error.OutOfMemory;
        return .{ .lib = lib, .raw = raw };
    }

    /// Creates a signal emitted from `object_path`.
    pub fn signal(lib: *const connection.Library, object_path: [:0]const u8, interface_name: [:0]const u8, member_name: [:0]const u8) Error!Message {
        const raw = lib.libdbus.fns.dbus_message_new_signal(object_path.ptr, interface_name.ptr, member_name.ptr) orelse return error.OutOfMemory;
        return .{ .lib = lib, .raw = raw };
    }

    /// Creates a reply to `request`.
    pub fn method_return(request: *const Message) Error!Message {
        const raw = request.lib.libdbus.fns.dbus_message_new_method_return(request.raw) orelse return error.OutOfMemory;
        return .{ .lib = request.lib, .raw = raw };
    }

    /// Creates an error reply to `request` with a name and text.
    pub fn error_reply(request: *const Message, name: [:0]const u8, text: [:0]const u8) Error!Message {
        const raw = request.lib.libdbus.fns.dbus_message_new_error(request.raw, name.ptr, text.ptr) orelse return error.OutOfMemory;
        return .{ .lib = request.lib, .raw = raw };
    }

    pub fn deinit(self: *Message) void {
        self.lib.libdbus.fns.dbus_message_unref(self.raw);
        self.* = undefined;
    }

    /// Appends the arguments of `values` to the message body. `gpa` provides
    /// temporary NUL-terminated copies; libdbus copies everything it keeps.
    pub fn append(self: *Message, gpa: Allocator, values: []const Value) Error!void {
        var iter: binding.Iter = undefined;
        self.lib.libdbus.fns.dbus_message_iter_init_append(self.raw, &iter);
        try append_all(self.lib, gpa, &iter, values);
    }

    /// Decodes the whole body into `arena`-owned values.
    pub fn body(self: *const Message, arena: Allocator) Error![]Value {
        var iter: binding.Iter = undefined;
        if (self.lib.libdbus.fns.dbus_message_iter_init(self.raw, &iter) == 0) return &.{};
        return decode_all(self.lib, arena, &iter);
    }

    /// Sets the no-reply flag so the bus does not expect an answer.
    pub fn set_no_reply(self: *Message, enabled: bool) void {
        self.lib.libdbus.fns.dbus_message_set_no_reply(self.raw, @intFromBool(enabled));
    }

    pub fn kind(self: *const Message) Kind {
        return Kind.from_raw(self.lib.libdbus.fns.dbus_message_get_type(self.raw));
    }

    pub fn serial(self: *const Message) u32 {
        return self.lib.libdbus.fns.dbus_message_get_serial(self.raw);
    }

    pub fn reply_serial(self: *const Message) u32 {
        return self.lib.libdbus.fns.dbus_message_get_reply_serial(self.raw);
    }

    pub fn path(self: *const Message) ?[]const u8 {
        return binding.span(self.lib.libdbus.fns.dbus_message_get_path(self.raw));
    }

    pub fn interface(self: *const Message) ?[]const u8 {
        return binding.span(self.lib.libdbus.fns.dbus_message_get_interface(self.raw));
    }

    pub fn member(self: *const Message) ?[]const u8 {
        return binding.span(self.lib.libdbus.fns.dbus_message_get_member(self.raw));
    }

    pub fn error_name(self: *const Message) ?[]const u8 {
        return binding.span(self.lib.libdbus.fns.dbus_message_get_error_name(self.raw));
    }

    pub fn sender(self: *const Message) ?[]const u8 {
        return binding.span(self.lib.libdbus.fns.dbus_message_get_sender(self.raw));
    }

    pub fn destination(self: *const Message) ?[]const u8 {
        return binding.span(self.lib.libdbus.fns.dbus_message_get_destination(self.raw));
    }

    /// Body signature, borrowed from the message.
    pub fn signature(self: *const Message) []const u8 {
        return binding.span(self.lib.libdbus.fns.dbus_message_get_signature(self.raw)) orelse "";
    }

    /// True for a signal with the given interface and member.
    pub fn is_signal(self: *const Message, iface: [:0]const u8, name: [:0]const u8) bool {
        return self.lib.libdbus.fns.dbus_message_is_signal(self.raw, iface.ptr, name.ptr) != 0;
    }

    /// True when the message's object path equals `object_path`.
    pub fn has_path(self: *const Message, object_path: [:0]const u8) bool {
        return self.lib.libdbus.fns.dbus_message_has_path(self.raw, object_path.ptr) != 0;
    }
};

/// Appends `values` as the arguments of an iterator (a message body or a
/// container). `gpa` provides temporary NUL-terminated copies.
fn append_all(lib: *const connection.Library, gpa: Allocator, iter: *binding.Iter, values: []const Value) Error!void {
    for (values) |v| try append_one(lib, gpa, iter, v);
}

fn append_basic(lib: *const connection.Library, iter: *binding.Iter, code: c_int, ptr: *const anyopaque) Error!void {
    if (lib.libdbus.fns.dbus_message_iter_append_basic(iter, code, ptr) == 0) return error.InvalidValue;
}

/// NUL-terminated copy of `text`, freed by the caller.
fn dupe_z(gpa: Allocator, text: []const u8) Allocator.Error![:0]u8 {
    return gpa.dupeSentinel(u8, text, 0);
}

fn append_one(lib: *const connection.Library, gpa: Allocator, iter: *binding.Iter, v: Value) Error!void {
    switch (v) {
        .byte => |x| try append_basic(lib, iter, binding.type_byte, &x),
        .boolean => |x| {
            const raw: binding.Bool = @intFromBool(x);
            try append_basic(lib, iter, binding.type_boolean, &raw);
        },
        .int16 => |x| try append_basic(lib, iter, binding.type_int16, &x),
        .uint16 => |x| try append_basic(lib, iter, binding.type_uint16, &x),
        .int32 => |x| try append_basic(lib, iter, binding.type_int32, &x),
        .uint32 => |x| try append_basic(lib, iter, binding.type_uint32, &x),
        .int64 => |x| try append_basic(lib, iter, binding.type_int64, &x),
        .uint64 => |x| try append_basic(lib, iter, binding.type_uint64, &x),
        .double => |x| try append_basic(lib, iter, binding.type_double, &x),
        .unix_fd => |x| try append_basic(lib, iter, binding.type_unix_fd, &x),
        .string, .object_path, .signature => |text| {
            const z = try dupe_z(gpa, text);
            defer gpa.free(z);
            const ptr: [*:0]const u8 = z.ptr;
            const code = switch (v) {
                .string => binding.type_string,
                .object_path => binding.type_object_path,
                else => binding.type_signature,
            };
            try append_basic(lib, iter, code, @ptrCast(&ptr));
        },
        .array => |arr| {
            const elem_z = try dupe_z(gpa, arr.element);
            defer gpa.free(elem_z);
            var sub: binding.Iter = undefined;
            if (lib.libdbus.fns.dbus_message_iter_open_container(iter, binding.type_array, elem_z.ptr, &sub) == 0) return error.InvalidValue;
            {
                errdefer lib.libdbus.fns.dbus_message_iter_abandon_container(iter, &sub);
                for (arr.items) |item| try append_one(lib, gpa, &sub, item);
            }
            // close consumes the open container even on failure: never call
            // abandon after a close attempt (dbus-message.h's exactly-once rule).
            if (lib.libdbus.fns.dbus_message_iter_close_container(iter, &sub) == 0) return error.InvalidValue;
        },
        .structure => |members| {
            var sub: binding.Iter = undefined;
            if (lib.libdbus.fns.dbus_message_iter_open_container(iter, binding.type_struct, null, &sub) == 0) return error.InvalidValue;
            {
                errdefer lib.libdbus.fns.dbus_message_iter_abandon_container(iter, &sub);
                for (members) |m| try append_one(lib, gpa, &sub, m);
            }
            if (lib.libdbus.fns.dbus_message_iter_close_container(iter, &sub) == 0) return error.InvalidValue;
        },
        .dict_entry => |entry| {
            var sub: binding.Iter = undefined;
            if (lib.libdbus.fns.dbus_message_iter_open_container(iter, binding.type_dict_entry, null, &sub) == 0) return error.InvalidValue;
            {
                errdefer lib.libdbus.fns.dbus_message_iter_abandon_container(iter, &sub);
                try append_one(lib, gpa, &sub, entry.key.*);
                try append_one(lib, gpa, &sub, entry.value.*);
            }
            if (lib.libdbus.fns.dbus_message_iter_close_container(iter, &sub) == 0) return error.InvalidValue;
        },
        .variant => |var_v| {
            const sig_z = try dupe_z(gpa, var_v.signature);
            defer gpa.free(sig_z);
            var sub: binding.Iter = undefined;
            if (lib.libdbus.fns.dbus_message_iter_open_container(iter, binding.type_variant, sig_z.ptr, &sub) == 0) return error.InvalidValue;
            {
                errdefer lib.libdbus.fns.dbus_message_iter_abandon_container(iter, &sub);
                try append_one(lib, gpa, &sub, var_v.value.*);
            }
            if (lib.libdbus.fns.dbus_message_iter_close_container(iter, &sub) == 0) return error.InvalidValue;
        },
    }
}

/// Decodes all remaining arguments of `iter` into `arena`-owned values.
fn decode_all(lib: *const connection.Library, arena: Allocator, iter: *binding.Iter) Error![]Value {
    var out: std.ArrayList(Value) = .empty;
    while (lib.libdbus.fns.dbus_message_iter_get_arg_type(iter) != binding.type_invalid) {
        try out.append(arena, try decode_one(lib, arena, iter));
        _ = lib.libdbus.fns.dbus_message_iter_next(iter);
    }
    return out.toOwnedSlice(arena);
}

fn get_basic(lib: *const connection.Library, iter: *binding.Iter, comptime T: type) T {
    var out: T = undefined;
    lib.libdbus.fns.dbus_message_iter_get_basic(iter, @ptrCast(&out));
    return out;
}

fn decode_one(lib: *const connection.Library, arena: Allocator, iter: *binding.Iter) Error!Value {
    const code = lib.libdbus.fns.dbus_message_iter_get_arg_type(iter);
    return switch (code) {
        binding.type_byte => .{ .byte = get_basic(lib, iter, u8) },
        binding.type_boolean => .{ .boolean = get_basic(lib, iter, binding.Bool) != 0 },
        binding.type_int16 => .{ .int16 = get_basic(lib, iter, i16) },
        binding.type_uint16 => .{ .uint16 = get_basic(lib, iter, u16) },
        binding.type_int32 => .{ .int32 = get_basic(lib, iter, i32) },
        binding.type_uint32 => .{ .uint32 = get_basic(lib, iter, u32) },
        binding.type_int64 => .{ .int64 = get_basic(lib, iter, i64) },
        binding.type_uint64 => .{ .uint64 = get_basic(lib, iter, u64) },
        binding.type_double => .{ .double = get_basic(lib, iter, f64) },
        binding.type_unix_fd => .{ .unix_fd = get_basic(lib, iter, i32) },
        binding.type_string, binding.type_object_path, binding.type_signature => blk: {
            const text: [*:0]const u8 = get_basic(lib, iter, [*:0]const u8);
            const copy = try arena.dupe(u8, std.mem.span(text));
            break :blk switch (code) {
                binding.type_string => .{ .string = copy },
                binding.type_object_path => .{ .object_path = copy },
                else => .{ .signature = copy },
            };
        },
        binding.type_array => blk: {
            var sub: binding.Iter = undefined;
            lib.libdbus.fns.dbus_message_iter_recurse(iter, &sub);
            const element = try signature_prefix(lib, arena, &sub);
            break :blk .{ .array = .{ .element = element, .items = try decode_all(lib, arena, &sub) } };
        },
        binding.type_struct => blk: {
            var sub: binding.Iter = undefined;
            lib.libdbus.fns.dbus_message_iter_recurse(iter, &sub);
            break :blk .{ .structure = try decode_all(lib, arena, &sub) };
        },
        binding.type_dict_entry => blk: {
            var sub: binding.Iter = undefined;
            lib.libdbus.fns.dbus_message_iter_recurse(iter, &sub);
            const key = try arena.create(Value);
            key.* = try decode_one(lib, arena, &sub);
            _ = lib.libdbus.fns.dbus_message_iter_next(&sub);
            const val_box = try arena.create(Value);
            val_box.* = try decode_one(lib, arena, &sub);
            break :blk .{ .dict_entry = .{ .key = key, .value = val_box } };
        },
        binding.type_variant => blk: {
            var sub: binding.Iter = undefined;
            lib.libdbus.fns.dbus_message_iter_recurse(iter, &sub);
            const sig = try signature_of(lib, arena, &sub);
            const payload = try arena.create(Value);
            payload.* = try decode_one(lib, arena, &sub);
            break :blk .{ .variant = .{ .signature = sig, .value = payload } };
        },
        else => error.UnsupportedType,
    };
}

/// Copies the signature of the remaining arguments of `iter` into `arena`.
fn signature_of(lib: *const connection.Library, arena: Allocator, iter: *binding.Iter) Error![]const u8 {
    const raw = lib.libdbus.fns.dbus_message_iter_get_signature(iter) orelse return error.UnsupportedType;
    defer lib.libdbus.fns.dbus_free(raw);
    return arena.dupe(u8, std.mem.span(raw));
}

/// The first complete type of the remaining arguments: the element signature of
/// an array whose items all share one type. Empty arrays yield an empty slice.
fn signature_prefix(lib: *const connection.Library, arena: Allocator, iter: *binding.Iter) Error![]const u8 {
    const full = try signature_of(lib, arena, iter);
    if (full.len == 0) return full;
    return full[0..value.complete_type_len(full)];
}
