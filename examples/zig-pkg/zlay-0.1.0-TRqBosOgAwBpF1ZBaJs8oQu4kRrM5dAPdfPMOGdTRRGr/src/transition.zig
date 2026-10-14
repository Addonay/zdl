//! Transitions: animating an element's box and colors when they change, plus
//! enter / exit animations.
//!
//! How it works (same design as Clay):
//!
//!  * Every element with `transition.handler` set gets a persistent
//!    `internal.Transition` record, matched by id across frames.
//!  * `endLayout` lays the tree out once to find each element's *target*
//!    state, compares it with last frame's target, and starts a transition
//!    for every property that changed. The handler interpolates `current`
//!    between `initial` and `target`; the interpolated values are written
//!    back into the elements and the layout runs a second time.
//!  * Exit transitions: an element can only animate out if it still exists.
//!    So at the end of every frame, elements that have an exit transition are
//!    copied (with their whole subtree) into the unused tail of the element
//!    arrays. When the element disappears, that copy is spliced back into
//!    the tree each frame until its exit transition completes.

const types = @import("types.zig");
const config = @import("config.zig");
const internal = @import("internal.zig");
const memory = @import("memory.zig");
const Context = @import("Context.zig");

const Vec2 = types.Vec2;
const BoundingBox = types.BoundingBox;
const LayoutElement = internal.LayoutElement;
const TransitionArgs = config.TransitionArgs;
const TransitionData = config.TransitionData;
const TransitionProperties = config.TransitionProperties;

// -----------------------------------------------------------------------------
// Built-in handlers
// -----------------------------------------------------------------------------

/// Interpolate every active property of `args` by `t` (0..1).
pub fn interpolate(args: TransitionArgs, t: f32) void {
    const p = args.properties;
    const from = args.initial;
    const to = args.target;
    const out = args.current;
    if (p.x) out.bounding_box.x = types.lerpFloat(from.bounding_box.x, to.bounding_box.x, t);
    if (p.y) out.bounding_box.y = types.lerpFloat(from.bounding_box.y, to.bounding_box.y, t);
    if (p.width) out.bounding_box.width = types.lerpFloat(from.bounding_box.width, to.bounding_box.width, t);
    if (p.height) out.bounding_box.height = types.lerpFloat(from.bounding_box.height, to.bounding_box.height, t);
    if (p.background_color) out.background_color = .lerp(from.background_color, to.background_color, t);
    if (p.overlay_color) out.overlay_color = .lerp(from.overlay_color, to.overlay_color, t);
    if (p.border_color) out.border_color = .lerp(from.border_color, to.border_color, t);
    if (p.border_width) out.border_width = .{
        .left = lerpU16(from.border_width.left, to.border_width.left, t),
        .right = lerpU16(from.border_width.right, to.border_width.right, t),
        .top = lerpU16(from.border_width.top, to.border_width.top, t),
        .bottom = lerpU16(from.border_width.bottom, to.border_width.bottom, t),
        .between_children = lerpU16(from.border_width.between_children, to.border_width.between_children, t),
    };
}

fn lerpU16(from: u16, to: u16, t: f32) u16 {
    const value = types.lerpFloat(@floatFromInt(from), @floatFromInt(to), t);
    return @intFromFloat(@max(0, @min(value, 65535)));
}

/// Progress 0..1 of a transition (1 if it has no duration).
pub fn progress(args: TransitionArgs) f32 {
    if (args.duration <= 0) return 1;
    return @min(args.elapsed_time / args.duration, 1);
}

/// Cubic "ease out" curve (Clay's `Clay_EaseOut`): fast start, gentle stop.
pub fn easeOut(args: TransitionArgs) bool {
    const ratio = progress(args);
    const inverse = 1 - ratio;
    interpolate(args, 1 - inverse * inverse * inverse);
    return ratio >= 1;
}

/// Constant speed.
pub fn linear(args: TransitionArgs) bool {
    const ratio = progress(args);
    interpolate(args, ratio);
    return ratio >= 1;
}

// -----------------------------------------------------------------------------
// Engine
// -----------------------------------------------------------------------------

