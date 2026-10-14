//! The layout context: owns all state and is the entry point of the API.
//!
//! A frame looks like this:
//!
//! ```zig
//! ui.setLayoutDimensions(.init(window_w, window_h));
//! ui.setPointerState(mouse_pos, mouse_down);
//! ui.updateScrollContainers(true, wheel_delta, dt);
//!
//! ui.beginLayout();
//! ui.open(.named("Root")).config(.{ .layout = .{ .sizing = .grow } }).children({
//!     ui.text("Hello", .{ .font_size = 24, .color = .white });
//! });
//! const commands = ui.endLayout(dt);
//! ```
//!
//! Unlike Clay there is no hidden global "current context": every call goes
//! through an explicit `*Context`, so any number of independent contexts can
//! coexist (one per window, one per thread, ...).
//!
//! The context lives *inside* the memory block you pass to `init`; it never
//! allocates. Use `minMemorySize` to know how big that block must be.

const Context = @This();

const types = @import("types.zig");
const config = @import("config.zig");
const render = @import("render.zig");
const memory = @import("memory.zig");
const internal = @import("internal.zig");
const hash = @import("hash.zig");
const layout = @import("layout.zig");
const text_measure = @import("text.zig");
const interaction = @import("interaction.zig");
const transition = @import("transition.zig");
const debug = @import("debug.zig");

const Vec2 = types.Vec2;
const Dimensions = types.Dimensions;
const BoundingBox = types.BoundingBox;
const Color = types.Color;
const ElementId = types.ElementId;
const PointerData = types.PointerData;
const ElementDeclaration = config.ElementDeclaration;
const TextConfig = config.TextConfig;
const RenderCommand = render.RenderCommand;
const Arena = memory.Arena;
const List = memory.List;
const LayoutElement = internal.LayoutElement;
const HashMapItem = internal.HashMapItem;

// -----------------------------------------------------------------------------
// Public helper types
// -----------------------------------------------------------------------------

/// Kinds of problems zlay reports through the `ErrorHandler`.
pub const ErrorType = enum(u8) {
    /// No text measurement function was set (see `setMeasureTextFunction`).
    text_measurement_function_not_provided,
    /// The memory block passed to `init` was too small.
    arena_capacity_exceeded,
    /// More elements (or render commands) than `max_element_count`.
    elements_capacity_exceeded,
    /// More measured words than `max_measure_text_cache_word_count`.
    text_measurement_capacity_exceeded,
    /// Two elements in the same layout used the same id.
    duplicate_id,
    /// `.attach_to = .element_with_id` named an element that doesn't exist.
    floating_container_parent_not_found,
    /// A `percent` sizing was given a value above 1 (expects 0..1).
    percentage_over_1,
    /// A bug in zlay. Please report it!
    internal_error,
    /// More `open` calls than `close` calls when the layout ended.
    unbalanced_open_close,
    /// The element id hash map is full (raise `max_element_count`).
    hash_map_capacity_exceeded,
};

pub const ErrorData = struct {
    kind: ErrorType,
    /// Human readable explanation (static string).
    text: []const u8,
    /// `ErrorHandler.user_data`.
    user_data: ?*anyopaque,
};

/// Called whenever zlay detects a problem. Layout continues regardless
/// (zlay never fails a frame), so it's fine to just log.
pub const ErrorHandler = struct {
    function: ?*const fn (err: ErrorData) void = null,
    user_data: ?*anyopaque = null,
};

/// Measures `text` (a single word or line, never containing '\n') using the
/// font settings in `config`. Must be fast: results are cached per word.
pub const MeasureTextFn = *const fn (text: []const u8, config: *const TextConfig, user_data: ?*anyopaque) Dimensions;

/// For hosts that scroll elements themselves (e.g. the DOM): return the
/// current scroll offset of the clip element with this id.
pub const QueryScrollOffsetFn = *const fn (element_id: u32, user_data: ?*anyopaque) Vec2;

pub const OnHoverFn = internal.OnHoverFn;

/// Settings fixed at `init` time. Changing capacities requires a new `init`.
pub const Options = struct {
    /// Size of the root container (usually your window size).
    layout_dimensions: Dimensions = .{},
    error_handler: ErrorHandler = .{},
    measure_text: ?MeasureTextFn = null,
    measure_text_user_data: ?*anyopaque = null,
    /// Maximum number of elements per frame (Clay default: 8192).
    max_element_count: u32 = 8192,
    /// Maximum number of words kept in the text measurement cache.
    max_measure_text_cache_word_count: u32 = 16384,
    /// Maximum number of clip / scroll containers alive at once.
    max_scroll_containers: u32 = 100,
    /// Maximum number of elements with transitions alive at once.
    max_transitions: u32 = 200,
};

/// Result of `elementData`.
pub const ElementData = struct {
    /// Final bounding box from the most recent layout.
    bounding_box: BoundingBox,
};

/// Result of `scrollContainerData`.
pub const ScrollContainerData = struct {
    /// The live internal scroll position. You may write through it (custom
    /// scroll bars, "scroll to item", ...).
    scroll_position: *Vec2,
    /// Size of the container itself.
    container_dimensions: Dimensions,
    /// Size of the content inside, including the container's padding.
    content_dimensions: Dimensions,
    config: config.ClipConfig,
};

// -----------------------------------------------------------------------------
// Fields
// -----------------------------------------------------------------------------

