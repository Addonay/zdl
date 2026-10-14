//! The layout algorithm.
//!
//! By the time `endLayout` runs, every element already knows its "fit" size:
//! `Context.closeElement` sums up children bottom-up while you declare the
//! tree. What's left happens here, in the same order as Clay:
//!
//!  1. Size along X: distribute space top-down (percent, grow, shrink).
//!  2. Wrap text now that widths are final; scale aspect ratio heights.
//!  3. Propagate the new heights bottom-up (wrapped text got taller).
//!  4. Size along Y: same distribution as step 1.
//!  5. Scale aspect ratio widths; sort floating trees by z index.
//!  6. Walk each tree depth-first computing positions and emitting render
//!     commands (on the way down: backgrounds, text, scissor start; on the
//!     way up: borders, overlay end, scissor end).
//!
//! Every tree root (the main root plus each floating element) is laid out
//! independently.

const types = @import("types.zig");
const config = @import("config.zig");
const internal = @import("internal.zig");
const memory = @import("memory.zig");
const hash = @import("hash.zig");
const text_measure = @import("text.zig");
const Context = @import("Context.zig");

const Vec2 = types.Vec2;
const Dimensions = types.Dimensions;
const BoundingBox = types.BoundingBox;
const LayoutElement = internal.LayoutElement;
const List = memory.List;
const floatEqual = types.floatEqual;

/// Grow the missing dimension of an element with an aspect ratio, if exactly
/// one of width / height is known.
pub fn updateAspectRatioBox(element: *LayoutElement) void {
    if (element.is_text) return;
    const ratio = element.cfg().aspect_ratio.ratio;
    if (ratio == 0) return;
    if (element.dimensions.width == 0 and element.dimensions.height != 0) {
        element.dimensions.width = element.dimensions.height * ratio;
    } else if (element.dimensions.width != 0 and element.dimensions.height == 0) {
        element.dimensions.height = element.dimensions.width * (1 / ratio);
    }
}

/// True if a box lies completely outside the layout (and culling is on).
pub fn elementIsOffscreen(ctx: *const Context, box: BoundingBox) bool {
    if (!ctx.culling_enabled) return false;
    return box.x > ctx.layout_dimensions.width or
        box.y > ctx.layout_dimensions.height or
        box.x + box.width < 0 or
        box.y + box.height < 0;
}

fn clampToSizing(value: f32, axis: config.SizingAxis) f32 {
    return @min(@max(value, axis.min_max.min), axis.min_max.max);
}

