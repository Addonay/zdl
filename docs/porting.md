# Conversion ledger

## Reference input

Original SDL: `.ref/SDL`, commit
`341496be7baf16633f1dddbca6eb3c7588b0af30` (SDL 3.5 development).
Previous C-shaped Zig translation: `.ref/translation_v1`.

The reference contains 1,102 source files preserved before reorganization,
including local changes, non-Zig platform code, generated protocol code and
translation helpers. `MANIFEST.json` records source paths, SHA-256 hashes and
which files participated in the former Linux build. Translation tools and the
old build files are beside its `src` directory. The temporary tar snapshot was
extracted and removed; work now proceeds by browsing the ordinary reference files.

The reference trees are development input, not an alternative library build,
a compatibility layer, or part of the Zig package. The old generated Linux
build's success is historical evidence only. The native library currently has
much less functionality, explicitly listed below. Unported source was moved
out of the active tree, not declared unnecessary or completed.

## Native source map

| Native module | Reference sources | Implemented surface / decisions |
| --- | --- | --- |
| `core/guid.zig` | `SDL_guid.zig`, upstream `SDL_guid.c` | 16-byte values, strict 32-digit parsing, lowercase text, Zig `{f}` formatting. Malformed input returns errors instead of truncating or zero-filling. |
| `core/diagnostics.zig` | `core/error_state.zig`, `SDL_error.zig` | Explicit owned messages with inline storage and allocator spills. Zig formatting, borrowed slices and allocation errors. TLS error slots, error codes and C varargs are removed. |
| `thread/sync.zig` | `atomic/SDL_atomic.zig`, `atomic/SDL_spinlock.zig` | Short-section SpinLock uses std.atomic.Mutex, bounded spinning and yielding. Ordinary atomic operations use std directly. No alias types or dummy standalone barrier. |
| `time/calendar.zig` | `core/calendar.zig`, `time/SDL_time.zig` | Signed Gregorian dates, enum months, calculated weekdays, reversible date/day and timestamp conversions, checked Windows tick conversion. No C date record, redundant weekday or silent timestamp clamping. Clocks/delays use std.Io. |
| `video/geometry.zig` | `video/SDL_rect.zig`, upstream `SDL_rect_impl.h` | Integer/floating points, segments, rectangles, membership, intersection, union, point bounds, line clipping and vertical spans. Widened arithmetic, checked representation errors, explicit pixel/float edge conventions. |
| `audio/processing.zig` | `audio/SDL_audiotypecvt.zig`, `audio/SDL_mixer.zig`, `audio/SDL_audioresample.zig`, upstream C routines | Fourteen PCM representations: the legacy integer/float formats plus packed and padded signed 24-bit and G.711 A-law/mu-law. Byte order, normalization, quantization, format-correct silence, checked buffers, specs and mixing. Twelve-tap Kaiser/sinc resampling, cubic coefficient interpolation, checked explicit padding, frame counts and per-object 32:32 phase. No global initialization or device startup. |
| `audio/processing.zig` | Channel converter expressions inside `audio/SDL_audiocvt.zig`; upstream `SDL_audio_channel_converters.h` | All eight layouts and 56 distinct transformations. Original gains and expression grouping are preserved, with one checked traversal, copied input frames and safe exact in-place growth/shrink. Same-layout copy uses std.mem. |
| `audio/wave.zig` (`audio.wave`, with `audio.Wave` convenience type) | `audio/SDL_wave.zig`, upstream `SDL_wave.c` | Bounded RIFF traversal, extensible headers, explicit fact/truncation policy, PCM 8/16/24/32, IEEE f32, A-law/mu-law and Microsoft/IMA ADPCM decoding. Owned decoded buffers, borrowed source chunks. |
| `audio/queue.zig` | `audio/SDL_audioqueue.zig`, upstream `SDL_audioqueue.c` | Owned chunks and copied typed channel maps, transactional append/copy, effective-map/spec boundaries, flush/stream iteration, explicit history and checked past/present/future windows. Only real frames are consumed; flushed lookahead uses format-correct silence. No pools or void-pointer buffer callbacks. Conversion and device scheduling remain separate. |
| `audio/stream.zig` | `audio/SDL_audiocvt.zig` streaming pipeline, upstream `SDL_audiocvt.c` | Comptime source/destination layouts so only the needed channel transform instantiates. Queued source format/rate/map changes flush at boundaries; fixed destination format/rate. Pull-driven non-blocking `read_some`, explicit ready/needs-input/drained status, frame predictions with overflow errors, gain and output maps applying to subsequently processed blocks, owned-buffer transfer and transactional writes. Resampler phase persists between bounded blocks; flush drains real frames with silence lookahead. No device binding, callbacks, locks or hidden threads; scratch grows on demand and is not a realtime allocation guarantee. |
| `audio/alsa/device.zig` | `audio/alsa/SDL_alsa_audio.zig`, upstream ALSA backend and installed ALSA headers | Optional system-library loading, endpoint enumeration, playback/capture configuration with SDL-ordered closest-format fallback, actual format/rate/channel readback, partial/nonblocking I/O, waits, recovery, drain/stop and channel-position metadata. Typed logical devices reject a negotiated channel count that differs from their layout. Real OS/library ABI only; no SDL bridge or hidden thread. |
| `video/pixels.zig` | `video/SDL_pixels.zig` | Direct RGB(A) byte orders, checked packed masks, one/two/four/eight-bit indexed pixels, bit expansion, borrowed palettes/nearest-color selection and sRGB transfer. YUV/HDR/other scalar formats remain pending. |
| `video/yuv.zig` | `video/SDL_yuv.zig`, upstream `SDL_yuv.c` and yuv2rgb scalar routines | Eight-bit planar 4:2:0/4:2:2/4:4:4, NV12/NV21 and YUY2/UYVY/YVYU packed layouts as borrowed checked views with independent strides and odd extents. BT.601/BT.709 full/limited and BT.2020 NCL full matrices with the reference six-bit fixed-point coefficients. Sample reads, RGB conversion into surfaces, owned images, copies and surface-to-YUV encoding. IYUV/YV12 differ only by plane slices. No clamp table or per-format generated functions; no HDR, transfer-function, 10-bit or SIMD paths. yuv2rgb BSD notice is in `docs/licenses/yuv2rgb.txt`. |
| `video/surface.zig` | `video/SDL_surface.zig`, `video/SDL_fillrect.zig`, `video/SDL_blit_copy.zig` | Owned/borrowed raster buffers, checked stride/size/palette, pixel reads/writes, clipped scalar fills, encoded-bit-preserving copies and byte-color format conversion. No reference count or hidden palette ownership. Scalar clipped blits, custom color/alpha blend equations, modulation/color keys, safe overlap snapshots and nearest/seven-bit scalar linear scaling are implemented. GPU/SIMD paths, wide/HDR/color-managed/RLE paths remain pending. |
| `video/bmp.zig` | `video/SDL_bmp.zig`, upstream BMP loader/writer | Bounded CORE/INFO/V2-V5 parsing, palette/bitfields, top-down/bottom-up rows, RLE4/RLE8, legacy alpha policy and owned image results. V4 RGBA/sRGB encoding; file I/O stays in std. |
| `video/wayland/` (`zdl.wayland`) | upstream `SDL_waylandvideo.c`, `SDL_waylandwindow.c`, `SDL_waylandevents.c`, `SDL_waylandshmbuffer.c`; protocol XML | Private runtime-loaded libwayland-client binding; generated interface tables for xdg-shell, xdg-decoration, viewporter and fractional-scale; Window with registry/globals, xdg toplevel configure/ack state machine, maximize/fullscreen/title, double-buffered wl_shm presentation gated on buffer release, frame callbacks, integer and fractional scale, keyboard keymap bytes/keys (evdev scancodes)/modifiers/repeat and pointer events. Second pass: themed cursors through runtime-loaded libwayland-cursor (SDL system-cursor names and fallbacks, animation, scale) preferring wp_cursor_shape_v1, custom and hidden cursors; clipboard and primary selection with arbitrary MIME types and non-blocking pipe receive; text-input-v3 preedit/commit; touch; relative pointer with pointer lock; xdg-activation focus requests. Generated protocols now include data device, cursor-shape, activation, primary selection, text input, relative pointer and pointer constraints. Third pass: outputs with geometry/modes/scale/names and xdg-output logical layout (added/changed/removed events), minimize, size limits, window geometry, parenting, decoration mode, hide/show, high-resolution scroll (value120 > discrete > continuous with step accumulation), pointer warp (wp_pointer_warp_v1 or lock hint), drag-and-drop receive (MIME offers, uri-list file paths, text), xdg popups (positioner, grabs, configure/repositioned/done), XKB key-repeat flags and UTF-8. Fourth pass: drag source (an addition; this SDL snapshot has none), popup frame callbacks and fractional scale, pen tablets via tablet-v2 (proximity, tip, pressure, tilt, rotation, distance, buttons, eraser), text-input content type and surrounding text (surrounding text is an addition), single-seat release on seat or capability loss. Requires libc. Multi-seat, tool cursors, tablet pads and wheel remain. |
| `render/software.zig` | `render/software/SDL_drawpoint.zig`, `SDL_drawline.zig`, blended drawing/fill units and `SDL_triangle.zig`, upstream software renderer | Borrowed immediate draw state; clipped points, crisp Bresenham segments/polylines, filled/stroked rectangles and colored/nearest-textured triangle batches. Half-pixel fixed positions, top-left coverage, widened edge/color arithmetic, clamp/repeat sampling and one alias snapshot per batch. No registry, texture IDs or command queue. Antialiased lines, linear triangle sampling and full renderer integration remain pending. |
| `video/x11/` (`zdl.x11`) | upstream `SDL_x11video.c`, `SDL_x11window.c`, `SDL_x11events.c`, `SDL_x11keyboard.c`, `SDL_x11clipboard.c`, `SDL_x11framebuffer.c` | Private runtime-loaded Xlib binding (`xlib.zig`, LP64 records with size guards). Connections, windows (title/class/PID, min/max hints, EWMH fullscreen/maximize, minimize/restore, focus, Motif borders, show/hide/resize/move), standard and hidden cursors, typed events with key-repeat suppression and modifier reconciliation on focus, XPutImage presentation, clipboard owner/requestor (TARGETS/UTF8_STRING/STRING/TEXT, chunked reads), keyboard Layout from the core keysym table with SDL's scancode-table fingerprinting and MappingNotify rebuild. Second pass: non-fatal protocol error handler (process-wide recorder table, surfaced by `sync`), XKB per-group keymaps (Shift levels) with group tracking and rebuild on map changes, XIM/XIC committed UTF-8 text with spot placement, MIT-SHM presentation with dirty rectangles and XPutImage fallback, RandR outputs/modes/primary/refresh and mode switching with change events, INCR clipboard send and receive. Requires libc. Parity caveat: the second pass was written from the X11 headers rather than line-by-line SDL sources, so SDL parity is unverified. Third pass: _NET_WM_STATE/WM_STATE read-back with window_state_changed events, SDL's full system-cursor set with libXcursor themes and font fallback, position query, always-on-top, opacity, icon, flashing, transient parents, mouse/keyboard grabs with SDL's retry rules, pointer warp, the default-visual window `visual_id` accessor for EGL/GLX, XInput2 raw motion/touch/smooth scrolling, and SDL's core-font toolkit message box (`message_box.zig`). Fourth pass: XDND receive (Enter/Position/Leave/Drop, uri-list and text, version 5), override-redirect tooltip/menu popups, XKB levels 0-7 per group (Shift/Level3/Level5 bit convention, not full key-type walking), XIM preedit callbacks as text-editing events, XI2 pen pressure/tilt/eraser/proximity, XShape input shapes from alpha. Remaining: XDND URI-to-path conversion and streamed drops, pen tip-button/rotation/slider, visual (bounding) shapes, XI2 deferred grabs/gestures, and `zdl.linux` wiring for drops, preedit, pens and popups. |
| `core/casefold.zig` | upstream `SDL_casefolding.h`, `SDL_CaseFoldUnicode`/`SDL_strcasecmp` in `SDL_string.c` | Full Unicode case folding (1,400 single and 104 multi-codepoint mappings, unchanged data) in two sorted tables searched with `std.sort.binarySearch` instead of per-width hash buckets. Case-insensitive UTF-8 ordering/equality over folded codepoint streams. Malformed UTF-8 is an error instead of comparing as U+003F. |
| `input/keyboard.zig` | upstream `SDL_scancode.h`, `SDL_keycode.h`, `SDL_keymap.c`, key-event parts of `SDL_keyboard.c`; translation_v1 `events/SDL_keymap.zig` | Generated `Scancode` (u9) and `Keycode` (u32) non-exhaustive enums and scancode names; packed `Modifiers` with SDL bit positions; default US layout both directions (the 350-line default switch is derived from the masked keycode set, verified identical; DELETE maps to U+007F); owned `Keymap` with modifier normalization, simplest-chord reverse map, Level5 → Level3+Shift → Level3 → Shift → base fallback with and without Caps, round-robin reserved scancodes 400-499 and layout classification; key/scancode names and parsing with Shift capitalization through case folding; `EventOptions` replacing `SDL_HINT_KEYCODE_OPTIONS` (hide numpad, French numbers, Latin letters), effective keymap and event keycode policy. No current/global keymap, global name table, persistent string cache or auto-release flag: callers pass `NameContext` and buffers. |
| `input/keyboard_state.zig` | key-state parts of upstream `SDL_keyboard.c` | Explicit KeyboardState: 512-bit pressed set, per-key hardware/virtual/auto-release sources (second sources on a held key are dropped, repeats detected), Num/Caps/Scroll lock toggles and side-specific modifiers, event keycodes through the borrowed keymap and EventOptions, Alt+Tab grab-escape flag, keymap-recording presses, Unicode character synthesis with reserved-scancode assignment, hardware-activity window, auto-release and reset as release iterators. Returns transitions instead of pushing to a global event queue; caller-supplied nanosecond clock; hints become Options. Focus, text input and device registries remain. |
| `input/linux_keys.zig` | upstream `scancodes_linux.h`, `scancodes_xfree86.h`, `scancodes_darwin.h`, `SDL_scancode_tables.c`, `SDL_keysym_to_scancode.c`, `SDL_keysym_to_keycode.c`, `imKStoUCS.c` | Generated evdev/XFree86/Xvnc/Darwin keycode tables, X keysym → scancode (custom list, Latin case folding, xkbcommon evdev keysyms, evdev keysym table indexed by X keycode − 8, extended table), keysym → UCS and keysym → keycode (dead keys, extended modifier keys, default layout fallback) and Linux "Menu" scancode name override. Pure data: no Xlib/xkbcommon. Confirmed upstream defect: imKStoUCS admitted keysyms 0x58A-0x58F before its 0x590 table; they now return no character. Unicode keysyms must name scalar values. X.Org notice in `docs/licenses/imKStoUCS.txt`. |
| `fs/` (`zdl.fs`) | upstream `SDL_filesystem.c`, `unix/SDL_sysfilesystem.c`, `posix/SDL_sysfsops.c`, `storage/SDL_storage.c`, `generic/SDL_genericstorage.c` | Base/pref/user folders and cwd with explicit `std.Io` and environment, path info, recursive create, rename/copy/remove, directory iterator, native glob (case-insensitive via Unicode folding), user-dirs.dirs parser, title/user/file Storage with path validation. No caches/globals. Confirmed upstream defects fixed: empty XDG_DATA_HOME read before its buffer; case-insensitive glob sliced folded paths at unfolded offsets. Storage path validation, title read-only rules and file-storage round trips are unit-tested in a temp directory. |
| `events/` (`zdl.events`) | upstream `SDL_events.c`, `SDL_mouse.c`, `SDL_touch.c`, `SDL_pen.c`, `SDL_categories.c`, window/display/drop/clipboard event units | Tagged-union Event with SDL type values, caller-owned typed `Queue(Context)` (add/peek/get by range, filters, watchers, enable/disable, user registration, window-event superseding), Mouse (buttons, clicks, relative/integer motion, wheel), Touches (fingers, mouse emulation, pinch), Pens. Caller clock; borrowed text payloads; caller-serialized. |
| `system/` (`zdl.system`) | upstream power/linux, locale/unix, cpuinfo, misc/unix URL, process/posix, timer, stdlib/SDL_iconv.c | Power (sysfs/ACPI/APM), preferred locales, CPU/RAM/cache/SIMD info, xdg-open, process spawning with stdio modes, explicit timer Scheduler, encoding conversion with incremental Progress. Deliberate fixes: UTF-16/32 BOM byte order, unpaired-surrogate consumption, surrogate replacement. UPower/OpenURI over D-Bus pending. Unit-tested: cpu feature masks/alignment/model mapping/host query, locale normalization, process capture/stdin pipe/kill/non-blocking wait (spawns /bin/sh and /bin/cat on Linux), URL argument check (xdg-open itself is never run). |
| `camera/` (`zdl.camera`) | upstream `SDL_camera.c`, `SDL_syscamera.h`, `v4l2/SDL_camera_v4l2.c`, `linux/videodev2.h` | Camera specs, ordering, dedupe, closest-spec negotiation, timestamp rebasing; V4L2 registry/rescan over /dev/video*, format/size/interval enumeration, MMAP streaming session with nonblocking acquire/release. Byte-encoded uapi records with comptime ioctl/size checks. Upstream defect avoided: buffer sizes from a still-zeroed spec. Frame conversion, READ/USERPTR I/O and PipeWire pending. |
| `input/xkb/` (`zdl.xkb`) | libxkbcommon (runtime-loaded), upstream Wayland keymap iteration in `SDL_waylandevents.c` | Private libxkbcommon binding, keymap from text, modifiers/levels/keysyms, wl_keyboard-style state updates, per-layout `keyboard.Keymap` construction with reserved scancodes as SDL's Wayland backend. Requires libc. Compose/UTF-8 text pending. |
| `audio/device.zig` (`zdl.audio.device`) | upstream `SDL_audio.c` device semantics over the libasound backend | Comptime-layout logical Output and Input with default endpoint choice, committed device specs, bind/unbind, gain/pause, non-blocking mixing/fan-out, xrun recovery and drain/drop. ALSA's explicit `Watcher` reports endpoint/default changes; default-opened devices expose `migrate_default`, which opens the replacement first and reconfigures bound streams while preserving their queued producer audio. Callers poll and apply changes; no migration thread is hidden. A stable ALSA `default` alias can conceal a changed underlying configuration from hint re-enumeration. |
| `render/{renderer,texture,rotate,antialias}.zig`, `render/debug_font_data.zig` (`zdl.render`) | upstream `SDL_render.c`, `SDL_render_sw.c`, `SDL_render_debug_font.h`, `video/SDL_rotate.c`, `SDL_blendline.c` | Immediate Renderer over a borrowed surface view: draw state, blend modes, viewport/clip/scale, five logical presentation modes with coordinate conversion, texture targets, primitives, copy/copy_ex (rotozoom, flips)/tiled/9-grid, affine texture mapping through textured triangles, geometry, read pixels and 8x8 UTF-8 debug text with the SDL public-domain IBM VGA glyphs; Textures with streaming lock; Wu antialiased lines (opt-in, since upstream never enables AA_LINES). `debug_text_format` uses Zig's checked formatting. Upstream defect corrected: unscaled rotation center. Color scale and tiled 9-grid remain pending. |
| `haptic/`, `hid/`, `sensor/` (`zdl.haptic`, `zdl.hid`, `zdl.sensor`) | upstream `SDL_haptic.c`, `linux/SDL_syshaptic.c`, `hidapi/linux/hid.c`, `SDL_hidapi.c`, `SDL_sensor.c` | Effect model and evdev force feedback (byte-encoded ff_effect, rumble helpers); hidraw enumeration via sysfs uevents (no udev), report-descriptor usages, controller ignore filter, reads/writes/feature/input reports; sensor types/state. Upstream defects fixed: spherical direction unsigned wrap, EV_IsMouse always true, null effect dereference. HIDAPI controller drivers and joystick-haptic association pending. |
| `joystick/` (`zdl.joystick`) | upstream `SDL_joystick.c`, `SDL_gamepad.c`, `SDL_gamepad_db.h`, `controller_type.c`/`controller_list.h`, `linux/SDL_sysjoystick.c`, `core/linux/SDL_evdev_capabilities.c`, `virtual/SDL_virtualjoystick.c` | Joystick state (axes/hats/buttons/balls, initial-state rules), GUID construction/CRC16/info, controller type tables (605 generated entries), full mapping-string parser, mapping Database with SDL match order and 279 generated Linux mappings, Gamepad state through mappings with labels and guide delay, evdev backend (sysfs prefilter, capability classification, absinfo correction, input_event decoding), typed virtual joysticks. Pure Zig, no udev. Second pass: evdev rumble (FF_RUMBLE with FF_SINE fallback, effect re-upload and removal), rumble expiry/resend bookkeeping (`rumble.zig`), automatic gamepad mappings from evdev layouts with SDL's field order and quirks (`auto_mapping.zig`). Third pass: evdev `haptic_path` (the node that SDL's joystick haptic open uses, present when the node advertises an EV_FF effect SDL counts as haptic; open it with `haptic.evdev.Device.open`). Trigger rumble on evdev is `Unsupported`, which matches SDL's LINUX_JoystickRumbleTriggers. HIDAPI drivers are in `joystick/hidapi/`. Pending: joystick-model touchpad and sensor events, virtual joystick touchpads and sensors, HIDAPI joystick haptics, LEDs on evdev. |
| `linux/dbus/` (`zdl.dbus`) | upstream `core/linux/SDL_dbus.c`; libdbus-1 (runtime-loaded) | Private libdbus binding (`binding.zig`), typed Value model with encode/decode through libdbus iterators and a{sv} builder, owned Message wrapper (method call/return/error/signal), Connection to session/system bus with names, matches, send, call with timeout and error mapping, receive with deadline. Thread-free. Requires libc. `desktop.zig`: screensaver inhibit (portal or org.freedesktop.ScreenSaver, Snap-aware), simulated activity, OpenURI portal, color-scheme setting, file:// URI decoding. |
| `dialog/` (`zdl.dialog`), `notify/` (`zdl.notify`) | upstream `SDL_dialog.c`, `SDL_dialog_utils.c`, `unix/SDL_portaldialog.c`, `unix/SDL_zenitydialog.c`; org.freedesktop.Notifications | Filter validation and glob conversion; FileChooser OpenFile/SaveFile/OpenFolder requests with filters, labels, default location, multiple selection and X11/Wayland parents, Response decoding into local paths through a `Pending` object instead of a void* callback; zenity fallback through `std.Io` processes; notifications with actions, urgency, expiry and close. Requires libc (libdbus). |
| `tray/` (`zdl.tray`) | upstream `tray/unix/SDL_dbustray.c`, dbusmenu handlers in `core/linux/SDL_dbus.c`, `SDL_tray_utils.c`, `SDL_tray.h` | Owned tray/menu/entry tree with typed callbacks (buttons, checkboxes, separators, enabled, submenus, positional insert/remove, change tracking); StatusNotifierItem + com.canonical.dbusmenu served from the bus queue by object path with a caller-driven `process` (properties, icon pixmap, tooltip, clicks, layout/group properties, events, change signals). Confirmed upstream defect fixed: SDL_ListInsertAtPosition inserted one place early for positions >= 2. Icon pixmaps use the specified network-order ARGB. Flatpak naming, attention/overlay icons and watcher re-registration remain. Requires libc. |
| `video/{display,window_state,blit_yuv}.zig` (`zdl.video`) | upstream `SDL_video.c`, `SDL_sysvideo.h`, `SDL_windowevents.c`, `SDL_utils.c` (SDL_CalculateFraction) | Display/mode model with SDL mode ordering, finalization (refresh fractions), dedupe, fullscreen match and closest-mode selection, display lookup for points/rects/window positions/fullscreen windows, usable-bounds hint parsing; per-window State with SDL's flag bits, window-event dedupe, show/hide/minimize/maximize/restore pending rules, fullscreen bookkeeping, size/aspect/min/max constraints, positioning and centering, pixel-size checks; camera frame (YUY2/UYVY/YVYU/NV12/NV21/YV12/IYUV/RGBX32) conversion and nearest scaling into surfaces. Pure Zig. Upstream defect avoided: display-bounds fallback indexing displays[-1]. Grabs, popups, hit tests, safe areas, superseded-event filtering, backend wiring and MJPG remain. |
| `audio/pulse/` (`zdl.audio.pulse`) | upstream `pulseaudio/SDL_pulseaudio.c`; libpulse (runtime-loaded) | Private libpulse binding with forwarding callbacks; Context on the threaded mainloop (server defaults, sink/source enumeration, optional monitor sources and polled hotplug/default events); `(name,index)` device handles map defaults and removal notifications; playback/capture streams support U8, 16/24/24-in-32/32-bit, float, A-law and mu-law PCM, explicit buffers, non-blocking I/O, waits, drain/flush/cork and signed latency; enumerated devices report per-channel Pulse volume units, mute and latency, with explicit linear-volume setting. Default-opened logical devices expose `migrate_default`; callers poll then migrate. Requires libc. |
| `video/egl/`, `video/vulkan_surface/` (`zdl.egl`, `zdl.vulkan_surface`) | upstream `SDL_egl.c`, GL parts of `SDL_video.c`, `x11/SDL_x11opengl.c`, `wayland/SDL_waylandopengles.c`, `x11/SDL_x11vulkan.c`, `wayland/SDL_waylandvulkan.c` | Private libEGL/libwayland-egl, libGL GLX and vkGetInstanceProcAddr bindings. GL Attributes struct (SDL_GL_ResetAttributes defaults and validation), EGL display platform fallback chain, SDL config scoring, window surfaces (X11 XID or wl_egl_window with resize), contexts with sharing and SDL's attribute rules, swap interval (adaptive with swap_control_tear), extension queries; Vulkan instance extension lists and Xlib/XCB/Wayland surface creation and presentation support. Requires libc. GLX checks the ARB/EXT framebuffer-sRGB extension and config capability for requested sRGB framebuffers, and uses GLX_EXT/MESA/SGI swap control; `GlOptions.backend` selects explicitly, while automatic mode uses GLX for X11 desktop GL and EGL for Wayland/OpenGL ES. `force_egl_hint` carries SDL_VIDEO_FORCE_EGL. EGL and GLX pbuffers, XCB Vulkan surfaces and the X11 window visual-ID accessor are implemented; compile-checked only. |
| `video/offscreen/` (`zdl.offscreen`) | upstream `video/offscreen/SDL_offscreenframebuffer.c`, `SDL_offscreenwindow.c`, `SDL_offscreenopengles.c` | Owned, zero-filled BGRA8 software framebuffer with transactional resize and scalar present/format conversion; a headless `Platform` driver selected by `Driver.offscreen` or `Environment.video_driver`; optional surfaceless EGL pbuffer target with an owned GL/GLES context. Software framebuffer logic is unit-tested without a display. Deliberate difference: SDL stores XRGB8888; zdl exposes BGRA8 and uses opaque alpha. EGL runtime behavior is not validated. |
| `video/kmsdrm/` (`zdl.kmsdrm`) | upstream `video/kmsdrm/SDL_kmsdrmvideo.c`, `SDL_kmsdrmdyn.c`, `SDL_kmsdrmopengles.c`, `SDL_kmsdrmmouse.c`, `SDL_kmsdrmevents.c`, `core/linux/SDL_evdev_kbd.c` | Private runtime-loaded libdrm/libgbm bindings; connected connector/preferred-mode selection, DRM master ownership, prior CRTC restoration, GBM software scanout buffers, AddFB2, atomic modeset with legacy SetCrtc fallback, atomic/legacy page flips with completion events (an accepted flip owns its buffers until its completion is handled; a failed wait keeps them pending rather than releasing them), GBM EGL window surfaces and hardware cursor set/move/hide. Optional `/dev/tty` VT_PROCESS/signalfd handling drops DRM master and restores the old CRTC on release, then reacquires master and reapplies the selected mode. `zdl.linux` selects KMS explicitly and sends key/relative-mouse/wheel input through `input.linux_keys`, `keyboard_state` and `events.mouse` from accessible evdev nodes. EGL GBM targets detect VT-generation changes; callers recreate those surfaces after a switch. CRTC choice prefers the encoder's current CRTC and otherwise takes a compatible CRTC that no other connected output is routed to, so restoring the connector routing is complete. Mode-rate and CRTC-preference logic have unit tests; all device paths are compile-checked only. No KMS device or EGL path was runtime-validated. Absolute evdev axes/touch, hotplug and multiple connectors remain. Requires libc. |
| `platform/evdev.zig` (`zdl.linux` internal) | upstream `core/linux/SDL_evdev.c`, KMS event dispatch | Nonblocking `/dev/input/event*` scan or caller-selected paths, bounded raw event batches, key/button translation, relative axes and high-resolution wheel forwarding into the shared platform state. Each device keeps its own key/button state: SYN_DROPPED discards records up to the next SYN_REPORT and reconciles keys with EVIOCGKEY, with the differences emitted as key events. Inactive sessions discard input, and reacquisition reconciles held keys. Wheel values keep the kernel sign, as in SDL. Record framing, drop/resync, reconciliation and scroll sign are unit tested; device I/O is compile-checked only. It does not claim devices, run a polling thread or currently decode absolute axes/touch. |
| `messagebox/` (`zdl.messagebox`) | message box parts of upstream `SDL_video.c`, `dialog/unix/SDL_zenitymessagebox.c` | Message box data (SDL flag bits, button defaults, color scheme, simple box) and the zenity backend (version probe, icon option cutoff, extra buttons, 8-button limit, exit-status rules). Pure Zig. The X11-drawn box lives in `video/x11/message_box.zig` (`zdl.x11.message_box`); Wayland has none. |
| `audio/pipewire/` (`zdl.audio.pipewire`), `audio/alsa/hotplug.zig`, ALSA `device.Input` | upstream `pipewire/SDL_pipewire.c`, `alsa/SDL_alsa_audio.c` hotplug iteration | Private libpipewire-0.3 binding; pure-Zig SPA pod writer/reader parses node EnumFormat format/rate/channel choices. `Connection.node_capabilities` queries a node and keeps one alternative per EnumFormat param; typed Output/Input use the best complete spec of those alternatives before stream connect (format preference, then rate and channel distance), so a rate is never paired with a format its own param does not offer and discrete rates are not merged into a range. Connection reports default metadata and monitor-source nodes; devices expose default migration, PipeWire transport pause through `pw_stream_set_active`, and device delay (converted from the graph's `pw_time.rate` to stream frames) and queue latency in stream frames. ALSA capture `Input(layout)` has overrun recovery and an explicit hotplug Watcher; playback/capture expose explicit default migration methods. Callers poll changes and apply migrations. Requires libc. |
| `io/async.zig` (`zdl.asyncio`) | upstream `io/SDL_asyncio.c`, `io_uring/SDL_asyncio_liburing.c` (behavior), `generic/SDL_asyncio_generic.c` | AsyncFile (mode strings as an enum, statx size, read/write at offsets, close with flush), Queue generic over a caller user value with io_uring (std.os.linux.IoUring, 128 entries, linked fsync+close) or synchronous generic backend chosen explicitly, non-blocking/timed waits, signal, whole-file loads. Pure Zig. Upstream defect fixed: generic flush now reaches storage (fdatasync instead of stdio flush). No cancel API, as upstream. |
| `platform/` (`zdl.linux`) | upstream `SDL_video.c` bootstrap and window API flow, `SDL_windowevents.c`, `SDL_events.c` pumping; built on the integrated backends | `Platform` with explicit environment/driver selection (Wayland when indicated and reachable, else X11), displays, a backend-independent `Window` handle (title, show/hide, size limits, fullscreen, maximize/minimize/restore, borders, resizable, present, system cursors, text input, clipboard text), and `pump`/`wait_event` translating backend events through `window_state`, `keyboard_state` (X11 layouts or XKB keymaps, Wayland key repeat on an explicit clock), `mouse` and `touch` into the event queue. Every emitted event gets a host monotonic nanosecond timestamp; generic event payload slices are copied into platform storage and stay valid until the next pump after the queue drains. Requires libc. Second pass: X11 window-manager state read-back, SDL's full cursor set, XInput2 touch/raw motion (relative mode)/smooth scroll, grabs, warp, always-on-top, opacity, icon, flash, text-input areas, exclusive fullscreen via RandR with restore; Wayland outputs as displays (bounds, modes, scale, names), drag-and-drop file/text events, tooltip/menu popups as Windows, hide/show, warp, relative mode, layout-aware key repeat, UTF-8 key text, high-resolution wheel; drawn X11 or zenity message boxes. Protocol gaps return UnsupportedOperation (Wayland positioning, stacking, opacity, icons, flashing, global grabs, mode switching; X11 popups). Third pass: X11 XDND drops (begin/position/file/text/complete, URIs to local paths), X11 preedit text editing, X11 and Wayland pens into `events.pen` with SDL's deferred proximity-out, X11 override-redirect popups, X11 window shapes, Wayland drag source (`start_drag`, `take_drag_result`), popup scale as pixel-size events, owned signal-based quit in `wait_event`/`pump`. Fourth pass (`platform/graphics.zig`): window→graphics integration without native handles: pixel size and density, GLX/EGL desktop contexts and EGL OpenGL ES contexts (create/make-current/swap/interval/extensions/proc addresses); GLX is X11's default for desktop GL, with `GlOptions.force_egl_hint` carrying SDL_VIDEO_FORCE_EGL, Vulkan instance extensions, presentation support and surface creation (`VulkanLoader` re-exported), GPU swapchain claim/release with automatic recreation on resize; the context-free size callback is replaced by `gpu.window.SizeSource`. Wayland input shapes, pen names/enumeration and runtime validation remain. Fifth pass: headless offscreen software windows and direct KMS/DRM software scanout with GBM EGL targets, event-driven page flips and evdev key/relative-mouse/wheel input. KMS has one output/window per Platform. Absolute evdev input, VT switching, display hotplug and runtime validation remain. |
| `audio/jack/` (`zdl.audio.jack`) | upstream `jack/SDL_jackaudio.c` | Private libjack binding with callback trampolines; physical-port devices grouped by client; Output/Input mirror `audio.device` with native float32, auto-connection and per-port interleaving through an allocation-free SPSC ring. Xrun, shutdown, sample-rate, buffer-size and port-registration events are polled; owner-side `refresh` reconfigures bound streams in place and remaps ports. Stale output ring data is dropped across a server rate change. Requires libc. Upstream defects avoided: missing NULL check on `jack_port_by_name`, leaked port lists on early returns. |
| `gpu/` (`zdl.gpu`) | upstream `SDL_gpu.h`, `SDL_gpu.c`, `SDL_sysgpu.h`, `vulkan/SDL_gpu_vulkan.c` (foundations), `SDL_gpu_vulkan_vkfuncs.h` | Public GPU types (105 texture formats in SDL order, usage flags, create infos, enums) with texel/block/size/mip helpers and texture validation; private libvulkan binding with comptime size/alignment/offset assertions for all 84 C structs; Vulkan instance/extension/layer setup, SDL's physical-device ranking, logical device and queues, four-tier memory-type selection with free-list suballocation in 16 MiB blocks separated by buffer/image kind; aligned ranges coalesce on release. Resources over 2 MiB and individually mapped uniform/transfer buffers get dedicated allocations. Host-visible block pooling needs persistent whole-block mapping before it is safe. Buffers, transfer buffers, textures with per-texture layout tracking and barriers, samplers, SPIR-V shaders, command buffers with sequence fences and deferred release, swapchain create/recreate/acquire/present. Upstream behavior preserved: device ranking picks the first (not largest) device of the best class; IsIntegerFormat omits 32-bit integer formats. Second pass: graphics/compute pipelines, SDL's fixed descriptor set numbering and per-stage limits, descriptor pools, 32 KiB uniform-buffer pool with dynamic offsets, render passes with render-pass/framebuffer caches, compute and copy passes, all bind/push/draw/dispatch (incl. indirect) calls, texture copy/blit/mipmap generation, window claiming with per-surface swapchains and resize recreation, swapchain texture format, VK_EXT_debug_utils names and labels. The second-pass layout checks were likewise never committed. Requires libc. Third pass: SDL's buffer/texture/transfer-buffer cycling with per-backing reference counts and deferred releases, per-subresource (layer × mip) layout tracking with ranged barriers, resolve-compatible pipeline keys for multisampled pipelines (an MSAA pipeline in a pass without resolves is rejected), CopyPass buffer upload/download/copy with bounds and overlap checks, refcounted descriptor-set-layout and pipeline-layout caches. Compile-checked; free-list unit tests run under `zig build test`. Vulkan driver paths and MSAA resolve are untested at runtime. Moving live resources to compact fragmented blocks and 3D-texture framebuffer layers remain. |
| `video/{colorspace,pixels_wide,yuv_wide,rle}.zig` (`zdl.video`) | upstream `SDL_pixels.c` (colorspaces, transfer functions, primaries, matrices), `SDL_surface.c` (SDR white point, HDR headroom), `SDL_blit_slow.c` float path, `SDL_blit.h` 2101010 macros, `SDL_RLEaccel.c`, P010 parts of `SDL_yuv.c` | Typed Colorspace with SDL's packed encoding and predefined values; sRGB, PQ, BT.709/601 and HLG transfers; primaries conversion; Chrome/linear tone mapping; 10-bit packed, 16-bit, half-float and f32 layouts with a decode→tone-map→primaries→encode Pipeline; P010/P016 views/images; colorkey and per-pixel-alpha RLE encoding and clipped blitting. Pure Zig. Explicit little-endian RLE streams; tone-mapping parameters are options rather than surface properties. Colorspace-aware Surface conversion, wide SIMD blitters and other 10-bit YUV formats remain. |
| `joystick/hidapi/` (`zdl.joystick.hidapi`) | upstream `hidapi/SDL_hidapijoystick.c`, `SDL_hidapi_rumble.c`, `SDL_hidapi_ps4.c`, `SDL_hidapi_ps5.c`, `SDL_hidapi_xboxone.c` (USB GIP), `SDL_hidapi_switch.c` (Pro Controller) | Comptime driver registry over `hid` hidraw devices with usage filtering, 'h' GUIDs, explicit scan/update with change lists; explicit rumble queue; PS4/PS5 full input decode, calibration, enhanced mode, Bluetooth CRC effect reports, touchpads, sensors, battery, LEDs and player index; Xbox One USB GIP framing, init state machine, Elite paddles, Share, rumble and LED; Switch Pro USB handshake, subcommands, SPI calibration, full input reports, HD rumble (generated tables) and lights. Pure Zig, no threads or hints. Delays become bounded poll windows. Second pass: Xbox 360 wired and wireless receiver, Xbox One Bluetooth, Steam Controller (wired and dongle, generated constants, haptic pulses) and Steam Deck, single Joy-Cons (simple reports), DualShock 3 and ShanWan, registered in SDL's match order; Joy-Con pairing (`joycon_pair.Pair`) and the GameCube adapter (`gamecube.Adapter`) are explicit objects because the registry hosts one joystick per node. Third pass: multi-slot devices (up to 4 joysticks per node, per-slot connect/rumble/capabilities), the GameCube adapter and combined Joy-Con pairs as registry drivers, Joy-Con device info, SPI calibration, SDL's AUTO full-report choice, IMU, HD rumble and LEDs, Steam Controller over Bluetooth LE (segment reassembly, chunked and type-7 state). Joy-Con open is best effort (SDL fails on calibration errors). Fourth pass: Google Stadia over USB (rumble probe, 13 buttons), Amazon Luna over USB and Bluetooth (the Bluetooth rumble packet is used on both transports, as SDL's product-ID check does), NVIDIA SHIELD V103 and V104 (V103 touchpad, command protocol with rumble, charge and battery queries, raw effect commands) and the GameCube adapter's PC mode (EVORETRO firmware: 9-byte single-controller and 10-byte port-numbered packets, one shared motor state repeated every 16 ms). The Nintendo adapter node is ignored on hidraw, as SDL does, because SDL drives it through libusb, so only PC mode enumerates on Linux. Still missing: Joy-Con grip and wired Joy-Cons (the grip protocol), Steam Controller pairing mode and quaternion, Xbox One Bluetooth LEDs, HIDAPI joystick haptics, and SDL drivers not ported: 8BitDo, Zuiki, GameSir, Flydigi, Wii, Switch 2, Steam Hori and Triton, SInput, Lg4ff, and the Xbox 360 Big Button receiver (libusb-only in SDL). |
| `system/upower.zig` (`zdl.system.upower`) | upstream `power/linux/SDL_syspower.c` UPower functions | GetDisplayDevice then EnumerateDevices on the system bus, per-device Type/PowerSupply/IsPresent/State/Percentage/TimeToEmpty properties with Refresh, SDL's state mapping and best-battery rule into `power.Info`. Fixed stack buffers (no allocator); bus failures return null as SDL does. Requires libc (libdbus). |
| `app/` (`zdl.app`) | upstream `SDL_keyboard.c`/`SDL_mouse.c` device registries, `SDL_touch.c` naming, `SDL_render.c` coordinate conversion, `main/SDL_main_callbacks.c` | Explicit keyboard/mouse Registry returning device events (SDL_IsKeyboard/IsMouse heuristics, touch/pen pseudo-mouse names); event coordinate conversion through a renderer's logical presentation, viewport and scale; comptime `run(App)` main-callbacks loop over `zdl.linux` with SDL's result semantics and rate/wait-event pacing on an explicit clock. Requires libc (platform). Event watchers and touch device events remain. |
| `render/gpu/` (`zdl.render.gpu`) | upstream `render/gpu/SDL_render_gpu.c`, `SDL_pipeline_gpu.c`, `SDL_shaders_gpu.c`, SPIR-V shader blobs | GpuRenderer (offscreen or window-claimed) with the software Renderer's API: draw state, blend modes, viewport/clip/scale/logical presentation, targets, primitives as geometry like SDL's generic dispatch, texture copy/copy_ex/tiled/9-grid, geometry, read_pixels, present with present-mode selection; command queue flushed into GPU passes, per-flush vertex/transfer buffers, pipeline cache keyed as SDL, samplers per scale/address mode, 7 SPIR-V shaders generated by `tools/gen/render_gpu_shaders.py`. Second pass: planar YUV, NV12/NV21 and P010 textures with SDL's matrices, palette textures, color scale, SDR/HDR-extended-linear/HDR10 output composition with tonemapping through SDL's advanced shader, persistent cycled vertex and staging buffers. Requires libc. GPU APIs support native sRGB texel formats, but renderer textures retain UNORM storage because their colorspace can change. Explicit sRGB/scRGB/HDR10 encodings use shader conversion; unspecified encoding is sampled as UNORM. Colorspace-aware image views for automatic sRGB sampling remain pending. Custom render state, packed/float/I444 formats and shared palette objects remain. Compile-checked only; no GPU renderer has run on hardware. |
| `image/` (`zdl.image`) | upstream `video/SDL_stb.c`, stb JPEG/PNG, QOI/Netpbm/GIF/TGA specifications and WebP RFCs | Native JPEG baseline/progressive and NV12 camera conversion, portable vector JPEG kernels with scalar equivalence tests; PNG decoding with bounded inflate and CRC/Adler verification, encoding with configurable filters/compression; BMP, QOI, TGA, PBM/PGM/PPM and first-frame GIF/WebP loading. WebP includes VP8L lossless transforms/cache/meta codes, VP8 lossy keyframes and ALPH, with libwebp pixel fixtures. Flat `load_png`, `load_jpeg`, `load_webp`, `decode`/`decodeAs`; grouped options/limits, borrowed metadata probing, orientation/crop/resize/background/premultiplication/flip, owned surfaces and separate MJPG helpers. Animation storage/compositing helpers are integrated, but full multi-frame GIF/WebP/APNG decoders are absent: animation entry points accept still images and explicitly reject animated containers. More signatures are recognized than decoded: AVIF/JXL/SVG and other recognized formats remain unsupported. AVIF fixtures alone do not establish AVIF support. stb notice in `docs/licenses/stb_image.txt`. |
| `video/{convert,yuv_more}.zig` (`zdl.video.convert`, `zdl.video.yuv_more`) | upstream `SDL_surface.c` (ConvertPixelsAndColorspace, ConvertSurfaceAndColorspace, premultiply, clear, flip, scale), `SDL_yuv.c` YUV conversions | One `convert_pixels` over byte, wide/float and YUV formats with explicit or default colorspaces and SDR/HDR options, choosing SDL's path (row copy, 8-bit sRGB intermediate, float pipeline, YUV matrices); owned-surface conversion; premultiply (SDL's integer path for sRGB), clear, flip, scale; 8-bit YUV↔YUV repacks with SDL's chroma averaging. Pure Zig. RGB→YUV uses the float inverse matrix (about one code from SDL's integer tables); I0FL/I4FL and P016 remain. |
| `events/{timestamp,payload,event,queue,mouse,touch,pen}.zig` | upstream `SDL_events.c`, `SDL_mouse.c`, `SDL_touch.c`, `SDL_pen.c`; event-time handling in Linux input/video backends | One `events.timestamp.Timestamp`: nanoseconds on the host monotonic clock (`std.Io.Clock.awake`, CLOCK_MONOTONIC on Linux). `SourceClock` rebases evdev timeval and sensor sample clocks, preserving spacing and clamping future samples. The Linux platform replaces X11 server times and Wayland millisecond times with current monotonic time when creating `events.Event`; raw backend values remain explicitly unit-named protocol metadata. Event values own no memory. `payload.Store` copies text, drop, clipboard MIME and candidate-list slices; payloads remain valid until the producer's next pump/poll, and generic queues do not extend that lifetime. Wayland keymap event bytes are copied into the same queue-lifetime store. |
| `events/quit.zig`, watcher/lifecycle additions (`zdl.events.quit`) | upstream `SDL_events.c`, `SDL_eventwatch.c`, `SDL_quit.c`, `SDL_touch.c`, `main/SDL_main_callbacks.c` | Watchers dispatched in SDL's order (filter, then watchers, then queue) with deferred removal during dispatch; SDL_SendAppEvent-style immediate lifecycle events; signalfd-based quit requests (no C signal handler); SDL_DelTouch swap-remove; callbacks dispatch terminating/low-memory/background events immediately. Pure Zig. SDL 3 has no touch device events, so none were invented. Signals are not yet wired into `Platform.pump`. |
| `core/properties.zig` | `SDL_properties.zig`, upstream `SDL_properties.c` | Owned names/strings and typed values/resources, lookup, iteration, removal, deep clone and transactional copy. IDs/global registries, implicit conversions, hidden locks and void-pointer cleanup callbacks are removed. Resources stay borrowed from their typed owners. |
| `core/hints.zig`, `core/hint_names.zig` | upstream `SDL_hints.c`, `SDL_hints.h` | Explicit owned `Hints` table (no global property set): Default/Normal/Override priorities with SDL's set/reset rules, environment lookup through a borrowed `Environ.Map` (environment beats stored values below Override; legacy `SDL_VIDEODRIVER`/`SDL_AUDIODRIVER` aliases), `reset`/`reset_all`, boolean/integer string helpers, a `revision` counter, and intrusive `Observer`s (embedded struct + `@fieldParentPtr`, newest first, initial `(value, value)` call, removal/registration during dispatch). 277 hint names generated by `tools/gen/hint_names.py`. Unit-tested. Differences: no locks, no per-hint `void *` userdata, `set` returns an outcome enum instead of a bool plus global error, Android's special-case hook is absent. |
| `core/log.zig` | upstream `SDL_log.c` | Explicit `Logger`: categories (built-in, reserved, custom ids), priorities, per-category thresholds with SDL's defaults and `DEBUG_INVOCATION`, the full `SDL_LOGGING` grammar (priority-only form, `cat=prio` lists, `*`, numbers, prefix matching, `quiet`), settable prefixes, 256-byte stack render with allocator fallback and final-newline stripping, intrusive `Output` (stderr default and a `std.log` forwarder), `attach` to follow the hint table. Unit-tested. Differences: Zig formatting instead of printf; no locks (configure before sharing); platform outputs (Android/OutputDebugString/NSLog/console files) are not ported. |
| `app/metadata.zig` | `SDL.c` app-metadata block | Owned `Metadata` for name/version/identifier/creator/copyright/url/type with SDL's property keys, hint overrides (`SDL_APP_NAME`, `SDL_APP_ID`), executable-name and "SDL Application"/"application" defaults. Unit-tested. Ubuntu Touch fallbacks not ported. |
| `app/lifecycle.zig` | `SDL.c` Init/InitSubSystem/QuitSubSystem/WasInit/Quit, `SDL_IsMainThread` | `Lifecycle(Host)`: reference-counted subsystems over a caller-supplied `start`/`stop` host, SDL's dependency graph (video/audio/joystick/camera need events, gamepad needs joystick), start/quit order, per-call rollback on failure, force-quit-all, main/events/video thread tracking; `Services` bundles Hints + Logger + Metadata with the logger following `SDL_LOGGING`. Unit-tested against a recording host; no concrete Linux host is bundled (the application composes `linux.Platform`, audio, joystick, camera itself). |
| `app/callbacks.zig` (additions) | `main/SDL_main_callbacks.c`, `generic/SDL_sysmain_callbacks.c` | `exit_code` (SDL_EnterAppMainCallbacks status) and `Options.hints`: SDL_MAIN_CALLBACK_RATE is read from a `Hints` table at start and re-read when its revision changes, like SDL's hint callback. Pacing parsing and change detection are unit-tested; the loop itself still has no hardware-free test. |
| `io/stream.zig` (`zdl.iostream`) | `io/SDL_iostream.c` (memory and dynamic streams, endian helpers) | `Memory` (mutable and const buffers, clamped seek, short reads, full-buffer write error) and growable `Dynamic`, integer/float read/write in either byte order, `read_float`/`write_float` for `std.Io.Reader`/`Writer`. Unit-tested. File/pipe sources, `SDL_LoadFile`/`SaveFile` and `SDL_IOprintf` stay with std (`Io.File`, `Dir`, `Writer.print`). |