// Configuration ---------------------------------------------------------------
max_element_count: u32,
max_measure_text_cache_word_count: u32,
max_scroll_containers: u32,
max_transitions: u32,
error_handler: ErrorHandler,
measure_text: ?MeasureTextFn = null,
measure_text_user_data: ?*anyopaque = null,
query_scroll_offset: ?QueryScrollOffsetFn = null,
query_scroll_offset_user_data: ?*anyopaque = null,
layout_dimensions: Dimensions,
/// Width of the debug panel in pixels.
debug_view_width: f32 = 400,
/// Color drawn over the element hovered in the debug panel.
debug_view_highlight_color: Color = .rgba(168, 66, 28, 100),

// Frame state -----------------------------------------------------------------
root_resized_last_frame: bool = false,
debug_mode_enabled: bool = false,
culling_enabled: bool = true,
external_scroll_handling_enabled: bool = false,
warnings: internal.BooleanWarnings = .{},
pointer_info: PointerData = .{},
debug_selected_element_id: u32 = 0,
/// Incremented by every `beginLayout`.
generation: u32 = 0,

// Memory ----------------------------------------------------------------------
arena: Arena,
/// Where ephemeral (per frame) memory starts inside `arena`.
arena_reset_offset: usize = 0,

// Persistent memory (survives across frames) ----------------------------------
scroll_containers: List(internal.ScrollContainer) = .{},
transitions: List(internal.Transition) = .{},
hash_map_items: List(HashMapItem) = .{},
/// Bucket heads of the element hash map; -1 means empty.
hash_map_buckets: List(i32) = .{},
hash_map_free_list: List(u32) = .{},
measure_cache_items: List(internal.MeasureTextCacheItem) = .{},
measure_cache_free_list: List(u32) = .{},
/// Bucket heads of the text measurement cache; 0 means empty.
measure_cache_buckets: List(u32) = .{},
measured_words: List(internal.MeasuredWord) = .{},
measured_words_free_list: List(u32) = .{},
pointer_over_ids: List(ElementId) = .{},

// Ephemeral memory (re-carved every frame) ------------------------------------
layout_elements: List(LayoutElement) = .{},
render_commands: List(RenderCommand) = .{},
open_layout_element_stack: List(u32) = .{},
layout_element_children: List(u32) = .{},
/// Children of still-open elements, waiting for their parent to close.
layout_element_children_buffer: List(u32) = .{},
reusable_element_index_buffer: List(u32) = .{},
/// For each element (by index): id of the clip element it's inside, or 0.
layout_element_clip_element_ids: List(u32) = .{},
wrapped_text_lines: List(internal.WrappedTextLine) = .{},
tree_node_array: List(internal.TreeNode) = .{},
tree_roots: List(internal.TreeRoot) = .{},
open_clip_element_stack: List(u32) = .{},
/// Indexed by DFS stack depth.
tree_node_visited: List(bool) = .{},
/// Scratch characters for numbers printed by the debug view.
dynamic_string_data: List(u8) = .{},

/// Id of the implicit root container every layout starts with.
pub const root_id: ElementId = .named("Zlay__RootContainer");

// -----------------------------------------------------------------------------
// Initialization
// -----------------------------------------------------------------------------

/// Bytes of memory `init` needs for these options (Clay's `Clay_MinMemorySize`).
pub fn minMemorySize(options: Options) usize {
    var arena: Arena = .measure();
    _ = arena.alloc(Context, 1);
    var ctx: Context = .{
        .max_element_count = options.max_element_count,
        .max_measure_text_cache_word_count = options.max_measure_text_cache_word_count,
        .max_scroll_containers = options.max_scroll_containers,
        .max_transitions = options.max_transitions,
        .error_handler = .{},
        .layout_dimensions = .{},
        .arena = arena,
    };
    _ = ctx.allocPersistent();
    _ = ctx.allocEphemeral();
    // Slack so we can align an arbitrary buffer to a cache line.
    return ctx.arena.next + memory.cache_line;
}

/// Create a context inside `buffer` (Clay's `Clay_Initialize`). The returned
/// pointer points into `buffer`, which must outlive the context. To change
/// capacities later, call `init` again (optionally on the same buffer).
pub fn init(buffer: []u8, options: Options) error{OutOfMemory}!*Context {
    // Cache line align the start of the block.
    const address = @intFromPtr(buffer.ptr);
    const skip = memory.alignForward(address, memory.cache_line) - address;
    if (skip >= buffer.len) return error.OutOfMemory;
    var arena: Arena = .init(buffer.ptr + skip, buffer.len - skip);

    const self = arena.create(Context) orelse return error.OutOfMemory;
    self.* = .{
        .max_element_count = options.max_element_count,
        .max_measure_text_cache_word_count = options.max_measure_text_cache_word_count,
        .max_scroll_containers = options.max_scroll_containers,
        .max_transitions = options.max_transitions,
        .error_handler = options.error_handler,
        .measure_text = options.measure_text,
        .measure_text_user_data = options.measure_text_user_data,
        .layout_dimensions = options.layout_dimensions,
        .arena = arena,
    };
    if (!self.allocPersistent()) return error.OutOfMemory;
    if (!self.allocEphemeral()) return error.OutOfMemory;

    @memset(self.hash_map_buckets.items(), internal.no_index);
    self.resetMeasureTextCache();
    return self;
}

