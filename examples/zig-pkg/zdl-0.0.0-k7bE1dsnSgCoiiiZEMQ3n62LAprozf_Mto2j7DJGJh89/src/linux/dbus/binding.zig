//! Private libdbus-1 binding. This is the only file in the D-Bus port that
//! declares C types or calls C; every other module uses the Zig API built on it.
//!
//! libdbus is loaded at runtime with `std.DynLib` ("libdbus-1.so.3"), following
//! the ALSA loader pattern: a table of function pointers resolved by name, so
//! zdl does not link libdbus at build time and missing libraries fail with an
//! error instead of a loader abort. Raw pointers never leave this module's
//! callers in public signatures; `Connection` and `Message` keep them private.
//!
//! libdbus owns all strings it returns; Zig callers borrow them until the
//! message or connection they came from is released.

const std = @import("std");

/// `dbus_bool_t`.
pub const Bool = u32;

/// Opaque libdbus connection and message handles.
pub const RawConnection = opaque {};
pub const RawMessage = opaque {};

/// Storage for `DBusMessageIter` (libdbus documents it as opaque; the 64-bit
/// struct is 16 pointers). Callers never inspect it.
pub const Iter = [16]usize;

/// Storage for `DBusError`: `name`, `message`, a flag word and a padding
/// pointer. Read `name` and `message` through `error_name` and `error_message`.
pub const ErrorStorage = [4]usize;

/// Bus selector values for `dbus_bus_get_private`.
pub const bus_session: c_int = 0;
pub const bus_system: c_int = 1;

/// Timeouts in milliseconds for libdbus blocking calls.
pub const timeout_infinite: c_int = 0x7fffffff;
pub const timeout_default: c_int = -1;

/// `DBUS_MESSAGE_TYPE_*`.
pub const message_method_call: c_int = 1;
pub const message_method_return: c_int = 2;
pub const message_error: c_int = 3;
pub const message_signal: c_int = 4;

/// `DBUS_REQUEST_NAME_REPLY_*` and `DBUS_NAME_FLAG_*`.
pub const request_name_primary_owner: c_int = 1;
pub const request_name_already_owner: c_int = 4;
pub const name_flag_replace_existing: u32 = 0x2;

/// `DBUS_TYPE_*` codes, which are the ASCII characters of the signatures.
pub const type_invalid: c_int = 0;
pub const type_byte: c_int = 'y';
pub const type_boolean: c_int = 'b';
pub const type_int16: c_int = 'n';
pub const type_uint16: c_int = 'q';
pub const type_int32: c_int = 'i';
pub const type_uint32: c_int = 'u';
pub const type_int64: c_int = 'x';
pub const type_uint64: c_int = 't';
pub const type_double: c_int = 'd';
pub const type_string: c_int = 's';
pub const type_object_path: c_int = 'o';
pub const type_signature: c_int = 'g';
pub const type_unix_fd: c_int = 'h';
pub const type_array: c_int = 'a';
pub const type_variant: c_int = 'v';
/// Iterator type code; '(' and ')' are only signature punctuation (dbus-protocol.h).
pub const type_struct: c_int = 'r';
/// Iterator type code; '{' and '}' are only signature punctuation.
pub const type_dict_entry: c_int = 'e';

/// Errors from loading libdbus.
pub const Error = std.DynLib.Error || error{ MissingSymbol, OutOfMemory };

