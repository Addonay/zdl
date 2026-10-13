// /*
//   Simple DirectMedia Layer
//   Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
// 
//   This software is provided 'as-is', without any express or implied
//   warranty.  In no event will the authors be held liable for any damages
//   arising from the use of this software.
// 
//   Permission is granted to anyone to use this software for any purpose,
//   including commercial applications, and to alter it and redistribute it
//   freely, subject to the following restrictions:
// 
//   1. The origin of this software must not be misrepresented; you must not
//      claim that you wrote the original software. If you use this software
//      in a product, an acknowledgment in the product documentation would be
//      appreciated but is not required.
//   2. Altered source versions must be plainly marked as such, and must not be
//      misrepresented as being the original software.
//   3. This notice may not be removed or altered from any source distribution.
// */
// SDL implementation ported to Zig; generated scaffolding removed.
pub const __builtin = @import("translation_builtins");
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub const __builtin_va_list = [1]struct___va_list_tag_2;
pub const va_list = __builtin_va_list;
pub const struct__IO_FILE = opaque {
};
pub const FILE = struct__IO_FILE;
pub extern var stdin: ?*FILE;
pub extern var stderr: ?*FILE;
pub extern fn fflush(__stream: ?*FILE) c_int;
pub extern fn fprintf(noalias __stream: ?*FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn fgets(noalias __s: [*c]u8, __n: c_int, noalias __stream: ?*FILE) [*c]u8;
pub extern fn abort() noreturn;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub inline fn SDL_size_add_check_overflow_builtin(a: usize, b: usize, ret: [*c]usize) bool {
    @setEvalBranchQuota(100000);
    return @as(c_int, @intFromBool(__builtin.add_overflow(a, b, ret))) == @as(c_int, 0);
}
pub const SDL_ASSERTION_RETRY: c_int = 0;
pub const SDL_ASSERTION_BREAK: c_int = 1;
pub const SDL_ASSERTION_ABORT: c_int = 2;
pub const SDL_ASSERTION_IGNORE: c_int = 3;
pub const SDL_ASSERTION_ALWAYS_IGNORE: c_int = 4;
pub const enum_SDL_AssertState = c_uint;
pub const SDL_AssertState = enum_SDL_AssertState;
pub const struct_SDL_AssertData = extern struct {
    always_ignore: bool = false,
    trigger_count: c_uint = 0,
    condition: [*c]const u8 = null,
    filename: [*c]const u8 = null,
    linenum: c_int = 0,
    function: [*c]const u8 = null,
    next: [*c]const struct_SDL_AssertData = null,
};
pub const SDL_AssertData = struct_SDL_AssertData;
pub const SDL_AssertionHandler = ?*const fn (data: [*c]const SDL_AssertData, userdata: ?*anyopaque) callconv(.c) SDL_AssertState;
pub const SDL_SpinLock = c_int;
pub extern fn SDL_LockSpinlock_REAL(lock: [*c]SDL_SpinLock) void;
pub extern fn SDL_UnlockSpinlock_REAL(lock: [*c]SDL_SpinLock) void;
pub const SDL_PropertiesID = Uint32;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
pub const enum_SDL_PixelFormat = c_uint;
pub const SDL_PixelFormat = enum_SDL_PixelFormat;
pub const enum_SDL_Colorspace = c_uint;
pub const SDL_Colorspace = enum_SDL_Colorspace;
pub const struct_SDL_Color = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub const SDL_Color = struct_SDL_Color;
pub const struct_SDL_Palette = extern struct {
    ncolors: c_int = 0,
    colors: [*c]SDL_Color = null,
    version: Uint32 = 0,
    refcount: c_int = 0,
};
pub const SDL_Palette = struct_SDL_Palette;
pub const struct_SDL_PixelFormatDetails = extern struct {
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    bits_per_pixel: Uint8 = 0,
    bytes_per_pixel: Uint8 = 0,
    padding: [2]Uint8 = @import("std").mem.zeroes([2]Uint8),
    Rmask: Uint32 = 0,
    Gmask: Uint32 = 0,
    Bmask: Uint32 = 0,
    Amask: Uint32 = 0,
    Rbits: Uint8 = 0,
    Gbits: Uint8 = 0,
    Bbits: Uint8 = 0,
    Abits: Uint8 = 0,
    Rshift: Uint8 = 0,
    Gshift: Uint8 = 0,
    Bshift: Uint8 = 0,
    Ashift: Uint8 = 0,
};
pub const SDL_PixelFormatDetails = struct_SDL_PixelFormatDetails;
pub const struct_SDL_Point = extern struct {
    x: c_int = 0,
    y: c_int = 0,
};
pub const SDL_Point = struct_SDL_Point;
pub const struct_SDL_Rect = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
};
pub const SDL_Rect = struct_SDL_Rect;
pub const SDL_SurfaceFlags = Uint32;
pub const SDL_SurfaceDataFlags = Uint32;
pub const SDL_Surface = struct_SDL_Surface;
pub const SDL_Blit = ?*const fn (src: [*c]struct_SDL_Surface, srcrect: [*c]const SDL_Rect, dst: [*c]struct_SDL_Surface, dstrect: [*c]const SDL_Rect) callconv(.c) bool;
pub const struct_SDL_BlitMap = extern struct {
    identity: c_int = 0,
    blit: SDL_Blit = null,
    data: ?*anyopaque = null,
    info: SDL_BlitInfo = @import("std").mem.zeroes(SDL_BlitInfo),
    dst_palette_version: Uint32 = 0,
    src_palette_version: Uint32 = 0,
};
pub const SDL_BlitMap = struct_SDL_BlitMap;
pub const struct_SDL_Surface = extern struct {
    flags: SDL_SurfaceFlags = 0,
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    pitch: c_int = 0,
    pixels: ?*anyopaque = null,
    refcount: c_int = 0,
    reserved: ?*anyopaque = null,
    internal_flags: SDL_SurfaceDataFlags = 0,
    props: SDL_PropertiesID = 0,
    fmt: [*c]const SDL_PixelFormatDetails = null,
    colorspace: SDL_Colorspace = @import("std").mem.zeroes(SDL_Colorspace),
    palette: [*c]SDL_Palette = null,
    num_images: c_int = 0,
    images: [*c][*c]SDL_Surface = null,
    locked: c_int = 0,
    clip_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    map: SDL_BlitMap = @import("std").mem.zeroes(SDL_BlitMap),
    saved_pixels: ?*anyopaque = null,
};
pub const SDL_DisplayID = Uint32;
pub const SDL_WindowID = Uint32;
pub const struct_SDL_DisplayModeData = opaque {};
pub const SDL_DisplayModeData = struct_SDL_DisplayModeData;
pub const struct_SDL_DisplayMode = extern struct {
    displayID: SDL_DisplayID = 0,
    format: SDL_PixelFormat = @import("std").mem.zeroes(SDL_PixelFormat),
    w: c_int = 0,
    h: c_int = 0,
    pixel_density: f32 = 0,
    refresh_rate: f32 = 0,
    refresh_rate_numerator: c_int = 0,
    refresh_rate_denominator: c_int = 0,
    internal: ?*SDL_DisplayModeData = null,
};
pub const SDL_DisplayMode = struct_SDL_DisplayMode;
pub const SDL_WindowFlags = Uint64;
pub const SDL_Window = struct_SDL_Window;
pub const enum_SDL_HitTestResult = c_uint;
pub const SDL_HitTestResult = enum_SDL_HitTestResult;
pub const SDL_HitTest = ?*const fn (win: [*c]SDL_Window, area: [*c]const SDL_Point, data: ?*anyopaque) callconv(.c) SDL_HitTestResult;
pub const enum_SDL_ProgressState = c_int;
pub const SDL_ProgressState = enum_SDL_ProgressState;
pub const struct_SDL_Renderer = opaque {
};
pub const SDL_Renderer = struct_SDL_Renderer;
pub const struct_SDL_WindowData = opaque {};
pub const SDL_WindowData = struct_SDL_WindowData;
pub const struct_SDL_Window = extern struct {
    id: SDL_WindowID = 0,
    title: [*c]u8 = null,
    icon: [*c]SDL_Surface = null,
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
    min_w: c_int = 0,
    min_h: c_int = 0,
    max_w: c_int = 0,
    max_h: c_int = 0,
    min_aspect: f32 = 0,
    max_aspect: f32 = 0,
    last_pixel_w: c_int = 0,
    last_pixel_h: c_int = 0,
    flags: SDL_WindowFlags = 0,
    pending_flags: SDL_WindowFlags = 0,
    display_scale: f32 = 0,
    external_graphics_context: bool = false,
    fullscreen_exclusive: bool = false,
    last_fullscreen_exclusive_display: SDL_DisplayID = 0,
    displayID: SDL_DisplayID = 0,
    pending_displayID: SDL_DisplayID = 0,
    windowed: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    floating: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    pending: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    tiled: bool = false,
    undefined_x: bool = false,
    undefined_y: bool = false,
    requested_fullscreen_mode: SDL_DisplayMode = @import("std").mem.zeroes(SDL_DisplayMode),
    current_fullscreen_mode: SDL_DisplayMode = @import("std").mem.zeroes(SDL_DisplayMode),
    HDR: SDL_HDROutputProperties = @import("std").mem.zeroes(SDL_HDROutputProperties),
    opacity: f32 = 0,
    surface: [*c]SDL_Surface = null,
    surface_valid: bool = false,
    is_hiding: bool = false,
    restore_on_show: bool = false,
    last_position_pending: bool = false,
    last_size_pending: bool = false,
    update_fullscreen_on_display_changed: bool = false,
    constrain_popup: bool = false,
    is_destroying: bool = false,
    is_dropping: bool = false,
    safe_inset_left: c_int = 0,
    safe_inset_right: c_int = 0,
    safe_inset_top: c_int = 0,
    safe_inset_bottom: c_int = 0,
    safe_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    text_input_props: SDL_PropertiesID = 0,
    text_input_active: bool = false,
    text_input_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    text_input_cursor: c_int = 0,
    mouse_rect: SDL_Rect = @import("std").mem.zeroes(SDL_Rect),
    hit_test: SDL_HitTest = null,
    hit_test_data: ?*anyopaque = null,
    progress_state: SDL_ProgressState = @import("std").mem.zeroes(SDL_ProgressState),
    progress_value: f32 = 0,
    props: SDL_PropertiesID = 0,
    num_renderers: c_int = 0,
    renderers: [*c]?*SDL_Renderer = null,
    internal: ?*SDL_WindowData = null,
    keyboard_focus: [*c]SDL_Window = null,
    prev: [*c]SDL_Window = null,
    next: [*c]SDL_Window = null,
    parent: [*c]SDL_Window = null,
    first_child: [*c]SDL_Window = null,
    prev_sibling: [*c]SDL_Window = null,
    next_sibling: [*c]SDL_Window = null,
};
pub extern fn SDL_MinimizeWindow_REAL(window: [*c]SDL_Window) bool;
pub extern fn SDL_RestoreWindow_REAL(window: [*c]SDL_Window) bool;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_Quit_REAL() void;
pub const SDL_LOG_CATEGORY_ASSERT: c_int = 2;
pub const SDL_LOG_PRIORITY_WARN: c_int = 5;
pub const enum_SDL_LogPriority = c_uint;
pub const SDL_LogPriority = enum_SDL_LogPriority;
pub extern fn SDL_LogMessageV_REAL(category: c_int, priority: SDL_LogPriority, fmt: [*c]const u8, ap: [*c]struct___va_list_tag_2) void;
pub const SDL_MessageBoxFlags = Uint32;
pub const SDL_MessageBoxButtonFlags = Uint32;
pub const struct_SDL_MessageBoxButtonData = extern struct {
    flags: SDL_MessageBoxButtonFlags = 0,
    buttonID: c_int = 0,
    text: [*c]const u8 = null,
};
pub const SDL_MessageBoxButtonData = struct_SDL_MessageBoxButtonData;
pub const struct_SDL_MessageBoxColor = extern struct {
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
};
pub const SDL_MessageBoxColor = struct_SDL_MessageBoxColor;
pub const struct_SDL_MessageBoxColorScheme = extern struct {
    colors: [5]SDL_MessageBoxColor = @import("std").mem.zeroes([5]SDL_MessageBoxColor),
};
pub const SDL_MessageBoxColorScheme = struct_SDL_MessageBoxColorScheme;
pub const struct_SDL_MessageBoxData = extern struct {
    flags: SDL_MessageBoxFlags = 0,
    window: [*c]SDL_Window = null,
    title: [*c]const u8 = null,
    message: [*c]const u8 = null,
    numbuttons: c_int = 0,
    buttons: [*c]const SDL_MessageBoxButtonData = null,
    colorScheme: [*c]const SDL_MessageBoxColorScheme = null,
};
pub const SDL_MessageBoxData = struct_SDL_MessageBoxData;
pub extern fn SDL_ShowMessageBox_REAL(messageboxdata: [*c]const SDL_MessageBoxData, buttonid: [*c]c_int) bool;
pub const struct_SDL_HashTable = opaque {
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const SDL_BlitInfo = extern struct {
    src_surface: [*c]SDL_Surface = null,
    src: [*c]Uint8 = null,
    src_w: c_int = 0,
    src_h: c_int = 0,
    src_pitch: c_int = 0,
    src_skip: c_int = 0,
    leading_skip: c_int = 0,
    dst_surface: [*c]SDL_Surface = null,
    dst: [*c]Uint8 = null,
    dst_w: c_int = 0,
    dst_h: c_int = 0,
    dst_pitch: c_int = 0,
    dst_skip: c_int = 0,
    src_fmt: [*c]const SDL_PixelFormatDetails = null,
    src_pal: [*c]const SDL_Palette = null,
    dst_fmt: [*c]const SDL_PixelFormatDetails = null,
    dst_pal: [*c]const SDL_Palette = null,
    table: [*c]Uint8 = null,
    palette_map: ?*SDL_HashTable = null,
    flags: c_int = 0,
    colorkey: Uint32 = 0,
    r: Uint8 = 0,
    g: Uint8 = 0,
    b: Uint8 = 0,
    a: Uint8 = 0,
};
pub const SDL_HDROutputProperties = extern struct {
    SDR_white_level: f32 = 0,
    HDR_headroom: f32 = 0,
};
pub extern fn SDL_GetToplevelForKeyboardFocus() [*c]SDL_Window;
pub var triggered_assertions: [*c]SDL_AssertData = null;
pub var assertion_mutex: ?*SDL_Mutex = null;
pub var assertion_handler: SDL_AssertionHandler = SDL_PromptAssertion;
pub var assertion_userdata: ?*anyopaque = null;
pub fn debug_print(fmt: [*c]const u8, ...) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ap: va_list = undefined;
    _ = &ap;
    __builtin.va_start(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))), @cVaStart());
    SDL_LogMessageV_REAL(SDL_LOG_CATEGORY_ASSERT, SDL_LOG_PRIORITY_WARN, fmt, @ptrCast(@alignCast(&ap)));
    __builtin.va_end(@as([*c]struct___va_list_tag_2, @ptrCast(@alignCast(&ap))));
}
pub fn SDL_AddAssertionToReport(data: [*c]SDL_AssertData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    data.*.trigger_count +%= 1;
    if (data.*.trigger_count == @as(c_uint, 1)) {
        data.*.next = triggered_assertions;
        triggered_assertions = data;
    }
}
pub fn SDL_RenderAssertMessage(buf: [*c]u8, buf_len: usize, data: [*c]const SDL_AssertData) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return SDL_snprintf_REAL(buf, buf_len, "Assertion failure at %s (%s:%d), triggered %u %s:\n  '%s'", data.*.function, data.*.filename, data.*.linenum, data.*.trigger_count, if (data.*.trigger_count == @as(c_uint, 1)) @as([*c]u8, @as([*c]u8, @constCast("time"))) else @as([*c]u8, @as([*c]u8, @constCast("times"))), data.*.condition);
}
pub fn SDL_GenerateAssertionReport() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var item: [*c]const SDL_AssertData = triggered_assertions;
    _ = &item;
    if ((item != null) and (assertion_handler != SDL_PromptAssertion)) {
        debug_print("\n\nSDL assertion report.\n");
        debug_print("All SDL assertions between last init/quit:\n\n");
        while (item != null) {
            debug_print("'%s'\n    * %s (%s:%d)\n    * triggered %u time%s.\n    * always ignore: %s.\n", item.*.condition, item.*.function, item.*.filename, item.*.linenum, item.*.trigger_count, if (item.*.trigger_count == @as(c_uint, 1)) @as([*c]u8, @as([*c]u8, @constCast(""))) else @as([*c]u8, @as([*c]u8, @constCast("s"))), if (item.*.always_ignore) @as([*c]u8, @as([*c]u8, @constCast("yes"))) else @as([*c]u8, @as([*c]u8, @constCast("no"))));
            item = item.*.next;
        }
        debug_print("\n");
        SDL_ResetAssertionReport_REAL();
    }
}
pub fn SDL_AbortAssertion() callconv(.c) noreturn {
    @setEvalBranchQuota(100000);
    SDL_Quit_REAL();
    abort();
}
pub fn SDL_PromptAssertion(data: [*c]const SDL_AssertData, arg_userdata: ?*anyopaque) callconv(.c) SDL_AssertState {
    @setEvalBranchQuota(100000);
    var userdata = arg_userdata;
    _ = &userdata;
    var state: SDL_AssertState = SDL_ASSERTION_ABORT;
    _ = &state;
    var window: [*c]SDL_Window = undefined;
    _ = &window;
    var messagebox: SDL_MessageBoxData = undefined;
    _ = &messagebox;
    var buttons: [5]SDL_MessageBoxButtonData = [5]SDL_MessageBoxButtonData{
        SDL_MessageBoxButtonData{
            .flags = 0,
            .buttonID = SDL_ASSERTION_RETRY,
            .text = "Retry",
        },
        SDL_MessageBoxButtonData{
            .flags = 0,
            .buttonID = SDL_ASSERTION_BREAK,
            .text = "Break",
        },
        SDL_MessageBoxButtonData{
            .flags = 0,
            .buttonID = SDL_ASSERTION_ABORT,
            .text = "Abort",
        },
        SDL_MessageBoxButtonData{
            .flags = SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT,
            .buttonID = SDL_ASSERTION_IGNORE,
            .text = "Ignore",
        },
        SDL_MessageBoxButtonData{
            .flags = SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT,
            .buttonID = SDL_ASSERTION_ALWAYS_IGNORE,
            .text = "Always Ignore",
        },
    };
    _ = &buttons;
    var selected: c_int = undefined;
    _ = &selected;
    var stack_buf: [256]u8 = undefined;
    _ = &stack_buf;
    var message: [*c]u8 = @ptrCast(@alignCast(&stack_buf));
    _ = &message;
    var buf_len: usize = @sizeOf(@TypeOf(stack_buf));
    _ = &buf_len;
    var len: c_int = undefined;
    _ = &len;
    _ = &userdata;
    len = SDL_RenderAssertMessage(message, buf_len, data);
    if (len >= @as(c_int, @bitCast(@as(c_uint, @truncate(buf_len))))) {
        if (SDL_size_add_check_overflow_builtin(@bitCast(@as(c_long, len)), 1, &buf_len)) {
            message = @ptrCast(@alignCast(SDL_malloc_REAL(buf_len)));
            if (message != null) {
                len = SDL_RenderAssertMessage(message, buf_len, data);
            } else {
                message = @ptrCast(@alignCast(&stack_buf));
            }
        }
    }
    if (len < @as(c_int, 0)) {
        if (message != @as([*c]u8, @ptrCast(@alignCast(&stack_buf)))) {
            SDL_free_REAL(@ptrCast(@alignCast(message)));
        }
        return SDL_ASSERTION_ABORT;
    }
    debug_print("\n\n%s\n\n", message);
    var hint: [*c]const u8 = SDL_GetHint_REAL("SDL_ASSERT");
    _ = &hint;
    if (hint != null) {
        if (message != @as([*c]u8, @ptrCast(@alignCast(&stack_buf)))) {
            SDL_free_REAL(@ptrCast(@alignCast(message)));
        }
        if (SDL_strcmp_REAL(hint, "abort") == @as(c_int, 0)) {
            return SDL_ASSERTION_ABORT;
        } else if (SDL_strcmp_REAL(hint, "break") == @as(c_int, 0)) {
            return SDL_ASSERTION_BREAK;
        } else if (SDL_strcmp_REAL(hint, "retry") == @as(c_int, 0)) {
            return SDL_ASSERTION_RETRY;
        } else if (SDL_strcmp_REAL(hint, "ignore") == @as(c_int, 0)) {
            return SDL_ASSERTION_IGNORE;
        } else if (SDL_strcmp_REAL(hint, "always_ignore") == @as(c_int, 0)) {
            return SDL_ASSERTION_ALWAYS_IGNORE;
        } else {
            return SDL_ASSERTION_ABORT;
        }
    }
    window = SDL_GetToplevelForKeyboardFocus();
    if (window != null) {
        if (window.*.fullscreen_exclusive) {
            _ = SDL_MinimizeWindow_REAL(window);
        } else {
            window = null;
        }
    }
    _ = memset(@ptrCast(@alignCast(&messagebox)), 0, @sizeOf(@TypeOf(messagebox)));
    messagebox.flags = SDL_MESSAGEBOX_WARNING;
    messagebox.window = window;
    messagebox.title = "Assertion Failed";
    messagebox.message = message;
    messagebox.numbuttons = @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buttons)) / @sizeOf(@TypeOf(buttons[@as(c_int, 0)])))));
    messagebox.buttons = @ptrCast(@alignCast(&buttons));
    if (SDL_ShowMessageBox_REAL(&messagebox, &selected)) {
        if (selected == -@as(c_int, 1)) {
            state = SDL_ASSERTION_IGNORE;
        } else {
            state = @bitCast(selected);
        }
    } else {
        while (true) {
            var buf: [32]u8 = undefined;
            _ = &buf;
            _ = fprintf(stderr, "Abort/Break/Retry/Ignore/AlwaysIgnore? [abriA] : ");
            _ = fflush(stderr);
            if (@as(?*anyopaque, @ptrCast(@alignCast(fgets(@ptrCast(@alignCast(&buf)), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(buf))))), stdin)))) == @as(?*anyopaque, null)) {
                break;
            }
            if (SDL_strncmp_REAL(@ptrCast(@alignCast(&buf)), "a", 1) == @as(c_int, 0)) {
                state = SDL_ASSERTION_ABORT;
                break;
            } else if (SDL_strncmp_REAL(@ptrCast(@alignCast(&buf)), "b", 1) == @as(c_int, 0)) {
                state = SDL_ASSERTION_BREAK;
                break;
            } else if (SDL_strncmp_REAL(@ptrCast(@alignCast(&buf)), "r", 1) == @as(c_int, 0)) {
                state = SDL_ASSERTION_RETRY;
                break;
            } else if (SDL_strncmp_REAL(@ptrCast(@alignCast(&buf)), "i", 1) == @as(c_int, 0)) {
                state = SDL_ASSERTION_IGNORE;
                break;
            } else if (SDL_strncmp_REAL(@ptrCast(@alignCast(&buf)), "A", 1) == @as(c_int, 0)) {
                state = SDL_ASSERTION_ALWAYS_IGNORE;
                break;
            }
        }
    }
    if (window != null) {
        _ = SDL_RestoreWindow_REAL(window);
    }
    if (message != @as([*c]u8, @ptrCast(@alignCast(&stack_buf)))) {
        SDL_free_REAL(@ptrCast(@alignCast(message)));
    }
    return state;
}
pub export fn SDL_ReportAssertion_REAL(data: [*c]SDL_AssertData, func: [*c]const u8, file: [*c]const u8, line: c_int) SDL_AssertState {
    @setEvalBranchQuota(100000);
    var state: SDL_AssertState = undefined;
    _ = &state;
    const static_local_assertion_running = struct {
        var assertion_running: c_int = 0;
    };
    _ = &static_local_assertion_running;
    const static_local_spinlock = struct {
        var spinlock: SDL_SpinLock = 0;
    };
    _ = &static_local_spinlock;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                state = SDL_ASSERTION_IGNORE;
                SDL_LockSpinlock_REAL(&static_local_spinlock.spinlock);
                if (!(assertion_mutex != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                assertion_mutex = SDL_CreateMutex_REAL();
                if (!(assertion_mutex != null)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                SDL_UnlockSpinlock_REAL(&static_local_spinlock.spinlock);
                SDL_LockMutex_REAL(assertion_mutex);
                if (data.*.trigger_count == @as(c_uint, 0)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            4 => {
                SDL_UnlockSpinlock_REAL(&static_local_spinlock.spinlock);
                return SDL_ASSERTION_IGNORE;
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                data.*.function = func;
                data.*.filename = file;
                data.*.linenum = line;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                SDL_AddAssertionToReport(data);
                static_local_assertion_running.assertion_running += 1;
                if (static_local_assertion_running.assertion_running > @as(c_int, 1)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                if (static_local_assertion_running.assertion_running == @as(c_int, 2)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                if (!data.*.always_ignore) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            13 => {
                SDL_AbortAssertion();
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                if (static_local_assertion_running.assertion_running == @as(c_int, 3)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            16 => {
                abort();
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            19 => {
                if (true) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            22 => {
                state = assertion_handler.?(data, assertion_userdata);
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                switch (state) {
                    @as(SDL_AssertState, SDL_ASSERTION_ALWAYS_IGNORE) => {
                        sdl_pc = 26;
                        continue;
                    },
                    @as(SDL_AssertState, SDL_ASSERTION_IGNORE) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(SDL_AssertState, SDL_ASSERTION_RETRY) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(SDL_AssertState, SDL_ASSERTION_BREAK) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(SDL_AssertState, SDL_ASSERTION_ABORT) => {
                        sdl_pc = 30;
                        continue;
                    },
                    else => {
                        sdl_pc = 25;
                        continue;
                    },
                }
            },
            25 => {
                static_local_assertion_running.assertion_running -= 1;
                SDL_UnlockMutex_REAL(assertion_mutex);
                return state;
            },
            26 => {
                state = SDL_ASSERTION_IGNORE;
                data.*.always_ignore = @"true" != 0;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            27 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            28 => {
                {
                    sdl_pc = 29;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            30 => {
                SDL_AbortAssertion();
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_AssertionsQuit() void {
    @setEvalBranchQuota(100000);
    SDL_GenerateAssertionReport();
    if (assertion_mutex != null) {
        SDL_DestroyMutex_REAL(assertion_mutex);
        assertion_mutex = null;
    }
}
pub export fn SDL_SetAssertionHandler_REAL(handler: SDL_AssertionHandler, userdata: ?*anyopaque) void {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(handler)))) != @as(?*anyopaque, null)) {
        assertion_handler = handler;
        assertion_userdata = userdata;
    } else {
        assertion_handler = SDL_PromptAssertion;
        assertion_userdata = null;
    }
}
pub export fn SDL_GetAssertionReport_REAL() [*c]const SDL_AssertData {
    @setEvalBranchQuota(100000);
    return triggered_assertions;
}
pub export fn SDL_ResetAssertionReport_REAL() void {
    @setEvalBranchQuota(100000);
    var next: [*c]SDL_AssertData = null;
    _ = &next;
    var item: [*c]SDL_AssertData = undefined;
    _ = &item;
    {
        item = triggered_assertions;
        while (item != null) : (item = next) {
            next = @ptrCast(@alignCast(@constCast(item.*.next)));
            item.*.always_ignore = @"false" != 0;
            item.*.trigger_count = 0;
            item.*.next = null;
        }
    }
    triggered_assertions = null;
}
pub export fn SDL_GetDefaultAssertionHandler_REAL() SDL_AssertionHandler {
    @setEvalBranchQuota(100000);
    return SDL_PromptAssertion;
}
pub export fn SDL_GetAssertionHandler_REAL(userdata: [*c]?*anyopaque) SDL_AssertionHandler {
    @setEvalBranchQuota(100000);
    if (userdata != null) {
        userdata.* = assertion_userdata;
    }
    return assertion_handler;
}

pub const SDL_GetAssertionHandler = SDL_GetAssertionHandler_REAL;
pub const SDL_GetAssertionReport = SDL_GetAssertionReport_REAL;
pub const SDL_GetDefaultAssertionHandler = SDL_GetDefaultAssertionHandler_REAL;
pub const SDL_ReportAssertion = SDL_ReportAssertion_REAL;
pub const SDL_ResetAssertionReport = SDL_ResetAssertionReport_REAL;
pub const SDL_SetAssertionHandler = SDL_SetAssertionHandler_REAL;
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /home/addo/dev/stupid/zdl/.cache/zig-lib/compiler/aro/include/stdarg.h:12:9
pub inline fn va_end(ap: anytype) @TypeOf(__builtin.va_end(ap)) {
    @setEvalBranchQuota(100000);
    _ = &ap;
    return __builtin.va_end(ap);
}
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_MESSAGEBOX_WARNING = @as(c_uint, 0x00000020);
pub const SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = @as(c_uint, 0x00000001);
pub const SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = @as(c_uint, 0x00000002);