/// Allocate the persistent arrays and remember where per-frame memory starts.
fn allocPersistent(self: *Context) bool {
    const arena = &self.arena;
    const n = self.max_element_count;
    const words = self.max_measure_text_cache_word_count;
    if (!allocList(arena, &self.scroll_containers, self.max_scroll_containers)) return false;
    if (!allocList(arena, &self.transitions, self.max_transitions)) return false;
    if (!allocList(arena, &self.hash_map_items, n)) return false;
    if (!allocList(arena, &self.hash_map_buckets, n)) return false;
    self.hash_map_buckets.len = self.hash_map_buckets.capacity;
    if (!allocList(arena, &self.hash_map_free_list, n)) return false;
    if (!allocList(arena, &self.measure_cache_items, n)) return false;
    if (!allocList(arena, &self.measure_cache_free_list, n)) return false;
    // Clay sizes the bucket count as words / 32.
    if (!allocList(arena, &self.measure_cache_buckets, @max(1, words / 32))) return false;
    self.measure_cache_buckets.len = self.measure_cache_buckets.capacity;
    if (!allocList(arena, &self.measured_words, words)) return false;
    if (!allocList(arena, &self.measured_words_free_list, words)) return false;
    if (!allocList(arena, &self.pointer_over_ids, n)) return false;
    self.arena_reset_offset = arena.next;
    return true;
}

/// Allocate `list` with `capacity` items from `arena`.
fn allocList(arena: *Arena, list: anytype, capacity: u32) bool {
    list.* = @TypeOf(list.*).alloc(arena, capacity) orelse return false;
    return true;
}

/// (Re)carve the per-frame arrays. Called by `init` and every `beginLayout`.
/// The arrays land at the same addresses each frame, which exit transitions
/// rely on (they stash data past the live region between frames).
fn allocEphemeral(self: *Context) bool {
    const arena = &self.arena;
    arena.next = self.arena_reset_offset;
    const n = self.max_element_count;
    if (!allocList(arena, &self.layout_element_children_buffer, n)) return false;
    if (!allocList(arena, &self.layout_elements, n)) return false;
    if (!allocList(arena, &self.wrapped_text_lines, n)) return false;
    if (!allocList(arena, &self.tree_node_array, n)) return false;
    if (!allocList(arena, &self.tree_roots, n)) return false;
    if (!allocList(arena, &self.layout_element_children, n)) return false;
    if (!allocList(arena, &self.open_layout_element_stack, n)) return false;
    if (!allocList(arena, &self.render_commands, n)) return false;
    if (!allocList(arena, &self.tree_node_visited, n)) return false;
    self.tree_node_visited.len = self.tree_node_visited.capacity;
    if (!allocList(arena, &self.open_clip_element_stack, n)) return false;
    if (!allocList(arena, &self.reusable_element_index_buffer, n)) return false;
    if (!allocList(arena, &self.layout_element_clip_element_ids, n)) return false;
    if (!allocList(arena, &self.dynamic_string_data, n)) return false;
    return true;
}

// -----------------------------------------------------------------------------
// Settings
// -----------------------------------------------------------------------------

/// Update the root size, e.g. when the window is resized.
pub fn setLayoutDimensions(self: *Context, dimensions: Dimensions) void {
    self.root_resized_last_frame = !types.floatEqual(self.layout_dimensions.width, dimensions.width) or
        !types.floatEqual(self.layout_dimensions.height, dimensions.height);
    self.layout_dimensions = dimensions;
}

pub fn getLayoutDimensions(self: *const Context) Dimensions {
    return self.layout_dimensions;
}

/// Set the text measurement callback. Required if you use text.
pub fn setMeasureTextFunction(self: *Context, function: ?MeasureTextFn, user_data: ?*anyopaque) void {
    self.measure_text = function;
    self.measure_text_user_data = user_data;
}

/// Hand scrolling over to the host: zlay asks `function` for each clip
/// element's offset and stops applying `child_offset` itself. Pass null to
/// return to internal scroll handling.
pub fn setExternalScrollHandling(self: *Context, function: ?QueryScrollOffsetFn, user_data: ?*anyopaque) void {
    self.query_scroll_offset = function;
    self.query_scroll_offset_user_data = user_data;
    self.external_scroll_handling_enabled = function != null;
}

pub fn setErrorHandler(self: *Context, handler: ErrorHandler) void {
    self.error_handler = handler;
}

/// Show the interactive debug panel on the right side of the layout. The
/// state is retained; no need to call it every frame.
pub fn setDebugModeEnabled(self: *Context, enabled: bool) void {
    self.debug_mode_enabled = enabled;
}

pub fn isDebugModeEnabled(self: *const Context) bool {
    return self.debug_mode_enabled;
}

/// When enabled (default) no render commands are produced for elements
/// entirely outside the layout dimensions.
pub fn setCullingEnabled(self: *Context, enabled: bool) void {
    self.culling_enabled = enabled;
}

pub fn maxElementCount(self: *const Context) u32 {
    return self.max_element_count;
}

pub fn maxMeasureTextCacheWordCount(self: *const Context) u32 {
    return self.max_measure_text_cache_word_count;
}

