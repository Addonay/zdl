//! In-memory seekable streams and endian-aware scalar helpers, from the parts of
//! SDL_iostream.c that std does not already provide.
//!
//! - `Memory` is SDL_IOFromMem / SDL_IOFromConstMem: a cursor over a borrowed
//!   buffer, readable and (for mutable buffers) writable, with clamped seeks.
//! - `Dynamic` is SDL_IOFromDynamicMem: a growable owned buffer with the same
//!   cursor semantics; writes past the end extend it, with the bytes between
//!   never exposed uninitialized.
//! - The `read_*`/`write_*` scalar helpers (SDL_ReadU16LE ... SDL_WriteFloatBE)
//!   exist on both stream types. For integers over an arbitrary
//!   `std.Io.Reader`/`std.Io.Writer`, std's `takeInt`/`writeInt` are the right
//!   tools, and `read_float`/`write_float` below add the missing float
//!   counterparts.
//!
//! Files, pipes and the other SDL_iostream sources are `std.Io.File` with
//! `std.Io.Reader`/`Writer`; SDL_LoadFile/SDL_SaveFile are the `std.Io.Dir`
//! whole-file helpers; SDL_IOprintf is `Writer.print`. They are intentionally not
//! wrapped. Pure Zig, libc-free, not synchronized.
//!
//! Differences from SDL: reads past the end return 0 bytes (end of stream is
//! a short count, not a sticky status); writes that do not fit a fixed buffer
//! are short and return `error.NoSpaceLeft` only when nothing could be
//! written (SDL: error status when the buffer is full); seeks take a signed
//! offset and clamp to [0, size], as SDL's memory streams do.
const std = @import("std");
const Allocator = std.mem.Allocator;

/// SDL_IOWhence.
pub const Whence = enum { set, current, end };

pub const WriteError = error{ NoSpaceLeft, ReadOnly };
pub const ReadError = error{EndOfStream};

fn clamp_seek(position: usize, length: usize, offset: i64, whence: Whence) usize {
    const base: i128 = switch (whence) {
        .set => 0,
        .current => position,
        .end => length,
    };
    const target = base + offset;
    return @intCast(std.math.clamp(target, 0, @as(i128, length)));
}

/// Scalar helpers shared by the stream types. `Self` must provide
/// `read_some(self, dest) usize` and `write_all(self, bytes) WriteError!void`.
fn Scalars(comptime Self: type) type {
    return struct {
        /// Reads exactly `dest.len` bytes or fails with `EndOfStream` (position
        /// unchanged on failure).
        pub fn read_exact(self: *Self, dest: []u8) ReadError!void {
            if (self.remaining() < dest.len) return error.EndOfStream;
            _ = self.read_some(dest);
        }

        /// SDL_ReadU16LE/BE, ReadS32LE, ... for any integer type.
        pub fn read_int(self: *Self, comptime T: type, endian: std.builtin.Endian) ReadError!T {
            var bytes: [@sizeOf(T)]u8 = undefined;
            try self.read_exact(&bytes);
            return std.mem.readInt(T, &bytes, endian);
        }

        /// SDL_WriteU16LE/BE, ... for any integer type.
        pub fn write_int(self: *Self, comptime T: type, value: T, endian: std.builtin.Endian) WriteError!void {
            var bytes: [@sizeOf(T)]u8 = undefined;
            std.mem.writeInt(T, &bytes, value, endian);
            try self.write_all(&bytes);
        }

        /// SDL_ReadFloatLE/BE style: `T` is f32 or f64.
        pub fn read_float(self: *Self, comptime T: type, endian: std.builtin.Endian) ReadError!T {
            const Bits = @Int(.unsigned, @bitSizeOf(T));
            return @bitCast(try self.read_int(Bits, endian));
        }

        pub fn write_float(self: *Self, comptime T: type, value: T, endian: std.builtin.Endian) WriteError!void {
            const Bits = @Int(.unsigned, @bitSizeOf(T));
            try self.write_int(Bits, @bitCast(value), endian);
        }
    };
}

