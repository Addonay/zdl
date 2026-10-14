//! MIT-SHM frame buffers: a SysV shared-memory segment attached to the X server
//! (libXext XShmCreateImage/XShmAttach) so XShmPutImage transfers pixels without
//! copying them through the socket. The segment is created with shmget/shmat
//! through std.os.linux syscalls, and marked for removal as soon as the server
//! has attached it, so it disappears when the last mapping goes away even if
//! the process exits abnormally.
//!
//! Ownership: a Frame owns its XImage metadata and its process mapping. Destroy
//! it before the display closes. The Frame borrows the Xext table and display
//! passed to `create`. Completion events from XShmPutImage (send_event true)
//! mark the frame busy; the owner must wait for them before writing again.
//!
//! Deliberate difference: SDL decides between XShm and XPutImage when a window is
//! created. Here the Window tries MIT-SHM at its first presentation and, after
//! any failure, stays on XPutImage for its lifetime.
const std = @import("std");
const xlib = @import("xlib.zig");

pub const Error = error{ SharedMemoryUnavailable, OutOfMemory };

/// SysV constants (linux/ipc.h, linux/shm.h).
const ipc_private: usize = 0;
const ipc_create: usize = 0o1000;
const ipc_rmid: usize = 0;
const shm_mode: usize = 0o600;
/// ZPixmap format value for XShmCreateImage (X.h).
const z_pixmap: c_int = 2;

pub const Frame = struct {
    info: xlib.XShmSegmentInfo,
    image: *xlib.Image,
    address: [*]u8,
    byte_length: usize,
    bytes_per_line: usize,
    width: u16,
    height: u16,

    /// Creates an image with a server-attached segment sized for `width` x
    /// `height` at the visual's depth. Requires a prior successful XShmQueryExtension.
    pub fn create(
        extension: *const xlib.Xext,
        display: *xlib.Display,
        visual: *xlib.Visual,
        depth: u32,
        width: u16,
        height: u16,
    ) Error!Frame {
        var info: xlib.XShmSegmentInfo = std.mem.zeroes(xlib.XShmSegmentInfo);
        const image = extension.XShmCreateImage(display, visual, depth, z_pixmap, null, &info, width, height) orelse return error.SharedMemoryUnavailable;
        errdefer destroy_image(image);
        if (image.bytes_per_line <= 0 or image.height <= 0) return error.SharedMemoryUnavailable;
        const bytes_per_line: usize = @intCast(image.bytes_per_line);
        const byte_length = bytes_per_line * @as(usize, height);

        const segment = try syscall_value(std.os.linux.syscall3(.shmget, ipc_private, byte_length, ipc_create | shm_mode));
        const address_value = std.os.linux.syscall3(.shmat, segment, 0, 0);
        if (std.os.linux.errno(address_value) != .SUCCESS) {
            _ = std.os.linux.syscall3(.shmctl, segment, ipc_rmid, 0);
            return error.SharedMemoryUnavailable;
        }
        const address: [*]u8 = @ptrFromInt(address_value);
        errdefer _ = std.os.linux.syscall1(.shmdt, address_value);

        info.shmid = @intCast(segment);
        info.shmaddr = address;
        info.read_only = 0;
        // The server copies pixels from this mapping, so it must be attached
        // before the image is used. Removal is requested now; the segment
        // lives until both sides detach.
        _ = extension.XShmAttach(display, &info);
        _ = std.os.linux.syscall3(.shmctl, segment, ipc_rmid, 0);
        image.data = address;
        return .{
            .info = info,
            .image = image,
            .address = address,
            .byte_length = byte_length,
            .bytes_per_line = bytes_per_line,
            .width = width,
            .height = height,
        };
    }

    /// Detaches the segment on the server, unmaps it and frees the image metadata.
    pub fn deinit(self: *Frame, extension: *const xlib.Xext, display: *xlib.Display) void {
        _ = extension.XShmDetach(display, &self.info);
        self.image.data = null;
        destroy_image(self.image);
        _ = std.os.linux.syscall1(.shmdt, @intFromPtr(self.address));
        self.* = undefined;
    }

    /// The pixel bytes of the frame, row stride `bytes_per_line`. Writing while
    /// `busy` races with the server.
    pub fn pixels(self: *Frame) []u8 {
        return self.address[0..self.byte_length];
    }
};

fn destroy_image(image: *xlib.Image) void {
    // Data is detached by the caller before destruction, so Xlib does not free the segment.
    image.data = null;
    _ = image.functions.destroy(image);
}

fn syscall_value(result: usize) Error!usize {
    return switch (std.os.linux.errno(result)) {
        .SUCCESS => result,
        else => error.SharedMemoryUnavailable,
    };
}