/// Forget every cached text measurement, e.g. after fonts were reloaded.
pub fn resetMeasureTextCache(self: *Context) void {
    self.measure_cache_items.len = 1; // slot 0 is reserved for "no next item"
    self.measure_cache_items.ptr[0] = .{};
    self.measure_cache_free_list.len = 0;
    self.measured_words.len = 0;
    self.measured_words_free_list.len = 0;
    @memset(self.measure_cache_buckets.items(), 0);
}

// -----------------------------------------------------------------------------
// Frame lifecycle
// -----------------------------------------------------------------------------

/// Start declaring a new layout. Everything from the previous frame's
/// element tree is discarded (persistent caches are kept).
pub fn beginLayout(self: *Context) void {
    _ = self.allocEphemeral();
    self.generation +%= 1;
    var root_dimensions = self.layout_dimensions;
    if (self.debug_mode_enabled) root_dimensions.width -= self.debug_view_width;
    self.warnings = .{};

    self.openElement(root_id);
    self.configureOpenElement(.{ .layout = .{ .sizing = .{
        .width = .fixed(root_dimensions.width),
        .height = .fixed(root_dimensions.height),
    } } });
    // The root sits on the stack twice so that "parent of the open element"
    // (stack[len - 2]) is always valid, even for direct children of the root.
    _ = self.open_layout_element_stack.append(0);
    _ = self.tree_roots.append(.{ .layout_element_index = 0 });
}

/// Finish the layout: compute sizes and positions, run transitions and
/// return the render commands, sorted and ready to draw. The returned slice
/// is valid until the next `beginLayout`.
pub fn endLayout(self: *Context, delta_time: f32) []const RenderCommand {
    if (!self.warnings.max_elements_exceeded) {
        // The root is on the stack twice (see beginLayout), so a balanced
        // layout has exactly 2 entries here.
        if (self.open_layout_element_stack.len > 2) {
            self.reportError(.unbalanced_open_close, "There were still open layout elements when endLayout was called. " ++
                "This results from an unequal number of calls to open and close.");
        }
        // Close whatever is still open (normally just the root) so the tree
        // is always well formed.
        while (self.open_layout_element_stack.len > 1) self.closeElement();
    }

    transition.processExitingElements(self);

    if (self.warnings.max_elements_exceeded) {
        self.addErrorTextCommand("zlay error: layout elements exceeded max_element_count");
    } else if (self.transitions.len > 0) {
        // First pass: compute target boxes, then let transitions override
        // them, then lay out again with the interpolated values.
        layout.calculateFinalLayout(self, delta_time, false, false);
        transition.updateTransitions(self, delta_time);
        if (self.debug_mode_enabled) debug.renderDebugView(self);
        if (self.warnings.max_elements_exceeded) {
            self.addErrorTextCommand("zlay error: debug view caused layout element count to exceed max_element_count");
        } else {
            layout.calculateFinalLayout(self, delta_time, true, true);
            transition.cloneElementsWithExitTransition(self);
        }
    } else {
        if (self.debug_mode_enabled) debug.renderDebugView(self);
        if (self.warnings.max_elements_exceeded) {
            self.addErrorTextCommand("zlay error: debug view caused layout element count to exceed max_element_count");
        } else {
            layout.calculateFinalLayout(self, delta_time, false, true);
        }
    }

    self.pruneHashMap();
    return self.render_commands.items();
}

/// Render commands produced by the last `endLayout`.
pub fn renderCommands(self: *const Context) []const RenderCommand {
    return self.render_commands.items();
}

// -----------------------------------------------------------------------------
// Declaring elements: the builder API
// -----------------------------------------------------------------------------

/// Open an element. Chain `.config(...)` and then `.children({...})` or
/// `.end()`:
///
/// ```zig
/// ui.open(.named("Button")).config(.{
///     .background_color = if (ui.hovered()) hover_color else base_color,
/// }).children({
///     ui.text("Click me", .{ .font_size = 16 });
/// });
/// ```
///
/// Because the element is opened *before* the declaration is evaluated,
/// `ui.hovered()` and `ui.scrollOffset()` inside `.config(...)` refer to this
/// element, exactly like inside Clay's `CLAY(...)` macro.
pub fn open(self: *Context, id: ElementId) OpenElement {
    self.openElement(id);
    return .{ .ctx = self };
}

/// Shorthand for `open(id).config(declaration)`.
///
/// Note: `declaration` is evaluated *before* the element opens, so calls
/// like `ui.hovered()` inside it refer to the parent. Use `open().config()`
/// when the declaration depends on the element itself.
pub fn element(self: *Context, id: ElementId, declaration: ElementDeclaration) ConfiguredElement {
    self.openElement(id);
    self.configureOpenElement(declaration);
    return .{ .ctx = self };
}

/// Returned by `open`: the element exists but isn't configured yet.
pub const OpenElement = struct {
    ctx: *Context,

    /// Apply the declaration.
    pub fn config(self: OpenElement, declaration: ElementDeclaration) ConfiguredElement {
        self.ctx.configureOpenElement(declaration);
        return .{ .ctx = self.ctx };
    }

    /// Default configuration, declare children, close.
    pub fn children(self: OpenElement, _: void) void {
        self.ctx.configureOpenElement(.{});
        self.ctx.closeElement();
    }

    /// Default configuration, no children, close.
    pub fn end(self: OpenElement) void {
        self.ctx.configureOpenElement(.{});
        self.ctx.closeElement();
    }
};

