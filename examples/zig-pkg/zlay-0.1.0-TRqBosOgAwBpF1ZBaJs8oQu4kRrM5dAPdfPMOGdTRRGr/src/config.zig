//! Everything you can say about an element when you declare it.
//!
//! `ElementDeclaration` is the Zig equivalent of Clay's
//! `Clay_ElementDeclaration`. Every field has a default, so you only spell out
//! what you need:
//!
//! ```zig
//! ui.open(.named("Card")).config(.{
//!     .layout = .{ .sizing = .{ .width = .grow(.{}) }, .padding = .all(16) },
//!     .background_color = .rgb(40, 40, 48),
//!     .corner_radius = .all(8),
//! }).children({ ... });
//! ```
//!
//! Extending: new per-element features are added as a new field (with a
//! default) on `ElementDeclaration`, plus handling in `layout.zig` (sizing /
//! positioning) and/or `render.zig` (render command emission).

const types = @import("types.zig");
const Vec2 = types.Vec2;
const Dimensions = types.Dimensions;
const BoundingBox = types.BoundingBox;
const Color = types.Color;
const CornerRadius = types.CornerRadius;

// -----------------------------------------------------------------------------
// Layout
// -----------------------------------------------------------------------------

/// Direction in which children are placed one after another.
pub const LayoutDirection = enum(u8) {
    /// (default) Children are placed left to right with increasing x.
    left_to_right,
    /// Children are placed top to bottom with increasing y.
    top_to_bottom,
};

/// Horizontal alignment of children inside their parent.
pub const AlignX = enum(u8) {
    /// (default) Align to the left edge (after `padding.left`).
    left,
    /// Align to the right edge (before `padding.right`).
    right,
    center,
};

/// Vertical alignment of children inside their parent.
pub const AlignY = enum(u8) {
    /// (default) Align to the top edge (after `padding.top`).
    top,
    /// Align to the bottom edge (before `padding.bottom`).
    bottom,
    center,
};

pub const ChildAlignment = struct {
    x: AlignX = .left,
    y: AlignY = .top,

    pub const center: ChildAlignment = .{ .x = .center, .y = .center };
};

/// Lower / upper bound in pixels for an element's size on one axis.
/// A `max` of 0 (or less) means "unbounded", exactly like Clay.
pub const MinMax = struct {
    min: f32 = 0,
    max: f32 = 0,
};

/// How an element is sized along one axis.
///
/// Construct it with the helpers rather than by hand:
/// `.fit(.{})`, `.grow(.{ .min = 100 })`, `.fixed(32)`, `.percent(0.5)`.
pub const SizingAxis = struct {
    kind: Kind = .fit,
    /// Bounds for `fit`, `grow` and `fixed` (fixed uses min == max).
    min_max: MinMax = .{},
    /// 0..1 fraction of the parent for `percent`.
    fraction: f32 = 0,

    pub const Kind = enum(u8) {
        /// (default) Wrap tightly around the element's content.
        fit,
        /// Expand to fill the space left over in the parent, shared with
        /// other `grow` siblings.
        grow,
        /// A fraction (0..1) of the parent's size minus padding and gaps.
        percent,
        /// An exact size in pixels.
        fixed,
    };

    /// Shrink-wrap the content, optionally clamped (Clay's `CLAY_SIZING_FIT`).
    pub fn fit(bounds: MinMax) SizingAxis {
        return .{ .kind = .fit, .min_max = bounds };
    }

    /// Fill available space, optionally clamped (Clay's `CLAY_SIZING_GROW`).
    pub fn grow(bounds: MinMax) SizingAxis {
        return .{ .kind = .grow, .min_max = bounds };
    }

    /// Exact pixel size (Clay's `CLAY_SIZING_FIXED`).
    pub fn fixed(size: f32) SizingAxis {
        return .{ .kind = .fixed, .min_max = .{ .min = size, .max = size } };
    }

    /// Fraction 0..1 of the parent (Clay's `CLAY_SIZING_PERCENT`).
    pub fn percent(fraction: f32) SizingAxis {
        return .{ .kind = .percent, .fraction = fraction };
    }
};

