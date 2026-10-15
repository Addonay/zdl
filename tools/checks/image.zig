const std = @import("std");
const image = @import("zdl").image;

pub fn check() void {
    if (std.os.linux.getpid() != 0) return;
    _ = image.jpeg.is_jpeg;
    _ = image.jpeg.decode;
    _ = image.jpeg.decode_nv12;
    _ = image.png.is_png;
    _ = image.png.decode;
    _ = image.png.encode;
    _ = image.load_jpeg;
    _ = image.load_png;
    _ = image.load_webp;
    _ = image.decode;
    _ = image.decodeAs;
    _ = image.probe;
    _ = image.mjpg.frame_to_nv12;
    _ = image.mjpg.frame_to_nv12_from;
    _ = image.mjpg.frame_to_surface;
}