/// Returned by `OpenElement.config` / `Context.element`.
pub const ConfiguredElement = struct {
    ctx: *Context,

    /// Declare children inside the block, then close the element. The block
    /// is evaluated before this function runs, which is what makes the
    /// `ui.open(..).config(..).children({ ... })` syntax work.
    pub fn children(self: ConfiguredElement, _: void) void {
        self.ctx.closeElement();
    }

    /// Close an element without children.
    pub fn end(self: ConfiguredElement) void {
        self.ctx.closeElement();
    }
};

/// Declare a text element inside the currently open element (Clay's
/// `CLAY_TEXT`). `string` is not copied: it must stay valid until the render
/// commands have been consumed.
pub fn text(self: *Context, string: []const u8, text_config: TextConfig) void {
    if (self.layout_elements.len == self.layout_elements.capacity -| 1 or self.warnings.max_elements_exceeded) {
        self.warnings.max_elements_exceeded = true;
        return;
    }
    const parent = self.openLayoutElement();

    const index = self.layout_elements.len;
    const text_element = self.layout_elements.append(.initText(text_config)) orelse return;
    _ = self.layout_element_clip_element_ids.set(index, self.currentClipElementId());
    _ = self.layout_element_children_buffer.append(index);

    const measured = text_measure.measureTextCached(self, string, &text_element.data.text.config);
    const element_id = hash.hashNumber(parent.children.len + parent.floating_children_count, parent.id);
    text_element.id = element_id.id;
    _ = self.addHashMapItem(element_id, text_element);

    const unwrapped: Dimensions = if (measured) |m| m.unwrapped_dimensions else .{};
    const line_height: f32 = if (text_config.line_height > 0) @floatFromInt(text_config.line_height) else unwrapped.height;
    text_element.dimensions = .{ .width = unwrapped.width, .height = line_height };
    text_element.min_dimensions = .{ .width = if (measured) |m| m.min_width else 0, .height = line_height };
    text_element.data.text.text = string;
    text_element.data.text.preferred_dimensions = unwrapped;
    parent.children.len += 1;
}

// -----------------------------------------------------------------------------
// Declaring elements: the low level API (what the builder uses)
// -----------------------------------------------------------------------------

/// Open a new element as a child of the currently open one (Clay's
/// `Clay__OpenElementWithId` / `Clay__OpenElement`). Must be followed by
/// `configureOpenElement` and eventually `closeElement`.
pub fn openElement(self: *Context, id: ElementId) void {
    if (self.layout_elements.len == self.layout_elements.capacity -| 1 or self.warnings.max_elements_exceeded) {
        self.warnings.max_elements_exceeded = true;
        return;
    }
    const index = self.layout_elements.len;
    const new_element = self.layout_elements.append(.initContainer(id.id)) orelse return;
    _ = self.open_layout_element_stack.append(index);

    var element_id = id;
    if (id.isAuto()) {
        // Auto ids hash the parent's id with our index among its children.
        const parent = self.parentElement();
        element_id = hash.hashNumber(parent.children.len + parent.floating_children_count, parent.id);
        new_element.id = element_id.id;
    }
    _ = self.addHashMapItem(element_id, new_element);
    _ = self.layout_element_clip_element_ids.set(index, self.currentClipElementId());
}

/// Apply a declaration to the currently open element (Clay's
/// `Clay__ConfigureOpenElement`).
pub fn configureOpenElement(self: *Context, declaration: ElementDeclaration) void {
    if (self.warnings.max_elements_exceeded) return;
    const open_element = self.openLayoutElement();
    open_element.data = .{ .config = declaration };
    const decl = open_element.cfg();

    const sizing = declaration.layout.sizing;
    if ((sizing.width.kind == .percent and sizing.width.fraction > 1) or
        (sizing.height.kind == .percent and sizing.height.fraction > 1))
    {
        self.reportError(.percentage_over_1, "An element was configured with percent sizing, but the value was over 1.0. " ++
            "zlay expects a value between 0 and 1, i.e. 20% is 0.2.");
    }

    const stack = &self.open_layout_element_stack;
    const open_index = stack.get(stack.len - 1).*;

    if (declaration.floating.attach_to != .none) {
        const floating = &decl.floating;
        // The root container is always on the stack, so len >= 2 here.
        const hierarchical_parent = self.parentElement();
        var clip_element_id: u32 = 0;
        switch (declaration.floating.attach_to) {
            .parent => {
                floating.parent_id = hierarchical_parent.id;
                if (self.open_clip_element_stack.last()) |clip| clip_element_id = clip.*;
            },
            .element_with_id => {
                if (self.getHashMapItem(floating.parent_id)) |parent_item| {
                    if (parent_item.layout_element) |parent_element| {
                        const parent_index = self.layout_elements.indexOf(parent_element);
                        clip_element_id = self.layout_element_clip_element_ids.getRaw(parent_index).*;
                    }
                } else {
                    self.reportError(.floating_container_parent_not_found, "A floating element was declared with a parent_id, " ++
                        "but no element with that id was found.");
                }
            },
            .root => floating.parent_id = root_id.id,
            .none => unreachable,
        }
        if (declaration.floating.clip_to == .none) clip_element_id = 0;
        _ = self.layout_element_clip_element_ids.set(open_index, clip_element_id);
        _ = self.open_clip_element_stack.append(clip_element_id);
        _ = self.tree_roots.append(.{
            .layout_element_index = open_index,
            .parent_id = floating.parent_id,
            .clip_element_id = clip_element_id,
            .z_index = floating.z_index,
        });
    }

    if (declaration.clip.enabled()) {
        _ = self.open_clip_element_stack.append(open_element.id);
        // Find or create the persistent scroll state for this element.
        var scroll: ?*internal.ScrollContainer = null;
        for (self.scroll_containers.items()) |*container| {
            if (container.element_id == open_element.id) {
                scroll = container;
                container.layout_element = open_element;
                container.open_this_frame = true;
            }
        }
        if (scroll == null) {
            scroll = self.scroll_containers.append(.{
                .layout_element = open_element,
                .scroll_origin = .{ .x = -1, .y = -1 },
                .element_id = open_element.id,
                .open_this_frame = true,
            });
        }
        if (self.external_scroll_handling_enabled) {
            if (scroll) |s| if (self.query_scroll_offset) |query| {
                s.scroll_position = query(s.element_id, self.query_scroll_offset_user_data);
            };
        }
    }

    if (declaration.transition.handler != null) transition.registerTransition(self, open_element, &declaration);
}

