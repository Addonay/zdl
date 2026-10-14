//! Internal data structures of the layout context. None of these are part of
//! the public API; they're the Zig counterparts of Clay's private structs.

const types = @import("types.zig");
const config = @import("config.zig");
const Vec2 = types.Vec2;
const Dimensions = types.Dimensions;
const BoundingBox = types.BoundingBox;
const ElementId = types.ElementId;
const PointerData = types.PointerData;
const Context = @import("Context.zig");

/// Sentinel for "no index" in intrusive linked lists.
pub const no_index: i32 = -1;

/// The children of an element: a window into `Context.layout_element_children`
/// holding indices into `Context.layout_elements`.
///
/// While an element is still open only `len` is meaningful (it counts the
/// children declared so far); `ptr` is set when the element closes.
pub const ChildList = struct {
    ptr: [*]u32 = undefined,
    len: u32 = 0,

    pub fn slice(self: ChildList) []u32 {
        return self.ptr[0..self.len];
    }
};

/// One line produced by text wrapping.
pub const WrappedTextLine = struct {
    dimensions: Dimensions,
    line: []const u8,
};

/// Wrapped lines of a text element: a window into `Context.wrapped_text_lines`.
pub const WrappedLines = struct {
    ptr: [*]WrappedTextLine = undefined,
    len: u32 = 0,

    pub fn slice(self: WrappedLines) []WrappedTextLine {
        return self.ptr[0..self.len];
    }
};

/// Data specific to text elements.
pub const TextElement = struct {
    config: config.TextConfig,
    text: []const u8,
    /// Size of the text laid out on a single line (per explicit newline).
    preferred_dimensions: Dimensions,
    wrapped_lines: WrappedLines = .{},
};

/// A node in the layout tree. Both containers and text are layout elements;
/// `is_text` says which half of `data` is valid.
pub const LayoutElement = struct {
    children: ChildList = .{},
    dimensions: Dimensions = .{},
    min_dimensions: Dimensions = .{},
    data: Data,
    id: u32 = 0,
    floating_children_count: u16 = 0,
    is_text: bool = false,
    /// True for a synthetic copy kept alive (from a previous frame) while its
    /// exit transition plays.
    exiting: bool = false,

    /// Untagged on purpose (memory, like Clay's C union). In safe builds Zig
    /// still checks we only read the active field.
    pub const Data = union {
        config: config.ElementDeclaration,
        text: TextElement,
    };

    pub fn initContainer(id: u32) LayoutElement {
        return .{ .id = id, .data = .{ .config = .{} } };
    }

    pub fn initText(text_config: config.TextConfig) LayoutElement {
        return .{
            .is_text = true,
            .data = .{ .text = .{ .config = text_config, .text = "", .preferred_dimensions = .{} } },
        };
    }

    /// The declaration of a container element. Must not be called on text.
    pub fn cfg(self: *LayoutElement) *config.ElementDeclaration {
        return &self.data.config;
    }

    pub fn text(self: *LayoutElement) *TextElement {
        return &self.data.text;
    }

    /// Text elements behave as if they had a default layout.
    pub fn layoutConfig(self: *LayoutElement) *const config.LayoutConfig {
        return if (self.is_text) &default_layout else &self.data.config.layout;
    }

    /// Text elements report "fit, no bounds" sizing (Clay's
    /// `Clay__GetElementSizing`).
    pub fn sizingAxis(self: *LayoutElement, x_axis: bool) config.SizingAxis {
        if (self.is_text) return .{};
        const sizing = self.data.config.layout.sizing;
        return if (x_axis) sizing.width else sizing.height;
    }

    pub fn isFloating(self: *LayoutElement) bool {
        return !self.is_text and self.data.config.floating.attach_to != .none;
    }

    pub fn clipsAny(self: *LayoutElement) bool {
        return !self.is_text and self.data.config.clip.enabled();
    }

    pub fn clipsAxis(self: *LayoutElement, x_axis: bool) bool {
        if (self.is_text) return false;
        const clip = self.data.config.clip;
        return if (x_axis) clip.horizontal else clip.vertical;
    }

    pub fn hasTransition(self: *LayoutElement) bool {
        return !self.is_text and self.data.config.transition.handler != null;
    }

    pub fn axisSize(self: *LayoutElement, x_axis: bool) *f32 {
        return if (x_axis) &self.dimensions.width else &self.dimensions.height;
    }

    pub fn axisMinSize(self: *LayoutElement, x_axis: bool) f32 {
        return if (x_axis) self.min_dimensions.width else self.min_dimensions.height;
    }
};