/// Distribute space along one axis for every tree, breadth first from the
/// roots (Clay's `Clay__SizeContainersAlongAxis`).
///
/// On the X pass it also collects text elements (to wrap afterwards) and
/// elements with an aspect ratio.
fn sizeContainersAlongAxis(ctx: *Context, x_axis: bool, text_elements_out: ?*List(u32), aspect_ratio_elements_out: ?*List(u32)) void {
    // Both buffers are free scratch space once declaration has finished.
    var bfs = ctx.layout_element_children_buffer;
    var resizable = ctx.open_layout_element_stack;

    for (ctx.tree_roots.items()) |root| {
        bfs.len = 0;
        const root_element = ctx.layout_elements.getRaw(root.layout_element_index);
        _ = bfs.append(root.layout_element_index);
        const root_sizing = &root_element.cfg().layout.sizing;

        // Floating roots that grow / use percent are sized from the element
        // they're attached to.
        if (root_element.isFloating()) {
            const parent_item = ctx.getHashMapItem(root_element.cfg().floating.parent_id);
            if (parent_item) |item| if (item.layout_element) |parent| {
                switch (root_sizing.width.kind) {
                    .grow => root_element.dimensions.width = parent.dimensions.width,
                    .percent => root_element.dimensions.width = parent.dimensions.width * root_sizing.width.fraction,
                    else => {},
                }
                switch (root_sizing.height.kind) {
                    .grow => root_element.dimensions.height = parent.dimensions.height,
                    .percent => root_element.dimensions.height = parent.dimensions.height * root_sizing.height.fraction,
                    else => {},
                }
            };
        }
        if (root_sizing.width.kind != .percent) root_element.dimensions.width = clampToSizing(root_element.dimensions.width, root_sizing.width);
        if (root_sizing.height.kind != .percent) root_element.dimensions.height = clampToSizing(root_element.dimensions.height, root_sizing.height);

        var bfs_index: u32 = 0;
        while (bfs_index < bfs.len) : (bfs_index += 1) {
            const parent_index = bfs.get(bfs_index).*;
            const parent = ctx.layout_elements.getRaw(parent_index);
            const parent_layout = &parent.cfg().layout;
            const parent_size = parent.axisSize(x_axis).*;
            const parent_padding = if (x_axis) parent_layout.padding.horizontalSum() else parent_layout.padding.verticalSum();
            const parent_child_gap: f32 = @floatFromInt(parent_layout.child_gap);
            const sizing_along_axis = (x_axis and parent_layout.direction == .left_to_right) or
                (!x_axis and parent_layout.direction == .top_to_bottom);

            var grow_container_count: u32 = 0;
            var inner_content_size: f32 = 0;
            var total_padding_and_child_gaps = parent_padding;
            var is_first_child = true;
            resizable.len = 0;

            for (parent.children.slice()) |child_index| {
                const child = ctx.layout_elements.getRaw(child_index);
                const child_sizing = child.sizingAxis(x_axis);
                const child_size = child.axisSize(x_axis).*;

                if (text_elements_out != null and child.is_text) {
                    _ = text_elements_out.?.append(child_index);
                } else if (child.children.len > 0) {
                    _ = bfs.append(child_index);
                }
                if (!child.is_text and aspect_ratio_elements_out != null and child.cfg().aspect_ratio.ratio != 0) {
                    _ = aspect_ratio_elements_out.?.append(child_index);
                }

                // Exiting elements are drawn but take no space.
                // (Like Clay, they also don't reset `is_first_child`.)
                if (child.exiting) continue;

                const wraps = !child.is_text or child.text().config.wrap_mode == .words;
                if (child_sizing.kind != .percent and child_sizing.kind != .fixed and wraps) {
                    _ = resizable.append(child_index);
                }

                if (sizing_along_axis) {
                    inner_content_size += if (child_sizing.kind == .percent) 0 else child_size;
                    if (child_sizing.kind == .grow) grow_container_count += 1;
                    if (!is_first_child) {
                        inner_content_size += parent_child_gap;
                        total_padding_and_child_gaps += parent_child_gap;
                    }
                } else {
                    inner_content_size = @max(child_size, inner_content_size);
                }
                is_first_child = false;
            }

            // Percent children take their share of the parent's inner size.
            for (parent.children.slice()) |child_index| {
                const child = ctx.layout_elements.getRaw(child_index);
                const child_sizing = child.sizingAxis(x_axis);
                if (child_sizing.kind != .percent) continue;
                const child_size = child.axisSize(x_axis);
                child_size.* = (parent_size - total_padding_and_child_gaps) * child_sizing.fraction;
                if (sizing_along_axis) inner_content_size += child_size.*;
                updateAspectRatioBox(child);
            }

            if (sizing_along_axis) {
                var size_to_distribute = parent_size - parent_padding - inner_content_size;
                if (size_to_distribute < 0) {
                    // Content too big. Clipping parents just let it overflow.
                    if (parent.clipsAxis(x_axis)) continue;
                    shrinkChildren(ctx, &resizable, x_axis, &size_to_distribute);
                } else if (size_to_distribute > 0 and grow_container_count > 0) {
                    // Spare space: only grow children take part.
                    var i: u32 = 0;
                    while (i < resizable.len) {
                        const child = ctx.layout_elements.getRaw(resizable.get(i).*);
                        if (child.sizingAxis(x_axis).kind != .grow) {
                            _ = resizable.swapRemove(i);
                        } else {
                            i += 1;
                        }
                    }
                    growChildren(ctx, &resizable, x_axis, &size_to_distribute);
                }
            } else {
                // Off axis: grow children fill the parent, everything is
                // clamped between its min size and the parent's inner size.
                for (resizable.items()) |child_index| {
                    const child = ctx.layout_elements.getRaw(child_index);
                    const child_sizing = child.sizingAxis(x_axis);
                    const min_size = child.axisMinSize(x_axis);
                    const child_size = child.axisSize(x_axis);
                    var max_size = parent_size - parent_padding;
                    // Inside a scroll panel, grow children expand to the
                    // content size rather than the visible size.
                    if (parent.clipsAxis(x_axis)) max_size = @max(max_size, inner_content_size);
                    if (child_sizing.kind == .grow) child_size.* = @min(max_size, child_sizing.min_max.max);
                    child_size.* = @max(min_size, @min(child_size.*, max_size));
                }
            }
        }
    }
}

