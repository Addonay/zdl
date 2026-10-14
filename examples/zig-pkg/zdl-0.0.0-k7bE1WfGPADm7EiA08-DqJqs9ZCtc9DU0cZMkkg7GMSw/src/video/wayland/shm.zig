//! wl_shm buffers for the Wayland backend: a memfd-backed pool holding one XRGB8888
//! `wl_buffer`. Used for presentation (two buffers per window, reused after
//! `wl_buffer.release`) and for custom cursor images (kept by the cursor owner).
//!
//! Lifetime: the memfd stays open until `release`; libwayland sends it with the
//! next flush after `create`, so the descriptor must not be closed earlier. A
//! buffer's pixels are CPU memory mapped shared with the compositor and must not
//! be written while `busy` is true (presentation tracks this via release events).

const std = @import("std");
const linux = std.os.linux;
const binding = @import("binding.zig");
const protocol = @import("protocol.zig");

const Proxy = binding.Proxy;
const page_size = std.heap.page_size_min;

pub const Error = binding.Error || error{
    ShmFailed,
    MapFailed,
    TooLarge,
    SizeMismatch,
};

/// One shared-memory XRGB8888 buffer. Fields are private to the backend; the
/// public API exposes only Window methods.
pub const Buffer = struct {
    wl_buffer: ?Proxy = null,
    pool: ?Proxy = null,
    fd: i32 = -1,
    memory: ?[]align(page_size) u8 = null,
    width: u31 = 0,
    height: u31 = 0,
    /// Set while the compositor may still read the buffer (after commit, until release).
    busy: bool = false,

    /// Creates a `width` x `height` buffer on the wl_shm global `shm`. Release
    /// events for it arrive in `inbox` as `buffer_release`.
    pub fn create(lib: *const binding.Library, shm: Proxy, inbox: *binding.Inbox, width: u31, height: u31) Error!Buffer {
        if (width == 0 or height == 0) return error.SizeMismatch;
        const stride = @as(usize, width) * 4;
        const bytes = stride * @as(usize, height);
        const pool_bytes = std.math.cast(i32, bytes) orelse return error.TooLarge;

        const created = linux.memfd_create("zdl-wayland-shm", linux.MFD.CLOEXEC);
        if (linux.errno(created) != .SUCCESS) return error.ShmFailed;
        const fd: i32 = @intCast(created);
        errdefer _ = linux.close(fd);
        if (linux.errno(linux.ftruncate(fd, @intCast(bytes))) != .SUCCESS) return error.ShmFailed;
        const mapped = linux.mmap(null, bytes, .{ .READ = true, .WRITE = true }, .{ .TYPE = .SHARED }, fd, 0);
        if (linux.errno(mapped) != .SUCCESS) return error.MapFailed;
        const ptr: [*]align(page_size) u8 = @ptrFromInt(mapped);
        errdefer _ = linux.munmap(ptr, bytes);

        const pool = try protocol.Shm.create_pool(lib, shm, fd, pool_bytes);
        errdefer lib.destroy(pool);
        const wl_buffer = try protocol.ShmPool.create_buffer(lib, pool, 0, width, height, @intCast(stride), .xrgb8888);
        try lib.listen(wl_buffer, &binding.buffer_listener, inbox);
        return .{
            .wl_buffer = wl_buffer,
            .pool = pool,
            .fd = fd,
            .memory = ptr[0..bytes],
            .width = width,
            .height = height,
            .busy = false,
        };
    }

    /// Destroys the wl_buffer and pool objects, unmaps the memory and closes the
    /// memfd. Call only when the compositor no longer reads the buffer.
    pub fn release(self: *Buffer, lib: *const binding.Library) void {
        if (self.memory) |memory| {
            if (self.wl_buffer) |wl_buffer| {
                protocol.Buffer.destroy(lib, wl_buffer);
                lib.destroy(wl_buffer);
            }
            if (self.pool) |pool| {
                protocol.ShmPool.destroy(lib, pool);
                lib.destroy(pool);
            }
            _ = linux.munmap(memory.ptr, memory.len);
            _ = linux.close(self.fd);
        }
        self.* = .{};
    }
};