const default_layout: config.LayoutConfig = .{};

/// Signature of a hover callback, see `Context.onHover`.
pub const OnHoverFn = *const fn (ctx: *Context, id: ElementId, pointer: PointerData, user_data: ?*anyopaque) void;

/// Entry of the element id -> element hash map. Persistent across frames so
/// bounding boxes from the last layout can be queried and hover handled.
pub const HashMapItem = struct {
    bounding_box: BoundingBox = .{},
    element_id: ElementId = .{},
    layout_element: ?*LayoutElement = null,
    on_hover: ?OnHoverFn = null,
    hover_user_data: ?*anyopaque = null,
    next_index: i32 = no_index,
    /// Frame number + 1 of the last frame this element was declared in.
    /// `generation > ctx.generation` means "declared this frame".
    generation: u32 = 0,
    appeared_this_frame: bool = false,
    debug: DebugData = .{},

    pub const DebugData = struct {
        collision: bool = false,
        collapsed: bool = false,
    };
};

/// A whitespace separated run of characters measured by the user's measure
/// function, as a node in a linked list (one list per measured string).
pub const MeasuredWord = struct {
    start_offset: u32 = 0,
    /// 0 means "explicit newline".
    length: u32 = 0,
    width: f32 = 0,
    next: i32 = no_index,
};

/// Cached measurements for one (text, font settings) pair.
pub const MeasureTextCacheItem = struct {
    unwrapped_dimensions: Dimensions = .{},
    measured_words_start_index: i32 = no_index,
    min_width: f32 = 0,
    contains_newlines: bool = false,
    // hash map bookkeeping
    id: u32 = 0,
    /// 0 means "end of bucket chain" (slot 0 is reserved).
    next_index: u32 = 0,
    generation: u32 = 0,
};

/// Work item for the depth first traversals of the layout tree.
pub const TreeNode = struct {
    layout_element: *LayoutElement,
    position: Vec2 = .{},
    next_child_offset: Vec2 = .{},
};

/// Root of an independently laid out tree: the root container itself, plus
/// one per floating element.
pub const TreeRoot = struct {
    layout_element_index: u32,
    /// Element the tree is attached to (0 for the main root).
    parent_id: u32 = 0,
    /// Clip element inherited by this tree (0 if none).
    clip_element_id: u32 = 0,
    z_index: i16 = 0,
};

/// Persistent state of a clip / scroll container.
pub const ScrollContainer = struct {
    layout_element: ?*LayoutElement = null,
    bounding_box: BoundingBox = .{},
    content_size: Dimensions = .{},
    scroll_origin: Vec2 = .{},
    pointer_origin: Vec2 = .{},
    scroll_momentum: Vec2 = .{},
    scroll_position: Vec2 = .{},
    previous_delta: Vec2 = .{},
    momentum_time: f32 = 0,
    element_id: u32 = 0,
    open_this_frame: bool = false,
    pointer_scroll_active: bool = false,
};

/// Persistent state of an element with a transition.
pub const Transition = struct {
    initial_state: config.TransitionData = .{},
    current_state: config.TransitionData = .{},
    target_state: config.TransitionData = .{},
    element_this_frame: *LayoutElement,
    old_parent_relative_position: Vec2 = .{},
    element_id: u32,
    parent_id: u32,
    sibling_index: u32,
    elapsed_time: f32 = 0,
    state: config.TransitionState = .idle,
    /// Has an exit transition, so must be kept alive after disappearing.
    transition_out: bool,
    reparented: bool = false,
    active_properties: config.TransitionProperties = .{},
};

/// Errors already reported this frame, so each is reported only once.
pub const BooleanWarnings = struct {
    max_elements_exceeded: bool = false,
    max_render_commands_exceeded: bool = false,
    max_text_measure_cache_exceeded: bool = false,
    text_measurement_function_not_set: bool = false,
    hash_map_capacity_exceeded: bool = false,
};