/// Shrink the largest resizable children first, evening them out, until the
/// content fits or nobody can shrink further (their min size).
fn shrinkChildren(ctx: *Context, resizable: *List(u32), x_axis: bool, size_to_distribute: *f32) void {
    while (size_to_distribute.* < -types.epsilon and resizable.len > 0) {
        var largest: f32 = 0;
        var second_largest: f32 = 0;
        var width_to_add = size_to_distribute.*;
        for (resizable.items()) |child_index| {
            const child_size = ctx.layout_elements.getRaw(child_index).axisSize(x_axis).*;
            if (floatEqual(child_size, largest)) continue;
            if (child_size > largest) {
                second_largest = largest;
                largest = child_size;
            }
            if (child_size < largest) {
                second_largest = @max(second_largest, child_size);
                width_to_add = second_largest - largest;
            }
        }
        width_to_add = @max(width_to_add, size_to_distribute.* / @as(f32, @floatFromInt(resizable.len)));

        var i: u32 = 0;
        while (i < resizable.len) {
            const child = ctx.layout_elements.getRaw(resizable.get(i).*);
            const child_size = child.axisSize(x_axis);
            const min_size = child.axisMinSize(x_axis);
            const previous = child_size.*;
            var removed = false;
            if (floatEqual(child_size.*, largest)) {
                child_size.* += width_to_add;
                if (child_size.* <= min_size) {
                    child_size.* = min_size;
                    _ = resizable.swapRemove(i);
                    removed = true;
                }
                size_to_distribute.* -= child_size.* - previous;
            }
            if (!removed) i += 1;
        }
    }
}

/// Grow the smallest grow children first, evening them out, until the space
/// is used up or everyone hit their max size.
fn growChildren(ctx: *Context, resizable: *List(u32), x_axis: bool, size_to_distribute: *f32) void {
    while (size_to_distribute.* > types.epsilon and resizable.len > 0) {
        var smallest: f32 = types.max_float;
        var second_smallest: f32 = types.max_float;
        var width_to_add = size_to_distribute.*;
        for (resizable.items()) |child_index| {
            const child_size = ctx.layout_elements.getRaw(child_index).axisSize(x_axis).*;
            if (floatEqual(child_size, smallest)) continue;
            if (child_size < smallest) {
                second_smallest = smallest;
                smallest = child_size;
            }
            if (child_size > smallest) {
                second_smallest = @min(second_smallest, child_size);
                width_to_add = second_smallest - smallest;
            }
        }
        width_to_add = @min(width_to_add, size_to_distribute.* / @as(f32, @floatFromInt(resizable.len)));

        var i: u32 = 0;
        while (i < resizable.len) {
            const child = ctx.layout_elements.getRaw(resizable.get(i).*);
            const child_size = child.axisSize(x_axis);
            const max_size = child.sizingAxis(x_axis).min_max.max;
            const previous = child_size.*;
            var removed = false;
            if (floatEqual(child_size.*, smallest)) {
                child_size.* += width_to_add;
                if (child_size.* >= max_size) {
                    child_size.* = max_size;
                    _ = resizable.swapRemove(i);
                    removed = true;
                }
                size_to_distribute.* -= child_size.* - previous;
            }
            if (!removed) i += 1;
        }
    }
}

