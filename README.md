# zdl

SDL functionality being converted into a native, std-only Zig library.
This is an altered SDL port, not an upstream SDL distribution.

The conversion is incomplete. Linux is the first target; native unit tests and
selected windowing/rendering/media paths have been exercised at runtime.

- Core: identifiers, diagnostics, spinlocks, calendar time, geometry, typed
  properties, Unicode case folding (`zdl.casefold`).
- Audio (`zdl.audio`): sample formats, channel layouts, mixing, resampling,
  queues, pull-driven streams, WAVE decoding; ALSA, PulseAudio, PipeWire and
  JACK backends with matching Output/Input types.
- Video: pixels, colorspaces, wide/float/YUV formats, RLE, surfaces, BMP,
  JPEG/PNG (`zdl.image`), displays and window state (`zdl.video`), X11
  (`zdl.x11`), Wayland (`zdl.wayland`), KMS/DRM (`zdl.kmsdrm`) and headless
  offscreen (`zdl.offscreen`) backends, EGL/OpenGL contexts and Vulkan surfaces
  (`zdl.egl`, `zdl.vulkan_surface`), the unified Linux platform/event pump
  (`zdl.linux`), app callbacks (`zdl.app`).
- Rendering: software renderer (`zdl.render`, `zdl.software`), the SDL GPU API
  on Vulkan (`zdl.gpu`) and a GPU-backed renderer (`zdl.render.gpu`).
- Input: keyboards/keymaps/state, libxkbcommon (`zdl.xkb`), events and
  mouse/touch/pen state, joysticks and gamepads with evdev and HIDAPI drivers
  (`zdl.joystick`), haptics, hidraw and sensors.
- Platform services: filesystem/storage, async I/O (`zdl.asyncio`), power
  (sysfs and UPower), locale, CPU, URLs, processes, timers, encodings
  (`zdl.system`), V4L2 cameras, D-Bus, dialogs, notifications, tray, message
  boxes.

The offscreen software framebuffer has a display-free unit test. KMS/DRM,
offscreen EGL and most device backends remain compile-checked only. Selected
Wayland/X11 application presentation and ALSA media playback have runtime checks. `docs/porting.md` lists, per area,
what is implemented, what deliberately differs from SDL and what remains. Other
platforms are deferred until Linux is complete.

Use Zig master, currently `0.18.0-dev.253+16d31ceed`. A build dependency exposes
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

`zig build` and `zig build check` compile without running tests. Run native
unit tests with `zig build test`. Selected native application presentation and
ALSA playback have runtime smoke checks; most physical device paths remain
unverified.

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

## Native application examples

[Application guide](examples/apps/README.md): `apps-dashboard` implements the
shadcn dashboard reference with zlay, Geist, FreeType/HarfBuzz and SVG icons.
`apps-player` uses the supplied VLC Figma design assets and a threaded FFmpeg
playback pipeline. Both use inlined controls and native window drag/resize on
Linux. These applications are under active refinement; exact visual/interaction
parity and Windows/macOS chrome support are not claimed.

## Architecture foundation checks

`zig build check-foundation` compiles and links small geometry-only, native PNG,
native audio-stream and libc-linked offscreen-platform consumers. It never runs
the compile-only backend consumer. `python3 tools/audit_foundation.py` builds the
profiles with explicit Zig master, runs these safe consumers and records ELF
linkage, artifact hashes and a deliberately syntactic source inventory under
`.cache/foundation`. The first three profiles must have no ELF dynamic section
or library sonames; the platform profile intentionally links libc.

`python3 tools/validate.py` includes this audit alongside the native/example/run
matrix. [Foundation implementation status](docs/foundation-status.md) separates
completed first-slice checks from the remaining ABI, lifecycle and GUI work.

With PipeWire/SPA development headers installed, `python3 tools/audit_pipewire_abi.py`
performs an optional native-header layout/constant check. Use
`python3 tools/validate.py --pipewire-headers` to include it in the full matrix.
Normal consumers and `zig build test-providers` do not require those headers.


The disposable [Pango/Cairo paragraph experiment](tools/spikes/paragraph/README.md)
is opt-in through `python3 tools/audit_paragraph_spike.py` or
`tools/validate.py --paragraph-spike`. It tests a provider-consistent CPU bitmap
route without adding a public text API or dependencies to ordinary consumers.

The experimental [retained scene foundation](docs/ui-scenes.md) is available as
`zdl.ui.Scene`: checked identities, keyed updates and retained immutable model
snapshots, with no libc or text-provider dependency. It does not yet implement
layout, widgets, input dispatch or accessibility.

Typed retained state uses `zdl.ui.with_states` with compile-time named ownership
policies. Values publish atomically with the scene and remain immutable across
retained snapshots. See [typed state contracts](docs/ui-scenes.md#typed-retained-state-channels)
and run `python3 tools/check_state_types.py` for compile-time API boundary fixtures.
The full validator includes these compile-positive/negative checks automatically.

[`zdl.text.Document`](docs/text-documents.md) provides application-owned UTF-8
edit transactions, retained snapshots and bounded grouped undo/redo without UI or
native-library dependencies. It is a document model, not yet an editable widget.

[`zdl.text.Registry`](docs/document-registrations.md) provides checked live routing
to application-owned documents. Delayed actions carry registration/revision
metadata, while immutable snapshots retain text independently of the live borrow.

The optional [editable paragraph experiment](docs/experiments/editor-paragraph.md)
connects document/registry editing to Pango hit testing, selection and CPU painting.
Run `python3 tools/audit_editor_spike.py` for offscreen Debug/ReleaseSafe evidence;
use `--editor-spike` to include it in the validator. Native input remains a
separate gate and is not certified by scripted offscreen output.

[`zdl.ui.with_semantics`](docs/ui-semantics.md) publishes semantic intent atomically
with retained scenes and validates owner-thread actions against current logical
identity, availability and document revisions. It is a semantic model, not yet a
native accessibility bridge.

The optional [pinned layout adapter experiment](docs/experiments/layout-zlay.md)
checks geometry/measurement/ownership against the examples' exact zlay source.
Run `python3 tools/audit_layout_spike.py`, or add `--layout-spike` to the full
validator. This does not add zlay to ordinary library consumers.

[`zdl.ui.action_queue`](docs/ui-actions.md) owns queued semantic payloads and tracks
one final receipt per accepted ticket. It is owner-thread delivery/backpressure,
not automatic widget execution or a thread-safe native callback queue.
[`zdl.ui.document_actions.dispatch`](docs/ui-actions.md#executing-document-commands)
executes queued semantic text/selection commands through the live scene and
registered document, returning an owning result for a separately retried refresh.

[`zdl.paint`](docs/paint-packets.md) records owned paint packets and immutable raster
leases. This is a recording foundation; native replay and renderer conformance
remain under development.
