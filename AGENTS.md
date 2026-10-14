# zdl working guide

## Objective

Port SDL behavior into an idiomatic, std-only, tree-shakable Zig library.
Complete Linux first. Other platforms follow on their machines. This is ongoing
work: a green native build does not mean all SDL functionality has been ported.

The user wants continued implementation, not a stop after each compiling piece.
Read the references, bring over a coherent subsystem, compile/link it, document
what changed and what remains, then repeat. Prefer substantial related chunks.

## References

- `.ref/SDL/`: original SDL checkout, commit
  `341496be7baf16633f1dddbca6eb3c7588b0af30`.
- `.ref/translation_v1/src/`: the prior C-shaped Zig translation, including local
  conversion work. Browse this alongside upstream source when porting.
- `.ref/translation_v1/tools/` and its build files: previous translation tooling
  and build context, not the current library build.
- `.ref/translation_v1/MANIFEST.json`: paths, hashes and former Linux build
  membership for the preserved translation snapshot (1,102 source files).

References are uncompressed ordinary folders, deliberately outside the native
package. Do not archive them again, discard unported functionality, or restore
all reference files into `src`. Objective-C, Swift, C++ and shader code remains
unchanged in the reference for later platform work.

The old translation once compiled as a full Linux library. The new native source
has less functionality; the conversion ledger must distinguish these states.

## Active layout

- `src/root.zig`: public module registered as `zdl`. Preserve this filename; the
  user renamed it from zdl.zig. It re-exports lazy native declarations.
- `src/core/`: identifiers, owned diagnostics, typed dynamic properties, hints
  (`hints.zig`, generated `hint_names.zig`) and the category logger (`log.zig`).
- `src/core/casefold.zig`: Unicode full case folding and case-insensitive UTF-8
  ordering (generated tables from SDL_casefolding.h).
- `src/input/keyboard.zig`: scancodes, keycodes, modifiers, names, default
  layout, owned Keymap and key-event keycode policy (generated enums/names).
- `src/input/keyboard_state.zig`: pressed keys, key sources, lock/modifier
  tracking, Unicode key synthesis and release iterators (no global keyboard).
- `src/input/linux_keys.zig`: evdev/XFree86/Xvnc/Darwin keycode tables and X
  keysym → scancode/keycode/UCS conversion (generated data, no Xlib/xkbcommon).
- `src/thread/`: synchronization behavior not already provided by std.
- `src/time/`: signed Gregorian date/time arithmetic and timestamp conversion.
- `src/audio/processing.zig`: sample formats, conversion, routing, mixing,
  channel-layout transformations and scalar bandlimited resampling. Related
  algorithms intentionally share one substantial file.
- `src/audio/queue.zig`: encoded chunk ownership, copied channel maps, flush/spec
  boundaries, metadata iteration and explicit past/present/future history windows.
- `src/audio/stream.zig`: comptime-layout pull-driven stream conversion over the
  queue and resampler, with explicit status, gain/map changes and flushing.
- `src/audio/wave.zig`: RIFF/WAVE parsing and supported PCM/float/companded/ADPCM
  decoding with explicit ownership and parse policies.
- `src/audio/alsa/device.zig`: optional Linux ALSA loading, enumeration,
  configuration, I/O, recovery and channel-position metadata.
- `src/video/geometry.zig`: integer/floating geometry and clipping.
- `src/video/pixels.zig`: byte/packed/indexed pixel formats and palette/color math.
- `src/video/yuv.zig`: borrowed eight-bit YCbCr planes, matrix/range encodings,
  RGB/YCbCr conversion and owned images.
- `src/video/surface.zig`: owned storage, borrowed views, fills, copying,
  conversion, scalar blitting/blending and sampling.
- `src/video/bmp.zig`: BMP decoding/encoding and owned image results.
- `src/video/x11/` (`zdl.x11`): Xlib binding (`xlib.zig`, private), windows,
  events, cursors, clipboard (INCR), XKB layouts, XIM text input, MIT-SHM
  presentation and RandR displays; requires libc.
- `src/video/wayland/` (`zdl.wayland`): libwayland-client binding (private),
  generated protocol tables, Window, cursors, clipboard, text input; requires libc.
- `src/render/software.zig`: immediate clipped primitives, colored/nearest-textured
  triangle batches, top-left coverage and explicit alias snapshots. Antialiasing
  and remaining renderer integration are pending.
- `src/platform/` (`zdl.linux`): unified Linux Platform/Window/event pump over
  the X11 and Wayland backends; requires libc.
- `src/app/` (`zdl.app`): device registries, render coordinate conversion, the
  main-callbacks loop, app metadata and the subsystem `Lifecycle`/`Services`.