/// After text wrapping / aspect scaling changed heights, recompute every
/// container's height bottom-up with a depth first traversal.
fn propagateHeights(ctx: *Context) void {
    var dfs = ctx.tree_node_array;
    dfs.len = 0;
    const visited = ctx.tree_node_visited.backing();
    for (ctx.tree_roots.items()) |root| {
        visited[dfs.len] = false;
        _ = dfs.append(.{ .layout_element = ctx.layout_elements.getRaw(root.layout_element_index) });
    }
    while (dfs.len > 0) {
        const current = dfs.get(dfs.len - 1).layout_element;
        if (!visited[dfs.len - 1]) {
            // First visit (going down): push children, handle us later.
            visited[dfs.len - 1] = true;
            if (current.is_text or current.children.len == 0) {
                dfs.len -= 1;
                continue;
            }
            for (current.children.slice()) |child_index| {
                visited[dfs.len] = false;
                _ = dfs.append(.{ .layout_element = ctx.layout_elements.getRaw(child_index) });
            }
            continue;
        }
        dfs.len -= 1;

        // Second visit (going up): all children are final.
        const layout_config = &current.cfg().layout;
        const height_sizing = layout_config.sizing.height;
        const padding_y = layout_config.padding.verticalSum();
        if (layout_config.direction == .left_to_right) {
            for (current.children.slice()) |child_index| {
                const child = ctx.layout_elements.getRaw(child_index);
                const with_padding = @max(child.dimensions.height + padding_y, current.dimensions.height);
                current.dimensions.height = clampToSizing(with_padding, height_sizing);
            }
        } else {
            var content_height = padding_y;
            for (current.children.slice()) |child_index| {
                content_height += ctx.layout_elements.getRaw(child_index).dimensions.height;
            }
            content_height += @as(f32, @floatFromInt(current.children.len -| 1)) * @as(f32, @floatFromInt(layout_config.child_gap));
            current.dimensions.height = clampToSizing(content_height, height_sizing);
        }
    }
}

/// Stable bubble sort of tree roots by ascending z index (Clay does the same;
/// there are rarely more than a handful of floating roots).
fn sortRootsByZIndex(ctx: *Context) void {
    const roots = ctx.tree_roots.items();
    if (roots.len < 2) return;
    var sort_max = roots.len - 1;
    while (sort_max > 0) : (sort_max -= 1) {
        for (0..sort_max) |i| {
            if (roots[i + 1].z_index < roots[i].z_index) {
                const tmp = roots[i];
                roots[i] = roots[i + 1];
                roots[i + 1] = tmp;
            }
        }
    }
}

/// Where a floating root should be placed, from its attach points.
fn floatingRootPosition(floating: config.FloatingConfig, dimensions: Dimensions, parent_box: BoundingBox) Vec2 {
    var position: Vec2 = .{};
    switch (floating.attach_points.parent) {
        .left_top, .left_center, .left_bottom => position.x = parent_box.x,
        .center_top, .center_center, .center_bottom => position.x = parent_box.x + parent_box.width / 2,
        .right_top, .right_center, .right_bottom => position.x = parent_box.x + parent_box.width,
    }
    switch (floating.attach_points.element) {
        .left_top, .left_center, .left_bottom => {},
        .center_top, .center_center, .center_bottom => position.x -= dimensions.width / 2,
        .right_top, .right_center, .right_bottom => position.x -= dimensions.width,
    }
    switch (floating.attach_points.parent) {
        .left_top, .center_top, .right_top => position.y = parent_box.y,
        .left_center, .center_center, .right_center => position.y = parent_box.y + parent_box.height / 2,
        .left_bottom, .center_bottom, .right_bottom => position.y = parent_box.y + parent_box.height,
    }
    switch (floating.attach_points.element) {
        .left_top, .center_top, .right_top => {},
        .left_center, .center_center, .right_center => position.y -= dimensions.height / 2,
        .left_bottom, .center_bottom, .right_bottom => position.y -= dimensions.height,
    }
    position.x += floating.offset.x;
    position.y += floating.offset.y;
    return position;
}

/// The scroll container record of an element, if it clips.
fn findScrollContainer(ctx: *Context, element: *LayoutElement) ?*internal.ScrollContainer {
    for (ctx.scroll_containers.items()) |*container| {
        if (container.layout_element == element) return container;
    }
    return null;
}

