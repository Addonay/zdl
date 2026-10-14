//! zlay: a UI layout library for Zig, ported from Clay (https://github.com/nicbarker/clay).
//!
//! zlay does layout only. You declare a tree of elements every frame, zlay
//! computes where everything goes (flex-box like sizing, text wrapping,
//! scrolling, floating elements, transitions) and returns a flat list of
//! render commands for your renderer to draw.
//!
//! Properties:
//!   * No dependencies, not even the Zig standard library.
//!   * No allocations: everything lives in one caller-provided buffer.
//!   * Immediate mode: redeclare the whole UI every frame; it's fast
//!     (thousands of elements in well under a millisecond).
//!   * Renderer agnostic.
//!
//! Quick start:
//!
//! ```zig
//! const zlay = @import("zlay");
//!
//! var memory: [zlay.default_memory_size]u8 align(64) = undefined;
//! const ui = try zlay.Context.init(&memory, .{
//!     .layout_dimensions = .init(1280, 720),
//!     .measure_text = myMeasureText,
//! });
//!
//! // every frame:
//! ui.setLayoutDimensions(.init(width, height));
//! ui.setPointerState(.init(mouse_x, mouse_y), mouse_down);
//! ui.updateScrollContainers(true, .init(wheel_x, wheel_y), dt);
//! ui.beginLayout();
//! ui.open(.named("Sidebar")).config(.{
//!     .layout = .{ .sizing = .{ .width = .fixed(300), .height = .grow(.{}) }, .padding = .all(16), .child_gap = 8, .direction = .top_to_bottom },
//!     .background_color = .rgb(30, 30, 36),
//! }).children({
//!     ui.text("Hello zlay", .{ .font_size = 24, .color = .white });
//! });
//! for (ui.endLayout(dt)) |command| draw(command);
//! ```
//!
//! Source map (handy when extending):
//!   * `types.zig`      geometry, colors, ids, pointer state
//!   * `config.zig`     element declarations (layout, text, floating, ...)
//!   * `render.zig`     render commands (the output)
//!   * `Context.zig`    the context: init, frame lifecycle, declaring elements, queries
//!   * `layout.zig`     sizing / positioning algorithm and render command emission
//!   * `text.zig`       text measurement cache and wrapping
//!   * `interaction.zig` pointer hit testing and scroll containers
//!   * `transition.zig` transitions / animations
//!   * `debug.zig`      the interactive debug view
//!   * `memory.zig`     arena and fixed capacity lists
//!   * `hash.zig`       id and text hashing

const types = @import("types.zig");
const config = @import("config.zig");
const render = @import("render.zig");
const transition = @import("transition.zig");

/// The layout context. See `Context.zig`.
pub const Context = @import("Context.zig");

// Basic types ------------------------------------------------------------------
pub const Vec2 = types.Vec2;
pub const Dimensions = types.Dimensions;
pub const BoundingBox = types.BoundingBox;
pub const Color = types.Color;
pub const CornerRadius = types.CornerRadius;
pub const ElementId = types.ElementId;
pub const PointerState = types.PointerState;
pub const PointerData = types.PointerData;
pub const max_float = types.max_float;

// Element configuration ----------------------------------------------------------
pub const ElementDeclaration = config.ElementDeclaration;
pub const LayoutConfig = config.LayoutConfig;
pub const LayoutDirection = config.LayoutDirection;
pub const AlignX = config.AlignX;
pub const AlignY = config.AlignY;
pub const ChildAlignment = config.ChildAlignment;
pub const Sizing = config.Sizing;
pub const SizingAxis = config.SizingAxis;
pub const MinMax = config.MinMax;
pub const Padding = config.Padding;
pub const TextConfig = config.TextConfig;
pub const TextWrapMode = config.TextWrapMode;
pub const TextAlignment = config.TextAlignment;
pub const AspectRatioConfig = config.AspectRatioConfig;
pub const ImageConfig = config.ImageConfig;
pub const CustomConfig = config.CustomConfig;
pub const ClipConfig = config.ClipConfig;
pub const BorderConfig = config.BorderConfig;
pub const BorderWidth = config.BorderWidth;
pub const FloatingConfig = config.FloatingConfig;
pub const AttachPoint = config.AttachPoint;
pub const AttachPoints = config.AttachPoints;
pub const AttachTo = config.AttachTo;
pub const ClipTo = config.ClipTo;
pub const PointerCaptureMode = config.PointerCaptureMode;
pub const TransitionConfig = config.TransitionConfig;
pub const TransitionData = config.TransitionData;
pub const TransitionState = config.TransitionState;
pub const TransitionProperties = config.TransitionProperties;
pub const TransitionArgs = config.TransitionArgs;
pub const TransitionHandler = config.TransitionHandler;
pub const EnterTrigger = config.EnterTrigger;
pub const ExitTrigger = config.ExitTrigger;
pub const InteractionHandling = config.InteractionHandling;
pub const ExitSiblingOrdering = config.ExitSiblingOrdering;

// Output --------------------------------------------------------------------------
pub const RenderCommand = render.RenderCommand;
pub const RenderCommandType = render.RenderCommandType;
pub const RenderData = render.RenderData;
pub const RectangleData = render.RectangleData;
pub const BorderData = render.BorderData;
pub const TextData = render.TextData;
pub const ImageData = render.ImageData;
pub const CustomData = render.CustomData;
pub const ClipData = render.ClipData;
pub const OverlayColorData = render.OverlayColorData;

// Context related -----------------------------------------------------------------
pub const Options = Context.Options;
pub const ErrorType = Context.ErrorType;
pub const ErrorData = Context.ErrorData;
pub const ErrorHandler = Context.ErrorHandler;
pub const MeasureTextFn = Context.MeasureTextFn;
pub const QueryScrollOffsetFn = Context.QueryScrollOffsetFn;
pub const OnHoverFn = Context.OnHoverFn;
pub const ElementData = Context.ElementData;
pub const ScrollContainerData = Context.ScrollContainerData;

/// Ready-made transition handlers (use as `.transition.handler`).
pub const transitions = struct {
    /// Cubic ease out (Clay's `Clay_EaseOut`).
    pub const easeOut = transition.easeOut;
    /// Constant speed.
    pub const linear = transition.linear;
    /// Building blocks for custom handlers.
    pub const interpolate = transition.interpolate;
    pub const progress = transition.progress;
};

/// Memory needed with the default `Options` (8192 elements). Computed at
/// compile time so it can size a static buffer.
pub const default_memory_size: usize = Context.minMemorySize(.{});

/// Memory needed for the given options (same as `Context.minMemorySize`).
pub fn minMemorySize(options: Options) usize {
    return Context.minMemorySize(options);
}

test {
    // Pull in every file so `zig build test` compiles all of it.
    _ = @import("hash.zig");
    _ = @import("memory.zig");
    _ = @import("layout.zig");
    _ = @import("text.zig");
    _ = @import("interaction.zig");
    _ = @import("debug.zig");
}
