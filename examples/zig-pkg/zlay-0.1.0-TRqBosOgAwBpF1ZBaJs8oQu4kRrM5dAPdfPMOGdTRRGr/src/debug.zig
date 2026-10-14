//! The interactive debug view (Clay's "Clay Debug Tools").
//!
//! When `ctx.setDebugModeEnabled(true)` is on, `endLayout` declares an extra
//! floating panel on the right side of the layout, built with zlay itself:
//!
//!  * a tree of every element (click "-" / "+" to collapse a subtree),
//!  * hovering a row highlights that element in your UI,
//!  * clicking a row shows its full configuration at the bottom.
//!
//! The panel's text always uses `font_id = 0` and `font_size = 16`, so make
//! sure your measure function / renderer handle that font.

const types = @import("types.zig");
const config = @import("config.zig");
const internal = @import("internal.zig");
const hash = @import("hash.zig");
const layout = @import("layout.zig");
const Context = @import("Context.zig");

const Color = types.Color;
const ElementId = types.ElementId;
const TextConfig = config.TextConfig;
const LayoutElement = internal.LayoutElement;

const color_1: Color = .rgb(58, 56, 52);
const color_2: Color = .rgb(62, 60, 58);
const color_3: Color = .rgb(141, 133, 135);
const color_4: Color = .rgb(238, 226, 231);
const color_selected_row: Color = .rgb(102, 80, 78);
const row_height = 30;
const outer_padding = 10;
const indent_width = 16;

const text_name_config: TextConfig = .{ .color = color_4, .font_size = 16, .wrap_mode = .none };
const info_text_config: TextConfig = .{ .color = color_4, .font_size = 16, .wrap_mode = .none };
const info_title_config: TextConfig = .{ .color = color_3, .font_size = 16, .wrap_mode = .none };
const label_text_config: TextConfig = .{ .color = color_4, .font_size = 16 };
const offscreen_text_config: TextConfig = .{ .color = color_3, .font_size = 16 };
const attribute_padding: config.Padding = .{ .left = outer_padding, .right = outer_padding, .top = 8, .bottom = 8 };
const thin_border: config.BorderWidth = .outside(1);

/// Every element feature that gets a colored tag in the tree.
const ConfigKind = enum {
    background_color,
    overlay_color,
    corner_radius,
    text,
    aspect,
    image,
    floating,
    clip,
    border,
    custom,

    fn label(self: ConfigKind) []const u8 {
        return switch (self) {
            .background_color => "Background",
            .overlay_color => "Overlay",
            .corner_radius => "Radius",
            .text => "Text",
            .aspect => "Aspect",
            .image => "Image",
            .floating => "Floating",
            .clip => "Scroll",
            .border => "Border",
            .custom => "Custom",
        };
    }

    fn color(self: ConfigKind) Color {
        return switch (self) {
            .background_color => .rgb(243, 134, 48),
            .overlay_color => .rgb(142, 129, 206),
            .corner_radius => .rgb(239, 148, 157),
            .text => .rgb(105, 210, 231),
            .aspect => .rgb(101, 149, 194),
            .image => .rgb(121, 189, 154),
            .floating => .rgb(250, 105, 0),
            .clip => .rgb(242, 196, 90),
            .border => .rgb(108, 91, 123),
            .custom => .rgb(11, 72, 107),
        };
    }
};

// -----------------------------------------------------------------------------
// Small helpers
// -----------------------------------------------------------------------------

/// Format an integer into the per-frame string scratch buffer (Clay's
/// `Clay__IntToString`). The slice stays valid until the next `beginLayout`.
fn intToString(ctx: *Context, value: i64) []const u8 {
    if (value == 0) return "0";
    var digits: [24]u8 = undefined;
    var length: usize = 0;
    var magnitude: u64 = if (value < 0) @intCast(-value) else @intCast(value);
    while (magnitude > 0) : (magnitude /= 10) {
        digits[length] = @intCast('0' + magnitude % 10);
        length += 1;
    }
    if (value < 0) {
        digits[length] = '-';
        length += 1;
    }
    const buffer = &ctx.dynamic_string_data;
    if (buffer.len + length > buffer.capacity) return "?";
    const out = buffer.ptr[buffer.len..][0..length];
    for (0..length) |i| out[i] = digits[length - 1 - i];
    buffer.len += @intCast(length);
    return out;
}

/// Floats are shown truncated to integers, like Clay does.
fn floatToString(ctx: *Context, value: f32) []const u8 {
    const clamped = @max(@min(value, 2147483647.0), -2147483648.0);
    return intToString(ctx, @intFromFloat(clamped));
}

fn colorWithAlpha(c: Color, a: f32) Color {
    return c.withAlpha(a);
}