/// Close the currently open element (Clay's `Clay__CloseElement`). This is
/// where an element's "fit" size is computed from its children.
pub fn closeElement(self: *Context) void {
    if (self.warnings.max_elements_exceeded) return;
    const open_element = self.openLayoutElement();
    const decl = open_element.cfg();
    const layout_config = &decl.layout;
    const clip_horizontal = decl.clip.horizontal;
    const clip_vertical = decl.clip.vertical;

    // Pop what configureOpenElement pushed onto the clip stack. (Clay pops
    // once even if an element both floats and clips; we pop once per push.)
    if (decl.clip.enabled()) _ = self.open_clip_element_stack.pop();
    if (decl.floating.attach_to != .none) _ = self.open_clip_element_stack.pop();

    const padding_x = layout_config.padding.horizontalSum();
    const padding_y = layout_config.padding.verticalSum();

    // Move this element's children from the pending buffer into the final
    // children array, accumulating our content size on the way.
    const child_count = open_element.children.len;
    const first_pending = self.layout_element_children_buffer.len - child_count;
    open_element.children.ptr = self.layout_element_children.ptr + self.layout_element_children.len;
    const gap_total: f32 = @as(f32, @floatFromInt(child_count -| 1)) * @as(f32, @floatFromInt(layout_config.child_gap));

    if (layout_config.direction == .left_to_right) {
        open_element.dimensions.width = padding_x;
        open_element.min_dimensions.width = padding_x;
        for (0..child_count) |i| {
            const child_index = self.layout_element_children_buffer.get(first_pending + @as(u32, @intCast(i))).*;
            const child = self.layout_elements.get(child_index);
            open_element.dimensions.width += child.dimensions.width;
            open_element.dimensions.height = @max(open_element.dimensions.height, child.dimensions.height + padding_y);
            // Clip containers can shrink below their content, so the content's
            // minimum size doesn't propagate on clipped axes.
            if (!clip_horizontal) open_element.min_dimensions.width += child.min_dimensions.width;
            if (!clip_vertical) open_element.min_dimensions.height = @max(open_element.min_dimensions.height, child.min_dimensions.height + padding_y);
            _ = self.layout_element_children.append(child_index);
        }
        open_element.dimensions.width += gap_total;
        if (!clip_horizontal) open_element.min_dimensions.width += gap_total;
    } else {
        open_element.dimensions.height = padding_y;
        open_element.min_dimensions.height = padding_y;
        for (0..child_count) |i| {
            const child_index = self.layout_element_children_buffer.get(first_pending + @as(u32, @intCast(i))).*;
            const child = self.layout_elements.get(child_index);
            open_element.dimensions.height += child.dimensions.height;
            open_element.dimensions.width = @max(open_element.dimensions.width, child.dimensions.width + padding_x);
            if (!clip_vertical) open_element.min_dimensions.height += child.min_dimensions.height;
            if (!clip_horizontal) open_element.min_dimensions.width = @max(open_element.min_dimensions.width, child.min_dimensions.width + padding_x);
            _ = self.layout_element_children.append(child_index);
        }
        open_element.dimensions.height += gap_total;
        if (!clip_vertical) open_element.min_dimensions.height += gap_total;
    }
    self.layout_element_children_buffer.len -= child_count;

    // Clamp to the configured min / max. A max of 0 means "unbounded"; we
    // normalise it to max_float here so later passes can use it directly.
    clampAxis(&layout_config.sizing.width, &open_element.dimensions.width, &open_element.min_dimensions.width);
    clampAxis(&layout_config.sizing.height, &open_element.dimensions.height, &open_element.min_dimensions.height);

    layout.updateAspectRatioBox(open_element);

    const is_floating = decl.floating.attach_to != .none;

    // Pop ourselves and attach to the parent (floating elements are tree
    // roots instead, so the parent only counts them for id generation).
    const closing_index = self.open_layout_element_stack.pop();
    const parent = self.openLayoutElement();
    if (self.open_layout_element_stack.len > 1) {
        if (is_floating) {
            parent.floating_children_count += 1;
            return;
        }
        parent.children.len += 1;
        _ = self.layout_element_children_buffer.append(closing_index);
    }
}

