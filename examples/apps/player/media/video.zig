//! Decoded video frames to the display raster.
//!
//! 8-bit YCbCr (4:2:0, 4:2:2, 4:4:4, NV12/NV21, YUYV, UYVY) goes straight through
//! zdl's `yuv.View` and `blit_yuv.scale_into`. 10-bit planar and P010 frames are
//! first reduced to 8-bit YCbCr in a reused `yuv.Image`, which keeps one
//! conversion path. Other formats use libswscale when it is installed.
//!
//! The picture is letterboxed: the frame keeps its aspect ratio inside the
//! destination, and the bars are cleared to black. The destination must be the
//! window's buffer size in pixels (HiDPI included) and must be RGBA8.
const std = @import("std");
const zdl = @import("zdl");
const ffmpeg = @import("ffmpeg.zig");

const yuv = zdl.yuv;
const surface = zdl.surface;
const blit_yuv = zdl.video.blit_yuv;

/// Rectangle of the frame inside the destination, in destination pixels.
pub const Fit = struct { x: usize, y: usize, width: usize, height: usize };

/// Largest aspect-correct rectangle centred in a destination. Pure integer math.
pub fn fit(destination_width: usize, destination_height: usize, frame_width: usize, frame_height: usize) Fit {
    if (frame_width == 0 or frame_height == 0 or destination_width == 0 or destination_height == 0) {
        return .{ .x = 0, .y = 0, .width = 0, .height = 0 };
    }
    var width = destination_width;
    var height = destination_width * frame_height / frame_width;
    if (destination_width * frame_height > destination_height * frame_width) {
        height = destination_height;
        width = destination_height * frame_width / frame_height;
    }
    return .{
        .x = (destination_width - width) / 2,
        .y = (destination_height - height) / 2,
        .width = width,
        .height = height,
    };
}

/// Matrix and range for a decoded frame. Full range is signalled by the frame;
/// unlabelled HD frames use BT.709 and SD frames use BT.601, as ffplay does.
pub fn encoding_of(frame: *const ffmpeg.Frame) yuv.Encoding {
    const full = frame.color_range == ffmpeg.color_range_jpeg;
    if (frame.colorspace == ffmpeg.color_space_bt2020_ncl) {
        return if (full) .bt2020_ncl_full else .bt709_limited;
    }
    const hd = frame.colorspace == ffmpeg.color_space_bt709 or
        (frame.colorspace != 5 and frame.colorspace != 6 and frame.height >= 720);
    if (hd) return if (full) .bt709_full else .bt709_limited;
    return if (full) .bt601_full else .bt601_limited;
}