This table records source-level conversion, not runtime parity verification.
Audio integer encoding maps NaNs to silence and uses explicit saturation.
Integer mixing preserves the original 128-step gain scale; gain is checked in
[0, 1]. Overlaps are rejected except exact in-place mixing. No claim of SIMD
throughput or bit-for-bit exceptional-value parity has been made. WAVE parsing
uses explicit, bounded slice policies rather than process hints; RF64 and
unsupported codecs return errors. Native ALSA/X11 require their system libraries and libc
only when explicitly used. Their private C calling conventions and ABI records
mirror those real interfaces; no temporary ABI exists between native modules.
Geometry uses wider float intermediates for clipping, so bit-for-bit f32
rounding parity has not been established. Negative-span rectangles contribute
nothing. Properties return WrongType/Missing instead of coercing or inventing a
default; typed resource ownership moves to the object that owns the resource.

## Removed façades and std replacements

| Old facility | Native replacement |
| --- | --- |
| malloc/free, replaceable allocation hooks, aligned allocation | Explicit `std.mem.Allocator`; allocate/free with the real type and length. |
| Atomic integer/pointer aliases | `std.atomic.Value(T)` with the actual pointee type and memory ordering. |
| Ordinary linked lists and custom hash tables | `std.SinglyLinkedList`, `std.DoublyLinkedList`, `std.ArrayList`, std hash maps. |
| qsort/bsearch, private quicksort implementation | `std.sort` and typed slice comparators/searches. |
| memset/memcpy/memmove, byte-order helpers | `@memset`, `@memcpy`, `std.mem.copyForwards/copyBackwards`, `std.mem.readInt/writeInt`, `@byteSwap`. |
| C-format varargs, string and ASCII wrappers | `std.fmt`, `std.Io.Writer`, `std.mem`, `std.ascii`. |
| RNG globals, seeded C generators | Caller-supplied `std.Random`; choose an explicit std generator when reproducible sequences matter. No promise of the old LCG sequence. |
| Scalar libm façade, GCD, power-of-two helpers | Numeric builtins and `std.math`; domain code checks edge cases needed by its caller. |
| CRC and Murmur helper implementations | `std.hash.crc` (correct polynomial/initial-state parameters) and `std.hash.Murmur3_32`; do not change persisted hash algorithms. |
| Thread creation, TLS registries, OS locks | std thread/Io primitives and explicit object state. No new native thread façade. |
| loadso/dlopen wrapper | `std.DynLib` directly, with genuine OS/library symbol types. |
| Logging façade | `std.log.scoped` and caller-configured logging; `core/log.zig` adds SDL's category/threshold model and `SDL_LOGGING` grammar on top for code that wants it. |
| Generic percent escaping / Unicode conversion | `std.Uri` and `std.unicode`; file-URI domain rules still need porting. |

