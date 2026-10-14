//! Render commands: the output of `Context.endLayout`.
//!
//! zlay never draws anything. It produces a flat, already z-sorted list of
//! `RenderCommand`s which you replay in order with whatever graphics API you
//! like. Each command has a bounding box and a tagged `data` payload:
//!
//! ```zig
//! for (ui.endLayout(dt)) |cmd| switch (cmd.data) {
//!     .rectangle => |r| drawRect(cmd.bounding_box, r.color, r.corner_radius),
//!     .text => |t| drawText(cmd.bounding_box, t.text, t.font_id, t.font_size, t.color),
//!     .scissor_start => beginClip(cmd.bounding_box),
//!     .scissor_end => endClip(),
//!     else => {},
//! };
//! ```
//!
//! Extending: add a variant to `RenderCommandType` + `RenderData` and emit it
//! from `layout.zig`. Renderers using `else => {}` keep compiling.

const types = @import("types.zig");
const config = @import("config.zig");
const BoundingBox = types.BoundingBox;
const Color = types.Color;
const CornerRadius = types.CornerRadius;

pub const RenderCommandType = enum(u8) {
    /// Should be skipped.
    none,
    /// A solid (optionally rounded) rectangle.
    rectangle,
    /// A border inset into the bounding box.
    border,
    /// One line of text.
    text,
    image,
    /// Start clipping everything that follows to the bounding box.
    scissor_start,
    /// Stop the most recent clip.
    scissor_end,
    /// Begin mixing a color into everything that follows.
    overlay_color_start,
    /// Stop the most recent color overlay.
    overlay_color_end,
    /// Something only your renderer knows how to draw.
    custom,
};

pub const RectangleData = struct {
    color: Color,
    corner_radius: CornerRadius = .{},
};

pub const BorderData = struct {
    color: Color,
    corner_radius: CornerRadius,
    width: config.BorderWidth,
};

pub const TextData = struct {
    /// The characters of this line (not null terminated).
    text: []const u8,
    /// The full string this line was cut from; handy for glyph caches.
    base: []const u8,
    color: Color,
    font_id: u16,
    font_size: u16,
    letter_spacing: u16,
    /// The configured line height (0 if it was left on "auto").
    line_height: u16,
};

pub const ImageData = struct {
    /// Tint. Note the default is all zeros, which you probably want to treat
    /// as "untinted".
    background_color: Color,
    corner_radius: CornerRadius,
    image_data: ?*anyopaque,
};

pub const CustomData = struct {
    background_color: Color,
    corner_radius: CornerRadius,
    custom_data: ?*anyopaque,
};

pub const ClipData = struct {
    horizontal: bool = false,
    vertical: bool = false,
};

pub const OverlayColorData = struct {
    color: Color,
};

/// Payload of a render command, tagged by its type.
pub const RenderData = union(RenderCommandType) {
    none: void,
    rectangle: RectangleData,
    border: BorderData,
    text: TextData,
    image: ImageData,
    scissor_start: ClipData,
    scissor_end: void,
    overlay_color_start: OverlayColorData,
    overlay_color_end: void,
    custom: CustomData,
};

pub const RenderCommand = struct {
    /// Where to draw, relative to the root of the layout.
    bounding_box: BoundingBox = .{},
    data: RenderData = .none,
    /// `user_data` from the element (or text) declaration.
    user_data: ?*anyopaque = null,
    /// Id of the element that produced this command (or an id derived from it).
    id: u32 = 0,
    /// The list is already sorted; this is for batching renderers.
    z_index: i16 = 0,

    pub fn commandType(self: RenderCommand) RenderCommandType {
        return self.data;
    }
};
