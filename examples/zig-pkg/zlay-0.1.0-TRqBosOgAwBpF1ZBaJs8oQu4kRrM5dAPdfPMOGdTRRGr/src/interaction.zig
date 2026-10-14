//! Pointer hit testing and scroll containers.
//!
//! Both operate on the bounding boxes of the *previous* layout (stored in the
//! element hash map), which is why you call them before `beginLayout`.

const types = @import("types.zig");
const internal = @import("internal.zig");
const Context = @import("Context.zig");

const Vec2 = types.Vec2;

/// Find every element under the pointer, fire hover callbacks and advance the
/// pointer state machine (Clay's `Clay_SetPointerState`).
///
/// Differences from Clay: the pointer state is advanced *before* hover
/// callbacks run (so a callback sees `pressed_this_frame` on the frame of the
/// press, not one frame later), and an element that ignores the pointer
/// because it is transitioning only hides its own subtree.
pub fn setPointerState(ctx: *Context, position: Vec2, pointer_down: bool) void {
    if (ctx.warnings.max_elements_exceeded) return;
    ctx.pointer_info.position = position;
    advancePointerState(&ctx.pointer_info.state, pointer_down);
    ctx.pointer_over_ids.len = 0;

    var dfs = ctx.layout_element_children_buffer;
    const visited = ctx.tree_node_visited.backing();

    // Topmost (highest z) trees first, so capturing floating elements can
    // stop the search.
    var root_index = ctx.tree_roots.len;
    while (root_index > 0) {
        root_index -= 1;
        const root = ctx.tree_roots.get(root_index).*;
        dfs.len = 0;
        _ = dfs.append(root.layout_element_index);
        visited[0] = false;
        var found = false;

        while (dfs.len > 0) {
            if (visited[dfs.len - 1]) {
                dfs.len -= 1;
                continue;
            }
            visited[dfs.len - 1] = true;
            const element_index = dfs.get(dfs.len - 1).*;
            const current = ctx.layout_elements.getRaw(element_index);

            const map_item = ctx.getHashMapItem(current.id);
            if (!ctx.declaredThisFrame(map_item)) {
                dfs.len -= 1;
                continue;
            }
            const item = map_item.?;

            if (ignoresPointer(ctx, current)) {
                dfs.len -= 1;
                continue;
            }

            const clip_element_id = ctx.layout_element_clip_element_ids.getRaw(element_index).*;
            const inside_clip = clip_element_id == 0 or ctx.external_scroll_handling_enabled or
                if (ctx.getHashMapItem(clip_element_id)) |clip_item| clip_item.bounding_box.contains(position) else false;
            if (item.bounding_box.contains(position) and inside_clip) {
                if (item.on_hover) |on_hover| on_hover(ctx, item.element_id, ctx.pointer_info, item.hover_user_data);
                _ = ctx.pointer_over_ids.append(item.element_id);
                found = true;
            }

            var i = current.children.len;
            while (i > 0) {
                i -= 1;
                _ = dfs.append(current.children.slice()[i]);
                visited[dfs.len - 1] = false;
            }
        }

        const root_element = ctx.layout_elements.getRaw(root.layout_element_index);
        if (found and root_element.isFloating() and root_element.cfg().floating.pointer_capture_mode == .capture) break;
    }
}

/// pressed_this_frame -> pressed -> released_this_frame -> released.
fn advancePointerState(state: *types.PointerState, pointer_down: bool) void {
    if (pointer_down) {
        state.* = if (state.* == .pressed_this_frame or state.* == .pressed) .pressed else .pressed_this_frame;
    } else {
        state.* = if (state.* == .released_this_frame or state.* == .released) .released else .released_this_frame;
    }
}

/// Elements in some transition states don't receive pointer events
/// (configurable via `TransitionConfig.interaction_handling`).
fn ignoresPointer(ctx: *Context, element: *internal.LayoutElement) bool {
    if (!element.hasTransition()) return false;
    for (ctx.transitions.items()) |data| {
        if (data.element_id != element.id) continue;
        return switch (element.cfg().transition.interaction_handling) {
            .disable_while_transitioning_position => data.state == .exiting or data.state == .entering or
                (data.active_properties.hasPosition() and data.state == .transitioning),
            .allow_while_transitioning_position => data.state == .exiting,
        };
    }
    return false;
}

fn clamp(value: f32, low: f32, high: f32) f32 {
    return @min(@max(value, low), high);
}