/// A small rounded tag like "[Background]".
fn renderConfigTypeLabel(ctx: *Context, label: []const u8, color: Color, offscreen: bool) void {
    ctx.element(.auto, .{
        .layout = .{ .padding = .{ .left = 8, .right = 8, .top = 2, .bottom = 2 } },
        .background_color = colorWithAlpha(color, 90),
        .corner_radius = .all(4),
        .border = .{ .color = color, .width = thin_border },
    }).children({
        ctx.text(label, .{ .color = if (offscreen) color_3 else color_4, .font_size = 16 });
    });
}

fn renderConfigKindLabel(ctx: *Context, kind: ConfigKind, offscreen: bool) void {
    renderConfigTypeLabel(ctx, kind.label(), kind.color(), offscreen);
}

/// Header of a section in the selected element panel.
fn renderConfigHeader(ctx: *Context, kind: ConfigKind) void {
    ctx.element(.auto, .{
        .layout = .{ .padding = .{ .left = 8, .right = 8, .top = 2, .bottom = 2 } },
        .background_color = colorWithAlpha(kind.color(), 90),
        .corner_radius = .all(4),
        .border = .{ .color = kind.color(), .width = thin_border },
    }).children({
        ctx.text(kind.label(), label_text_config);
    });
}

fn row(ctx: *Context) Context.ConfiguredElement {
    return ctx.element(.auto, .{ .layout = .{ .direction = .left_to_right } });
}

fn renderColor(ctx: *Context, color: Color) void {
    ctx.element(.auto, .{ .layout = .{ .child_alignment = .{ .y = .center } } }).children({
        ctx.text("{ r: ", info_text_config);
        ctx.text(floatToString(ctx, color.r), info_text_config);
        ctx.text(", g: ", info_text_config);
        ctx.text(floatToString(ctx, color.g), info_text_config);
        ctx.text(", b: ", info_text_config);
        ctx.text(floatToString(ctx, color.b), info_text_config);
        ctx.text(", a: ", info_text_config);
        ctx.text(floatToString(ctx, color.a), info_text_config);
        ctx.text(" }", info_text_config);
        ctx.element(.auto, .{ .layout = .{ .sizing = .{ .width = .fixed(10) } } }).end();
        ctx.element(.auto, .{
            .layout = .{ .sizing = .fixed(row_height - 8, row_height - 8) },
            .background_color = color,
            .corner_radius = .all(4),
            .border = .{ .color = color_4, .width = thin_border },
        }).end();
    });
}

fn renderCornerRadius(ctx: *Context, radius: types.CornerRadius) void {
    ctx.element(.auto, .{ .layout = .{ .child_alignment = .{ .y = .center } } }).children({
        ctx.text("{ topLeft: ", info_text_config);
        ctx.text(floatToString(ctx, radius.top_left), info_text_config);
        ctx.text(", topRight: ", info_text_config);
        ctx.text(floatToString(ctx, radius.top_right), info_text_config);
        ctx.text(", bottomLeft: ", info_text_config);
        ctx.text(floatToString(ctx, radius.bottom_left), info_text_config);
        ctx.text(", bottomRight: ", info_text_config);
        ctx.text(floatToString(ctx, radius.bottom_right), info_text_config);
        ctx.text(" }", info_text_config);
    });
}

fn renderSizingAxis(ctx: *Context, sizing: config.SizingAxis) void {
    ctx.text(switch (sizing.kind) {
        .fit => "FIT",
        .grow => "GROW",
        .percent => "PERCENT",
        .fixed => "FIXED",
    }, info_text_config);
    if (sizing.kind == .percent) {
        ctx.text("(", info_text_config);
        ctx.text(floatToString(ctx, sizing.fraction * 100), info_text_config);
        ctx.text("%)", info_text_config);
        return;
    }
    const has_max = sizing.min_max.max != types.max_float and sizing.min_max.max > 0;
    ctx.text("(", info_text_config);
    if (sizing.min_max.min != 0) {
        ctx.text("min: ", info_text_config);
        ctx.text(floatToString(ctx, sizing.min_max.min), info_text_config);
        if (has_max) ctx.text(", ", info_text_config);
    }
    if (has_max) {
        ctx.text("max: ", info_text_config);
        ctx.text(floatToString(ctx, sizing.min_max.max), info_text_config);
    }
    ctx.text(")", info_text_config);
}

fn attachPointName(point: config.AttachPoint) []const u8 {
    return switch (point) {
        .left_top => "LEFT_TOP",
        .left_center => "LEFT_CENTER",
        .left_bottom => "LEFT_BOTTOM",
        .center_top => "CENTER_TOP",
        .center_center => "CENTER_CENTER",
        .center_bottom => "CENTER_BOTTOM",
        .right_top => "RIGHT_TOP",
        .right_center => "RIGHT_CENTER",
        .right_bottom => "RIGHT_BOTTOM",
    };
}