pub const Converter = struct {
    allocator: std.mem.Allocator,
    library: *const ffmpeg.Library,
    shifted: ?yuv.Image = null,
    sws: ?Sws = null,

    const Sws = struct {
        context: *ffmpeg.SwsContext,
        format: ffmpeg.PixelFormat,
        source_width: c_int,
        source_height: c_int,
        target_width: c_int,
        target_height: c_int,
    };

    pub fn init(allocator: std.mem.Allocator, library: *const ffmpeg.Library) Converter {
        return .{ .allocator = allocator, .library = library };
    }

    pub fn deinit(self: *Converter) void {
        if (self.shifted) |*image| image.deinit();
        if (self.sws) |sws| if (self.library.scale) |scale| scale.sws_freeContext(sws.context);
        self.* = undefined;
    }

    /// Draws `frame` letterboxed into `destination` (RGBA8). Clears the bars.
    pub fn draw(self: *Converter, frame: *const ffmpeg.Frame, destination: surface.View) !void {
        if (destination.format != .rgba8) return error.UnsupportedDestination;
        if (frame.width <= 0 or frame.height <= 0) return error.InvalidFrame;
        try destination.fill(.{ .r = 0, .g = 0, .b = 0, .a = 255 }, null);

        const area = fit(destination.width, destination.height, @intCast(frame.width), @intCast(frame.height));
        if (area.width == 0 or area.height == 0) return;
        const offset = area.y * destination.stride + area.x * 4;
        const target = try surface.View.init(destination.data[offset..], @intCast(area.width), @intCast(area.height), destination.stride, .rgba8, null);

        const format: ffmpeg.PixelFormat = @fromBackingInt(@intCast(frame.format));
        switch (format) {
            .yuv420p, .yuv422p, .yuv444p, .nv12, .nv21, .yuyv422, .uyvy422 => {
                const view = try eight_bit_view(frame, format);
                try blit_yuv.scale_into(target, .{ .ycbcr = .{ .view = view, .encoding = encoding_of(frame) } });
            },
            .yuv420p10le, .yuv422p10le, .yuv444p10le, .p010le => {
                const image = try self.reduce_depth(frame, format);
                try blit_yuv.scale_into(target, .{ .ycbcr = .{ .view = image.view, .encoding = encoding_of(frame) } });
            },
            else => try self.scale_with_swscale(frame, target),
        }
    }

    /// Native 8-bit view over the frame's planes. Each plane is bounded by its
    /// stride times its row count, which is the smallest extent the view accepts.
    fn eight_bit_view(frame: *const ffmpeg.Frame, format: ffmpeg.PixelFormat) !yuv.View {
        const width: u31 = @intCast(frame.width);
        const height: u31 = @intCast(frame.height);
        const h: usize = height;
        return switch (format) {
            .yuv420p => try yuv.View.init(width, height, .planar420, .{ .planar = .{
                .y = try plane(frame, 0, h),
                .u = try plane(frame, 1, (h + 1) / 2),
                .v = try plane(frame, 2, (h + 1) / 2),
            } }),
            .yuv422p => try yuv.View.init(width, height, .planar422, .{ .planar = .{
                .y = try plane(frame, 0, h),
                .u = try plane(frame, 1, h),
                .v = try plane(frame, 2, h),
            } }),
            .yuv444p => try yuv.View.init(width, height, .planar444, .{ .planar = .{
                .y = try plane(frame, 0, h),
                .u = try plane(frame, 1, h),
                .v = try plane(frame, 2, h),
            } }),
            .nv12, .nv21 => try yuv.View.init(width, height, if (format == .nv12) .nv12 else .nv21, .{ .semiplanar = .{
                .y = try plane(frame, 0, h),
                .uv = try plane(frame, 1, (h + 1) / 2),
            } }),
            .yuyv422 => try yuv.View.init(width, height, .yuy2, .{ .interleaved = try plane(frame, 0, h) }),
            .uyvy422 => try yuv.View.init(width, height, .uyvy, .{ .interleaved = try plane(frame, 0, h) }),
            else => error.UnsupportedFormat,
        };
    }

    fn plane(frame: *const ffmpeg.Frame, index: usize, rows: usize) !yuv.Plane {
        const pointer = frame.data[index] orelse return error.InvalidFrame;
        if (frame.linesize[index] <= 0) return error.InvalidFrame;
        const stride: usize = @intCast(frame.linesize[index]);
        return .{ .data = pointer[0 .. stride * rows], .stride = stride };
    }

    /// Converts 10-bit planar or P010 samples to 8-bit planes of the same layout.
    /// P010 keeps its ten bits in the top of each container; yuv420p10le keeps
    /// them in the bottom, so the shift differs by format.
    fn reduce_depth(self: *Converter, frame: *const ffmpeg.Frame, format: ffmpeg.PixelFormat) !*const yuv.Image {
        const width: u31 = @intCast(frame.width);
        const height: u31 = @intCast(frame.height);
        const layout: yuv.Layout = switch (format) {
            .yuv420p10le => .planar420,
            .yuv422p10le => .planar422,
            .yuv444p10le => .planar444,
            .p010le => .nv12,
            else => unreachable,
        };
        const shift: u4 = if (format == .p010le) 8 else 2;
        if (self.shifted) |*image| {
            if (image.view.width != width or image.view.height != height or image.view.layout != layout) {
                image.deinit();
                self.shifted = null;
            }
        }
        if (self.shifted == null) self.shifted = try yuv.Image.init(self.allocator, width, height, layout);
        const image = &self.shifted.?;

        const w: usize = width;
        const h: usize = height;
        const cw: usize = if (layout == .planar444) w else (w + 1) / 2;
        const ch: usize = if (layout == .planar420 or layout == .nv12) (h + 1) / 2 else h;

        for (0..h) |y| {
            const source = try row_bytes(frame, 0, y, w * 2);
            const destination = image.writable[0][y * w ..][0..w];
            for (destination, 0..) |*out, x| out.* = sample8(source, x, shift);
        }
        const chroma_planes: []const usize = if (layout == .nv12) &.{1} else &.{ 1, 2 };
        for (chroma_planes) |plane_index| {
            // NV12 interleaves U and V in one plane, so its row holds 2 * cw samples.
            const samples_per_row: usize = if (layout == .nv12) cw * 2 else cw;
            const row_width: usize = if (layout == .nv12) cw * 2 else cw;
            for (0..ch) |y| {
                const source = try row_bytes(frame, plane_index, y, samples_per_row * 2);
                const destination = image.writable[plane_index][y * row_width ..][0..row_width];
                for (destination, 0..) |*out, x| out.* = sample8(source, x, shift);
            }
        }
        return image;
    }

    /// Bytes of one row of a plane, `byte_count` long.
    fn row_bytes(frame: *const ffmpeg.Frame, index: usize, row: usize, byte_count: usize) ![]const u8 {
        const pointer = frame.data[index] orelse return error.InvalidFrame;
        const stride: usize = @intCast(frame.linesize[index]);
        return pointer[row * stride ..][0..byte_count];
    }

    fn scale_with_swscale(self: *Converter, frame: *const ffmpeg.Frame, target: surface.View) !void {
        const scale = self.library.scale orelse return error.UnsupportedFormat;
        const context = try self.sws_for(scale, frame, target);
        var sources: [4][*]const u8 = undefined;
        var source_strides: [4]c_int = @splat(0);
        for (0..4) |index| {
            if (frame.data[index]) |pointer| {
                sources[index] = pointer;
                source_strides[index] = frame.linesize[index];
            } else {
                sources[index] = sources[0];
            }
        }
        const destinations = [_][*]u8{ target.data.ptr, target.data.ptr, target.data.ptr, target.data.ptr };
        const destination_strides = [_]c_int{ @intCast(target.stride), 0, 0, 0 };
        const result = scale.sws_scale(context, &sources, &source_strides, 0, frame.height, &destinations, &destination_strides);
        if (result < 0) return error.ScaleFailed;
    }

    fn sws_for(self: *Converter, scale: ffmpeg.ScaleFunctions, frame: *const ffmpeg.Frame, target: surface.View) !*ffmpeg.SwsContext {
        const format: ffmpeg.PixelFormat = @fromBackingInt(@intCast(frame.format));
        const target_width: c_int = @intCast(target.width);
        const target_height: c_int = @intCast(target.height);
        if (self.sws) |cached| {
            if (cached.format == format and cached.source_width == frame.width and cached.source_height == frame.height and
                cached.target_width == target_width and cached.target_height == target_height) return cached.context;
            scale.sws_freeContext(cached.context);
            self.sws = null;
        }
        const context = scale.sws_getContext(frame.width, frame.height, @backingInt(format), target_width, target_height, @backingInt(ffmpeg.PixelFormat.rgba), 2, null, null, null) orelse return error.UnsupportedFormat;
        self.sws = .{ .context = context, .format = format, .source_width = frame.width, .source_height = frame.height, .target_width = target_width, .target_height = target_height };
        return context;
    }
};

/// One 8-bit sample from a row of little-endian 16-bit containers.
fn sample8(bytes: []const u8, index: usize, shift: u4) u8 {
    const value = std.mem.readInt(u16, bytes[index * 2 ..][0..2], .little);
    return @truncate(value >> shift);
}