A std replacement for a façade does not automatically convert its remaining
callers. Those callers are still in the pending subsystem work below.

## Dependency policy

Established C libraries may be used where they do the job well (user decision,
2026-10-14), loaded at runtime with `std.DynLib` where practical and bound in
private files behind idiomatic Zig APIs. The ALSA (libasound) and X11 (Xlib)
backends follow this pattern. Core modules without a C-library backend remain
libc-free. Kernel interfaces (evdev, V4L2, hidraw, sysfs) are used directly.

## Pending Linux functionality

These areas are **not implemented in the native library** yet (see the source
map for what each integrated module already covers):

- Audio: runtime validation of all backends. ALSA re-enumeration cannot tell
  whether the system changed the configuration behind an unchanged `default`
  alias; callers can apply reported endpoint changes through explicit migration
  methods. JACK and sound-server events likewise require an owner call to
  `refresh` or `migrate_default`.
- Video/windowing: KMS EGL target recreation after VT switches, absolute
  evdev axes/touch and hotplug, Wayland input shapes, multi-seat and pads, X11
  XKB levels 3/5, XIM preedit, XInput2, backend accessors needed by `zdl.linux`,
  window state machine, cursors, clipboard and text input/IME on remaining
  backends; multiple KMS connectors and mode changes.
