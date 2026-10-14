# zdl

SDL functionality being converted into a native, std-only Zig library.
This is an altered SDL port, not an upstream SDL distribution.

The conversion is incomplete and nothing has been exercised at runtime yet;
everything below compiles and links. Linux is the first target.

- Core: identifiers, diagnostics, spinlocks, calendar time, geometry, typed
  properties, Unicode case folding (`zdl.casefold`).
- Audio (`zdl.audio`): sample formats, channel layouts, mixing, resampling,
  queues, pull-driven streams, WAVE decoding; ALSA, PulseAudio, PipeWire and
  JACK backends with matching Output/Input types.
- Video: pixels, colorspaces, wide/float/YUV formats, RLE, surfaces, BMP,
  JPEG/PNG (`zdl.image`), displays and window state (`zdl.video`), X11
  (`zdl.x11`) and Wayland (`zdl.wayland`) backends, EGL/OpenGL contexts and
  Vulkan surfaces (`zdl.egl`, `zdl.vulkan_surface`), the unified Linux
  platform and event pump (`zdl.linux`), app callbacks (`zdl.app`).
- Rendering: software renderer (`zdl.render`, `zdl.software`), the SDL GPU API
  on Vulkan (`zdl.gpu`) and a GPU-backed renderer (`zdl.render.gpu`).
- Input: keyboards/keymaps/state, libxkbcommon (`zdl.xkb`), events and
  mouse/touch/pen state, joysticks and gamepads with evdev and HIDAPI drivers
  (`zdl.joystick`), haptics, hidraw and sensors.
- Platform services: filesystem/storage, async I/O (`zdl.asyncio`), power
  (sysfs and UPower), locale, CPU, URLs, processes, timers, encodings
  (`zdl.system`), V4L2 cameras, D-Bus, dialogs, notifications, tray, message
  boxes.

Nothing above has been exercised at runtime yet. `docs/porting.md` lists, per
area, what is implemented, what deliberately differs from SDL and what remains.
Other platforms are deferred until Linux is complete.

Use Zig master, currently `0.18.0-dev.246+05671ced9`. A build dependency exposes
source so each consumer compiles only the declarations it uses:

```zig
const dependency = b.dependency("zdl", .{ .target = target, .optimize = optimize });
app.root_module.addImport("zdl", dependency.module("zdl"));
```

```zig
const zdl = @import("zdl");
const rect: zdl.geometry.Rect(i32) = .{
    .x = 0, .y = 0, .width = 640, .height = 480,
};
const visible = try rect.intersection(.{
    .x = 100, .y = 100, .width = 100, .height = 100,
});
_ = visible;
```

Names have no `SDL_` or `zdl_` prefixes. There is no C compatibility layer,
prelinked SDL archive, dynapi, process-global allocator or hidden initialization.
Use std directly for allocators, atomics, containers, random numbers, hashing,
sorting, strings, Unicode, OS I/O and dynamic library loading.

`zig build` and `zig build check` compile without running tests. Existing native
unit tests can be run explicitly with `zig build test`; they have not been run
as part of this compile-only conversion. Linux devices have not been exercised.

[Architecture and conventions](docs/idiomatic-zig.md) describe the target.
[Conversion ledger](docs/porting.md) maps source areas and records remaining work.
Core consumers need no OS library linkage or libc. Backends may load
established system libraries at runtime (libasound, Xlib, libwayland,
libxkbcommon, libdbus); using such a backend requires application libc linkage.
There are no third-party Zig packages.

The previous translation is available uncompressed in `.ref/translation_v1`;
original SDL is in `.ref/SDL`. Neither reference tree belongs to the native
library or its package. Existing Objective-C, Swift, C++ and shader sources are
preserved unchanged in the reference tree for their later platform work.

SDL-derived code retains the [SDL license](LICENSE.txt).

[Working guide](AGENTS.md) explains the checkout layout, references, ownership
conventions and compile-only continuation workflow.
