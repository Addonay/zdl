//! Native Zig multimedia building blocks.
//!
//! Import only the declarations you need. This module has no forced imports,
//! exported C symbols, implicit initialization, global allocator or OS linkage.
//! Allocating objects receive `std.mem.Allocator` from their caller.
//!
//! SDL functionality is being converted directly into this API. See
//! `docs/porting.md` for the implemented surface and the unported subsystems.
//! Successful compilation of this surface does not mean SDL parity is complete.
//!
//! General-purpose facilities belong to std: use `std.atomic.Value`,
//! `std.Random`, `std.sort`, `std.mem`, `std.ascii`, `std.Io` and std containers
//! directly. zdl adds domain behavior rather than another naming layer for them.

/// Fixed-size identifiers with checked parsing and allocation-free formatting.
pub const Guid = @import("core/guid.zig").Guid;
/// An explicitly owned, optional human-readable diagnostic alongside Zig errors.
pub const Diagnostic = @import("core/diagnostics.zig").Diagnostic;
/// Configuration hints with priorities, environment overrides and observers
/// (explicit owned table; `hints.names` lists every documented hint).
pub const hints = @import("core/hints.zig");
/// Categorized, prioritized logging with the SDL_LOGGING grammar over a pluggable output.
pub const log = @import("core/log.zig");
/// A short-critical-section lock with bounded spinning before yielding.
pub const SpinLock = @import("thread/sync.zig").SpinLock;
/// Signed Gregorian dates and checked nanosecond timestamp conversion.
pub const time = @import("time/calendar.zig");
/// Integer pixel and floating-point coordinate geometry.
pub const geometry = @import("video/geometry.zig");

/// Unicode full case folding and case-insensitive UTF-8 ordering.
pub const casefold = @import("core/casefold.zig");
/// Scancodes, keycodes, modifiers, key names and per-layout keymaps.
pub const keyboard = @import("input/keyboard.zig");
/// Pressed-key, lock and modifier tracking producing key transitions.
pub const keyboard_state = @import("input/keyboard_state.zig");
/// Linux evdev/X keycode tables and X keysym translation (pure data).
pub const linux_keys = @import("input/linux_keys.zig");

/// Typed dynamic metadata with owned names and strings, without property IDs.
pub const Properties = @import("core/properties.zig").Properties;

/// Sample formats, scalar conversion and saturated mixing; no device startup.
pub const audio = @import("audio/processing.zig");

/// Byte/packed/indexed color representations and palettes.
pub const pixels = @import("video/pixels.zig");
/// Borrowed eight-bit YCbCr planes and owned scalar RGB/YCbCr conversion.
pub const yuv = @import("video/yuv.zig");
/// Owned raster buffers and checked borrowed views.
pub const surface = @import("video/surface.zig");

/// Immediate scalar primitives and colored/textured triangle rasterization.
pub const software = @import("render/software.zig");

/// Xlib-backed X11 windows, events, cursors, clipboard and keyboard layouts (requires libc).
pub const x11 = struct {
    pub const window = @import("video/x11/window.zig");
    pub const clipboard = @import("video/x11/clipboard.zig");
    pub const keyboard = @import("video/x11/keyboard.zig");
    pub const displays = @import("video/x11/displays.zig");
    pub const shm = @import("video/x11/shm.zig");
    pub const text_input = @import("video/x11/text_input.zig");
    pub const ewmh = @import("video/x11/ewmh.zig");
    pub const xinput = @import("video/x11/xinput.zig");
    pub const message_box = @import("video/x11/message_box.zig");
    pub const dnd = @import("video/x11/dnd.zig");
    pub const shape = @import("video/x11/shape.zig");
};

/// Host filesystem paths, metadata, directory iteration, glob and storage roots.
pub const fs = struct {
    pub const filesystem = @import("fs/filesystem.zig");
    pub const glob = @import("fs/glob.zig");
    pub const storage = @import("fs/storage.zig");
    pub const user_dirs = @import("fs/user_dirs.zig");
};

/// Event model, caller-owned event queue and mouse/touch/pen input state.
pub const events = struct {
    pub const event = @import("events/event.zig");
    pub const timestamp = @import("events/timestamp.zig");
    pub const payload = @import("events/payload.zig");
    pub const queue = @import("events/queue.zig");
    pub const mouse = @import("events/mouse.zig");
    pub const touch = @import("events/touch.zig");
    pub const pen = @import("events/pen.zig");
    pub const quit = @import("events/quit.zig");
};