- Accelerated/SIMD blits and image decoding kernels, half-float planar YUV
  (I0FL/I4FL), P016 conversion.
- GPU live-resource memory compaction/defragmentation and 3D-texture framebuffer layers.
- HIDAPI: Joy-Con grip/wired, Steam Controller pairing mode, Switch 2 and Wii
  controllers, and the remaining third-party pads listed in the `joystick/hidapi`
  row; HIDAPI joystick haptics; virtual joystick touchpads and sensors; sensor
  backends (none exist on Linux in SDL). Evdev trigger rumble is unsupported in
  SDL as well.
- Lifecycle/hints (area narrowed): hints, logging, metadata, reference-counted
  lifecycle and memory streams are implemented and unit-tested (see source map),
  but no concrete Linux `Lifecycle` host ships, `Hints` does not yet feed other
  modules automatically (callers pass values), `SDL_assert` handler/ignore-list
  policy is not ported (std.debug.assert plus `Diagnostic`), locale-aware message
  catalogs do not exist upstream and are not provided, and other platform
  backends remain.

Objective-C, Swift, C++ and shaders are retained unchanged in the reference;
other-platform modernization remains deferred. Linux completion has not been
claimed. After each coherent conversion, update the source map and narrow the
pending entries, rather than deleting an entry because std provides one helper.