/// Called from `configureOpenElement` for elements with a handler: find or
/// create the element's transition record and refresh it for this frame.
pub fn registerTransition(ctx: *Context, element: *LayoutElement, declaration: *const config.ElementDeclaration) void {
    const parent = ctx.parentElement();
    const transition_out = declaration.transition.exit.set_final_state != null;
    for (ctx.transitions.items()) |*data| {
        if (data.element_id != element.id) continue;
        if (data.state == .exiting) {
            // Came back while exiting: cancel the exit.
            data.state = .idle;
            if (ctx.getHashMapItem(element.id)) |item| item.appeared_this_frame = false;
        }
        data.element_this_frame = element;
        if (data.parent_id != parent.id) data.reparented = true;
        data.parent_id = parent.id;
        data.sibling_index = parent.children.len;
        data.transition_out = transition_out;
        return;
    }
    _ = ctx.transitions.append(.{
        .element_this_frame = element,
        .element_id = element.id,
        .parent_id = parent.id,
        .sibling_index = parent.children.len,
        .transition_out = transition_out,
    });
}

/// Start of `endLayout`: forget transitions of vanished elements, and splice
/// elements that are exiting (or just started to) back into the tree.
pub fn processExitingElements(ctx: *Context) void {
    // Drop records of elements that disappeared without an exit transition,
    // or whose handler was removed.
    var i: u32 = 0;
    while (i < ctx.transitions.len) {
        const data = ctx.transitions.get(i);
        const item = ctx.getHashMapItem(data.element_id);
        if (!data.transition_out and (!ctx.declaredThisFrame(item) or
            item.?.layout_element == null or !item.?.layout_element.?.hasTransition()))
        {
            _ = ctx.transitions.swapRemove(i);
            continue;
        }
        i += 1;
    }

    // Transition records of exiting subtrees' descendants get removed: only
    // the exiting root animates.
    var ids_to_remove = ctx.reusable_element_index_buffer;
    ids_to_remove.len = 0;

    i = 0;
    while (i < ctx.transitions.len) {
        const data = ctx.transitions.get(i);
        const item = ctx.getHashMapItem(data.element_id);
        if (!data.transition_out or ctx.declaredThisFrame(item)) {
            i += 1;
            continue;
        }

        // The element wasn't declared this frame: exit (or keep exiting).
        const transition_config = data.element_this_frame.cfg().transition;
        const parent_item = ctx.getHashMapItem(data.parent_id);
        const parent_present = ctx.declaredThisFrame(parent_item);
        if (transition_config.exit.trigger != .trigger_when_parent_exits and !parent_present) {
            // The parent left too and we were asked not to animate then.
            _ = ctx.transitions.swapRemove(i);
            continue;
        }

        if (data.state != .exiting) {
            // First exit frame.
            const exiting = data.element_this_frame;
            const last_box: BoundingBox = if (item) |it| it.bounding_box else .{};
            if (!parent_present) {
                // Nothing to stay attached to: float at the last position.
                const floating = &exiting.cfg().floating;
                floating.attach_to = .root;
                floating.offset = .{ .x = last_box.x, .y = last_box.y };
                floating.parent_id = Context.root_id.id;
            }
            if (item) |it| it.appeared_this_frame = false;
            exiting.exiting = true;
            exiting.cfg().layout.sizing = .{
                .width = .fixed(exiting.dimensions.width),
                .height = .fixed(exiting.dimensions.height),
            };
            data.state = .exiting;
            data.active_properties = transition_config.properties;
            data.elapsed_time = 0;
            if (transition_config.exit.set_final_state) |set_final_state| {
                data.target_state = set_final_state(data.target_state, transition_config.properties);
            }
        }

        // Every exiting frame: copy the stashed subtree into the live tree.
        if (!spliceExitingSubtree(ctx, data, &ids_to_remove)) {
            i += 1;
            continue;
        }

        const exiting_index = ctx.layout_elements.indexOf(data.element_this_frame);
        const floating = data.element_this_frame.cfg().floating;
        if (parent_present and floating.attach_to == .none) {
            // Reinsert among the former siblings.
            const parent = parent_item.?.layout_element.?;
            const children = &ctx.layout_element_children;
            const new_start = children.len;
            const ordering = transition_config.exit.sibling_ordering;
            var inserted = false;
            if (ordering == .underneath_siblings) {
                _ = children.append(exiting_index);
                inserted = true;
            }
            for (parent.children.slice(), 0..) |child_index, j| {
                if (ordering == .natural_order and j == data.sibling_index) {
                    _ = children.append(exiting_index);
                    inserted = true;
                }
                _ = children.append(child_index);
            }
            if (!inserted) _ = children.append(exiting_index);
            parent.children = .{ .ptr = children.ptr + new_start, .len = parent.children.len + 1 };
        } else {
            // Floating (or orphaned) exiting elements are their own tree.
            _ = ctx.tree_roots.append(.{
                .layout_element_index = exiting_index,
                .parent_id = floating.parent_id,
                .z_index = floating.z_index,
            });
        }
        i += 1;
    }

    for (ids_to_remove.items()) |id| {
        for (ctx.transitions.items(), 0..) |data, j| {
            if (data.element_id == id) {
                _ = ctx.transitions.swapRemove(@intCast(j));
                break;
            }
        }
    }
}

