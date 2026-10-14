//! YUV-to-YUV repacking for SDL's FOURCC family: planar 4:2:0 (YV12, IYUV),
//! semi-planar 4:2:0 (NV12, NV21), packed 4:2:2 (YUY2, UYVY, YVYU), planar
//! 4:4:4 (I444) and semi-planar 16-bit P010. Every same-format copy is a plain
//! row copy; the 8-bit 4:2:0/4:2:2 family converts between itself by sample
//! addressing alone.
//!
//! Altered native port of the plane-shuffle paths of SDL_yuv.c
//! (SDL_ConvertPixels_YUV_to_YUV, Planar2x2_to_Planar2x2, Planar2x2_to_Packed4,
//! Packed4_to_Planar2x2, Packed4_to_Packed4). SDL's pointer macros, SSE/LSX
//! variants and in-place rejection are replaced by explicit index functions and
//! checked buffer extents. Output bytes match SDL's scalar paths.
//!
//! Chroma geometry: all formats here share horizontal 2:1 chroma. Vertically,
//! 4:2:2 -> 4:2:0 averages each pair of source chroma rows with an integer
//! `(a + b) / 2`, as SDL does; 4:2:0 -> 4:2:2 repeats a row pair's chroma on
//! both rows. Conversions that change subsampling in x, change bit depth or
//! involve I444/P010 with a different format return `UnsupportedConversion`;
//! `convert.zig` routes those through RGB.
//!
//! Plane convention: planes are separate slices given in SDL's memory order for
//! one buffer. YV12 is Y, V, U; IYUV is Y, U, V; NV21 interleaves V then U.
//! Packed formats use plane 0 only. Plane extents must not overlap.

const std = @import("std");

/// SDL FOURCC formats handled by this module. `i444` and `p010` are included
/// for same-format copies; they have no 8-bit repack partner here.
pub const Fourcc = enum { yv12, iyuv, i444, nv12, nv21, yuy2, uyvy, yvyu, p010 };

/// Invalid geometry, aliased storage or a conversion this module does not perform.
pub const Error = error{ InvalidBuffer, InvalidSize, OverlappingBuffers, UnsupportedConversion, Overflow };

/// Chroma component selector.
pub const Component = enum { u, v };

/// Byte location of one sample: which plane slice and the byte offset in it.
pub const Index = struct { plane: usize, offset: usize };

/// Writable plane with an independent byte stride between rows.
pub const Plane = struct { data: []u8, stride: usize };

/// Read-only plane with an independent byte stride between rows.
pub const ConstPlane = struct { data: []const u8, stride: usize };

/// Number of separate planes the format uses (1 packed, 2 semi-planar, 3 planar).
pub fn plane_count(fourcc: Fourcc) usize {
    return switch (fourcc) {
        .yv12, .iyuv, .i444 => 3,
        .nv12, .nv21, .p010 => 2,
        .yuy2, .uyvy, .yvyu => 1,
    };
}

/// Bytes per luma sample container: two for P010 (value in the top ten bits), else one.
pub fn sample_bytes(fourcc: Fourcc) usize {
    return if (fourcc == .p010) 2 else 1;
}

/// Luma samples per chroma sample horizontally: 1 for I444, else 2.
pub fn subsample_x(fourcc: Fourcc) usize {
    return if (fourcc == .i444) 1 else 2;
}

/// Luma rows per chroma row: 1 for packed 4:2:2 and I444, else 2.
pub fn subsample_y(fourcc: Fourcc) usize {
    return switch (fourcc) {
        .yuy2, .uyvy, .yvyu, .i444 => 1,
        else => 2,
    };
}

/// True for the packed 4:2:2 family, which interleave Y0 U Y1 V (in some order)
/// into one four-byte macro-pixel.
pub fn is_packed(fourcc: Fourcc) bool {
    return fourcc == .yuy2 or fourcc == .uyvy or fourcc == .yvyu;
}

/// True for the NV family, which interleave two chroma components in one plane.
pub fn is_semiplanar(fourcc: Fourcc) bool {
    return fourcc == .nv12 or fourcc == .nv21 or fourcc == .p010;
}

/// Chroma sample columns for a luma width (rounded up for odd widths).
pub fn chroma_width(fourcc: Fourcc, width: usize) usize {
    const sx = subsample_x(fourcc);
    return (width + sx - 1) / sx;
}

/// Chroma rows for a luma height (rounded up for odd heights).
pub fn chroma_rows(fourcc: Fourcc, height: usize) usize {
    const sy = subsample_y(fourcc);
    return (height + sy - 1) / sy;
}