## Independent review (2026-10-14)

A read-only review by a separate model (Codex, gpt-6.1-sol) checked the C
bindings against /usr/include, concurrency/lifetimes and Vulkan synchronization
in the stable areas. It confirmed 26 bugs; the report is not in the repo.
Fixed by the coordinator: D-Bus struct/dict-entry iterator codes ('r'/'e'),
PipeWire pod size offset, U8 underrun silence, loop-name NUL overflow and
`pw_core_add_listener` return type, evdev read-write open (rumble), sparse
digital hat indices and analog hat polling, JPEG fast-AC negative values,
16-bit grey+alpha PNG transparency stride, V4L2 `v4l2_streamparm` size (204,
not 208) and its ioctl numbers. Fixed by a Codex follow-up job (then verified against the headers by a
separate reviewer): io_uring waits now use per-waiter eventfds and ppoll with a
monotonic deadline (no timer SQEs, no wakeup race, failure completions for
accepted submissions on enter errors); JACK `drop` discards through a
realtime-safe handshake instead of deactivating; Pulse SIZE_MAX sentinels and
single counting of peeked fragments; SPA enum choices list the default then
all allowed values; PipeWire finite waits use absolute deadlines with a private
SPA loop timer, single stream-callback registration and checked sync sequences;
D-Bus containers are abandoned on every error path, exit-on-disconnect is off
and libdbus threading is initialized; portal request tokens are unique and
waits keep their deadline. GPU: comptime size/alignment/offset assertions for
all 84 Vulkan C structs (which caught a wrong BufferCreateInfo size),
pipeline/sampler reference tracking, feature negotiation (depthClamp etc.),
sampled usage for read-only storage, per-mip storage writes, working copy-pass
texture copies, dynamic-state defaults and SDL's viewport orientation. Then
finished: per-command-buffer transactional layout tracking (committed on
successful submit, discarded on abort; concurrent recordings touching one
texture fail with TextureLayoutConflict) and SDL's buffer usage modes with
default-usage transitions around copies and compute writes. All review fixes are
compile-checked only; none has run on hardware.