- `src/io/stream.zig` (`zdl.iostream`): memory streams and endian helpers.
- `src/fs/` (`zdl.fs`): host folders, path info, directory iteration, glob,
  user-dirs parsing and Storage roots, with explicit `std.Io`/environment.
- `src/events/` (`zdl.events`): Event tagged union, caller-owned typed Queue,
  Mouse/Touches/Pens state machines.
- `src/system/` (`zdl.system`): power (sysfs and UPower), locale, cpu, url,
  process, timer Scheduler and iconv encodings.
- `src/joystick/` (`zdl.joystick`): joystick state, GUIDs, gamepad mappings
  and database, Linux evdev backend with rumble, automatic mappings, virtual
  joysticks.
- `src/joystick/hidapi/` (`zdl.joystick.hidapi`): PS4/PS5/Xbox One/Switch Pro
  HIDAPI drivers over hidraw.
- `src/messagebox/` (`zdl.messagebox`): message box data and zenity backend.
- `src/gpu/` (`zdl.gpu`): GPU API types and the Vulkan backend foundation;
  binding private in `gpu/vulkan/binding.zig`; requires libc.
- `src/video/egl/`, `src/video/vulkan_surface/` (`zdl.egl`, `zdl.vulkan_surface`):
  EGL contexts and Vulkan surfaces for X11/Wayland windows; requires libc.
- `src/video/{display,window_state,blit_yuv}.zig` (`zdl.video`): displays and
  modes, backend-independent window state, camera frame conversion,
  colorspaces/transfer functions, wide and float formats, P010 YUV and RLE.
- `src/image/` (`zdl.image`): JPEG/PNG decoding, PNG encoding, MJPG frames.
- `src/camera/` (`zdl.camera`): spec negotiation and the V4L2 backend.
- `src/input/xkb/` (`zdl.xkb`): libxkbcommon binding and SDL keymap building.
- `src/audio/device.zig` (`zdl.audio.device`): logical output over ALSA.
- `src/audio/pipewire/` (`zdl.audio.pipewire`), `src/audio/alsa/hotplug.zig`:
  PipeWire backend and ALSA hotplug; `audio.device` also has ALSA capture Input.
- `src/audio/jack/` (`zdl.audio.jack`): JACK backend with a lock-free ring.
- `src/io/async.zig` (`zdl.asyncio`): async file I/O over io_uring.
- `src/audio/pulse/` (`zdl.audio.pulse`): libpulse binding, context/hotplug,
  playback/capture streams and a matching Output; requires libc.
- `src/render/{renderer,texture,rotate,antialias}.zig` (`zdl.render`), and
  `src/render/gpu/` (`zdl.render.gpu`): GPU-backed renderer over `zdl.gpu`.
- `src/haptic/`, `src/hid/`, `src/sensor/`: evdev force feedback, hidraw and
  sensor state.
- `src/linux/dbus/` (`zdl.dbus`): libdbus binding (private `binding.zig`),
  values, messages, connections and desktop helpers; requires libc.
- `src/dialog/` (`zdl.dialog`), `src/notify/` (`zdl.notify`): portal/zenity
  file dialogs and desktop notifications over `zdl.dbus`.
- `src/tray/` (`zdl.tray`): tray model and StatusNotifierItem/dbusmenu export.
- `tools/gen/`: Python generators for every generated table (see its README);
  regenerate rather than hand-editing generated entries.
- `tools/checks/*.zig`: per-subsystem compile-only consumers called by
  `tools/compile_check.zig`; namespaces are declared inline in `src/root.zig`.
- `tools/compile_check.zig`: compile-only consumer that instantiates generic API
  bodies and links optional backend paths; do not execute it.
- `docs/idiomatic-zig.md`: architecture/conventions.
- `docs/porting.md`: source map, completed pieces, std replacements, behavior
  differences, remaining Linux functionality and verification status.
- `README.md`: package use and candid current capabilities.

Folders and nested folders are welcome when they group related responsibilities.
Large cohesive files, including several thousand lines, are acceptable. Avoid
splitting only to satisfy an arbitrary line count or preserving every C unit.

## API and code design

- Native public names have no SDL_ or zdl_ prefixes. The import namespace already
  identifies the library. Use descriptive files, PascalCase types and snake_case
  functions. Rename/reorganize code as the domain design requires.
- Use std directly for allocators, atomics, ordinary containers, hashing,
  sorting/searching, ASCII/Unicode, formatting, RNGs, clocks, OS I/O and dynamic
  loading. Remove redundant SDL façades rather than rename them into wrappers.