/// Copy an exiting element (stashed in the tail of the element arrays by
/// `cloneElementsWithExitTransition`) and its subtree into the live arrays.
/// Children that were re-declared elsewhere this frame are left out.
fn spliceExitingSubtree(ctx: *Context, data: *internal.Transition, ids_to_remove: *memory.List(u32)) bool {
    const copy = ctx.layout_elements.append(data.element_this_frame.*) orelse return false;
    data.element_this_frame = copy;
    const exiting_index = ctx.layout_elements.len - 1;
    // Exiting elements ignore the pointer, so their clip id is irrelevant.
    _ = ctx.layout_element_clip_element_ids.set(exiting_index, 0);

    // Breadth first over the copy; the children buffer is free scratch now.
    var bfs = ctx.layout_element_children_buffer;
    bfs.len = 0;
    _ = bfs.append(exiting_index);
    var bfs_index: u32 = 0;
    while (bfs_index < bfs.len) : (bfs_index += 1) {
        const element = ctx.layout_elements.getRaw(bfs.get(bfs_index).*);
        if (ctx.declaredThisFrame(ctx.getHashMapItem(element.id))) continue;
        _ = ctx.addHashMapItem(.{ .id = element.id }, element);
        if (element.is_text) continue;

        const first_child_slot = ctx.layout_element_children.len;
        var new_length: u32 = 0;
        for (element.children.slice()) |child_index| {
            const child = ctx.layout_elements.getRaw(child_index);
            // Moved elsewhere in the layout this frame: don't duplicate it.
            if (ctx.declaredThisFrame(ctx.getHashMapItem(child.id))) continue;
            if (child.hasTransition()) _ = ids_to_remove.append(child.id);
            const child_copy = ctx.layout_elements.append(child.*) orelse break;
            const child_copy_index = ctx.layout_elements.len - 1;
            _ = ctx.layout_element_clip_element_ids.set(child_copy_index, 0);
            if (child_copy.is_text) child_copy.text().wrapped_lines.len = 0;
            _ = bfs.append(child_copy_index);
            _ = ctx.layout_element_children.append(child_copy_index);
            new_length += 1;
        }
        element.children = .{ .ptr = ctx.layout_element_children.ptr + first_child_slot, .len = new_length };
    }
    if (ctx.getHashMapItem(data.element_id)) |item| item.layout_element = copy;
    return true;
}