/// Power, locale, CPU info, URL opening, processes, timers and text encodings.
pub const system = struct {
    pub const power = @import("system/power.zig");
    pub const locale = @import("system/locale.zig");
    pub const cpu = @import("system/cpu.zig");
    pub const url = @import("system/url.zig");
    pub const process = @import("system/process.zig");
    pub const timer = @import("system/timer.zig");
    pub const iconv = @import("system/iconv.zig");
    pub const upower = @import("system/upower.zig");
};

/// Camera specs and negotiation with a Linux V4L2 capture backend.
pub const camera = struct {
    pub const camera = @import("camera/camera.zig");
    pub const v4l2 = @import("camera/v4l2.zig");
};

/// libxkbcommon-backed XKB keymaps, keyboard state and SDL keymap construction (requires libc).
pub const xkb = struct {
    pub const library = @import("input/xkb/library.zig");
    pub const keymap = @import("input/xkb/keymap.zig");
    pub const state = @import("input/xkb/state.zig");
    pub const sdl_keymap = @import("input/xkb/sdl_keymap.zig");
};

/// Immediate software renderer, textures, rotation and antialiased lines.
pub const render = struct {
    pub const renderer = @import("render/renderer.zig");
    pub const texture = @import("render/texture.zig");
    pub const rotate = @import("render/rotate.zig");
    pub const antialias = @import("render/antialias.zig");
    /// GPU-backed renderer over zdl.gpu with SDL's precompiled SPIR-V shaders,
    /// pipeline cache and command batching (requires libc).
    pub const gpu = struct {
        pub const renderer = @import("render/gpu/renderer.zig");
        pub const texture = @import("render/gpu/texture.zig");
        pub const pipeline_cache = @import("render/gpu/pipeline_cache.zig");
        pub const shaders = @import("render/gpu/shaders.zig");
        pub const layout = @import("render/gpu/layout.zig");
        pub const color = @import("render/gpu/color.zig");
    };
};

/// Force-feedback effects with a Linux evdev backend.
pub const haptic = struct {
    pub const effect = @import("haptic/effect.zig");
    pub const evdev = @import("haptic/evdev.zig");
};

/// HID report descriptors, controller filtering and Linux hidraw devices.
pub const hid = struct {
    pub const report_descriptor = @import("hid/report_descriptor.zig");
    pub const filter = @import("hid/filter.zig");
    pub const sysfs = @import("hid/sysfs.zig");
    pub const hidraw = @import("hid/hidraw.zig");
};

/// Sensor types, standard gravity and per-sensor state.
pub const sensor = struct {
    pub const sensor = @import("sensor/sensor.zig");
};

/// Joystick state, GUIDs, gamepad mappings/database and the Linux evdev backend.
pub const joystick = struct {
    pub const joystick = @import("joystick/joystick.zig");
    pub const gamepad = @import("joystick/gamepad.zig");
    pub const linux_evdev = @import("joystick/linux_evdev.zig");
    pub const virtual = @import("joystick/virtual.zig");
    pub const rumble = @import("joystick/rumble.zig");
    pub const auto_mapping = @import("joystick/auto_mapping.zig");
    /// HIDAPI controller drivers over hidraw: PS4, PS5, Xbox One (USB) and
    /// Switch Pro, with a driver registry, rumble queue and typed device state.
    pub const hidapi = struct {
        pub const common = @import("joystick/hidapi/common.zig");
        pub const rumble = @import("joystick/hidapi/rumble.zig");
        pub const device = @import("joystick/hidapi/device.zig");
        pub const registry = @import("joystick/hidapi/registry.zig");
        pub const ps4 = @import("joystick/hidapi/ps4.zig");
        pub const ps5 = @import("joystick/hidapi/ps5.zig");
        pub const xboxone = @import("joystick/hidapi/xboxone.zig");
        pub const switch_pro = @import("joystick/hidapi/switch_pro.zig");
        pub const xbox360 = @import("joystick/hidapi/xbox360.zig");
        pub const xbox360w = @import("joystick/hidapi/xbox360w.zig");
        pub const xboxone_bt = @import("joystick/hidapi/xboxone_bt.zig");
        pub const steam = @import("joystick/hidapi/steam.zig");
        pub const steam_constants = @import("joystick/hidapi/steam_constants.zig");
        pub const steamdeck = @import("joystick/hidapi/steamdeck.zig");
        pub const joycon = @import("joystick/hidapi/joycon.zig");
        pub const joycon_pair = @import("joystick/hidapi/joycon_pair.zig");
        pub const ps3 = @import("joystick/hidapi/ps3.zig");
        pub const gamecube = @import("joystick/hidapi/gamecube.zig");
        pub const luna = @import("joystick/hidapi/luna.zig");
        pub const stadia = @import("joystick/hidapi/stadia.zig");
        pub const shield = @import("joystick/hidapi/shield.zig");
    };
};