Architecture recommendations recorded for follow-up: keep raw bindings private
(done: D-Bus, ALSA, PulseAudio, PipeWire and JACK each sit behind a
`Library` facade over a private `binding.zig`, and every backend's
`Library.open` reports a missing library or server as `error.Unavailable`);
provide platform-owned window→EGL/Vulkan integration instead of raw handles and
a context-free size callback (done, `platform/graphics.zig`); share one logical
mixing/binding layer across the four audio backends (done: `audio/logical.zig`
`Mixer`/`Fanout` own bound streams, gain, pause, mixing and capture fan-out;
backends keep transport only); define one timestamp domain and payload-lifetime
rule for event producers (done: `events.timestamp.Timestamp` uses monotonic
nanoseconds, foreign source clocks are rebased or protocol times replaced, and
borrowed event payloads are copied into producer storage through the next
pump/poll); and distinguish implemented / compile-checked / runtime-validated
in this ledger.

## Verification status

- Current native modules and compile-time generic consumers compile with Zig
  `0.18.0-dev.246+05671ced9`.
- `zig build` and `zig build test` pass at this revision. Unit tests exercise
  24-bit/G.711 encoding, ALSA default choice, PipeWire EnumFormat range parsing
  and negotiation, Pulse format IDs, JACK event coalescing, and logical mixer
  reconfiguration.