fn clampAxis(axis: *config.SizingAxis, size: *f32, min_size: *f32) void {
    if (axis.kind == .percent) {
        size.* = 0;
        return;
    }
    if (axis.min_max.max <= 0) axis.min_max.max = types.max_float;
    size.* = @min(@max(size.*, axis.min_max.min), axis.min_max.max);
    min_size.* = @min(@max(min_size.*, axis.min_max.min), axis.min_max.max);
}

// -----------------------------------------------------------------------------
// Ids
// -----------------------------------------------------------------------------

/// Id of the currently open element (useful with auto ids).
pub fn openElementId(self: *Context) u32 {
    return self.openLayoutElement().id;
}

/// Id local to the currently open element (Clay's `CLAY_ID_LOCAL`): the same
/// label under different parents gives different ids.
pub fn localId(self: *Context, label: []const u8) ElementId {
    return .seeded(label, self.openElementId());
}

/// Local id with an index (Clay's `CLAY_IDI_LOCAL`).
pub fn localIdIndexed(self: *Context, label: []const u8, index: u32) ElementId {
    return .seededIndexed(label, index, self.openElementId());
}

// -----------------------------------------------------------------------------
// Queries & interaction
// -----------------------------------------------------------------------------

/// Bounding box of an element from the most recent layout, or null if no
/// element with that id exists.
pub fn elementData(self: *Context, id: ElementId) ?ElementData {
    const item = self.getHashMapItem(id.id) orelse return null;
    return .{ .bounding_box = item.bounding_box };
}

/// True if the pointer is over the currently open element. Uses the pointer
/// state from `setPointerState` and the boxes of the previous layout.
pub fn hovered(self: *Context) bool {
    if (self.warnings.max_elements_exceeded) return false;
    const open_id = self.openLayoutElement().id;
    for (self.pointer_over_ids.items()) |over| {
        if (over.id == open_id) return true;
    }
    return false;
}

/// Call `function` during `setPointerState` whenever the pointer is over the
/// currently open element.
pub fn onHover(self: *Context, function: ?OnHoverFn, user_data: ?*anyopaque) void {
    if (self.warnings.max_elements_exceeded) return;
    const item = self.getHashMapItem(self.openLayoutElement().id) orelse return;
    item.on_hover = function;
    item.hover_user_data = user_data;
}

/// True if the pointer is over the element with this id.
pub fn pointerOver(self: *Context, id: ElementId) bool {
    for (self.pointer_over_ids.items()) |over| {
        if (over.id == id.id) return true;
    }
    return false;
}

/// Ids of every element under the pointer, from outermost to innermost.
pub fn pointerOverIds(self: *Context) []const ElementId {
    return self.pointer_over_ids.items();
}

/// Update the pointer position / button state and recompute which elements
/// are hovered. Call once per frame, before `beginLayout`.
pub fn setPointerState(self: *Context, position: Vec2, pointer_down: bool) void {
    interaction.setPointerState(self, position, pointer_down);
}

pub fn pointerState(self: *const Context) PointerData {
    return self.pointer_info;
}

/// Advance scroll containers: apply wheel `scroll_delta`, drag scrolling
/// (if `enable_drag_scrolling`) and momentum. Call once per frame.
pub fn updateScrollContainers(self: *Context, enable_drag_scrolling: bool, scroll_delta: Vec2, delta_time: f32) void {
    interaction.updateScrollContainers(self, enable_drag_scrolling, scroll_delta, delta_time);
}

/// Scroll offset of the currently open element. Use inside `.config(...)`:
/// `.clip = .{ .vertical = true, .child_offset = ui.scrollOffset() }`.
pub fn scrollOffset(self: *Context) Vec2 {
    if (self.warnings.max_elements_exceeded) return .{};
    return self.scrollOffsetOf(.{ .id = self.openLayoutElement().id });
}

/// Scroll offset of the clip element with this id (zero if unknown).
pub fn scrollOffsetOf(self: *Context, id: ElementId) Vec2 {
    for (self.scroll_containers.items()) |container| {
        if (container.element_id == id.id) return container.scroll_position;
    }
    return .{};
}

/// State of a scroll container, or null if no clip element has this id.
pub fn scrollContainerData(self: *Context, id: ElementId) ?ScrollContainerData {
    for (self.scroll_containers.items()) |*container| {
        if (container.element_id != id.id) continue;
        // Can happen on the first frame before the container is declared.
        const element_ptr = container.layout_element orelse return null;
        return .{
            .scroll_position = &container.scroll_position,
            .container_dimensions = .{ .width = container.bounding_box.width, .height = container.bounding_box.height },
            .content_dimensions = container.content_size,
            .config = element_ptr.cfg().clip,
        };
    }
    return null;
}

// -----------------------------------------------------------------------------
// Internals shared with the other files
// -----------------------------------------------------------------------------

/// The element currently being declared (top of the open stack).
pub fn openLayoutElement(self: *Context) *LayoutElement {
    const stack = self.open_layout_element_stack;
    return self.layout_elements.getRaw(stack.get(stack.len - 1).*);
}

/// The parent of the element currently being declared.
pub fn parentElement(self: *Context) *LayoutElement {
    const stack = self.open_layout_element_stack;
    return self.layout_elements.getRaw(stack.get(stack.len - 2).*);
}