/// Minimum bytes in one row of `plane` for a `width`-pixel image.
/// Packed macro-pixels round an odd width up to a whole pair of luma samples.
pub fn row_bytes(fourcc: Fourcc, plane: usize, width: usize) usize {
    const bps = sample_bytes(fourcc);
    if (is_packed(fourcc)) return chroma_width(fourcc, width) * 4;
    if (plane == 0) return width * bps;
    if (is_semiplanar(fourcc)) return chroma_width(fourcc, width) * 2 * bps;
    return chroma_width(fourcc, width) * bps;
}

/// Number of rows in `plane`.
pub fn plane_rows(fourcc: Fourcc, plane: usize, height: usize) usize {
    return if (plane == 0) height else chroma_rows(fourcc, height);
}

/// Checks each plane's stride against its row bytes and its slice length against
/// the last row's end. Strides are in bytes, `lengths` are slice lengths.
pub fn validate_lengths(fourcc: Fourcc, width: usize, height: usize, strides: [3]usize, lengths: [3]usize) Error!void {
    for (0..plane_count(fourcc)) |p| {
        const bytes = row_bytes(fourcc, p, width);
        const rows = plane_rows(fourcc, p, height);
        if (rows == 0 or bytes == 0) continue;
        if (strides[p] < bytes) return error.InvalidBuffer;
        const prefix = std.math.mul(usize, rows - 1, strides[p]) catch return error.Overflow;
        const required = std.math.add(usize, prefix, bytes) catch return error.Overflow;
        if (lengths[p] < required) return error.InvalidBuffer;
    }
}

/// Plane addressing for a luma sample. The luma plane is always plane 0.
/// In packed formats the macro-pixel holds Y0 at the first pixel of the pair and
/// Y1 at the second; YUY2 and YVYU place luma at bytes 0 and 2, UYVY at 1 and 3.
pub fn luma_index(fourcc: Fourcc, stride: usize, x: usize, y: usize) Index {
    if (is_packed(fourcc)) {
        const pair_offset: usize = if (fourcc == .uyvy) 1 else 0;
        const second: usize = if (x & 1 == 1) 2 else 0;
        return .{ .plane = 0, .offset = y * stride + (x / 2) * 4 + pair_offset + second };
    }
    return .{ .plane = 0, .offset = y * stride + x * sample_bytes(fourcc) };
}

/// Plane addressing for one chroma component at chroma column `cx` and chroma
/// row `cy`. `strides` is the stride of every plane (unused entries ignored).
/// For packed formats `cy` is the luma row, since their chroma row count equals the height.
pub fn chroma_index(fourcc: Fourcc, strides: [3]usize, cx: usize, cy: usize, component: Component) Index {
    return switch (fourcc) {
        // Packed macro-pixel byte positions: YUY2 Y0 U Y1 V, UYVY U Y0 V Y1, YVYU Y0 V Y1 U.
        .yuy2 => .{ .plane = 0, .offset = cy * strides[0] + cx * 4 + if (component == .u) @as(usize, 1) else 3 },
        .uyvy => .{ .plane = 0, .offset = cy * strides[0] + cx * 4 + if (component == .u) @as(usize, 0) else 2 },
        .yvyu => .{ .plane = 0, .offset = cy * strides[0] + cx * 4 + if (component == .u) @as(usize, 3) else 1 },
        // Interleaved NV pairs: NV12 is U then V, NV21 is V then U.
        .nv12 => .{ .plane = 1, .offset = cy * strides[1] + cx * 2 + if (component == .u) @as(usize, 0) else 1 },
        .nv21 => .{ .plane = 1, .offset = cy * strides[1] + cx * 2 + if (component == .u) @as(usize, 1) else 0 },
        // P010 chroma pairs are 16-bit containers: U at bytes 0..1, V at 2..3.
        .p010 => .{ .plane = 1, .offset = cy * strides[1] + cx * 4 + if (component == .u) @as(usize, 0) else 2 },
        // Separate planes in memory order: YV12 stores V before U.
        .yv12 => blk: {
            const plane: usize = if (component == .u) 2 else 1;
            break :blk .{ .plane = plane, .offset = cy * strides[plane] + cx };
        },
        .iyuv, .i444 => blk: {
            const plane: usize = if (component == .u) 1 else 2;
            break :blk .{ .plane = plane, .offset = cy * strides[plane] + cx * sample_bytes(fourcc) };
        },
    };
}

/// True when both buffers' byte ranges intersect. Empty slices never overlap.
pub fn overlaps(a: []const u8, b: []const u8) bool {
    if (a.len == 0 or b.len == 0) return false;
    const x = @intFromPtr(a.ptr);
    const y = @intFromPtr(b.ptr);
    return if (x <= y) y - x < a.len else x - y < b.len;
}