fn closeButtonHover(ctx: *Context, id: ElementId, pointer: types.PointerData, user_data: ?*anyopaque) void {
    _ = id;
    _ = user_data;
    if (pointer.state == .pressed_this_frame) ctx.debug_mode_enabled = false;
}

// -----------------------------------------------------------------------------
// Element tree
// -----------------------------------------------------------------------------

const ListResult = struct {
    row_count: i32 = 0,
    selected_element_row_index: i32 = -1,
};

/// One row per element (plus one per text's contents), indented by depth.
fn renderElementsList(ctx: *Context, initial_roots_length: u32, highlighted_row_index: i32) ListResult {
    var dfs = ctx.reusable_element_index_buffer;
    const visited = ctx.tree_node_visited.backing();
    var result: ListResult = .{};
    var highlighted_element_id: u32 = 0;
    const item_layout: config.LayoutConfig = .{
        .sizing = .{ .height = .fixed(row_height) },
        .child_gap = 6,
        .child_alignment = .{ .y = .center },
    };

    for (0..initial_roots_length) |root_index| {
        dfs.len = 0;
        const root = ctx.tree_roots.get(@intCast(root_index)).*;
        _ = dfs.append(root.layout_element_index);
        visited[0] = false;

        if (root_index > 0) {
            // Separator between trees (floating elements).
            ctx.element(.indexed("Zlay__DebugView_EmptyRowOuter", @intCast(root_index)), .{
                .layout = .{ .sizing = .{ .width = .grow(.{}) }, .padding = .{ .left = indent_width / 2 } },
            }).children({
                ctx.element(.indexed("Zlay__DebugView_EmptyRow", @intCast(root_index)), .{
                    .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(row_height) } },
                    .border = .{ .color = color_3, .width = .{ .top = 1 } },
                }).end();
            });
            result.row_count += 1;
        }

        while (dfs.len > 0) {
            const element_index = dfs.get(dfs.len - 1).*;
            const current = ctx.layout_elements.getRaw(element_index);
            if (visited[dfs.len - 1]) {
                // Leaving: close the three indentation containers.
                if (!current.is_text and current.children.len > 0) {
                    ctx.closeElement();
                    ctx.closeElement();
                    ctx.closeElement();
                }
                dfs.len -= 1;
                continue;
            }
            if (current.exiting) {
                dfs.len -= 1;
                continue;
            }

            if (highlighted_row_index == result.row_count) {
                if (ctx.pointer_info.state == .pressed_this_frame) ctx.debug_selected_element_id = current.id;
                highlighted_element_id = current.id;
            }
            visited[dfs.len - 1] = true;

            const element_data = ctx.getHashMapItem(current.id);
            const offscreen = if (element_data) |d| layout.elementIsOffscreen(ctx, d.bounding_box) else false;
            if (ctx.debug_selected_element_id == current.id) result.selected_element_row_index = result.row_count;

            ctx.element(.indexed("Zlay__DebugView_ElementOuter", current.id), .{ .layout = item_layout }).children({
                renderRowContents(ctx, current, element_data, offscreen);
            });

            if (current.is_text) {
                // The text itself on its own row.
                result.row_count += 1;
                const text_element = current.text();
                const raw_config = if (offscreen) offscreen_text_config else text_name_config;
                ctx.element(.auto, .{ .layout = .{
                    .sizing = .{ .height = .fixed(row_height) },
                    .child_alignment = .{ .y = .center },
                } }).children({
                    ctx.element(.auto, .{ .layout = .{ .sizing = .{ .width = .fixed(indent_width + 16) } } }).end();
                    ctx.text("\"", raw_config);
                    ctx.text(if (text_element.text.len > 40) text_element.text[0..40] else text_element.text, raw_config);
                    if (text_element.text.len > 40) ctx.text("...", raw_config);
                    ctx.text("\"", raw_config);
                });
            } else if (current.children.len > 0) {
                // Indentation with a guide line; closed when leaving.
                ctx.openElement(.auto);
                ctx.configureOpenElement(.{ .layout = .{ .padding = .{ .left = 8 } } });
                ctx.openElement(.auto);
                ctx.configureOpenElement(.{
                    .layout = .{ .padding = .{ .left = indent_width } },
                    .border = .{ .color = color_3, .width = .{ .left = 1 } },
                });
                ctx.openElement(.auto);
                ctx.configureOpenElement(.{ .layout = .{ .direction = .top_to_bottom } });
            }

            result.row_count += 1;
            const collapsed = if (element_data) |d| d.debug.collapsed else false;
            if (!(current.is_text or collapsed)) {
                const children = current.children.slice();
                var i = children.len;
                while (i > 0) {
                    i -= 1;
                    _ = dfs.append(children[i]);
                    visited[dfs.len - 1] = false;
                }
            }
        }
    }

    // Clicking a collapse button toggles that element's subtree.
    if (ctx.pointer_info.state == .pressed_this_frame) {
        const collapse_button_id = ElementId.named("Zlay__DebugView_CollapseElement");
        const over = ctx.pointer_over_ids.items();
        var i = over.len;
        while (i > 0) {
            i -= 1;
            if (over[i].base_id == collapse_button_id.base_id) {
                if (ctx.getHashMapItem(over[i].offset)) |item| item.debug.collapsed = !item.debug.collapsed;
                break;
            }
        }
    }

    if (highlighted_element_id != 0) {
        ctx.element(.named("Zlay__DebugView_ElementHighlight"), .{
            .layout = .{ .sizing = .grow },
            .floating = .{
                .parent_id = highlighted_element_id,
                .z_index = 32767,
                .pointer_capture_mode = .passthrough,
                .attach_to = .element_with_id,
            },
        }).children({
            ctx.element(.named("Zlay__DebugView_ElementHighlightRectangle"), .{
                .layout = .{ .sizing = .grow },
                .background_color = ctx.debug_view_highlight_color,
            }).end();
        });
    }
    return result;
}