/// Compute final sizes and positions and (optionally) emit render commands
/// (Clay's `Clay__CalculateFinalLayout`).
///
/// `use_stored_bounding_boxes` makes elements with an active transition use
/// the transition's interpolated box instead of the computed one.
pub fn calculateFinalLayout(ctx: *Context, delta_time: f32, use_stored_bounding_boxes: bool, generate_render_commands: bool) void {
    _ = delta_time;

    // 1. X axis.
    var text_elements = ctx.open_clip_element_stack;
    text_elements.len = 0;
    var aspect_ratio_elements = ctx.reusable_element_index_buffer;
    aspect_ratio_elements.len = 0;
    sizeContainersAlongAxis(ctx, true, &text_elements, &aspect_ratio_elements);

    // 2. Text wrapping and aspect ratio heights.
    for (text_elements.items()) |index| text_measure.wrapTextElement(ctx, ctx.layout_elements.getRaw(index));
    for (aspect_ratio_elements.items()) |index| {
        const element = ctx.layout_elements.getRaw(index);
        element.dimensions.height = (1 / element.cfg().aspect_ratio.ratio) * element.dimensions.width;
        element.cfg().layout.sizing.height.min_max.max = element.dimensions.height;
    }

    // 3. Heights bottom-up.
    propagateHeights(ctx);

    // 4. Y axis.
    sizeContainersAlongAxis(ctx, false, null, null);

    // 5. Aspect ratio widths, z ordering.
    for (aspect_ratio_elements.items()) |index| {
        const element = ctx.layout_elements.getRaw(index);
        element.dimensions.width = element.cfg().aspect_ratio.ratio * element.dimensions.height;
    }
    sortRootsByZIndex(ctx);

    // 6. Positions and render commands.
    ctx.render_commands.len = 0;
    for (ctx.tree_roots.items()) |root| {
        positionTree(ctx, root, use_stored_bounding_boxes, generate_render_commands);
    }
}