/// Wayland toplevel windows, shm presentation and input events over libwayland-client (requires libc).
pub const wayland = struct {
    pub const window = @import("video/wayland/window.zig");
    pub const cursor = @import("video/wayland/cursor.zig");
    pub const clipboard = @import("video/wayland/clipboard.zig");
    pub const text_input = @import("video/wayland/text_input.zig");
    pub const shm = @import("video/wayland/shm.zig");
    pub const dnd = @import("video/wayland/dnd.zig");
    pub const tablet = @import("video/wayland/tablet.zig");
};

/// libdbus-1 binding: connections, typed message values, calls, matches and signals (requires libc).
pub const dbus = struct {
    pub const value = @import("linux/dbus/value.zig");
    pub const message = @import("linux/dbus/message.zig");
    pub const connection = @import("linux/dbus/connection.zig");
    pub const desktop = @import("linux/dbus/desktop.zig");
};

/// File and folder dialogs: filter validation, xdg-desktop-portal FileChooser
/// over D-Bus and a zenity fallback.
pub const dialog = struct {
    pub const dialog = @import("dialog/dialog.zig");
    pub const portal = @import("dialog/portal.zig");
    pub const zenity = @import("dialog/zenity.zig");
};

/// Desktop notifications over org.freedesktop.Notifications.
pub const notify = struct {
    pub const notify = @import("notify/notify.zig");
};

/// System tray icon and menu model, exported as a StatusNotifierItem with a
/// dbusmenu over zdl.dbus (requires libc).
pub const tray = struct {
    pub const model = @import("tray/model.zig");
    pub const sni = @import("tray/sni.zig");
};

/// Backend-independent displays and modes, window state machine and camera frame conversion.
pub const video = struct {
    pub const display = @import("video/display.zig");
    pub const window_state = @import("video/window_state.zig");
    pub const blit_yuv = @import("video/blit_yuv.zig");
    pub const colorspace = @import("video/colorspace.zig");
    pub const pixels_wide = @import("video/pixels_wide.zig");
    pub const yuv_wide = @import("video/yuv_wide.zig");
    pub const rle = @import("video/rle.zig");
    pub const convert = @import("video/convert.zig");
    pub const yuv_more = @import("video/yuv_more.zig");
};

/// Headless windows and software framebuffers; this module does not load a
/// display server or a C library.
pub const offscreen = struct {
    pub const framebuffer = @import("video/offscreen/framebuffer.zig");
    pub const egl = @import("video/offscreen/egl.zig");
    pub const Framebuffer = framebuffer.Framebuffer;
    pub const EglTarget = @import("video/offscreen/egl.zig").Target;
};

/// Linux DRM/KMS connector selection, GBM scanout, page flips and hardware cursor.
/// Open only on an explicitly selected direct-display backend; requires libc.
pub const kmsdrm = struct {
    pub const device = @import("video/kmsdrm/device.zig");
    pub const Device = device.Device;
    pub const Options = device.Options;
    pub const Mode = device.Mode;
    pub const GbmWindow = device.GbmWindow;
};

/// OpenGL contexts over runtime-loaded GLX or EGL, and OpenGL ES over EGL;
/// config selection, window/pbuffer surfaces and swap control (requires libc).
pub const egl = struct {
    pub const attributes = @import("video/egl/attributes.zig");
    pub const display = @import("video/egl/display.zig");
    pub const surface = @import("video/egl/surface.zig");
    pub const pbuffer = @import("video/egl/pbuffer.zig");
    pub const context = @import("video/egl/context.zig");
    pub const glx = @import("video/egl/glx.zig");
};