/// A cursor over a borrowed buffer. The buffer must outlive the stream.
pub const Memory = struct {
    data: []const u8,
    /// Same memory as `data` when writable; null for const buffers.
    mutable: ?[]u8,
    position: usize = 0,

    /// SDL_IOFromMem: reads and writes over `buffer`.
    pub fn init(buffer: []u8) Memory {
        return .{ .data = buffer, .mutable = buffer };
    }

    /// SDL_IOFromConstMem: read-only.
    pub fn init_const(buffer: []const u8) Memory {
        return .{ .data = buffer, .mutable = null };
    }

    pub fn size(self: *const Memory) usize {
        return self.data.len;
    }

    pub fn tell(self: *const Memory) usize {
        return self.position;
    }

    pub fn remaining(self: *const Memory) usize {
        return self.data.len - self.position;
    }

    /// SDL_SeekIO: returns the new position, clamped to the buffer.
    pub fn seek(self: *Memory, offset: i64, whence: Whence) usize {
        self.position = clamp_seek(self.position, self.data.len, offset, whence);
        return self.position;
    }

    /// Copies up to `dest.len` bytes from the cursor and advances; returns the
    /// count (0 at the end).
    pub fn read_some(self: *Memory, dest: []u8) usize {
        const count = @min(dest.len, self.remaining());
        @memcpy(dest[0..count], self.data[self.position..][0..count]);
        self.position += count;
        return count;
    }

    /// SDL_WriteIO: writes as much as fits and returns the count. Fails if the
    /// stream is read-only, or if the buffer is full and `src` is not empty.
    pub fn write_some(self: *Memory, src: []const u8) WriteError!usize {
        const target = self.mutable orelse return error.ReadOnly;
        if (src.len == 0) return 0;
        const count = @min(src.len, target.len - self.position);
        if (count == 0) return error.NoSpaceLeft;
        @memcpy(target[self.position..][0..count], src[0..count]);
        self.position += count;
        return count;
    }

    /// All of `src` or `error.NoSpaceLeft` with nothing written.
    pub fn write_all(self: *Memory, src: []const u8) WriteError!void {
        const target = self.mutable orelse return error.ReadOnly;
        if (target.len - self.position < src.len) return error.NoSpaceLeft;
        _ = try self.write_some(src);
    }

    pub const read_exact = Scalars(Memory).read_exact;
    pub const read_int = Scalars(Memory).read_int;
    pub const write_int = Scalars(Memory).write_int;
    pub const read_float = Scalars(Memory).read_float;
    pub const write_float = Scalars(Memory).write_float;
};