/// Collapse button, warnings, id and feature tags of one tree row.
fn renderRowContents(ctx: *Context, current: *LayoutElement, element_data: ?*internal.HashMapItem, offscreen: bool) void {
    if (!current.is_text and current.children.len > 0) {
        ctx.element(.indexed("Zlay__DebugView_CollapseElement", current.id), .{
            .layout = .{ .sizing = .fixed(16, 16), .child_alignment = .center },
            .corner_radius = .all(4),
            .border = .{ .color = color_3, .width = thin_border },
        }).children({
            const collapsed = if (element_data) |d| d.debug.collapsed else false;
            ctx.text(if (collapsed) "+" else "-", label_text_config);
        });
    } else {
        // Square dot for leaves.
        ctx.element(.auto, .{ .layout = .{ .sizing = .fixed(16, 16), .child_alignment = .center } }).children({
            ctx.element(.auto, .{
                .layout = .{ .sizing = .fixed(8, 8) },
                .background_color = color_3,
                .corner_radius = .all(2),
            }).end();
        });
    }

    if (element_data) |data| {
        if (data.debug.collision) {
            ctx.element(.auto, .{
                .layout = .{ .padding = .{ .left = 8, .right = 8, .top = 2, .bottom = 2 } },
                .border = .{ .color = .rgb(177, 147, 8), .width = thin_border },
            }).children({
                ctx.text("Duplicate ID", offscreen_text_config);
            });
        }
        if (offscreen) {
            ctx.element(.auto, .{
                .layout = .{ .padding = .{ .left = 8, .right = 8, .top = 2, .bottom = 2 } },
                .border = .{ .color = color_3, .width = thin_border },
            }).children({
                ctx.text("Offscreen", offscreen_text_config);
            });
        }
        const element_id = data.element_id;
        if (element_id.string_id.len > 0) {
            ctx.open(.auto).children({
                const text_config = if (offscreen) offscreen_text_config else text_name_config;
                ctx.text(element_id.string_id, text_config);
                if (element_id.offset != 0) {
                    ctx.text(" (", text_config);
                    ctx.text(intToString(ctx, element_id.offset), text_config);
                    ctx.text(")", text_config);
                }
            });
        }
    }

    if (current.is_text) {
        renderConfigKindLabel(ctx, .text, offscreen);
        return;
    }
    const decl = current.cfg();
    if (decl.background_color.a > 0) renderConfigKindLabel(ctx, .background_color, offscreen);
    if (decl.overlay_color.a > 0) renderConfigKindLabel(ctx, .overlay_color, offscreen);
    if (!decl.corner_radius.isZero()) renderConfigKindLabel(ctx, .corner_radius, offscreen);
    if (decl.aspect_ratio.ratio != 0) renderConfigKindLabel(ctx, .aspect, offscreen);
    if (decl.image.data != null) renderConfigKindLabel(ctx, .image, offscreen);
    if (decl.floating.attach_to != .none) renderConfigKindLabel(ctx, .floating, offscreen);
    if (decl.clip.enabled()) renderConfigKindLabel(ctx, .clip, offscreen);
    if (decl.border.width.any()) renderConfigKindLabel(ctx, .border, offscreen);
    if (decl.custom.data != null) renderConfigKindLabel(ctx, .custom, offscreen);
}

// -----------------------------------------------------------------------------
// Selected element panel
// -----------------------------------------------------------------------------