/// Sizing on both axes.
pub const Sizing = struct {
    width: SizingAxis = .{},
    height: SizingAxis = .{},

    /// Grow on both axes; a very common choice for containers.
    pub const grow: Sizing = .{ .width = .grow(.{}), .height = .grow(.{}) };

    pub fn fixed(width: f32, height: f32) Sizing {
        return .{ .width = .fixed(width), .height = .fixed(height) };
    }
};

/// Space in pixels between an element's edge and its children.
pub const Padding = struct {
    left: u16 = 0,
    right: u16 = 0,
    top: u16 = 0,
    bottom: u16 = 0,

    /// Same padding on all sides (Clay's `CLAY_PADDING_ALL`).
    pub fn all(p: u16) Padding {
        return .{ .left = p, .right = p, .top = p, .bottom = p };
    }

    /// `horizontal` on left/right, `vertical` on top/bottom.
    pub fn axes(horizontal: u16, vertical: u16) Padding {
        return .{ .left = horizontal, .right = horizontal, .top = vertical, .bottom = vertical };
    }

    pub fn horizontalSum(self: Padding) f32 {
        return @floatFromInt(@as(u32, self.left) + self.right);
    }

    pub fn verticalSum(self: Padding) f32 {
        return @floatFromInt(@as(u32, self.top) + self.bottom);
    }
};

/// Settings that affect the size and position of an element and its children.
pub const LayoutConfig = struct {
    sizing: Sizing = .{},
    padding: Padding = .{},
    /// Gap between consecutive children along the layout direction.
    child_gap: u16 = 0,
    child_alignment: ChildAlignment = .{},
    direction: LayoutDirection = .left_to_right,
};

// -----------------------------------------------------------------------------
// Text
// -----------------------------------------------------------------------------

/// How text is broken into lines when there isn't enough horizontal space.
pub const TextWrapMode = enum(u8) {
    /// (default) Break on whitespace.
    words,
    /// Only break on explicit newlines.
    newlines,
    /// Never wrap.
    none,
};

/// Horizontal alignment of each wrapped line inside the text's bounding box.
pub const TextAlignment = enum(u8) {
    left,
    center,
    right,
};

/// Configuration for a text element (Clay's `Clay_TextElementConfig`).
pub const TextConfig = struct {
    /// Passed through untouched to the resulting text render commands.
    user_data: ?*anyopaque = null,
    color: Color = .{},
    /// Passed to your measure function and renderer to pick a font.
    /// The debug view always uses font id 0.
    font_id: u16 = 0,
    font_size: u16 = 0,
    /// Extra horizontal space between characters (handled by your measure
    /// function and renderer).
    letter_spacing: u16 = 0,
    /// Height of each line. 0 means "use the measured height".
    line_height: u16 = 0,
    wrap_mode: TextWrapMode = .words,
    alignment: TextAlignment = .left,
};

// -----------------------------------------------------------------------------
// Element features
// -----------------------------------------------------------------------------

/// Keeps width / height at a fixed ratio.
pub const AspectRatioConfig = struct {
    /// width / height. 0 disables aspect ratio scaling.
    ratio: f32 = 0,
};

/// Turns the element into an image. zlay does nothing with the pointer except
/// hand it to the renderer in an `image` render command.
pub const ImageConfig = struct {
    data: ?*anyopaque = null,
};

/// Produces a `custom` render command carrying this pointer, for anything zlay
/// doesn't draw itself (charts, 3D views, video...).
pub const CustomConfig = struct {
    data: ?*anyopaque = null,
};

/// Clip overflowing children and optionally offset them (scroll containers).
pub const ClipConfig = struct {
    horizontal: bool = false,
    vertical: bool = false,
    /// Offset applied to every child. For a scroll container, pass
    /// `ui.scrollOffset()` (inside `.config(...)`) or `ui.scrollOffsetOf(id)`.
    child_offset: Vec2 = .{},

    pub fn enabled(self: ClipConfig) bool {
        return self.horizontal or self.vertical;
    }
};