/// Formats handled by the 8-bit repack path (P010 and I444 need `convert.zig`'s RGB route).
fn repackable(fourcc: Fourcc) bool {
    return switch (fourcc) {
        .yv12, .iyuv, .nv12, .nv21, .yuy2, .uyvy, .yvyu => true,
        .i444, .p010 => false,
    };
}

/// Copies one image between identical formats, row by row. Equal source and
/// destination storage is accepted as a no-op, as SDL does.
pub fn copy(width: usize, height: usize, fourcc: Fourcc, src: [3]ConstPlane, dst: [3]Plane) Error!void {
    try validate_lengths(fourcc, width, height, .{ src[0].stride, src[1].stride, src[2].stride }, .{ src[0].data.len, src[1].data.len, src[2].data.len });
    try validate_lengths(fourcc, width, height, .{ dst[0].stride, dst[1].stride, dst[2].stride }, .{ dst[0].data.len, dst[1].data.len, dst[2].data.len });
    for (0..plane_count(fourcc)) |p| {
        if (src[p].data.ptr == dst[p].data.ptr and src[p].stride == dst[p].stride) continue;
        if (overlaps(src[p].data, dst[p].data)) return error.OverlappingBuffers;
        const bytes = row_bytes(fourcc, p, width);
        for (0..plane_rows(fourcc, p, height)) |row| {
            const from = src[p].data[row * src[p].stride ..][0..bytes];
            @memcpy(dst[p].data[row * dst[p].stride ..][0..bytes], from);
        }
    }
}

/// Repacks an image from one 8-bit 4:2:0/4:2:2 FOURCC to another without
/// touching colors. Luma is copied sample for sample. Each destination chroma
/// sample comes from the source chroma at the same column, averaging two rows
/// when the source has twice the chroma rows, or repeating a row when it has half.
/// Returns `UnsupportedConversion` for pairs outside the 8-bit family, leaving
/// the destination untouched; the caller must then convert through RGB.
pub fn convert(width: usize, height: usize, src_fourcc: Fourcc, src: [3]ConstPlane, dst_fourcc: Fourcc, dst: [3]Plane) Error!void {
    if (src_fourcc == dst_fourcc) return copy(width, height, src_fourcc, src, dst);
    if (!repackable(src_fourcc) or !repackable(dst_fourcc)) return error.UnsupportedConversion;
    try validate_lengths(src_fourcc, width, height, .{ src[0].stride, src[1].stride, src[2].stride }, .{ src[0].data.len, src[1].data.len, src[2].data.len });
    try validate_lengths(dst_fourcc, width, height, .{ dst[0].stride, dst[1].stride, dst[2].stride }, .{ dst[0].data.len, dst[1].data.len, dst[2].data.len });
    for (src) |s| for (dst) |d| if (overlaps(s.data, d.data)) return error.OverlappingBuffers;

    const src_strides = .{ src[0].stride, src[1].stride, src[2].stride };
    const dst_strides = .{ dst[0].stride, dst[1].stride, dst[2].stride };
    for (0..height) |y| {
        for (0..width) |x| {
            const from = luma_index(src_fourcc, src_strides[0], x, y);
            const to = luma_index(dst_fourcc, dst_strides[0], x, y);
            dst[0].data[to.offset] = src[from.plane].data[from.offset];
        }
    }

    const src_sy = subsample_y(src_fourcc);
    const dst_sy = subsample_y(dst_fourcc);
    for (0..chroma_rows(dst_fourcc, height)) |cy| {
        for (0..chroma_width(dst_fourcc, width)) |cx| {
            for ([_]Component{ .u, .v }) |component| {
                const value: u8 = if (src_sy == dst_sy)
                    sample_at(src_fourcc, src, src_strides, cx, cy, component)
                else if (src_sy == 2)
                    // Destination rows are full-height luma rows: row `cy` uses source chroma row `cy / 2`.
                    sample_at(src_fourcc, src, src_strides, cx, cy / 2, component)
                else blk: {
                    // Destination pairs of luma rows share one chroma sample; average the two source rows.
                    const first = sample_at(src_fourcc, src, src_strides, cx, 2 * cy, component);
                    const second_row = @min(2 * cy + 1, height - 1);
                    const second = sample_at(src_fourcc, src, src_strides, cx, second_row, component);
                    break :blk @intCast((@as(u16, first) + second) / 2);
                };
                const index = chroma_index(dst_fourcc, dst_strides, cx, cy, component);
                dst[index.plane].data[index.offset] = value;
            }
        }
    }
}

fn sample_at(fourcc: Fourcc, planes: [3]ConstPlane, strides: [3]usize, cx: usize, cy: usize, component: Component) u8 {
    const index = chroma_index(fourcc, strides, cx, cy, component);
    return planes[index.plane].data[index.offset];
}