/// Depth first walk of one tree: positions every element, records bounding
/// boxes in the hash map and emits render commands.
fn positionTree(ctx: *Context, root: internal.TreeRoot, use_stored_bounding_boxes: bool, generate: bool) void {
    var dfs = ctx.tree_node_array;
    dfs.len = 0;
    const visited = ctx.tree_node_visited.backing();

    const root_element = ctx.layout_elements.getRaw(root.layout_element_index);
    var root_position: Vec2 = .{};
    if (root_element.isFloating()) {
        const parent_box: BoundingBox = if (ctx.getHashMapItem(root.parent_id)) |item| item.bounding_box else .{};
        root_position = floatingRootPosition(root_element.cfg().floating, root_element.dimensions, parent_box);
    }

    // A floating tree inherits the clip rect of the element it attaches to.
    var root_clip_open = false;
    if (root.clip_element_id != 0) {
        if (ctx.getHashMapItem(root.clip_element_id)) |clip_item| {
            if (!elementIsOffscreen(ctx, clip_item.bounding_box)) {
                var clip_flags: config.ClipConfig = .{};
                if (clip_item.layout_element) |clip_element| clip_flags = clip_element.cfg().clip;
                // With external scrolling, floating elements attached inside
                // scrolled content need the offset applied here.
                if (ctx.external_scroll_handling_enabled) {
                    if (clip_flags.horizontal) root_position.x += clip_flags.child_offset.x;
                    if (clip_flags.vertical) root_position.y += clip_flags.child_offset.y;
                }
                if (generate) {
                    ctx.addRenderCommand(.{
                        .bounding_box = clip_item.bounding_box,
                        .data = .{ .scissor_start = .{ .horizontal = clip_flags.horizontal, .vertical = clip_flags.vertical } },
                        .id = hash.hashNumber(root_element.id, root_element.children.len + 10).id,
                        .z_index = root.z_index,
                    });
                    root_clip_open = true;
                }
            }
        }
    }

    const root_padding = root_element.layoutConfig().padding;
    visited[0] = false;
    _ = dfs.append(.{
        .layout_element = root_element,
        .position = root_position,
        .next_child_offset = .{ .x = @floatFromInt(root_padding.left), .y = @floatFromInt(root_padding.top) },
    });

    while (dfs.len > 0) {
        const node = dfs.get(dfs.len - 1);
        const current = node.layout_element;

        if (visited[dfs.len - 1]) {
            // Second visit, going back up.
            if (!current.is_text) emitClosingCommands(ctx, current, root, root_element, generate);
            dfs.len -= 1;
            continue;
        }
        // First visit, going down.
        visited[dfs.len - 1] = true;

        var box: BoundingBox = .{
            .x = node.position.x,
            .y = node.position.y,
            .width = current.dimensions.width,
            .height = current.dimensions.height,
        };
        var scroll_container: ?*internal.ScrollContainer = null;
        var scroll_offset: Vec2 = .{};

        if (!current.is_text) {
            const decl = current.cfg();
            if (use_stored_bounding_boxes and decl.transition.handler != null) {
                var found = false;
                for (ctx.transitions.items()) |data| {
                    if (data.element_id != current.id) continue;
                    found = true;
                    if (data.state != .idle) {
                        const props = data.active_properties;
                        const state_box = data.current_state.bounding_box;
                        if (props.x) box.x = state_box.x;
                        if (props.y) box.y = state_box.y;
                        if (props.width) box.width = state_box.width;
                        if (props.height) box.height = state_box.height;
                    }
                    break;
                }
                // An exiting element whose transition finished this frame.
                if (!found and decl.transition.exit.set_final_state != null) {
                    dfs.len -= 1;
                    continue;
                }
            }
            if (decl.floating.attach_to != .none) {
                const expand = decl.floating.expand;
                box.x -= expand.width;
                box.width += expand.width * 2;
                box.y -= expand.height;
                box.height += expand.height * 2;
            }
            if (decl.clip.enabled()) {
                if (findScrollContainer(ctx, current)) |container| {
                    scroll_container = container;
                    container.bounding_box = box;
                    scroll_offset = if (ctx.external_scroll_handling_enabled) .{} else decl.clip.child_offset;
                }
            }
        }

        if (generate and !elementIsOffscreen(ctx, box)) {
            if (current.is_text) {
                emitTextCommands(ctx, current, box, root.z_index);
            } else {
                emitOpeningCommands(ctx, current, box, root.z_index);
            }
        }

        if (ctx.getHashMapItem(current.id)) |item| item.bounding_box = box;

        // Text elements stay on the stack; the next iteration pops them.
        if (current.is_text) continue;

        // --- Position children ---------------------------------------------
        const layout_config = &current.cfg().layout;
        const padding = layout_config.padding;
        const child_gap: f32 = @floatFromInt(layout_config.child_gap);
        const gaps = @as(f32, @floatFromInt(current.children.len -| 1)) * child_gap;

        // Alignment along the layout axis shifts all children together.
        var content: Dimensions = .{};
        if (layout_config.direction == .left_to_right) {
            for (current.children.slice()) |child_index| {
                const child = ctx.layout_elements.getRaw(child_index);
                if (child.exiting) continue;
                content.width += child.dimensions.width;
                content.height = @max(content.height, child.dimensions.height);
            }
            content.width += gaps;
            var extra_space = current.dimensions.width - padding.horizontalSum() - content.width;
            switch (layout_config.child_alignment.x) {
                .left => extra_space = 0,
                .center => extra_space /= 2,
                .right => {},
            }
            node.next_child_offset.x += @max(0, extra_space);
        } else {
            for (current.children.slice()) |child_index| {
                const child = ctx.layout_elements.getRaw(child_index);
                if (child.exiting) continue;
                content.width = @max(content.width, child.dimensions.width);
                content.height += child.dimensions.height;
            }
            content.height += gaps;
            var extra_space = current.dimensions.height - padding.verticalSum() - content.height;
            switch (layout_config.child_alignment.y) {
                .top => extra_space = 0,
                .center => extra_space /= 2,
                .bottom => {},
            }
            node.next_child_offset.y += @max(0, extra_space);
        }

        if (scroll_container) |container| {
            container.content_size = .{
                .width = content.width + padding.horizontalSum(),
                .height = content.height + padding.verticalSum(),
            };
        }

        // Push children in reverse so they pop (and render) in order.
        const child_count = current.children.len;
        memory.assert(dfs.len + child_count <= dfs.capacity);
        dfs.len += child_count;
        const dfs_buffer = dfs.backing();
        for (current.children.slice(), 0..) |child_index, i| {
            const child = ctx.layout_elements.getRaw(child_index);
            // Alignment across the layout axis is per child.
            if (layout_config.direction == .left_to_right) {
                node.next_child_offset.y = @floatFromInt(padding.top);
                const white_space = current.dimensions.height - padding.verticalSum() - child.dimensions.height;
                switch (layout_config.child_alignment.y) {
                    .top => {},
                    .center => node.next_child_offset.y += white_space / 2,
                    .bottom => node.next_child_offset.y += white_space,
                }
            } else {
                node.next_child_offset.x = @floatFromInt(padding.left);
                const white_space = current.dimensions.width - padding.horizontalSum() - child.dimensions.width;
                switch (layout_config.child_alignment.x) {
                    .left => {},
                    .center => node.next_child_offset.x += white_space / 2,
                    .right => node.next_child_offset.x += white_space,
                }
            }

            const child_padding = child.layoutConfig().padding;
            const new_node_index = dfs.len - 1 - @as(u32, @intCast(i));
            dfs_buffer[new_node_index] = .{
                .layout_element = child,
                .position = .{
                    .x = box.x + node.next_child_offset.x + scroll_offset.x,
                    .y = box.y + node.next_child_offset.y + scroll_offset.y,
                },
                .next_child_offset = .{ .x = @floatFromInt(child_padding.left), .y = @floatFromInt(child_padding.top) },
            };
            visited[new_node_index] = false;

            if (!child.exiting) {
                if (layout_config.direction == .left_to_right) {
                    node.next_child_offset.x += child.dimensions.width + child_gap;
                } else {
                    node.next_child_offset.y += child.dimensions.height + child_gap;
                }
            }
        }
    }

    if (root_clip_open) {
        ctx.addRenderCommand(.{
            .data = .scissor_end,
            .id = hash.hashNumber(root_element.id, root_element.children.len + 11).id,
        });
    }
}