/// Vulkan instance extensions and VkSurfaceKHR creation for X11 and Wayland
/// windows (requires libc).
pub const vulkan_surface = struct {
    pub const surface = @import("video/vulkan_surface/surface.zig");
    pub const extensions = @import("video/vulkan_surface/extensions.zig");
};

/// Message box data model and the zenity process backend.
pub const messagebox = struct {
    pub const message_box = @import("messagebox/message_box.zig");
    pub const zenity = @import("messagebox/zenity.zig");
};

/// In-memory seekable streams and endian-aware scalar read/write helpers.
pub const iostream = @import("io/stream.zig");

/// Asynchronous file reads, writes, closes and whole-file loads with a
/// caller-typed completion queue over io_uring or a synchronous fallback.
pub const asyncio = @import("io/async.zig");

/// Unified Linux platform: Wayland/X11 backend selection, windows, displays,
/// clipboard and an event pump feeding `events`, keyboard and window state
/// (requires libc for the backends it loads).
pub const linux = @import("platform/linux.zig");

/// SDL GPU API types and validation with a Vulkan backend foundation
/// (instance/device selection, memory, buffers, textures, samplers, shaders,
/// command submission, swapchains). Requires libc.
pub const gpu = struct {
    pub const types = @import("gpu/types.zig");
    pub const device = @import("gpu/vulkan/device.zig");
    pub const tables = @import("gpu/vulkan/tables.zig");
    pub const descriptors = @import("gpu/vulkan/descriptors.zig");
    pub const pipeline = @import("gpu/vulkan/pipeline.zig");
    pub const pass = @import("gpu/vulkan/pass.zig");
    pub const window = @import("gpu/vulkan/window.zig");
    pub const debug = @import("gpu/vulkan/debug.zig");
};

/// Device registries, render coordinate conversion and SDL's main-callbacks loop over zdl.linux (requires libc).
pub const app = struct {
    pub const devices = @import("app/devices.zig");
    pub const render_coordinates = @import("app/render_coordinates.zig");
    pub const callbacks = @import("app/callbacks.zig");
    /// Application name/version/identifier metadata (SDL_SetAppMetadata).
    pub const metadata = @import("app/metadata.zig");
    /// Reference-counted subsystem lifecycle (SDL_Init/Quit semantics) and core services.
    pub const lifecycle = @import("app/lifecycle.zig");
};

/// JPEG and PNG decoding (stb_image behavior), PNG encoding and MJPG camera frame conversion. Pure Zig.
pub const image = struct {
    pub const jpeg = @import("image/jpeg.zig");
    pub const png = @import("image/png.zig");
    pub const load = @import("image/load.zig");
};

test {
    reference_namespaces(@This(), 4);
    _ = @import("tests.zig");
}

/// `std.testing.refAllDecls` is not recursive, so files re-exported through
/// namespace structs (`app.lifecycle`, `audio.pulse.context`, ...) would never
/// have their tests collected. Recurse only into field-less structs; any
/// referenced file is analyzed, which is what collects its `test` blocks.
fn reference_namespaces(comptime T: type, comptime depth: comptime_int) void {
    const std = @import("std");
    inline for (comptime std.meta.declarations(T)) |name| {
        const value = &@field(T, name);
        if (depth > 0 and @TypeOf(value.*) == type) {
            const Child = value.*;
            if (@typeInfo(Child) == .@"struct" and @typeInfo(Child).@"struct".field_names.len == 0)
                reference_namespaces(Child, depth - 1);
        }
    }
}

// The X11 and Wayland backends sit behind namespaces that refAllDecls does not
// enter; naming their files pulls in the tests that need no display.
test "windowing backend unit tests" {
    _ = @import("video/x11/shape.zig");
    _ = @import("video/x11/keyboard.zig");
    _ = @import("video/x11/dnd.zig");
    _ = @import("video/x11/xinput.zig");
}

test "HIDAPI driver unit tests" {
    _ = @import("joystick/hidapi/gamecube.zig");
    _ = @import("joystick/hidapi/stadia.zig");
    _ = @import("joystick/hidapi/luna.zig");
    _ = @import("joystick/hidapi/shield.zig");
}

test "Linux input and KMS unit tests" {
    _ = @import("platform/evdev.zig");
    _ = @import("video/kmsdrm/device.zig");
    _ = @import("platform/linux.zig");
}
