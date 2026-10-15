//! Shared option types for the image facade.
//!
//! The facade's `Options` is deliberately flat where a caller commonly edits a
//! limit, and grouped where the options describe one concern. Codec-specific
//! knobs live with their codec module and are reached through `Options.codec`,
//! so a single `Options` value covers every format without enumerating hundreds
//! of unrelated fields.
const std = @import("std");
const pixels = @import("../video/pixels.zig");
const png = @import("png.zig");
const jpeg = @import("jpeg.zig");
const bmp = @import("../video/bmp.zig");
pub const limits = @import("limits.zig");

/// Requested eight-bit representation of the decoded pixels.
///
/// `natural` keeps what the codec produced: indexed images stay indexed with
/// their palette, grey images stay indexed with a grey ramp, colour images
/// become `rgb8` and images with alpha become `rgba8`.
pub const Output = enum { natural, rgb8, rgba8 };

/// Separable resampling filter used by `Resize`.
pub const Filter = enum {
    /// Fastest, keeps hard edges; for pixel art and thumbnails of flat art.
    nearest,
    /// Area average; the correct filter when downscaling by a large factor.
    box,
    /// Triangle filter with edge clamping.
    bilinear,
    /// Mitchell-Netravali cubic (B = 1/3, C = 1/3).
    bicubic,
    /// Lanczos3. The default: sharp results without ringing on flat art.
    lanczos3,
};

/// Decode-time resampling. Setting a dimension rescales both axes to fit the
/// requested box while preserving the aspect ratio when only one is given;
/// `null` dimensions keep the source size. No resampling runs when every field
/// is null, which is the default.
pub const Resize = struct {
    width: ?u32 = null,
    height: ?u32 = null,
    /// Shrink to fit this edge, but never enlarge. Used by thumbnailers that
    /// do not know one axis ahead of time.
    max_dimension: ?u32 = null,
    filter: Filter = default_filter,

    const default_filter: Filter = if (@import("builtin").mode == .debug) .bilinear else .lanczos3;

    /// True when this resize asks for any work.
    pub fn isRequested(self: Resize) bool {
        return self.width != null or self.height != null or self.max_dimension != null;
    }
};

/// Source rectangle cropped before resampling and pixel operations.
pub const Crop = struct {
    x: u32 = 0,
    y: u32 = 0,
    width: u32,
    height: u32,
};

/// EXIF orientation, stored as the orientation tag value.
pub const Orientation = enum(u8) {
    upright = 1,
    mirror_horizontal = 2,
    rotate_180 = 3,
    mirror_vertical = 4,
    transpose = 5,
    rotate_90 = 6,
    transverse = 7,
    rotate_270 = 8,

    /// Unknown tag values fall back to `upright`.
    pub fn fromTag(value: u32) Orientation {
        return if (value >= 1 and value <= 8) @fromBackingInt(@as(u8, @intCast(value))) else .upright;
    }

    /// True when applying the orientation exchanges the image axes.
    pub fn swapsAxes(self: Orientation) bool {
        return switch (self) {
            .transpose, .rotate_90, .transverse, .rotate_270 => true,
            else => false,
        };
    }
};

/// Per-pixel work applied after decoding, in this order: orientation, crop,
/// resize, background composite, premultiply, flip.
pub const PixelOps = struct {
    /// Apply the file's EXIF orientation. Set false to keep stored pixels.
    /// Files without EXIF are unaffected either way.
    apply_orientation: bool = true,
    /// Multiply color by alpha in place; requires four-channel output.
    premultiply_alpha: bool = false,
    /// Mirror rows after every other operation.
    flip_y: bool = false,
    /// Composite over this color and make the result opaque. Useful when a
    /// caller cannot handle alpha but wants the picture to look right.
    background: ?pixels.Color = null,
};

/// Which frames of an animated image to decode.
pub const Frames = struct {
    pub const Selection = union(enum) {
        /// Only the first frame is decoded; the default for still loading.
        first,
        /// Every frame, composited per the format's animation model.
        all,
        /// One specific frame index, counted in display order from zero.
        index: u32,
    };

    select: Selection = .first,
    /// Stop after this many frames; zero means no limit. Only meaningful
    /// together with `select = .all`.
    max_frames: u32 = 0,
    /// Treat the whole image as one frame when the container supports both a
    /// still and an animated layout, for example animated PNG or WebP.
    prefer_still: bool = false,

    pub fn count(self: Frames, available: u32) u32 {
        return switch (self.select) {
            .first => 1,
            .index => |i| if (i < available) @as(u32, 1) else 0,
            .all => if (self.max_frames == 0) available else @min(self.max_frames, available),
        };
    }
};

/// Limits guarding every decoder, shared by all codecs.
pub const Limits = limits.Limits;

/// Decoder threads for codecs that can parallelize. Zero picks a sensible count
/// from the CPU count; one forces single-threaded decoding.
pub const Threads = struct {
    count: u16 = 0,
};

/// The full decode request. Every field has a working default, so
/// `.{}` decodes an ordinary image exactly as the format defines it.
pub const Options = struct {
    limits: Limits = .{},
    output: Output = .natural,
    pixel: PixelOps = .{},
    resize: Resize = .{},
    crop: ?Crop = null,
    frames: Frames = .{},
    threads: Threads = .{},
    codec: Codec = .{},

    /// Shorthand for the common limit edits; mirrors the grouped fields.
    pub fn withLimits(self: Options, requested_limits: Limits) Options {
        var out = self;
        out.limits = requested_limits;
        return out;
    }
};

/// Per-codec knobs. Only the codec being decoded reads its entry, so unused
/// entries cost nothing. Defaults are each codec's own recommended behavior.
pub const Codec = struct {
    png: Png = .{},
    jpeg: Jpeg = .{},
    bmp: bmp.Options = .{},
    gif: Gif = .{},
    webp: Webp = .{},
};

/// PNG decoder knobs.
pub const Png = struct {
    /// Verify CRC-32 of every chunk. Disable only for trusted input.
    verify_checksums: bool = true,
    /// Row filters may select the best filter per row (the "adaptive" filter)
    /// instead of the encoder's choice. Only affects encoding.
    encoding: png.EncodeOptions = .{},
};

/// JPEG decoder knobs.
pub const Jpeg = struct {
    /// Request RGB or RGBA from the decoder; `auto` follows SDL's rule of one
    /// channel for grey input, three for colour and four when asked.
    channels: jpeg.Channels = .automatic,
};

/// GIF decoder knobs, including animation model details.
pub const Gif = struct {
    /// Interlaced GIF images are decoded progressively; the default matches
    /// the specification, and `false` rejects them instead.
    allow_interlaced: bool = true,
    /// Treat frames whose disposal method is undefined as "do not dispose",
    /// which is what browsers do; the other reading is "restore to background".
    undefined_disposal_is_keep: bool = true,
};

/// WebP decoder knobs.
pub const Webp = struct {
    /// Composite animation frames as full-canvas images (default) or keep the
    /// per-frame rectangles so a caller can implement its own animation.
    compose_animation: bool = true,
};