fn section(ctx: *Context, id: ElementId) Context.ConfiguredElement {
    return ctx.element(id, .{ .layout = .{ .padding = attribute_padding, .child_gap = 8, .direction = .top_to_bottom } });
}

fn renderSelectedElement(ctx: *Context, item: *internal.HashMapItem) void {
    const selected = item.layout_element.?;
    ctx.open(.auto).config(.{
        .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(300) }, .direction = .top_to_bottom },
        .background_color = color_2,
        .clip = .{ .vertical = true, .child_offset = ctx.scrollOffset() },
        .border = .{ .color = color_3, .width = .{ .between_children = 1 } },
    }).children({
        ctx.element(.auto, .{ .layout = .{
            .sizing = .{ .width = .grow(.{}), .height = .fixed(row_height + 8) },
            .padding = .{ .left = outer_padding, .right = outer_padding },
            .child_alignment = .{ .y = .center },
        } }).children({
            ctx.text("Element Configuration", info_text_config);
            ctx.element(.auto, .{ .layout = .{ .sizing = .{ .width = .grow(.{}) } } }).end();
            if (item.element_id.string_id.len != 0) {
                ctx.text(item.element_id.string_id, info_title_config);
                if (item.element_id.offset != 0) {
                    ctx.text(" (", info_title_config);
                    ctx.text(intToString(ctx, item.element_id.offset), info_title_config);
                    ctx.text(")", info_title_config);
                }
            }
        });

        // Layout.
        section(ctx, .auto).children({
            ctx.element(.auto, .{
                .layout = .{ .padding = .{ .left = 8, .right = 8, .top = 2, .bottom = 2 } },
                .background_color = .rgba(200, 200, 200, 120),
                .corner_radius = .all(4),
                .border = .{ .color = .rgb(200, 200, 200), .width = thin_border },
            }).children({
                ctx.text("Layout", label_text_config);
            });
            ctx.text("Bounding Box", info_title_config);
            row(ctx).children({
                const box = item.bounding_box;
                ctx.text("{ x: ", info_text_config);
                ctx.text(floatToString(ctx, box.x), info_text_config);
                ctx.text(", y: ", info_text_config);
                ctx.text(floatToString(ctx, box.y), info_text_config);
                ctx.text(", width: ", info_text_config);
                ctx.text(floatToString(ctx, box.width), info_text_config);
                ctx.text(", height: ", info_text_config);
                ctx.text(floatToString(ctx, box.height), info_text_config);
                ctx.text(" }", info_text_config);
            });
            if (!selected.is_text) {
                const layout_config = selected.cfg().layout;
                ctx.text("Layout Direction", info_title_config);
                ctx.text(if (layout_config.direction == .top_to_bottom) "TOP_TO_BOTTOM" else "LEFT_TO_RIGHT", info_text_config);
                ctx.text("Sizing", info_title_config);
                row(ctx).children({
                    ctx.text("width: ", info_text_config);
                    renderSizingAxis(ctx, layout_config.sizing.width);
                });
                row(ctx).children({
                    ctx.text("height: ", info_text_config);
                    renderSizingAxis(ctx, layout_config.sizing.height);
                });
                ctx.text("Padding", info_title_config);
                ctx.open(.named("Zlay__DebugViewElementInfoPadding")).children({
                    const p = layout_config.padding;
                    ctx.text("{ left: ", info_text_config);
                    ctx.text(intToString(ctx, p.left), info_text_config);
                    ctx.text(", right: ", info_text_config);
                    ctx.text(intToString(ctx, p.right), info_text_config);
                    ctx.text(", top: ", info_text_config);
                    ctx.text(intToString(ctx, p.top), info_text_config);
                    ctx.text(", bottom: ", info_text_config);
                    ctx.text(intToString(ctx, p.bottom), info_text_config);
                    ctx.text(" }", info_text_config);
                });
                ctx.text("Child Gap", info_title_config);
                ctx.text(intToString(ctx, layout_config.child_gap), info_text_config);
                ctx.text("Child Alignment", info_title_config);
                row(ctx).children({
                    ctx.text("{ x: ", info_text_config);
                    ctx.text(switch (layout_config.child_alignment.x) {
                        .left => "LEFT",
                        .center => "CENTER",
                        .right => "RIGHT",
                    }, info_text_config);
                    ctx.text(", y: ", info_text_config);
                    ctx.text(switch (layout_config.child_alignment.y) {
                        .top => "TOP",
                        .center => "CENTER",
                        .bottom => "BOTTOM",
                    }, info_text_config);
                    ctx.text(" }", info_text_config);
                });
            }
        });

        if (selected.is_text) {
            renderTextInfo(ctx, &selected.text().config);
        } else {
            renderContainerInfo(ctx, selected);
        }
    });
}