/// Between the two layout passes: compute targets, start transitions for
/// changed properties, run handlers and write the interpolated state back.
pub fn updateTransitions(ctx: *Context, delta_time: f32) void {
    var i: u32 = 0;
    while (i < ctx.transitions.len) {
        const data = ctx.transitions.get(i);
        const current = data.element_this_frame;
        const map_item = ctx.getHashMapItem(data.element_id) orelse {
            i += 1;
            continue;
        };
        const parent_item = ctx.getHashMapItem(data.parent_id);
        const decl = current.cfg();
        const transition_config = &decl.transition;

        // Where the element *wants* to be this frame (exiting elements keep
        // the target computed by `exit.set_final_state`).
        var target_state = data.target_state;
        if (data.state != .exiting) {
            target_state = .{
                .bounding_box = map_item.bounding_box,
                .background_color = decl.background_color,
                .overlay_color = decl.overlay_color,
                .border_color = decl.border.color,
                .border_width = decl.border.width,
            };
        }
        const old_target_state = data.target_state;
        data.target_state = target_state;

        if (map_item.appeared_this_frame) {
            // Entering.
            const parent_appeared = if (parent_item) |p| p.appeared_this_frame else false;
            const skip = parent_appeared and transition_config.enter.trigger == .skip_on_first_parent_frame;
            if (transition_config.enter.set_initial_state != null and !skip) {
                data.state = .entering;
                data.initial_state = transition_config.enter.set_initial_state.?(data.target_state, transition_config.properties);
                data.current_state = data.initial_state;
                data.active_properties = transition_config.properties;
                applyTransitionedProperties(current, transition_config.properties, data.initial_state, &map_item.bounding_box, data.reparented);
            } else {
                data.initial_state = target_state;
                data.current_state = target_state;
                data.active_properties = .none;
            }
            i += 1;
            continue;
        }

        if (data.state != .exiting) {
            const changed = detectChanges(ctx, data, map_item, parent_item, old_target_state, target_state, transition_config.properties);
            if (!changed.isEmpty()) {
                data.elapsed_time = 0;
                data.initial_state = data.current_state;
                data.state = .transitioning;
                data.active_properties = data.active_properties.merge(changed);
            }
        }

        if (data.state == .idle) {
            data.initial_state = target_state;
            data.current_state = target_state;
            data.target_state = target_state;
            data.active_properties = .none;
            i += 1;
            continue;
        }

        const complete = if (transition_config.handler) |handler| handler(.{
            .state = data.state,
            .initial = data.initial_state,
            .current = &data.current_state,
            .target = target_state,
            .elapsed_time = data.elapsed_time,
            .duration = transition_config.duration,
            .properties = data.active_properties,
        }) else true;
        applyTransitionedProperties(current, data.active_properties, data.current_state, &map_item.bounding_box, data.reparented);
        data.elapsed_time += delta_time;

        if (complete) {
            switch (data.state) {
                .entering, .transitioning => {
                    data.state = .idle;
                    data.elapsed_time = 0;
                    data.reparented = false;
                    data.active_properties = .none;
                },
                .exiting => {
                    _ = ctx.transitions.swapRemove(i);
                    continue;
                },
                .idle => {},
            }
        }
        i += 1;
    }
}

/// Which of `properties` changed since last frame and should animate.
fn detectChanges(
    ctx: *Context,
    data: *internal.Transition,
    map_item: *internal.HashMapItem,
    parent_item: ?*internal.HashMapItem,
    old_target: TransitionData,
    target: TransitionData,
    properties: TransitionProperties,
) TransitionProperties {
    var parent_scroll_offset: Vec2 = .{};
    var parent_box: BoundingBox = .{};
    if (parent_item) |p| {
        parent_box = p.bounding_box;
        if (p.layout_element) |parent| {
            if (!parent.is_text) parent_scroll_offset = parent.cfg().clip.child_offset;
        }
    }
    const new_relative: Vec2 = .{
        .x = map_item.bounding_box.x - parent_box.x - parent_scroll_offset.x,
        .y = map_item.bounding_box.y - parent_box.y - parent_scroll_offset.y,
    };
    const old_relative = data.old_parent_relative_position;
    data.old_parent_relative_position = new_relative;

    const resized = ctx.root_resized_last_frame;
    const eq = types.floatEqual;
    var changed: TransitionProperties = .{};
    // A position change only animates if the element moved *within* its
    // parent (or changed parent), not when the parent itself moved, and not
    // when the window was resized.
    if (properties.x and !eq(old_target.bounding_box.x, target.bounding_box.x) and
        (!eq(old_relative.x, new_relative.x) or data.reparented) and !resized) changed.x = true;
    if (properties.y and !eq(old_target.bounding_box.y, target.bounding_box.y) and
        (!eq(old_relative.y, new_relative.y) or data.reparented) and !resized) changed.y = true;
    if (properties.width and !eq(old_target.bounding_box.width, target.bounding_box.width) and !resized) changed.width = true;
    if (properties.height and !eq(old_target.bounding_box.height, target.bounding_box.height) and !resized) changed.height = true;
    if (properties.background_color and !old_target.background_color.eql(target.background_color)) changed.background_color = true;
    if (properties.overlay_color and !old_target.overlay_color.eql(target.overlay_color)) changed.overlay_color = true;
    if (properties.border_color and !old_target.border_color.eql(target.border_color)) changed.border_color = true;
    if (properties.border_width and !old_target.border_width.eql(target.border_width)) changed.border_width = true;
    return changed;
}