/// A growable owned buffer with a cursor.
pub const Dynamic = struct {
    allocator: Allocator,
    bytes: std.ArrayList(u8) = .empty,
    position: usize = 0,

    pub fn init(allocator: Allocator) Dynamic {
        return .{ .allocator = allocator };
    }

    pub fn deinit(self: *Dynamic) void {
        self.bytes.deinit(self.allocator);
        self.* = undefined;
    }

    /// The data written so far, borrowed until the next write.
    pub fn contents(self: *const Dynamic) []const u8 {
        return self.bytes.items;
    }

    /// Transfers the data to the caller (freed with `allocator`) and resets the
    /// stream to empty.
    pub fn take_owned(self: *Dynamic) Allocator.Error![]u8 {
        const owned = try self.bytes.toOwnedSlice(self.allocator);
        self.position = 0;
        return owned;
    }

    pub fn size(self: *const Dynamic) usize {
        return self.bytes.items.len;
    }

    pub fn tell(self: *const Dynamic) usize {
        return self.position;
    }

    pub fn remaining(self: *const Dynamic) usize {
        return self.bytes.items.len - self.position;
    }

    pub fn seek(self: *Dynamic, offset: i64, whence: Whence) usize {
        self.position = clamp_seek(self.position, self.bytes.items.len, offset, whence);
        return self.position;
    }

    pub fn read_some(self: *Dynamic, dest: []u8) usize {
        const count = @min(dest.len, self.remaining());
        @memcpy(dest[0..count], self.bytes.items[self.position..][0..count]);
        self.position += count;
        return count;
    }

    /// Overwrites from the cursor, extending the stream when it runs past the end.
    pub fn write_all(self: *Dynamic, src: []const u8) (Allocator.Error || WriteError)!void {
        const end = self.position + src.len;
        if (end > self.bytes.items.len) try self.bytes.resize(self.allocator, end);
        @memcpy(self.bytes.items[self.position..][0..src.len], src);
        self.position = end;
    }

    pub fn read_exact(self: *Dynamic, dest: []u8) ReadError!void {
        return Scalars(Dynamic).read_exact(self, dest);
    }
    pub fn read_int(self: *Dynamic, comptime T: type, endian: std.builtin.Endian) ReadError!T {
        return Scalars(Dynamic).read_int(self, T, endian);
    }
    pub fn read_float(self: *Dynamic, comptime T: type, endian: std.builtin.Endian) ReadError!T {
        return Scalars(Dynamic).read_float(self, T, endian);
    }
    pub fn write_int(self: *Dynamic, comptime T: type, value: T, endian: std.builtin.Endian) (Allocator.Error || WriteError)!void {
        var bytes: [@sizeOf(T)]u8 = undefined;
        std.mem.writeInt(T, &bytes, value, endian);
        try self.write_all(&bytes);
    }
    pub fn write_float(self: *Dynamic, comptime T: type, value: T, endian: std.builtin.Endian) (Allocator.Error || WriteError)!void {
        const Bits = @Int(.unsigned, @bitSizeOf(T));
        try self.write_int(Bits, @bitCast(value), endian);
    }
};

/// Float counterpart of `std.Io.Reader.takeInt` (SDL_ReadFloatLE/BE and the
/// double variants). `T` is f32 or f64.
pub fn read_float(reader: *std.Io.Reader, comptime T: type, endian: std.builtin.Endian) std.Io.Reader.Error!T {
    const Bits = @Int(.unsigned, @bitSizeOf(T));
    return @bitCast(try reader.takeInt(Bits, endian));
}

/// Float counterpart of `std.Io.Writer.writeInt`.
pub fn write_float(writer: *std.Io.Writer, comptime T: type, value: T, endian: std.builtin.Endian) std.Io.Writer.Error!void {
    const Bits = @Int(.unsigned, @bitSizeOf(T));
    var bytes: [@sizeOf(T)]u8 = undefined;
    std.mem.writeInt(Bits, &bytes, @bitCast(value), endian);
    try writer.writeAll(&bytes);
}

const testing = std.testing;

test "memory stream reads, seeks and clamps" {
    var stream = Memory.init_const("abcdef");
    var buf: [4]u8 = undefined;
    try testing.expectEqual(@as(usize, 4), stream.read_some(&buf));
    try testing.expectEqualStrings("abcd", &buf);
    try testing.expectEqual(@as(usize, 2), stream.read_some(&buf));
    try testing.expectEqual(@as(usize, 0), stream.read_some(&buf));
    try testing.expectEqual(@as(usize, 6), stream.tell());
    try testing.expectEqual(@as(usize, 1), stream.seek(-5, .end));
    try testing.expectEqual(@as(usize, 3), stream.seek(2, .current));
    try testing.expectEqual(@as(usize, 0), stream.seek(-100, .set));
    try testing.expectEqual(@as(usize, 6), stream.seek(100, .set));
    try testing.expectEqual(@as(usize, 6), stream.size());
    try testing.expectError(error.ReadOnly, stream.write_all("x"));
}