fn renderTextInfo(ctx: *Context, text_config: *const TextConfig) void {
    section(ctx, .auto).children({
        renderConfigHeader(ctx, .text);
        ctx.text("Font Size", info_title_config);
        ctx.text(intToString(ctx, text_config.font_size), info_text_config);
        ctx.text("Font ID", info_title_config);
        ctx.text(intToString(ctx, text_config.font_id), info_text_config);
        ctx.text("Line Height", info_title_config);
        ctx.text(if (text_config.line_height == 0) "auto" else intToString(ctx, text_config.line_height), info_text_config);
        ctx.text("Letter Spacing", info_title_config);
        ctx.text(intToString(ctx, text_config.letter_spacing), info_text_config);
        ctx.text("Wrap Mode", info_title_config);
        ctx.text(switch (text_config.wrap_mode) {
            .words => "WORDS",
            .newlines => "NEWLINES",
            .none => "NONE",
        }, info_text_config);
        ctx.text("Text Alignment", info_title_config);
        ctx.text(switch (text_config.alignment) {
            .left => "LEFT",
            .center => "CENTER",
            .right => "RIGHT",
        }, info_text_config);
        ctx.text("Text Color", info_title_config);
        renderColor(ctx, text_config.color);
    });
}

fn renderContainerInfo(ctx: *Context, selected: *LayoutElement) void {
    const decl = selected.cfg();

    section(ctx, .named("Zlay__DebugViewElementInfoSharedBody")).children({
        renderConfigTypeLabel(ctx, "Color & Radius", ConfigKind.background_color.color(), false);
        if (decl.background_color.a > 0) {
            ctx.text("Background Color", info_title_config);
            renderColor(ctx, decl.background_color);
        }
        if (!decl.corner_radius.isZero()) {
            ctx.text("Corner Radius", info_title_config);
            renderCornerRadius(ctx, decl.corner_radius);
        }
        if (decl.overlay_color.a > 0) {
            ctx.text("Overlay Color", info_title_config);
            renderColor(ctx, decl.overlay_color);
        }
    });

    if (decl.aspect_ratio.ratio > 0) {
        section(ctx, .named("Zlay__DebugViewElementInfoAspectRatioBody")).children({
            renderConfigHeader(ctx, .aspect);
            ctx.text("Aspect Ratio", info_title_config);
            ctx.open(.named("Zlay__DebugViewElementInfoAspectRatio")).children({
                const ratio = decl.aspect_ratio.ratio;
                const whole: i64 = @intFromFloat(@min(ratio, 2147483647.0));
                ctx.text(intToString(ctx, whole), info_text_config);
                ctx.text(".", info_text_config);
                const hundredths: i64 = @intFromFloat((ratio - @as(f32, @floatFromInt(whole))) * 100);
                if (hundredths < 10) ctx.text("0", info_text_config);
                ctx.text(intToString(ctx, hundredths), info_text_config);
            });
        });
    }

    if (decl.image.data != null) {
        const preview_ratio: f32 = if (decl.aspect_ratio.ratio > 0) decl.aspect_ratio.ratio else 1;
        section(ctx, .named("Zlay__DebugViewElementInfoImageBody")).children({
            renderConfigHeader(ctx, .image);
            ctx.text("Preview", info_title_config);
            ctx.element(.auto, .{
                .layout = .{ .sizing = .{
                    .width = .grow(.{ .min = 64, .max = 128 }),
                    .height = .grow(.{ .min = 64, .max = 128 }),
                } },
                .aspect_ratio = .{ .ratio = preview_ratio },
                .image = decl.image,
            }).end();
        });
    }

    if (decl.floating.attach_to != .none) {
        const floating = decl.floating;
        section(ctx, .auto).children({
            renderConfigHeader(ctx, .floating);
            ctx.text("Offset", info_title_config);
            row(ctx).children({
                ctx.text("{ x: ", info_text_config);
                ctx.text(floatToString(ctx, floating.offset.x), info_text_config);
                ctx.text(", y: ", info_text_config);
                ctx.text(floatToString(ctx, floating.offset.y), info_text_config);
                ctx.text(" }", info_text_config);
            });
            ctx.text("Expand", info_title_config);
            row(ctx).children({
                ctx.text("{ width: ", info_text_config);
                ctx.text(floatToString(ctx, floating.expand.width), info_text_config);
                ctx.text(", height: ", info_text_config);
                ctx.text(floatToString(ctx, floating.expand.height), info_text_config);
                ctx.text(" }", info_text_config);
            });
            ctx.text("z-index", info_title_config);
            ctx.text(intToString(ctx, floating.z_index), info_text_config);
            ctx.text("Parent", info_title_config);
            const parent_name = if (ctx.getHashMapItem(floating.parent_id)) |p| p.element_id.string_id else "";
            ctx.text(parent_name, info_text_config);
            ctx.text("Attach Points", info_title_config);
            row(ctx).children({
                ctx.text("{ element: ", info_text_config);
                ctx.text(attachPointName(floating.attach_points.element), info_text_config);
                ctx.text(", parent: ", info_text_config);
                ctx.text(attachPointName(floating.attach_points.parent), info_text_config);
                ctx.text(" }", info_text_config);
            });
            ctx.text("Pointer Capture Mode", info_title_config);
            ctx.text(if (floating.pointer_capture_mode == .passthrough) "PASSTHROUGH" else "CAPTURE", info_text_config);
            ctx.text("Attach To", info_title_config);
            ctx.text(switch (floating.attach_to) {
                .none => "NONE",
                .parent => "PARENT",
                .element_with_id => "ELEMENT_WITH_ID",
                .root => "ROOT",
            }, info_text_config);
            ctx.text("Clip To", info_title_config);
            ctx.text(if (floating.clip_to == .none) "NONE" else "ATTACHED_PARENT", info_text_config);
        });
    }

    if (decl.clip.enabled()) {
        section(ctx, .auto).children({
            renderConfigHeader(ctx, .clip);
            ctx.text("Vertical", info_title_config);
            ctx.text(if (decl.clip.vertical) "true" else "false", info_text_config);
            ctx.text("Horizontal", info_title_config);
            ctx.text(if (decl.clip.horizontal) "true" else "false", info_text_config);
        });
    }

    if (decl.border.width.any()) {
        const border = decl.border;
        section(ctx, .named("Zlay__DebugViewElementInfoBorderBody")).children({
            renderConfigHeader(ctx, .border);
            ctx.text("Border Widths", info_title_config);
            row(ctx).children({
                ctx.text("{ left: ", info_text_config);
                ctx.text(intToString(ctx, border.width.left), info_text_config);
                ctx.text(", right: ", info_text_config);
                ctx.text(intToString(ctx, border.width.right), info_text_config);
                ctx.text(", top: ", info_text_config);
                ctx.text(intToString(ctx, border.width.top), info_text_config);
                ctx.text(", bottom: ", info_text_config);
                ctx.text(intToString(ctx, border.width.bottom), info_text_config);
                ctx.text(" }", info_text_config);
            });
            ctx.text("Border Color", info_title_config);
            renderColor(ctx, border.color);
        });
    }
}