/// Apply wheel scrolling, drag scrolling and momentum to scroll containers
/// (Clay's `Clay_UpdateScrollContainers`).
pub fn updateScrollContainers(ctx: *Context, enable_drag_scrolling: bool, scroll_delta: Vec2, delta_time: f32) void {
    const pointer_active = enable_drag_scrolling and ctx.pointer_info.state.isDown();
    // Only the innermost hovered container scrolls, not its ancestors.
    var highest_priority_index: i64 = -1;
    var target: ?*internal.ScrollContainer = null;

    var i: u32 = 0;
    while (i < ctx.scroll_containers.len) {
        const data = ctx.scroll_containers.get(i);
        // Containers not declared last frame are forgotten.
        if (!data.open_this_frame or ctx.getHashMapItem(data.element_id) == null or data.layout_element == null) {
            _ = ctx.scroll_containers.swapRemove(i);
            continue;
        }
        data.open_this_frame = false;
        const element_dimensions = data.layout_element.?.dimensions;

        // Touch / click released: turn the drag into momentum.
        if (!pointer_active and data.pointer_scroll_active) {
            const x_diff = data.scroll_position.x - data.scroll_origin.x;
            if (x_diff < -10 or x_diff > 10) data.scroll_momentum.x = x_diff / (data.momentum_time * 25);
            const y_diff = data.scroll_position.y - data.scroll_origin.y;
            if (y_diff < -10 or y_diff > 10) data.scroll_momentum.y = y_diff / (data.momentum_time * 25);
            data.pointer_scroll_active = false;
            data.pointer_origin = .{};
            data.scroll_origin = .{};
            data.momentum_time = 0;
        }

        // Apply and decay existing momentum.
        const scroll_occurred = scroll_delta.x != 0 or scroll_delta.y != 0;
        data.scroll_position.x += data.scroll_momentum.x;
        data.scroll_momentum.x *= 0.95;
        if ((data.scroll_momentum.x > -0.1 and data.scroll_momentum.x < 0.1) or scroll_occurred) data.scroll_momentum.x = 0;
        data.scroll_position.x = clamp(data.scroll_position.x, -@max(data.content_size.width - element_dimensions.width, 0), 0);

        data.scroll_position.y += data.scroll_momentum.y;
        data.scroll_momentum.y *= 0.95;
        if ((data.scroll_momentum.y > -0.1 and data.scroll_momentum.y < 0.1) or scroll_occurred) data.scroll_momentum.y = 0;
        data.scroll_position.y = clamp(data.scroll_position.y, -@max(data.content_size.height - element_dimensions.height, 0), 0);

        for (ctx.pointer_over_ids.items(), 0..) |over, j| {
            if (data.element_id == over.id) {
                highest_priority_index = @intCast(j);
                target = data;
            }
        }
        i += 1;
    }

    const data = target orelse return;
    if (highest_priority_index < 0) return;
    const scroll_element = data.layout_element.?;
    const clip = scroll_element.cfg().clip;
    const can_scroll_vertically = clip.vertical and data.content_size.height > scroll_element.dimensions.height;
    const can_scroll_horizontally = clip.horizontal and data.content_size.width > scroll_element.dimensions.width;

    // Mouse wheel.
    if (can_scroll_vertically) data.scroll_position.y += scroll_delta.y * 10;
    if (can_scroll_horizontally) data.scroll_position.x += scroll_delta.x * 10;

    // Click / touch drag.
    if (pointer_active) {
        data.scroll_momentum = .{};
        if (!data.pointer_scroll_active) {
            data.pointer_origin = ctx.pointer_info.position;
            data.scroll_origin = data.scroll_position;
            data.pointer_scroll_active = true;
        } else {
            var scroll_delta_x: f32 = 0;
            var scroll_delta_y: f32 = 0;
            if (can_scroll_horizontally) {
                const old = data.scroll_position.x;
                data.scroll_position.x = data.scroll_origin.x + (ctx.pointer_info.position.x - data.pointer_origin.x);
                data.scroll_position.x = @max(@min(data.scroll_position.x, 0), -(data.content_size.width - data.bounding_box.width));
                scroll_delta_x = data.scroll_position.x - old;
            }
            if (can_scroll_vertically) {
                const old = data.scroll_position.y;
                data.scroll_position.y = data.scroll_origin.y + (ctx.pointer_info.position.y - data.pointer_origin.y);
                data.scroll_position.y = @max(@min(data.scroll_position.y, 0), -(data.content_size.height - data.bounding_box.height));
                scroll_delta_y = data.scroll_position.y - old;
            }
            // Pointer held still for a while: restart momentum measurement.
            if (scroll_delta_x > -0.1 and scroll_delta_x < 0.1 and scroll_delta_y > -0.1 and scroll_delta_y < 0.1 and data.momentum_time > 0.15) {
                data.momentum_time = 0;
                data.pointer_origin = ctx.pointer_info.position;
                data.scroll_origin = data.scroll_position;
            } else {
                data.momentum_time += delta_time;
            }
        }
    }

    // Clamp to the content size.
    if (can_scroll_vertically) {
        data.scroll_position.y = @max(@min(data.scroll_position.y, 0), -(data.content_size.height - scroll_element.dimensions.height));
    }
    if (can_scroll_horizontally) {
        data.scroll_position.x = @max(@min(data.scroll_position.x, 0), -(data.content_size.width - scroll_element.dimensions.width));
    }
}