/// Widths of each border side in pixels.
pub const BorderWidth = struct {
    left: u16 = 0,
    right: u16 = 0,
    top: u16 = 0,
    bottom: u16 = 0,
    /// Lines drawn between children (vertical lines for left_to_right,
    /// horizontal lines for top_to_bottom). Emitted as rectangle commands.
    between_children: u16 = 0,

    /// Outer sides only (Clay's `CLAY_BORDER_OUTSIDE`).
    pub fn outside(w: u16) BorderWidth {
        return .{ .left = w, .right = w, .top = w, .bottom = w };
    }

    /// Outer sides and between children (Clay's `CLAY_BORDER_ALL`).
    pub fn all(w: u16) BorderWidth {
        return .{ .left = w, .right = w, .top = w, .bottom = w, .between_children = w };
    }

    pub fn any(self: BorderWidth) bool {
        return self.left > 0 or self.right > 0 or self.top > 0 or self.bottom > 0 or self.between_children > 0;
    }

    pub fn eql(self: BorderWidth, other: BorderWidth) bool {
        return self.left == other.left and self.right == other.right and self.top == other.top and
            self.bottom == other.bottom and self.between_children == other.between_children;
    }
};

pub const BorderConfig = struct {
    color: Color = .{},
    width: BorderWidth = .{},
};

// -----------------------------------------------------------------------------
// Floating
// -----------------------------------------------------------------------------

/// A point on a box used to attach floating elements. See Clay's docs for a
/// picture: the floating element's `element` point is placed on the parent's
/// `parent` point, then `offset` is added.
pub const AttachPoint = enum(u8) {
    left_top,
    left_center,
    left_bottom,
    center_top,
    center_center,
    center_bottom,
    right_top,
    right_center,
    right_bottom,
};

pub const AttachPoints = struct {
    element: AttachPoint = .left_top,
    parent: AttachPoint = .left_top,
};

/// Whether pointer events stop at a floating element or pass through it.
pub const PointerCaptureMode = enum(u8) {
    /// (default) Elements underneath don't receive hover.
    capture,
    passthrough,
};

/// What a floating element is positioned relative to.
pub const AttachTo = enum(u8) {
    /// (default) Not floating.
    none,
    /// The element's parent in the declaration tree.
    parent,
    /// The element whose id is `FloatingConfig.parent_id`.
    element_with_id,
    /// The root of the layout ("absolute positioning" with `offset`).
    root,
};

/// Whether a floating element is clipped like the element it attaches to.
pub const ClipTo = enum(u8) {
    none,
    attached_parent,
};

/// Floating elements are laid out above other elements and don't affect the
/// size or position of their siblings or parents.
pub const FloatingConfig = struct {
    offset: Vec2 = .{},
    /// Grows the floating element's box without affecting its children.
    expand: Dimensions = .{},
    /// Used with `.attach_to = .element_with_id`, e.g. `ElementId.named("x").id`.
    parent_id: u32 = 0,
    /// Floating trees are sorted by ascending z index before rendering.
    z_index: i16 = 0,
    attach_points: AttachPoints = .{},
    pointer_capture_mode: PointerCaptureMode = .capture,
    attach_to: AttachTo = .none,
    clip_to: ClipTo = .none,

    pub fn isFloating(self: FloatingConfig) bool {
        return self.attach_to != .none;
    }
};

// -----------------------------------------------------------------------------
// Transitions
// -----------------------------------------------------------------------------

/// The animatable state of an element.
pub const TransitionData = struct {
    bounding_box: BoundingBox = .{},
    background_color: Color = .{},
    overlay_color: Color = .{},
    border_color: Color = .{},
    border_width: BorderWidth = .{},
};

pub const TransitionState = enum(u8) {
    idle,
    entering,
    transitioning,
    exiting,
};

/// Which properties of an element are animated. A bit set; combine with
/// `merge` or use the predefined groups (`position`, `dimensions`, ...).
pub const TransitionProperties = packed struct(u16) {
    x: bool = false,
    y: bool = false,
    width: bool = false,
    height: bool = false,
    background_color: bool = false,
    overlay_color: bool = false,
    corner_radius: bool = false,
    border_color: bool = false,
    border_width: bool = false,
    _padding: u7 = 0,

    pub const none: TransitionProperties = .{};
    pub const position: TransitionProperties = .{ .x = true, .y = true };
    pub const dimensions: TransitionProperties = .{ .width = true, .height = true };
    pub const bounding_box: TransitionProperties = .{ .x = true, .y = true, .width = true, .height = true };
    pub const border: TransitionProperties = .{ .border_color = true, .border_width = true };
    pub const colors: TransitionProperties = .{ .background_color = true, .overlay_color = true, .border_color = true };

    pub fn merge(a: TransitionProperties, b: TransitionProperties) TransitionProperties {
        return @bitCast(@as(u16, @bitCast(a)) | @as(u16, @bitCast(b)));
    }

    pub fn intersect(a: TransitionProperties, b: TransitionProperties) TransitionProperties {
        return @bitCast(@as(u16, @bitCast(a)) & @as(u16, @bitCast(b)));
    }

    pub fn isEmpty(self: TransitionProperties) bool {
        return @as(u16, @bitCast(self)) == 0;
    }

    pub fn hasPosition(self: TransitionProperties) bool {
        return self.x or self.y;
    }
};