- Geometry consumer instantiates both i32 and f32 operations; properties consumer
  instantiates primitive-only and typed-resource sets.
- Integrated subsystem consumers live in `tools/checks/*.zig` and are called by
  `tools/compile_check.zig`, so `zig build` compiles and links them (never runs).
- `tools/compile_check.zig` instantiates geometry, calendar, GUID formatting, diagnostics, locks, both property configurations, all sample-format conversion pairs, all layout pairs, frame-routing/gain conversion, resampler/filter paths, WAVE codecs, pixel/surface methods, immediate software drawing and triangle meshes, encoded audio queue/history operations, every source/destination layout pair of streaming conversion, all YUV layouts and encodings, and optional ALSA/X11/GLX/EGL/XCB method bodies plus pooled GPU resource paths. The build compiles it but never runs it.
- Integrated build and test validation is recorded below; HIDAPI report/queue
  tests also passed in Debug and ReleaseSafe (24/24), using constructed reports.
  `tools/checks/hidapi4.zig` compiles new driver hooks without running devices.
- Compile-check consumers instantiate the ALSA, PulseAudio, PipeWire and JACK
  migration, volume, latency, pause, format and refresh paths; their server and
  device calls remain behind the PID-zero guard.
- The new audio negotiation, codec, event-policy and mixer-reconfiguration
  logic is unit-tested. Backend behavior remains compile-checked only; no sound
  server, ALSA PCM, PipeWire graph or JACK server was contacted.
