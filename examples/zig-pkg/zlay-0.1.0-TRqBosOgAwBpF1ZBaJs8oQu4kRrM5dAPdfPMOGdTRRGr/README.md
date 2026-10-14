# zlay

A UI layout library for Zig, ported from [Clay](https://github.com/nicbarker/clay) (v0.14).

- **No dependencies.** The library doesn't import `std` (or `builtin`), so it builds for any target, including `wasm32-freestanding`.
- **No allocations.** You pass `Context.init` one block of memory and everything lives inside it.
- **Clay's layout engine.** Flex-box-like sizing (fit / grow / percent / fixed, min / max), padding, gaps, alignment, word wrapping with a measurement cache, aspect ratio, floating elements, clipping and scroll containers with momentum, borders, color overlays, enter / exit / move transitions, and Clay's interactive debug view.
- **Renderer agnostic.** The output is a sorted list of render commands (rectangles, borders, text lines, images, scissor regions...) that you draw however you like.

Requires **Zig 0.17.0**.

## Install

```sh
zig fetch --save git+https://<where-you-host-zlay>
```

```zig
// build.zig
const zlay = b.dependency("zlay", .{ .target = target, .optimize = optimize });
exe.root_module.addImport("zlay", zlay.module("zlay"));
```

Or just copy `src/` into your project and `@import("zlay/zlay.zig")`.

## Usage

```zig
const zlay = @import("zlay");

// zlay doesn't know about fonts: tell it how big a piece of text is.
fn measureText(text: []const u8, config: *const zlay.TextConfig, user_data: ?*anyopaque) zlay.Dimensions {
    const font: *MyFont = @ptrCast(@alignCast(user_data));
    return font.measure(text, config.font_size, config.letter_spacing);
}

// Once:
const options: zlay.Options = .{
    .layout_dimensions = .init(1280, 720),
    .measure_text = measureText,
    .measure_text_user_data = &my_font,
    .error_handler = .{ .function = logZlayError },
};
const memory = try gpa.alloc(u8, zlay.minMemorySize(options)); // ~5.5 MiB for the defaults
const ui = try zlay.Context.init(memory, options);

// Every frame:
ui.setLayoutDimensions(.init(window_width, window_height));
ui.setPointerState(.init(mouse_x, mouse_y), mouse_down);
ui.updateScrollContainers(true, .init(wheel_x, wheel_y), dt);

ui.beginLayout();
ui.open(.named("Sidebar")).config(.{
    .layout = .{
        .sizing = .{ .width = .fixed(300), .height = .grow(.{}) },
        .padding = .all(16),
        .child_gap = 8,
        .direction = .top_to_bottom,
    },
    .background_color = .rgb(30, 30, 36),
}).children({
    for (items, 0..) |item, i| {
        ui.open(.indexed("Item", @intCast(i))).config(.{
            .layout = .{ .sizing = .{ .width = .grow(.{}) }, .padding = .axes(12, 8) },
            .background_color = if (ui.hovered()) .rgb(60, 60, 80) else .rgb(45, 45, 55),
            .corner_radius = .all(6),
        }).children({
            ui.text(item.name, .{ .font_size = 16, .color = .white });
        });
    }
});
const commands = ui.endLayout(dt);

for (commands) |cmd| switch (cmd.data) {
    .rectangle => |r| drawRect(cmd.bounding_box, r.color, r.corner_radius),
    .border => |b| drawBorder(cmd.bounding_box, b.color, b.width, b.corner_radius),
    .text => |t| drawText(t.text, cmd.bounding_box, t.font_id, t.font_size, t.color),
    .image => |img| drawImage(img.image_data, cmd.bounding_box),
    .scissor_start => beginScissor(cmd.bounding_box),
    .scissor_end => endScissor(),
    else => {},
};
```

`zig build example` runs `examples/print_commands.zig`, a complete program that prints the commands of a typical app layout.

### Video demo (raylib)

`examples/video-demo/` rebuilds the demo from Nic Barker's "Introducing Clay" video with zlay and [raylib-zig](https://github.com/raylib-zig/raylib-zig): a header with a hover dropdown, a clickable sidebar and a scrolling document view. Press `D` to toggle the debug view.

```sh
cd examples/video-demo
zig build run
```

It is a separate package, so only the demo depends on raylib. `src/renderer.zig` is a port of Clay's raylib renderer and works as a starting point for any zlay + raylib app.

### Declaring elements

Clay uses a `for`-loop macro, `CLAY(id, { config }) { children }`. zlay uses a small builder that reads almost the same:

| Clay | zlay |
| --- | --- |
| `CLAY(CLAY_ID("X"), { ... }) { ... }` | `ui.open(.named("X")).config(.{ ... }).children({ ... });` |
| `CLAY_AUTO_ID({ ... }) {}` | `ui.open(.auto).config(.{ ... }).end();` |
| `CLAY_TEXT(CLAY_STRING("hi"), CLAY_TEXT_CONFIG({ ... }))` | `ui.text("hi", .{ ... });` |
| `CLAY_IDI("Item", i)` | `.indexed("Item", i)` |
| `CLAY_ID_LOCAL("x")` / `CLAY_IDI_LOCAL` | `ui.localId("x")` / `ui.localIdIndexed("x", i)` |
| `Clay_GetElementId(str)` | `zlay.ElementId.named(str)` |

`ui.open(id)` opens the element *before* `.config(...)`'s argument is evaluated, so `ui.hovered()` and `ui.scrollOffset()` inside the declaration refer to the element being declared, exactly like in Clay. The `{ ... }` block passed to `.children` is evaluated before `children` runs, which is what closes the element after its children.

`ui.element(id, decl)` is a shorthand for `open(id).config(decl)`. Because the declaration is evaluated before the element opens, `hovered()` / `scrollOffset()` inside it refer to the *parent*. Use it for elements that don't depend on themselves.

The low-level calls are public too: `openElement(id)`, `configureOpenElement(decl)`, `closeElement()`, which pair nicely with `defer` if you prefer:

```zig
{
    ui.openElement(.named("Panel"));
    ui.configureOpenElement(.{ .background_color = .rgb(20, 20, 20) });
    defer ui.closeElement();
    ui.text("inside", .{});
}
```

Components are plain functions taking `*zlay.Context`.

### Sizing

```zig
.sizing = .{ .width = .grow(.{}), .height = .fixed(48) }
.sizing = .{ .width = .fit(.{ .min = 100, .max = 400 }) }
.sizing = .{ .width = .percent(0.5) }   // 0..1 of the parent
.sizing = .grow                          // grow on both axes
.sizing = .fixed(32, 32)
```

### Scrolling

```zig
ui.open(.named("List")).config(.{
    .layout = .{ .sizing = .grow, .direction = .top_to_bottom },
    .clip = .{ .vertical = true, .child_offset = ui.scrollOffset() },
}).children({ ... });
```

`updateScrollContainers` handles the mouse wheel, touch / click dragging (with momentum) and clamping. `ui.scrollContainerData(id)` exposes the live scroll position (writable) and content size, for custom scroll bars or "scroll to".

### Floating elements

```zig
.floating = .{
    .attach_to = .parent,                 // or .element_with_id / .root
    .attach_points = .{ .element = .center_top, .parent = .center_bottom },
    .offset = .{ .y = 4 },
    .z_index = 10,
    .pointer_capture_mode = .capture,     // or .passthrough
},
```

### Transitions

```zig
.transition = .{
    .handler = zlay.transitions.easeOut,  // or linear, or your own
    .duration = 0.3,
    .properties = zlay.TransitionProperties.bounding_box.merge(.{ .background_color = true }),
    .enter = .{ .set_initial_state = slideInFromLeft },
    .exit = .{ .set_final_state = fadeOut },
},
```

A handler is `fn (zlay.TransitionArgs) bool`: write the interpolated state to `args.current` and return true when finished. `zlay.transitions.interpolate` / `progress` are the building blocks.

### Pointer & queries

- `ui.hovered()`: is the pointer over the element being declared?
- `ui.onHover(callback, user_data)`: called from `setPointerState` while hovered.
- `ui.pointerOver(id)`, `ui.pointerOverIds()`
- `ui.elementData(id)`: bounding box from the last layout, or `null`.
- `ui.pointerState()`: `.pressed_this_frame`, `.pressed`, `.released_this_frame`, `.released`.

### Debug view

`ui.setDebugModeEnabled(true)` adds Clay's inspector on the right: the element tree (collapsible), highlighting on hover, and full configuration of the clicked element. It uses `font_id = 0, font_size = 16`.

### Errors

zlay never fails a frame. Problems (duplicate ids, capacity exceeded, missing measure function, percent > 1, unbalanced open / close...) are reported through `Options.error_handler` and layout continues as well as it can.

## Differences from Clay

The layout algorithm is a line-by-line port. A differential test (the same layouts built with `clay.h` and zlay) produces **identical render commands**, except in the transition case caused by the Clay bug listed below. The deliberate changes are:

**API**
- No global "current context". Everything goes through a `*Context`, so multiple contexts (windows, threads) are trivial.
- `Context.init(buffer, options)` replaces `Clay_MinMemorySize` / `Clay_CreateArenaWithCapacityAndMemory` / `Clay_Initialize` / the global `Clay_SetMax*` functions, and returns `error.OutOfMemory` instead of `NULL`. Scroll container and transition capacities (hard-coded 100 / 200 in Clay) are options.
- Render commands are a tagged union (`cmd.data`), lookups return optionals (`elementData`, `scrollContainerData`) instead of a `found` flag, and the measure function receives a plain `[]const u8`.
- The text measurement cache always hashes text contents. Clay hashes the pointer for `CLAY_STRING` literals, but a Zig slice carries no lifetime information.
- Hover callbacks also receive the `*Context`.
- `setExternalScrollHandling(fn, user_data)` combines `Clay_SetQueryScrollOffsetFunction` and `Clay_SetExternalScrollHandlingEnabled`.
- Additions: `scrollOffsetOf(id)`, `transitions.linear`, `default_memory_size` (comptime), `renderCommands()`.

**Behavior fixes** (Clay quirks that zlay doesn't reproduce)
- The pointer state advances *before* hover callbacks run, so a callback sees `pressed_this_frame` on the frame of the click rather than one frame late. The initial state is `.released`; Clay starts as "pressed this frame".
- When an exit transition finishes, Clay's swap-remove skips the next transition for one frame, which causes a visible one-frame jump. zlay doesn't skip it. The same skip is fixed in scroll container cleanup.
- An element that ignores the pointer while transitioning only hides its own subtree. In Clay it hid every element visited after it.
- Elements that are both floating and clipping pop the clip stack twice (they pushed twice).
- Wrapping a newline right after an oversized word could produce a line of length -1.
- Unbalanced `open` / `close` is reported and then repaired. In Clay it reads an uninitialized children pointer.
- The id hash map reuses freed slots before declaring itself full.
- Exit-transition snapshots are bounds-checked against the live element data.
- Border and scissor commands carry the tree's `z_index`, and scissor commands for floating elements carry the clip flags.

## Extending zlay

The code is split by concern, and every file starts with a comment explaining its role:

| File | Contents |
| --- | --- |
| `src/zlay.zig` | Public surface (re-exports) |
| `src/types.zig` | Geometry, colors, ids, pointer types |
| `src/config.zig` | `ElementDeclaration` and every config struct |
| `src/render.zig` | Render command types |
| `src/Context.zig` | Context, memory layout, frame lifecycle, element declaration, queries |
| `src/layout.zig` | Sizing / positioning passes and render command emission |
| `src/text.zig` | Word measurement cache and wrapping |
| `src/interaction.zig` | Pointer hit testing, scroll containers |
| `src/transition.zig` | Transitions |
| `src/debug.zig` | Debug view |
| `src/memory.zig`, `src/hash.zig` | Arena / fixed-capacity lists, hashing |

Common extensions:
- **A new element feature** (say, a drop shadow): add a field with a default to `ElementDeclaration` in `config.zig`. If it affects size, handle it in `Context.closeElement` (fit size) and/or `layout.zig`. If it draws something, add a variant to `RenderData` / `RenderCommandType` in `render.zig` and emit it in `layout.emitOpeningCommands` or `emitClosingCommands`. Renderers using `else => {}` keep compiling.
- **A new sizing mode**: add a `SizingAxis.Kind` and handle it in `layout.sizeContainersAlongAxis`. The compiler points you at every `switch` that needs updating.
- **A new transition curve**: write a `fn (zlay.TransitionArgs) bool` using `zlay.transitions.interpolate`.
- **A new animatable property**: add it to `TransitionProperties`, `TransitionData`, `transition.interpolate`, `detectChanges` and `applyTransitionedProperties`.
- **Per-frame state**: add a `List` field to `Context` and allocate it in `allocEphemeral` (rebuilt every frame) or `allocPersistent` (kept). `minMemorySize` accounts for it automatically.

## Building & testing

```sh
zig build test                 # behavioral tests (25)
zig build example              # prints render commands of a demo layout
zig build bench                # repeated head-to-head CPU benchmarks against clay.h
zig build bench-test           # benchmark statistics, ABI, and fixture tests
zig build check-freestanding   # builds every code path for wasm32-freestanding (no std, no libc)
```

The headless benchmark suite defaults to ReleaseFast for both engines and reports
mean timings, variability, relative speed, work counters, and arena memory.
See [bench/README.md](bench/README.md) for coverage, methodology, and controls.

## License

zlib, same as Clay. zlay is an altered version of Clay by Nic Barker; see `LICENSE`.