/// Write an interpolated state into the element (and its stored box) so the
/// second layout pass uses it. Sizes become fixed so children follow along;
/// reparented elements only change their drawn box.
fn applyTransitionedProperties(element: *LayoutElement, properties: TransitionProperties, state: TransitionData, box: *BoundingBox, reparented: bool) void {
    const decl = element.cfg();
    if (properties.width) {
        if (!reparented) {
            element.dimensions.width = state.bounding_box.width;
            decl.layout.sizing.width = .fixed(state.bounding_box.width);
        } else {
            box.width = state.bounding_box.width;
        }
    }
    if (properties.height) {
        if (!reparented) {
            element.dimensions.height = state.bounding_box.height;
            decl.layout.sizing.height = .fixed(state.bounding_box.height);
        } else {
            box.height = state.bounding_box.height;
        }
    }
    if (properties.x) box.x = state.bounding_box.x;
    if (properties.y) box.y = state.bounding_box.y;
    if (properties.overlay_color) decl.overlay_color = state.overlay_color;
    if (properties.background_color) decl.background_color = state.background_color;
    if (properties.border_color) decl.border.color = state.border_color;
    if (properties.border_width) decl.border.width = state.border_width;
}

/// End of `endLayout`: stash a copy of every element that has an exit
/// transition (with its subtree) in the unused tail of the element arrays,
/// so it can be resurrected next frame if it disappears.
///
/// This relies on the ephemeral arrays being re-carved at the same address
/// every frame. If a later frame uses so many elements that it reaches the
/// tail, the stash is overwritten (same limitation as Clay).
pub fn cloneElementsWithExitTransition(ctx: *Context) void {
    var next_index: u32 = ctx.layout_elements.capacity -| 1;
    var next_child_index: u32 = ctx.layout_element_children.capacity -| 1;

    for (ctx.transitions.items()) |*data| {
        if (!data.transition_out) continue;
        if (!stashSubtree(ctx, data, &next_index, &next_child_index)) {
            // Out of room: this element will simply vanish without an exit
            // animation (its record gets pruned next frame).
            data.transition_out = false;
        }
    }
}

/// Copy `data.element_this_frame` and its subtree downwards from the end of
/// the arrays. Returns false if it would reach this frame's live data (which
/// is still needed for pointer hit testing before the next `beginLayout`).
fn stashSubtree(ctx: *Context, data: *internal.Transition, next_index: *u32, next_child_index: *u32) bool {
    if (next_index.* <= ctx.layout_elements.len) return false;
    var bfs = ctx.layout_element_children_buffer;
    bfs.len = 0;
    const stashed = ctx.layout_elements.setRaw(next_index.*, data.element_this_frame.*);
    _ = bfs.append(next_index.*);
    data.element_this_frame = stashed;
    next_index.* -= 1;

    var bfs_index: u32 = 0;
    while (bfs_index < bfs.len) : (bfs_index += 1) {
        const element = ctx.layout_elements.getRaw(bfs.get(bfs_index).*);
        if (element.is_text) continue;
        // Children are written backwards so they end up in forward order.
        const children = element.children.slice();
        var j = children.len;
        while (j > 0) {
            j -= 1;
            if (next_index.* <= ctx.layout_elements.len or next_child_index.* <= ctx.layout_element_children.len) return false;
            const child = ctx.layout_elements.getRaw(children[j]);
            _ = bfs.append(next_index.*);
            _ = ctx.layout_elements.setRaw(next_index.*, child.*);
            _ = ctx.layout_element_children.setRaw(next_child_index.*, next_index.*);
            next_index.* -= 1;
            next_child_index.* -= 1;
        }
        element.children.ptr = ctx.layout_element_children.ptr + next_child_index.* + 1;
    }
    return true;
}