/// Commands emitted when entering a container: overlay start, image, custom,
/// scissor start, background rectangle (in Clay's order).
fn emitOpeningCommands(ctx: *Context, current: *LayoutElement, box: BoundingBox, z_index: i16) void {
    const decl = current.cfg();
    if (decl.overlay_color.a > 0) {
        ctx.addRenderCommand(.{
            .data = .{ .overlay_color_start = .{ .color = decl.overlay_color } },
            .user_data = decl.user_data,
            .id = current.id,
            .z_index = z_index,
        });
    }
    if (decl.image.data != null) {
        ctx.addRenderCommand(.{
            .bounding_box = box,
            .data = .{ .image = .{
                .background_color = decl.background_color,
                .corner_radius = decl.corner_radius,
                .image_data = decl.image.data,
            } },
            .user_data = decl.user_data,
            .id = current.id,
            .z_index = z_index,
        });
    }
    if (decl.custom.data != null) {
        ctx.addRenderCommand(.{
            .bounding_box = box,
            .data = .{ .custom = .{
                .background_color = decl.background_color,
                .corner_radius = decl.corner_radius,
                .custom_data = decl.custom.data,
            } },
            .user_data = decl.user_data,
            .id = current.id,
            .z_index = z_index,
        });
    }
    if (decl.clip.enabled()) {
        ctx.addRenderCommand(.{
            .bounding_box = box,
            .data = .{ .scissor_start = .{ .horizontal = decl.clip.horizontal, .vertical = decl.clip.vertical } },
            .user_data = decl.user_data,
            .id = current.id,
            .z_index = z_index,
        });
    }
    if (decl.background_color.a > 0) {
        ctx.addRenderCommand(.{
            .bounding_box = box,
            .data = .{ .rectangle = .{ .color = decl.background_color, .corner_radius = decl.corner_radius } },
            .user_data = decl.user_data,
            .id = current.id,
            .z_index = z_index,
        });
    }
}

/// One text command per wrapped line, aligned inside the element's box.
fn emitTextCommands(ctx: *Context, current: *LayoutElement, box: BoundingBox, z_index: i16) void {
    const text_element = current.text();
    const text_config = &text_element.config;
    const natural_line_height = text_element.preferred_dimensions.height;
    const final_line_height: f32 = if (text_config.line_height > 0) @floatFromInt(text_config.line_height) else natural_line_height;
    // Center the glyphs vertically inside a taller (or shorter) line.
    var y_position = (final_line_height - natural_line_height) / 2;

    for (text_element.wrapped_lines.slice(), 0..) |wrapped, line_index| {
        if (wrapped.line.len == 0) {
            y_position += final_line_height;
            continue;
        }
        const x_offset: f32 = switch (text_config.alignment) {
            .left => 0,
            .center => (box.width - wrapped.dimensions.width) / 2,
            .right => box.width - wrapped.dimensions.width,
        };
        ctx.addRenderCommand(.{
            .bounding_box = .{
                .x = box.x + x_offset,
                .y = box.y + y_position,
                .width = wrapped.dimensions.width,
                .height = wrapped.dimensions.height,
            },
            .data = .{ .text = .{
                .text = wrapped.line,
                .base = text_element.text,
                .color = text_config.color,
                .font_id = text_config.font_id,
                .font_size = text_config.font_size,
                .letter_spacing = text_config.letter_spacing,
                .line_height = text_config.line_height,
            } },
            .user_data = text_config.user_data,
            .id = hash.hashNumber(@intCast(line_index), current.id).id,
            .z_index = z_index,
        });
        y_position += final_line_height;
        // Remaining lines are below the screen.
        if (ctx.culling_enabled and box.y + y_position > ctx.layout_dimensions.height) break;
    }
}