- **Dependency policy (user decision, 2026-10-14).** Established, high-quality
  C libraries may be used anywhere they do the job well (libasound, libX11/xcb,
  libwayland-client, libxkbcommon, libdbus-1, libpipewire, libpulse, libudev,
  the Vulkan loader, ...). Prefer runtime loading through `std.DynLib`, as SDL
  does, so applications start without optional libraries; link directly only
  when loading is impractical. Pure Zig remains the default where no such
  library clearly wins (kernel ioctl interfaces like evdev/V4L2/hidraw, sysfs,
  domain algorithms, data tables).
- C declarations (`extern`, `callconv(.c)`, C-layout records, function-pointer
  tables) stay private inside one binding file per backend. Public APIs stay
  idiomatic Zig: snake_case functions, PascalCase types, slices, optionals,
  error unions, no C pointers, out-parameters, status codes or void* userdata.
- Core modules that need no OS library stay libc-free; only applications that
  use a C-library backend need `link_libc`. Do not force libc into core users.
- No temporary ABI bridges, SDL exports/dynapi or C translation helpers between
  native modules. `.ref/translation_v1` (translate-c output) is input: port its
  behavior, and rewrite any C-shaped form idiomatically.
- Use ordinary structs, typed pointers, enums, slices, optionals and error unions.
  Widths express actual domain/serialization/OS needs rather than C aliases.
- Allocating objects receive/capture std.mem.Allocator. Document ownership,
  borrowed-result lifetime, synchronization and deinitialization. No global
  allocator hooks, hidden subsystem startup or thread-local last-error state.
- Preserve required domain behavior against upstream source. Confirm translation
  defects before correcting them. Record deliberate API/rounding/compatibility
  changes instead of pretending they are byte-exact SDL parity.

## Comments and documentation

Use `//!` module descriptions and `///` public API documentation. Regular comments,
TODOs, source-origin notes and longer reasoning comments are also encouraged.
Not every comment is documentation. Explain ownership, algorithm choices, numeric
conventions and genuine platform constraints where they matter.

Update the ledger after each coherent conversion, narrowing pending entries only
for functionality actually implemented. A std helper replacing one function does
not make the rest of its old subsystem complete.

## Build and verification

The source uses Zig master, currently `0.18.0-dev.246+05671ced9`. The shell's `zig`
may point to 0.17 because the user changes their default for other work. Invoke
master explicitly and do not change their global selection:

```sh
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build check
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build --release=safe
/home/addo/.zvm/master/zig fmt src build.zig tools/compile_check.zig
```

Do not add `-j4` or another explicit job limit: use default available threads.
Zig master APIs have changed (std.lang, @backingInt/@fromBackingInt, reflected
field_names/field_types, allocator.dupeSentinel, EnumSet.empty). Read the installed
std source before assuming an older API spelling. Zig 0.17.0 release notes:
`@intFromEnum`/`@enumFromInt` are deprecated for `@backingInt`/`@fromBackingInt`
(`@fromBackingInt(@intCast(x))` infers the backing type); `builtin.os`/`cpu`/`abi`
become `builtin.target.*`; `@bitCast` on extern types is gone; bit sets are
`std.bit_set.Static(n)` with `.empty`/`.full`; `std.builtin` is `std.lang`;
`a ** n` array repetition is removed (use `@splat`); `errdefer |err|` captures
are removed; `ArrayList.getLast` becomes `last()`. Local langrefs:
`/home/addo/.zvm/{0.17.0,master}/doc/langref.html`.

The default build compiles tests and a consumer without executing them. The user
authorized porting and running SDL automation tests and examples on 2026-10-14,
as well as parallel branch work, integration, commits and pushing this independent
repository. Run `zig build test` for integration validation and exercise relevant
examples. Keep hardware-dependent validation explicitly distinguished from unit
tests. Backend call bodies in the compile consumer are protected by the impossible
user PID zero; do not execute that consumer as a runtime smoke test.

Compile-only Xlib layout validation used both Zig guards and a C-header static
assert object under `.cache`; it did not execute native code. Core-only
consumers (no C-library backend) must compile without libc and show no ELF
dynamic section. These are build checks, not runtime correctness or parity.

If development packages become necessary, the user requested package commands
prefixed with pkexec so they can authenticate. Do not substitute sudo. Backends
load system libraries at runtime and need no development packages to build.

## Integration discipline

Inspect current files before edits: the user works in the same checkout and has
changed the public root/default compiler while work was ongoing. Preserve their
changes. The broad deleted-file Git diff reflects migration out of the product
source tree; references under `.ref` are ignored but present on disk.

No upstream SDL contribution is being made. Follow the independent port's scope
and preserve SDL's license/origin notice in this repository. The user authorized
local integration commits and GitHub pushes on 2026-10-14; sending messages to
others still requires explicit instructions.