// -----------------------------------------------------------------------------
// Entry point
// -----------------------------------------------------------------------------

/// Declare the debug panel. Called by `endLayout` after the user's tree has
/// been closed (the panel is a floating tree attached to the root).
pub fn renderDebugView(ctx: *Context) void {
    // The open stack was used as scratch by the layout passes; restore the
    // root as the (only) open element.
    ctx.open_layout_element_stack.len = 1;
    ctx.open_layout_element_stack.ptr[0] = 0;

    const initial_roots_length = ctx.tree_roots.len;
    const initial_elements_length = ctx.layout_elements.len;
    const scroll_id = ElementId.named("Zlay__DebugViewOuterScrollPane");
    const dims = ctx.layout_dimensions;
    const pointer = ctx.pointer_info.position;

    // Which tree row is under the pointer?
    var scroll_y_offset: f32 = 0;
    var pointer_in_debug_view = pointer.y < dims.height - 300;
    for (ctx.scroll_containers.items()) |container| {
        if (container.element_id != scroll_id.id) continue;
        if (!ctx.external_scroll_handling_enabled) {
            scroll_y_offset = container.scroll_position.y;
        } else {
            pointer_in_debug_view = pointer.y + container.scroll_position.y < dims.height - 300;
        }
        break;
    }
    var highlighted_row: i32 = if (pointer_in_debug_view)
        @as(i32, @intFromFloat(@max(-1000000.0, @min((pointer.y - scroll_y_offset) / row_height, 1000000.0)))) - 1
    else
        -1;
    if (pointer.x < dims.width - ctx.debug_view_width) highlighted_row = -1;

    var list_result: ListResult = .{};
    ctx.element(.named("Zlay__DebugView"), .{
        .layout = .{
            .sizing = .{ .width = .fixed(ctx.debug_view_width), .height = .fixed(dims.height) },
            .direction = .top_to_bottom,
        },
        .floating = .{
            .z_index = 32765,
            .attach_points = .{ .element = .left_center, .parent = .right_center },
            .attach_to = .root,
            .clip_to = .attached_parent,
        },
        .border = .{ .color = color_3, .width = .{ .bottom = 1 } },
    }).children({
        // Title bar with close button.
        ctx.element(.auto, .{
            .layout = .{
                .sizing = .{ .width = .grow(.{}), .height = .fixed(row_height) },
                .padding = .{ .left = outer_padding, .right = outer_padding },
                .child_alignment = .{ .y = .center },
            },
            .background_color = color_2,
        }).children({
            ctx.text("zlay Debug Tools", info_text_config);
            ctx.element(.auto, .{ .layout = .{ .sizing = .{ .width = .grow(.{}) } } }).end();
            ctx.element(.auto, .{
                .layout = .{ .sizing = .fixed(row_height - 10, row_height - 10), .child_alignment = .center },
                .background_color = .rgba(217, 91, 67, 80),
                .corner_radius = .all(4),
                .border = .{ .color = .rgb(217, 91, 67), .width = thin_border },
            }).children({
                ctx.onHover(closeButtonHover, null);
                ctx.text("x", label_text_config);
            });
        });
        ctx.element(.auto, .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(1) } }, .background_color = color_3 }).end();

        // Scrollable element tree.
        ctx.open(scroll_id).config(.{
            .layout = .{ .sizing = .grow },
            .clip = .{ .horizontal = true, .vertical = true, .child_offset = ctx.scrollOffset() },
        }).children({
            const striped = ((initial_elements_length + initial_roots_length) & 1) == 0;
            ctx.element(.auto, .{
                .layout = .{ .sizing = .grow, .direction = .top_to_bottom },
                .background_color = if (striped) color_2 else color_1,
            }).children({
                const panel_contents_id = ElementId.named("Zlay__DebugViewPaneOuter");
                // The rows float above the stripes drawn below.
                ctx.element(panel_contents_id, .{
                    .layout = .{ .sizing = .grow },
                    .floating = .{
                        .z_index = 32766,
                        .pointer_capture_mode = .passthrough,
                        .attach_to = .parent,
                        .clip_to = .attached_parent,
                    },
                }).children({
                    ctx.element(.auto, .{ .layout = .{
                        .sizing = .grow,
                        .padding = .{ .left = outer_padding, .right = outer_padding },
                        .direction = .top_to_bottom,
                    } }).children({
                        list_result = renderElementsList(ctx, initial_roots_length, highlighted_row);
                    });
                });
                // Spacer as wide as the rows, so horizontal scrolling works.
                var content_width: f32 = 0;
                if (ctx.getHashMapItem(panel_contents_id.id)) |item| {
                    if (item.layout_element) |panel| content_width = panel.dimensions.width;
                }
                ctx.element(.auto, .{ .layout = .{ .sizing = .{ .width = .fixed(content_width) }, .direction = .top_to_bottom } }).end();
                // Row stripes / selection / hover highlight.
                var i: i32 = 0;
                while (i < list_result.row_count) : (i += 1) {
                    var row_color = if (@rem(i, 2) == 0) color_2 else color_1;
                    if (i == list_result.selected_element_row_index) row_color = color_selected_row;
                    if (i == highlighted_row) {
                        row_color.r *= 1.25;
                        row_color.g *= 1.25;
                        row_color.b *= 1.25;
                    }
                    ctx.element(.auto, .{
                        .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(row_height) }, .direction = .top_to_bottom },
                        .background_color = row_color,
                    }).end();
                }
            });
        });
        ctx.element(.auto, .{ .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(1) } }, .background_color = color_3 }).end();

        // Bottom panel: selected element, or warnings.
        const selected_item = ctx.getHashMapItem(ctx.debug_selected_element_id);
        if (ctx.declaredThisFrame(selected_item) and selected_item.?.layout_element != null) {
            renderSelectedElement(ctx, selected_item.?);
        } else {
            ctx.open(.named("Zlay__DebugViewWarningsScrollPane")).config(.{
                .layout = .{
                    .sizing = .{ .width = .grow(.{}), .height = .fixed(300) },
                    .child_gap = 6,
                    .direction = .top_to_bottom,
                },
                .background_color = color_2,
                .clip = .{ .horizontal = true, .vertical = true, .child_offset = ctx.scrollOffset() },
            }).children({
                ctx.element(.named("Zlay__DebugViewWarningItemHeader"), .{ .layout = .{
                    .sizing = .{ .height = .fixed(row_height) },
                    .padding = .{ .left = outer_padding, .right = outer_padding },
                    .child_gap = 8,
                    .child_alignment = .{ .y = .center },
                } }).children({
                    ctx.text("Warnings", info_text_config);
                });
                ctx.element(.named("Zlay__DebugViewWarningsTopBorder"), .{
                    .layout = .{ .sizing = .{ .width = .grow(.{}), .height = .fixed(1) } },
                    .background_color = .rgb(200, 200, 200),
                }).end();
            });
        }
    });
}