- `zig build test` executes the display-free offscreen framebuffer and KMS mode-rate
  unit tests; no device, GUI, audio or event-loop test is part of that run.
- Offscreen software framebuffer behavior is unit-tested. Offscreen EGL, KMS/DRM,
  hardware cursors and evdev behavior remain compile-checked, not runtime-validated.
- The 17 renderer examples and three `misc` examples compile and ran for two headless frames each. BMPs were checked as 640x480 32-bit images with nonempty pixel ranges; the clear example correctly produced one uniform color per frame. The affine cube, geometry, and readback examples produced changing checksums across frames.
- The five audio examples compile. Each attempted the ALSA default route and exited successfully with `DeviceFailure` when no playback endpoint was available; no audio was played.
- No GUI window or live input event loop was exercised. The headless examples use only the software renderer and owned surfaces.
- Hardware calls in the compile consumer are guarded by the impossible user PID
  zero, so even manual execution cannot reach them. No consumer was executed.
- A GUID-only consumer compiled without libc and has no ELF dynamic section,
  confirming that optional ALSA loading does not force a core consumer dependency.
- Xlib LP64 record sizes/offsets have Zig compile-time assertions. Compiled C-header probes checked `XIGesturePinchEvent` (scale 152, delta_angle 160, flags 168, mods 172, group 188, size 208), `XIDeviceEvent` (size 200) and `XIGroupState` (16 bytes, an alias of `XIModifierState`); those records were corrected by the probes. The other XI2 records are asserted from the headers by Zig only. The XCB Vulkan surface create-info and GLX XVisualInfo layouts have Zig compile-time assertions.
- Scalar blending uses normalized factor equations; its approximate accelerated
  SDL paths and renderer-specific custom blend support are not claimed identical.
- Full native SDL parity and runtime validation remain pending.

Software drawing deliberately uses crisp lines rather than SDL's format-specific
antialiasing. Triangle vertices quantize toward zero to half pixels; texture UVs
are normalized, with nearest clamp/repeat sampling. Negative repeat coordinates
use mathematical modulo. These native contracts and general byte-color blend
equations have not been compared at runtime against SDL renderer output. Queue
windows retain encoded source bytes/maps; callers explicitly perform conversion,
resampling, synchronization and stream advancement. A failed allocation cannot
partially append a write, unlike the original chunk-by-chunk writer.

## Review fixes (2026-10-15)

Two independent reviews (GPT-6.1 Sol) were checked against the code and
`/usr/include` before fixing. All changes are compile-checked and, where the
logic is hardware-free, unit-tested. None has run on KMS, evdev, PipeWire or X11
hardware.

- KMS: an accepted page flip owns its framebuffer and buffer until its
  completion is handled. The completion record is heap-allocated because the
  kernel holds its address, and a failed wait keeps it pending instead of
  releasing the buffers. Teardown settles a pending flip first, or leaks its
  buffers when settling fails. CRTC choice prefers the encoder's current CRTC
  and otherwise takes an unused compatible one, so no other connected output is
  displaced.
- Input: VT transitions are handled before input. Input is discarded while the
  session is released, held keys and buttons are released, and reacquisition
  reconciles held keys. SYN_DROPPED discards the lost packet and resynchronizes
  keys from EVIOCGKEY. Vertical wheel values keep the kernel sign, as SDL does.
- X11: XI2 integer properties are read as packed 32-bit words; a live round trip
  through libXi confirmed the layout. `XIGesturePinchEvent` follows the header's
  field order, and `XIDeviceEvent` (200 bytes) and `XIGroupState` (16 bytes) were
  corrected. The `XEvent` union no longer embeds the oversized XI record, since
  XI events are read through their cookie data.
- PipeWire: each EnumFormat param is kept as an alternative, so rates are not
  merged into ranges and formats stay paired with their own rates. Delay is
  converted from the graph time domain to stream frames with rounding. A failed
  pen publication removes its link.
- Callbacks: a rate hint set during `App.init` is seen by the first loop
  iteration.
- Clipboard example: a failed paste keeps the previous text, which is freed
  once. Pasted text is truncated at character boundaries.

## Native applications and runtime follow-up (2026-10-15)

- `platform/hit_test.zig` and `platform/window_controls.zig`: owned drag/no-drag
  regions, resize edges, desktop button order, caption state/actions, window menu
  and custom decorations for Wayland/X11. Geometry/state tests run without a
  display. Windows/macOS integration remains pending.
- `examples/apps/ui`: zlay layout, runtime-loaded FreeType/HarfBuzz, SVG masks,
  antialiased canvas, theme tokens, focus/keyboard activation, clipping and
  frame-owned text copies. Copies fix stack-local badge text lifetime; popovers
  flip above anchors near the window bottom. No OS accessibility tree yet.
- Progressive JPEG refinement now counts EOB runs without including the current
  block twice, matching upstream stb and restoring the dashboard avatar.
- Dashboard and VLC-style player are runnable native views. Their source,
  dependencies, commands, interactions and remaining fidelity gaps are in
  `examples/apps/README.md`. No claim of exact reference parity is made.
- Media runtime probing exposed and fixed a chunk double-free during shutdown,
  pause/device state handling and seek keyframe preroll. ALSA symbol names now
  resolve their real `snd_pcm_hw_params_*` APIs, and explicit PCM pause preserves
  queued samples when supported. Unsupported hardware pause falls back to
  seeking at the frozen timestamp on resume.
- X11 smoke presentation exposed a dangling `XShmSegmentInfo` retained by XImage.
  It now has stable allocator-owned storage, with a move/retained-pointer
  regression test. SysV mapping tests use a fake X backend, not an X server.
- Debug and ReleaseSafe verification runs 250 native tests, including the SHM
  regression and a baseline/progressive JPEG equivalence fixture. Application
  tests cover toolkit clipping, chart interpolation, UTF-8 drawer edits and media
  queue/clock behavior.
  Native smoke rendering passes on Wayland and X11; H.264 and 10-bit FFV1 probes
  advance frames, freeze on pause and resume beyond a 0.5-second seek target.
  KMS/DRM, physical controllers and camera runtime remain unverified. Decoder
  layout access rejects unverified FFmpeg versions.

## Worktree integration (2026-10-15)

Committed image changes and uncommitted image, JPEG-kernel, GPU-bookkeeping and
player-library drafts were consolidated in the main working tree. Older dashboard
changes were reconciled against the newer main implementation: existing pointer
press handling, end-aligned/edge-aware popovers, full dashboard and application
build targets were retained. Original worktrees were not modified. Git history
could not be merged because this session mounts `.git` read-only; source
integration is not a merge commit. See `docs/integration-plan.md` for checks and
remaining gates.

The GPU draft adds allocation-owner tracking, container links and mapped-buffer
state. Relocation helpers were absent from the draft and now explicitly return
`UnsupportedFeature`; new allocations still fall back to a fresh memory block.
Live-resource relocation is **not implemented or hardware-validated** by this
integration. No claim of completed defragmentation is made.

Integration repairs include image API consumer migration, current Zig API/type
fixes, checked metadata chunk traversal, corrected synthetic fixtures/assertions,
RGBA resampler row indexing/vector conversion/source conversion and vertical-row
caching, image palette ownership across transformations, and player-library path
ownership across navigation. Broader correctness auditing and public API redesign
remain later stages; integration checks are not whole-library correctness proof.

### Complete target validation follow-up

`tools/validate.py` provides a reproducible native build/test/run matrix. Debug
and ReleaseSafe pass 296 native/platform tests and 24 application tests each.
Default/ReleaseFast example builds and all 29 declared run targets pass with
finite offscreen arguments; audio runs use an explicit process-local ALSA null
PCM and reject a skipped device path. The custom-titlebar example now supports
`--frames N` for offscreen automation. Native drag/resize, real audio devices,
controllers and GPU presentation are not covered by those runs.

The previously reproduced `Platform.open` duplicate destroy is fixed. Its
invalid-driver and allocation-failure regression runs in a separate libc-linked
test application, so exported core/image modules still do not require libc.
