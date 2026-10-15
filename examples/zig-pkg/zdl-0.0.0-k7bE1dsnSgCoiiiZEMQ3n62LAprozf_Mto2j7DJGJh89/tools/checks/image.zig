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
    _ = image.load.load_jpg;
    _ = image.load.load_png;
    _ = image.load.convert_mjpg_to_nv12;
    _ = image.load.convert_mjpg_frame_to_nv12;
    _ = image.load.convert_mjpg_frame_to_surface;
}