test "memory stream writes until full" {
    var storage: [5]u8 = undefined;
    var stream = Memory.init(&storage);
    try testing.expectEqual(@as(usize, 3), try stream.write_some("abc"));
    try testing.expectEqual(@as(usize, 2), try stream.write_some("defg"));
    try testing.expectError(error.NoSpaceLeft, stream.write_some("h"));
    try testing.expectEqual(@as(usize, 0), try stream.write_some(""));
    try testing.expectEqualStrings("abcde", &storage);
    _ = stream.seek(4, .set);
    try testing.expectError(error.NoSpaceLeft, stream.write_all("xy")); // nothing written
    try testing.expectEqual(@as(u8, 'e'), storage[4]);
    try stream.write_all("z");
    try testing.expectEqual(@as(u8, 'z'), storage[4]);
}

test "scalar helpers match SDL byte orders" {
    var storage: [32]u8 = undefined;
    var stream = Memory.init(&storage);
    try stream.write_int(u16, 0x1234, .little);
    try stream.write_int(u16, 0x1234, .big);
    try stream.write_int(i32, -2, .big);
    try stream.write_float(f32, 1.5, .little);
    try stream.write_float(f64, -2.25, .big);
    try testing.expectEqualSlices(u8, &.{ 0x34, 0x12, 0x12, 0x34, 0xff, 0xff, 0xff, 0xfe }, storage[0..8]);
    _ = stream.seek(0, .set);
    try testing.expectEqual(@as(u16, 0x1234), try stream.read_int(u16, .little));
    try testing.expectEqual(@as(u16, 0x1234), try stream.read_int(u16, .big));
    try testing.expectEqual(@as(i32, -2), try stream.read_int(i32, .big));
    try testing.expectEqual(@as(f32, 1.5), try stream.read_float(f32, .little));
    try testing.expectEqual(@as(f64, -2.25), try stream.read_float(f64, .big));
    _ = stream.seek(-4, .end);
    try testing.expectError(error.EndOfStream, stream.read_int(u64, .little));
}

test "short scalar read leaves the cursor" {
    var stream = Memory.init_const("\x01\x02\x03");
    try testing.expectError(error.EndOfStream, stream.read_int(u32, .little));
    try testing.expectEqual(@as(usize, 0), stream.tell());
    try testing.expectEqual(@as(u16, 0x0201), try stream.read_int(u16, .little));
}

test "dynamic stream grows and overwrites" {
    var stream = Dynamic.init(testing.allocator);
    defer stream.deinit();
    try stream.write_all("hello");
    try stream.write_int(u32, 7, .little);
    try testing.expectEqual(@as(usize, 9), stream.size());
    _ = stream.seek(1, .set);
    try stream.write_all("EL");
    try testing.expectEqualStrings("hELlo", stream.contents()[0..5]);
    _ = stream.seek(0, .end);
    try stream.write_float(f32, 0.5, .big);
    try testing.expectEqual(@as(usize, 13), stream.size());
    _ = stream.seek(5, .set);
    try testing.expectEqual(@as(u32, 7), try stream.read_int(u32, .little));
    try testing.expectEqual(@as(f32, 0.5), try stream.read_float(f32, .big));
    var tail: [1]u8 = undefined;
    try testing.expectEqual(@as(usize, 0), stream.read_some(&tail));
    const owned = try stream.take_owned();
    defer testing.allocator.free(owned);
    try testing.expectEqual(@as(usize, 13), owned.len);
    try testing.expectEqual(@as(usize, 0), stream.size());
}

test "float helpers over std readers and writers" {
    var storage: [12]u8 = undefined;
    var writer = std.Io.Writer.fixed(&storage);
    try write_float(&writer, f32, 3.5, .little);
    try write_float(&writer, f64, -0.125, .big);
    var reader = std.Io.Reader.fixed(&storage);
    try testing.expectEqual(@as(f32, 3.5), try read_float(&reader, f32, .little));
    try testing.expectEqual(@as(f64, -0.125), try read_float(&reader, f64, .big));
}