/// Commands emitted when leaving a container: border, between-children
/// borders, overlay end and finally scissor end (the scissor must close
/// *after* the between-children borders).
fn emitClosingCommands(ctx: *Context, current: *LayoutElement, root: internal.TreeRoot, root_element: *LayoutElement, generate: bool) void {
    if (!generate) return;
    const box: BoundingBox = if (ctx.getHashMapItem(current.id)) |item| item.bounding_box else .{};
    if (elementIsOffscreen(ctx, box)) return;

    const decl = current.cfg();
    const layout_config = &decl.layout;
    var scroll_offset: Vec2 = .{};
    const close_clip = decl.clip.enabled();
    if (close_clip) {
        if (findScrollContainer(ctx, current) != null) {
            scroll_offset = if (ctx.external_scroll_handling_enabled) .{} else decl.clip.child_offset;
        }
    }

    const border = decl.border;
    if (border.width.any()) {
        ctx.addRenderCommand(.{
            .bounding_box = box,
            .data = .{ .border = .{ .color = border.color, .corner_radius = decl.corner_radius, .width = border.width } },
            .user_data = decl.user_data,
            .id = hash.hashNumber(current.id, current.children.len).id,
            .z_index = root.z_index,
        });

        if (border.width.between_children > 0 and border.color.a > 0) {
            // Integer halves, like Clay.
            const half_gap: f32 = @floatFromInt(layout_config.child_gap / 2);
            const half_width: f32 = @floatFromInt(border.width.between_children / 2);
            const thickness: f32 = @floatFromInt(border.width.between_children);
            const child_gap: f32 = @floatFromInt(layout_config.child_gap);
            var border_offset: Vec2 = .{
                .x = @as(f32, @floatFromInt(layout_config.padding.left)) - half_gap,
                .y = @as(f32, @floatFromInt(layout_config.padding.top)) - half_gap,
            };
            for (current.children.slice(), 0..) |child_index, i| {
                const child = ctx.layout_elements.getRaw(child_index);
                if (i > 0) {
                    const line_box: BoundingBox = if (layout_config.direction == .left_to_right) .{
                        .x = box.x + border_offset.x + scroll_offset.x - half_width,
                        .y = box.y + scroll_offset.y,
                        .width = thickness,
                        .height = current.dimensions.height,
                    } else .{
                        .x = box.x + scroll_offset.x,
                        .y = box.y + border_offset.y + scroll_offset.y - half_width,
                        .width = current.dimensions.width,
                        .height = thickness,
                    };
                    ctx.addRenderCommand(.{
                        .bounding_box = line_box,
                        .data = .{ .rectangle = .{ .color = border.color } },
                        .user_data = decl.user_data,
                        .id = hash.hashNumber(current.id, current.children.len + 1 + @as(u32, @intCast(i))).id,
                        .z_index = root.z_index,
                    });
                }
                if (layout_config.direction == .left_to_right) {
                    border_offset.x += child.dimensions.width + child_gap;
                } else {
                    border_offset.y += child.dimensions.height + child_gap;
                }
            }
        }
    }

    if (decl.overlay_color.a > 0) {
        ctx.addRenderCommand(.{
            .data = .overlay_color_end,
            .user_data = decl.user_data,
            .id = current.id,
            .z_index = root.z_index,
        });
    }

    if (close_clip) {
        ctx.addRenderCommand(.{
            .data = .scissor_end,
            .id = hash.hashNumber(current.id, root_element.children.len + 11).id,
            .z_index = root.z_index,
        });
    }
}