fn currentClipElementId(self: *Context) u32 {
    return if (self.open_clip_element_stack.last()) |clip| clip.* else 0;
}

/// Send an error to the user's handler (if any).
pub fn reportError(self: *Context, kind: ErrorType, message: []const u8) void {
    if (self.error_handler.function) |function| {
        function(.{ .kind = kind, .text = message, .user_data = self.error_handler.user_data });
    }
}

/// Append a render command, reporting (once) if we run out of space.
pub fn addRenderCommand(self: *Context, command: RenderCommand) void {
    if (self.render_commands.len < self.render_commands.capacity -| 1) {
        _ = self.render_commands.append(command);
    } else if (!self.warnings.max_render_commands_exceeded) {
        self.warnings.max_render_commands_exceeded = true;
        self.reportError(.elements_capacity_exceeded, "zlay ran out of capacity while creating render commands. " ++
            "This is usually caused by many wrapping text elements close to the element limit. " ++
            "Try a higher max_element_count.");
    }
}

fn addErrorTextCommand(self: *Context, message: []const u8) void {
    self.addRenderCommand(.{
        .bounding_box = .{ .x = self.layout_dimensions.width / 2 - 59 * 4, .y = self.layout_dimensions.height / 2 },
        .data = .{ .text = .{
            .text = message,
            .base = message,
            .color = .rgb(255, 0, 0),
            .font_id = 0,
            .font_size = 16,
            .letter_spacing = 0,
            .line_height = 0,
        } },
    });
}

/// Insert or refresh the hash map entry for an element declared this frame
/// (Clay's `Clay__AddHashMapItem`).
pub fn addHashMapItem(self: *Context, element_id: ElementId, layout_element: *LayoutElement) ?*HashMapItem {
    var item: HashMapItem = .{
        .element_id = element_id,
        .layout_element = layout_element,
        .generation = self.generation +% 1,
        .appeared_this_frame = true,
    };
    const bucket = element_id.id % self.hash_map_buckets.len;
    var previous: i32 = internal.no_index;
    var index = self.hash_map_buckets.get(bucket).*;
    while (index != internal.no_index) {
        const existing = self.hash_map_items.getRaw(@intCast(index));
        if (existing.element_id.id == element_id.id) {
            item.next_index = existing.next_index;
            if (existing.generation <= self.generation) {
                // First declaration this frame: the "same" element as last
                // frame. Refresh it in place.
                existing.appeared_this_frame = existing.generation < self.generation;
                existing.element_id = element_id;
                existing.generation = self.generation +% 1;
                existing.layout_element = layout_element;
                existing.debug.collision = false;
                existing.on_hover = null;
                existing.hover_user_data = null;
            } else {
                // Already declared this frame: two elements share an id.
                self.reportError(.duplicate_id, "An element with this id was already declared during this layout.");
                if (self.debug_mode_enabled) existing.debug.collision = true;
            }
            return existing;
        }
        previous = index;
        index = existing.next_index;
    }

    // New entry: reuse a freed slot, else grow. (Clay checks for a full
    // array before looking at the free list; we only fail if both are out.)
    if (self.hash_map_free_list.len == 0 and self.hash_map_items.len >= self.hash_map_items.capacity -| 1) {
        if (!self.warnings.hash_map_capacity_exceeded) {
            self.warnings.hash_map_capacity_exceeded = true;
            self.reportError(.hash_map_capacity_exceeded, "zlay ran out of space in its internal element id hash map. " ++
                "Try a higher max_element_count.");
        }
        return null;
    }
    const new_index: u32 = if (self.hash_map_free_list.len > 0) self.hash_map_free_list.pop() else self.hash_map_items.len;
    const stored = self.hash_map_items.set(new_index, item);
    if (previous != internal.no_index) {
        self.hash_map_items.getRaw(@intCast(previous)).next_index = @intCast(new_index);
    } else {
        self.hash_map_buckets.get(bucket).* = @intCast(new_index);
    }
    return stored;
}

/// Look up an element by id (Clay's `Clay__GetHashMapItem`).
pub fn getHashMapItem(self: *Context, id: u32) ?*HashMapItem {
    if (self.hash_map_buckets.len == 0) return null;
    var index = self.hash_map_buckets.get(id % self.hash_map_buckets.len).*;
    while (index != internal.no_index) {
        const item = self.hash_map_items.getRaw(@intCast(index));
        if (item.element_id.id == id) return item;
        index = item.next_index;
    }
    return null;
}

/// True if the element with this id was declared during the current frame.
pub fn declaredThisFrame(self: *Context, item: ?*HashMapItem) bool {
    const it = item orelse return false;
    return it.generation > self.generation;
}

/// Drop hash map entries of elements that weren't declared this frame.
fn pruneHashMap(self: *Context) void {
    for (self.hash_map_buckets.items()) |*bucket_head| {
        var previous: i32 = internal.no_index;
        var index = bucket_head.*;
        while (index != internal.no_index) {
            const item = self.hash_map_items.getRaw(@intCast(index));
            const next = item.next_index;
            if (item.generation <= self.generation) {
                item.* = .{};
                _ = self.hash_map_free_list.append(@intCast(index));
                if (previous == internal.no_index) {
                    bucket_head.* = next;
                } else {
                    self.hash_map_items.getRaw(@intCast(previous)).next_index = next;
                }
            } else {
                previous = index;
            }
            index = next;
        }
    }
}