/// Every libdbus function this port calls. Field names are the C names.
pub const Functions = struct {
    dbus_threads_init_default: *const fn () callconv(.c) Bool,
    dbus_error_init: *const fn (*ErrorStorage) callconv(.c) void,
    dbus_error_free: *const fn (*ErrorStorage) callconv(.c) void,
    dbus_error_is_set: *const fn (*const ErrorStorage) callconv(.c) Bool,
    dbus_bus_get_private: *const fn (c_int, *ErrorStorage) callconv(.c) ?*RawConnection,
    dbus_connection_close: *const fn (*RawConnection) callconv(.c) void,
    dbus_connection_unref: *const fn (*RawConnection) callconv(.c) void,
    dbus_connection_get_is_connected: *const fn (*RawConnection) callconv(.c) Bool,
    dbus_connection_set_exit_on_disconnect: *const fn (*RawConnection, Bool) callconv(.c) void,
    dbus_connection_send: *const fn (*RawConnection, *RawMessage, ?*u32) callconv(.c) Bool,
    dbus_connection_send_with_reply_and_block: *const fn (*RawConnection, *RawMessage, c_int, *ErrorStorage) callconv(.c) ?*RawMessage,
    dbus_connection_flush: *const fn (*RawConnection) callconv(.c) void,
    dbus_connection_read_write: *const fn (*RawConnection, c_int) callconv(.c) Bool,
    dbus_connection_pop_message: *const fn (*RawConnection) callconv(.c) ?*RawMessage,
    dbus_bus_get_unique_name: *const fn (*RawConnection) callconv(.c) ?[*:0]const u8,
    dbus_bus_request_name: *const fn (*RawConnection, [*:0]const u8, u32, *ErrorStorage) callconv(.c) c_int,
    dbus_bus_add_match: *const fn (*RawConnection, [*:0]const u8, *ErrorStorage) callconv(.c) void,
    dbus_bus_remove_match: *const fn (*RawConnection, [*:0]const u8, *ErrorStorage) callconv(.c) void,
    dbus_message_new_method_call: *const fn (?[*:0]const u8, [*:0]const u8, ?[*:0]const u8, [*:0]const u8) callconv(.c) ?*RawMessage,
    dbus_message_new_signal: *const fn ([*:0]const u8, [*:0]const u8, [*:0]const u8) callconv(.c) ?*RawMessage,
    dbus_message_new_method_return: *const fn (*RawMessage) callconv(.c) ?*RawMessage,
    dbus_message_new_error: *const fn (*RawMessage, [*:0]const u8, [*:0]const u8) callconv(.c) ?*RawMessage,
    dbus_message_unref: *const fn (*RawMessage) callconv(.c) void,
    dbus_message_get_type: *const fn (*RawMessage) callconv(.c) c_int,
    dbus_message_get_serial: *const fn (*RawMessage) callconv(.c) u32,
    dbus_message_get_reply_serial: *const fn (*RawMessage) callconv(.c) u32,
    dbus_message_get_path: *const fn (*RawMessage) callconv(.c) ?[*:0]const u8,
    dbus_message_get_interface: *const fn (*RawMessage) callconv(.c) ?[*:0]const u8,
    dbus_message_get_member: *const fn (*RawMessage) callconv(.c) ?[*:0]const u8,
    dbus_message_get_error_name: *const fn (*RawMessage) callconv(.c) ?[*:0]const u8,
    dbus_message_get_sender: *const fn (*RawMessage) callconv(.c) ?[*:0]const u8,
    dbus_message_get_destination: *const fn (*RawMessage) callconv(.c) ?[*:0]const u8,
    dbus_message_get_signature: *const fn (*RawMessage) callconv(.c) ?[*:0]const u8,
    dbus_message_set_no_reply: *const fn (*RawMessage, Bool) callconv(.c) void,
    dbus_message_is_signal: *const fn (*RawMessage, [*:0]const u8, [*:0]const u8) callconv(.c) Bool,
    dbus_message_has_path: *const fn (*RawMessage, [*:0]const u8) callconv(.c) Bool,
    dbus_message_iter_init: *const fn (*RawMessage, *Iter) callconv(.c) Bool,
    dbus_message_iter_init_append: *const fn (*RawMessage, *Iter) callconv(.c) void,
    dbus_message_iter_append_basic: *const fn (*Iter, c_int, *const anyopaque) callconv(.c) Bool,
    dbus_message_iter_open_container: *const fn (*Iter, c_int, ?[*:0]const u8, *Iter) callconv(.c) Bool,
    dbus_message_iter_close_container: *const fn (*Iter, *Iter) callconv(.c) Bool,
    dbus_message_iter_abandon_container: *const fn (*Iter, *Iter) callconv(.c) void,
    dbus_message_iter_get_arg_type: *const fn (*Iter) callconv(.c) c_int,
    dbus_message_iter_get_basic: *const fn (*Iter, *anyopaque) callconv(.c) void,
    dbus_message_iter_recurse: *const fn (*Iter, *Iter) callconv(.c) void,
    dbus_message_iter_next: *const fn (*Iter) callconv(.c) Bool,
    dbus_message_iter_get_signature: *const fn (*Iter) callconv(.c) ?[*:0]u8,
    dbus_free: *const fn (?*anyopaque) callconv(.c) void,
};

/// The loaded libdbus: its handle and resolved functions. Load once per
/// process by the caller and pass a pointer to every operation that needs it.
/// `close` must run after all connections and messages are released.
pub const Library = struct {
    dynlib: std.DynLib,
    fns: Functions,

    pub fn open() Error!Library {
        var dynlib = try std.DynLib.open("libdbus-1.so.3");
        errdefer dynlib.close();
        var fns: Functions = undefined;
        const info = @typeInfo(Functions).@"struct";
        inline for (info.field_names, info.field_types) |name, FieldType| {
            const sym: [:0]const u8 = "" ++ name;
            @field(fns, name) = dynlib.lookup(FieldType, sym) orelse return error.MissingSymbol;
        }
        // Initialize before any connection/message use. libdbus serializes
        // repeated initialization, including independent callers of open().
        if (fns.dbus_threads_init_default() == 0) return error.OutOfMemory;
        return .{ .dynlib = dynlib, .fns = fns };
    }

    pub fn close(self: *Library) void {
        self.dynlib.close();
        self.* = undefined;
    }
};

/// The message text libdbus reports in `ErrorStorage`, borrowed until
/// `dbus_error_free`. Null when no error is set.
pub fn error_name(storage: *const ErrorStorage) ?[]const u8 {
    if (storage[0] == 0) return null;
    return std.mem.span(@as([*:0]const u8, @ptrFromInt(storage[0])));
}

/// Companion to `error_name`: the human-readable message, or null.
pub fn error_message(storage: *const ErrorStorage) ?[]const u8 {
    if (storage[1] == 0) return null;
    return std.mem.span(@as([*:0]const u8, @ptrFromInt(storage[1])));
}

/// Converts a libdbus C string to a borrowed Zig slice, or null.
pub fn span(text: ?[*:0]const u8) ?[]const u8 {
    const t = text orelse return null;
    return std.mem.span(t);
}