/// Arguments handed to a transition handler every frame while it runs.
pub const TransitionArgs = struct {
    state: TransitionState,
    initial: TransitionData,
    /// Write the interpolated state here.
    current: *TransitionData,
    target: TransitionData,
    elapsed_time: f32,
    duration: f32,
    properties: TransitionProperties,
};

/// Advances a transition. Writes `args.current` and returns true once done.
/// `zlay.transitions.easeOut` is a ready-made handler.
pub const TransitionHandler = *const fn (args: TransitionArgs) bool;

/// Computes the state an entering element animates *from*.
pub const EnterStateFn = *const fn (target: TransitionData, properties: TransitionProperties) TransitionData;

/// Computes the state an exiting element animates *to*.
pub const ExitStateFn = *const fn (initial: TransitionData, properties: TransitionProperties) TransitionData;

pub const EnterTrigger = enum(u8) {
    /// Don't play the enter transition if the parent also appeared this frame.
    skip_on_first_parent_frame,
    trigger_on_first_parent_frame,
};

pub const ExitTrigger = enum(u8) {
    /// Don't play the exit transition if the parent also disappeared.
    skip_when_parent_exits,
    trigger_when_parent_exits,
};

pub const InteractionHandling = enum(u8) {
    /// Ignore the pointer while the element is entering/exiting or moving.
    disable_while_transitioning_position,
    /// Only ignore the pointer while exiting.
    allow_while_transitioning_position,
};

/// Where an exiting element is drawn relative to its former siblings.
pub const ExitSiblingOrdering = enum(u8) {
    underneath_siblings,
    natural_order,
    above_siblings,
};

/// Animate changes to an element's box and colors, plus enter / exit
/// animations. Setting `handler` enables transitions for the element.
pub const TransitionConfig = struct {
    handler: ?TransitionHandler = null,
    /// Seconds.
    duration: f32 = 0,
    properties: TransitionProperties = .{},
    interaction_handling: InteractionHandling = .disable_while_transitioning_position,
    enter: Enter = .{},
    exit: Exit = .{},

    pub const Enter = struct {
        set_initial_state: ?EnterStateFn = null,
        trigger: EnterTrigger = .skip_on_first_parent_frame,
    };

    pub const Exit = struct {
        set_final_state: ?ExitStateFn = null,
        trigger: ExitTrigger = .skip_when_parent_exits,
        sibling_ordering: ExitSiblingOrdering = .underneath_siblings,
    };
};

// -----------------------------------------------------------------------------
// The declaration itself
// -----------------------------------------------------------------------------

/// Full description of a (non-text) element. The id is passed separately to
/// `Context.open`, mirroring Clay's `CLAY(id, { ... })`.
pub const ElementDeclaration = struct {
    layout: LayoutConfig = .{},
    /// Fills the element with a rectangle (if alpha > 0). For image and custom
    /// elements it is passed along as a tint / background instead.
    background_color: Color = .{},
    /// "Color overlay" applied to this element and all its children:
    /// `mix(color, overlay.rgb, overlay.a)`.
    overlay_color: Color = .{},
    corner_radius: CornerRadius = .{},
    aspect_ratio: AspectRatioConfig = .{},
    image: ImageConfig = .{},
    floating: FloatingConfig = .{},
    custom: CustomConfig = .{},
    clip: ClipConfig = .{},
    border: BorderConfig = .{},
    transition: TransitionConfig = .{},
    /// Passed through untouched to every render command of this element.
    user_data: ?*anyopaque = null,
};
