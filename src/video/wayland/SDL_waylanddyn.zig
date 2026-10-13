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
pub const struct___va_list_tag_2 = extern struct {
    unnamed_0: c_uint = 0,
    unnamed_1: c_uint = 0,
    unnamed_2: ?*anyopaque = null,
    unnamed_3: ?*anyopaque = null,
};
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub extern fn SDL_ClearError_REAL() bool;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
pub const struct_wl_message = extern struct {
    name: [*c]const u8 = null,
    signature: [*c]const u8 = null,
    types: [*c][*c]const struct_wl_interface = null,
};
pub const struct_wl_interface = extern struct {
    name: [*c]const u8 = null,
    version: c_int = 0,
    method_count: c_int = 0,
    methods: [*c]const struct_wl_message = null,
    event_count: c_int = 0,
    events: [*c]const struct_wl_message = null,
};
pub const struct_wl_proxy = opaque {
};
pub const struct_wl_event_queue = opaque {
};
pub const struct_wl_display = opaque {
};
pub const struct_wl_surface = opaque {
};
pub const struct_wl_shm = opaque {
};
pub const struct_wl_seat = opaque {
};
pub const struct_wl_output = opaque {
};
pub const struct_libdecor = opaque {
};
pub const struct_libdecor_frame = opaque {
};
pub const struct_libdecor_state = opaque {
};
pub const struct_libdecor_configuration = opaque {
};
pub const enum_libdecor_error = c_uint;
pub const struct_libdecor_interface = extern struct {
    @"error": ?*const fn (context: ?*struct_libdecor, @"error": enum_libdecor_error, message: [*c]const u8) callconv(.c) void = null,
    reserved0: ?*const fn () callconv(.c) void = null,
    reserved1: ?*const fn () callconv(.c) void = null,
    reserved2: ?*const fn () callconv(.c) void = null,
    reserved3: ?*const fn () callconv(.c) void = null,
    reserved4: ?*const fn () callconv(.c) void = null,
    reserved5: ?*const fn () callconv(.c) void = null,
    reserved6: ?*const fn () callconv(.c) void = null,
    reserved7: ?*const fn () callconv(.c) void = null,
    reserved8: ?*const fn () callconv(.c) void = null,
    reserved9: ?*const fn () callconv(.c) void = null,
};
pub const struct_libdecor_frame_interface = extern struct {
    configure: ?*const fn (frame: ?*struct_libdecor_frame, configuration: ?*struct_libdecor_configuration, user_data: ?*anyopaque) callconv(.c) void = null,
    close: ?*const fn (frame: ?*struct_libdecor_frame, user_data: ?*anyopaque) callconv(.c) void = null,
    commit: ?*const fn (frame: ?*struct_libdecor_frame, user_data: ?*anyopaque) callconv(.c) void = null,
    dismiss_popup: ?*const fn (frame: ?*struct_libdecor_frame, seat_name: [*c]const u8, user_data: ?*anyopaque) callconv(.c) void = null,
    reserved0: ?*const fn () callconv(.c) void = null,
    reserved1: ?*const fn () callconv(.c) void = null,
    reserved2: ?*const fn () callconv(.c) void = null,
    reserved3: ?*const fn () callconv(.c) void = null,
    reserved4: ?*const fn () callconv(.c) void = null,
    reserved5: ?*const fn () callconv(.c) void = null,
    reserved6: ?*const fn () callconv(.c) void = null,
    reserved7: ?*const fn () callconv(.c) void = null,
    reserved8: ?*const fn () callconv(.c) void = null,
    reserved9: ?*const fn () callconv(.c) void = null,
};
pub const enum_libdecor_resize_edge = c_uint;
pub const enum_libdecor_capabilities = c_uint;
pub const enum_libdecor_window_state = c_uint;
pub const struct_wl_cursor_theme = opaque {
};
pub const struct_wl_buffer = opaque {
};
pub const struct_wl_cursor_image = extern struct {
    width: u32 = 0,
    height: u32 = 0,
    hotspot_x: u32 = 0,
    hotspot_y: u32 = 0,
    delay: u32 = 0,
};
pub const struct_wl_cursor = extern struct {
    image_count: c_uint = 0,
    images: [*c][*c]struct_wl_cursor_image = null,
    name: [*c]u8 = null,
};
pub const struct_wl_object = opaque {};
pub const struct_wl_list = extern struct {
    prev: [*c]struct_wl_list = null,
    next: [*c]struct_wl_list = null,
};
pub const struct_wl_array = extern struct {
    size: usize = 0,
    alloc: usize = 0,
    data: ?*anyopaque = null,
};
pub const wl_fixed_t = i32;
pub const union_wl_argument = extern union {
    i: i32,
    u: u32,
    f: wl_fixed_t,
    s: [*c]const u8,
    o: ?*struct_wl_object,
    n: u32,
    a: [*c]struct_wl_array,
    h: i32,
};
pub const wl_log_func_t = ?*const fn (fmt: [*c]const u8, args: [*c]struct___va_list_tag_2) callconv(.c) void;
pub const struct_xkb_context = opaque {
};
pub const struct_xkb_keymap = opaque {
};
pub const struct_xkb_state = opaque {
};
pub const xkb_keycode_t = u32;
pub const xkb_keysym_t = u32;
pub const xkb_layout_index_t = u32;
pub const xkb_level_index_t = u32;
pub const xkb_mod_mask_t = u32;
pub const enum_xkb_context_flags = c_uint;
pub const enum_xkb_keymap_compile_flags = c_uint;
pub const enum_xkb_keymap_format = c_uint;
pub const xkb_keymap_key_iter_t = ?*const fn (keymap: ?*struct_xkb_keymap, key: xkb_keycode_t, data: ?*anyopaque) callconv(.c) void;
pub const enum_xkb_state_component = c_uint;
pub const struct_xkb_compose_table = opaque {
};
pub const struct_xkb_compose_state = opaque {
};
pub const enum_xkb_compose_compile_flags = c_uint;
pub const enum_xkb_compose_state_flags = c_uint;
pub const enum_xkb_compose_status = c_uint;
pub const enum_xkb_compose_feed_result = c_uint;
pub const SDL_DYNWAYLANDFN_wl_proxy_marshal = ?*const fn (?*struct_wl_proxy, u32, ...) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_proxy_create = ?*const fn (?*struct_wl_proxy, [*c]const struct_wl_interface) callconv(.c) ?*struct_wl_proxy;
pub const SDL_DYNWAYLANDFN_wl_proxy_destroy = ?*const fn (?*struct_wl_proxy) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_proxy_add_listener = ?*const fn (?*struct_wl_proxy, [*c]?*const fn () callconv(.c) void, ?*anyopaque) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_proxy_set_user_data = ?*const fn (?*struct_wl_proxy, ?*anyopaque) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_proxy_get_user_data = ?*const fn (?*struct_wl_proxy) callconv(.c) ?*anyopaque;
pub const SDL_DYNWAYLANDFN_wl_proxy_get_version = ?*const fn (?*struct_wl_proxy) callconv(.c) u32;
pub const SDL_DYNWAYLANDFN_wl_proxy_get_id = ?*const fn (?*struct_wl_proxy) callconv(.c) u32;
pub const SDL_DYNWAYLANDFN_wl_proxy_get_class = ?*const fn (?*struct_wl_proxy) callconv(.c) [*c]const u8;
pub const SDL_DYNWAYLANDFN_wl_proxy_set_queue = ?*const fn (?*struct_wl_proxy, ?*struct_wl_event_queue) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_proxy_create_wrapper = ?*const fn (?*anyopaque) callconv(.c) ?*anyopaque;
pub const SDL_DYNWAYLANDFN_wl_proxy_wrapper_destroy = ?*const fn (?*anyopaque) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_display_connect = ?*const fn ([*c]const u8) callconv(.c) ?*struct_wl_display;
pub const SDL_DYNWAYLANDFN_wl_display_connect_to_fd = ?*const fn (c_int) callconv(.c) ?*struct_wl_display;
pub const SDL_DYNWAYLANDFN_wl_display_disconnect = ?*const fn (?*struct_wl_display) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_display_get_fd = ?*const fn (?*struct_wl_display) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_display_dispatch = ?*const fn (?*struct_wl_display) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_display_dispatch_queue = ?*const fn (?*struct_wl_display, ?*struct_wl_event_queue) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_display_dispatch_queue_pending = ?*const fn (?*struct_wl_display, ?*struct_wl_event_queue) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_display_dispatch_pending = ?*const fn (?*struct_wl_display) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_display_prepare_read = ?*const fn (?*struct_wl_display) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_display_prepare_read_queue = ?*const fn (?*struct_wl_display, ?*struct_wl_event_queue) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_display_read_events = ?*const fn (?*struct_wl_display) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_display_cancel_read = ?*const fn (?*struct_wl_display) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_display_get_error = ?*const fn (?*struct_wl_display) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_display_flush = ?*const fn (?*struct_wl_display) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_display_roundtrip = ?*const fn (?*struct_wl_display) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_display_create_queue = ?*const fn (?*struct_wl_display) callconv(.c) ?*struct_wl_event_queue;
pub const SDL_DYNWAYLANDFN_wl_event_queue_destroy = ?*const fn (?*struct_wl_event_queue) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_log_set_handler_client = ?*const fn (wl_log_func_t) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_list_init = ?*const fn ([*c]struct_wl_list) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_list_insert = ?*const fn ([*c]struct_wl_list, [*c]struct_wl_list) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_list_remove = ?*const fn ([*c]struct_wl_list) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_list_length = ?*const fn ([*c]const struct_wl_list) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_list_empty = ?*const fn ([*c]const struct_wl_list) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_list_insert_list = ?*const fn ([*c]struct_wl_list, [*c]struct_wl_list) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_array_init = ?*const fn ([*c]struct_wl_array) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_array_release = ?*const fn ([*c]struct_wl_array) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_array_add = ?*const fn ([*c]struct_wl_array, usize) callconv(.c) ?*anyopaque;
pub const SDL_DYNWAYLANDFN_wl_array_copy = ?*const fn ([*c]struct_wl_array, [*c]struct_wl_array) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_wl_proxy_marshal_constructor = ?*const fn (?*struct_wl_proxy, opcode: u32, interface: [*c]const struct_wl_interface, ...) callconv(.c) ?*struct_wl_proxy;
pub const SDL_DYNWAYLANDFN_wl_proxy_marshal_constructor_versioned = ?*const fn (proxy: ?*struct_wl_proxy, opcode: u32, interface: [*c]const struct_wl_interface, version: u32, ...) callconv(.c) ?*struct_wl_proxy;
pub const SDL_DYNWAYLANDFN_wl_proxy_set_tag = ?*const fn (?*struct_wl_proxy, [*c]const [*c]const u8) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_proxy_get_tag = ?*const fn (?*struct_wl_proxy) callconv(.c) [*c]const [*c]const u8;
pub const SDL_DYNWAYLANDFN_wl_proxy_marshal_flags = ?*const fn (proxy: ?*struct_wl_proxy, opcode: u32, interface: [*c]const struct_wl_interface, version: u32, flags: u32, ...) callconv(.c) ?*struct_wl_proxy;
pub const SDL_DYNWAYLANDFN_wl_proxy_marshal_array_flags = ?*const fn (proxy: ?*struct_wl_proxy, opcode: u32, interface: [*c]const struct_wl_interface, version: u32, flags: u32, args: [*c]union_wl_argument) callconv(.c) ?*struct_wl_proxy;
pub const SDL_DYNWAYLANDFN_wl_display_create_queue_with_name = ?*const fn (display: ?*struct_wl_display, name: [*c]const u8) callconv(.c) ?*struct_wl_event_queue;
pub const struct_wl_egl_window = opaque {
};
pub const SDL_DYNWAYLANDFN_wl_egl_window_create = ?*const fn (?*struct_wl_surface, c_int, c_int) callconv(.c) ?*struct_wl_egl_window;
pub const SDL_DYNWAYLANDFN_wl_egl_window_destroy = ?*const fn (?*struct_wl_egl_window) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_egl_window_resize = ?*const fn (?*struct_wl_egl_window, c_int, c_int, c_int, c_int) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_egl_window_get_attached_size = ?*const fn (?*struct_wl_egl_window, [*c]c_int, [*c]c_int) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_cursor_theme_load = ?*const fn ([*c]const u8, c_int, ?*struct_wl_shm) callconv(.c) ?*struct_wl_cursor_theme;
pub const SDL_DYNWAYLANDFN_wl_cursor_theme_destroy = ?*const fn (?*struct_wl_cursor_theme) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_wl_cursor_theme_get_cursor = ?*const fn (?*struct_wl_cursor_theme, [*c]const u8) callconv(.c) [*c]struct_wl_cursor;
pub const SDL_DYNWAYLANDFN_wl_cursor_image_get_buffer = ?*const fn ([*c]struct_wl_cursor_image) callconv(.c) ?*struct_wl_buffer;
pub const SDL_DYNWAYLANDFN_wl_cursor_frame = ?*const fn ([*c]struct_wl_cursor, u32) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_xkb_state_key_get_syms = ?*const fn (?*struct_xkb_state, xkb_keycode_t, [*c][*c]const xkb_keysym_t) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_xkb_keysym_to_utf8 = ?*const fn (xkb_keysym_t, [*c]u8, usize) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_xkb_keymap_new_from_string = ?*const fn (?*struct_xkb_context, [*c]const u8, enum_xkb_keymap_format, enum_xkb_keymap_compile_flags) callconv(.c) ?*struct_xkb_keymap;
pub const SDL_DYNWAYLANDFN_xkb_state_new = ?*const fn (?*struct_xkb_keymap) callconv(.c) ?*struct_xkb_state;
pub const SDL_DYNWAYLANDFN_xkb_keymap_key_repeats = ?*const fn (keymap: ?*struct_xkb_keymap, key: xkb_keycode_t) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_xkb_keymap_unref = ?*const fn (?*struct_xkb_keymap) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_xkb_state_unref = ?*const fn (?*struct_xkb_state) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_xkb_context_unref = ?*const fn (?*struct_xkb_context) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_xkb_context_new = ?*const fn (flags: enum_xkb_context_flags) callconv(.c) ?*struct_xkb_context;
pub const SDL_DYNWAYLANDFN_xkb_state_update_mask = ?*const fn (state: ?*struct_xkb_state, depressed_mods: xkb_mod_mask_t, latched_mods: xkb_mod_mask_t, locked_mods: xkb_mod_mask_t, depressed_layout: xkb_layout_index_t, latched_layout: xkb_layout_index_t, locked_layout: xkb_layout_index_t) callconv(.c) enum_xkb_state_component;
pub const SDL_DYNWAYLANDFN_xkb_compose_table_new_from_locale = ?*const fn (?*struct_xkb_context, locale: [*c]const u8, enum_xkb_compose_compile_flags) callconv(.c) ?*struct_xkb_compose_table;
pub const SDL_DYNWAYLANDFN_xkb_compose_state_reset = ?*const fn (?*struct_xkb_compose_state) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_xkb_compose_table_unref = ?*const fn (?*struct_xkb_compose_table) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_xkb_compose_state_new = ?*const fn (?*struct_xkb_compose_table, enum_xkb_compose_state_flags) callconv(.c) ?*struct_xkb_compose_state;
pub const SDL_DYNWAYLANDFN_xkb_compose_state_unref = ?*const fn (?*struct_xkb_compose_state) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_xkb_compose_state_feed = ?*const fn (?*struct_xkb_compose_state, xkb_keysym_t) callconv(.c) enum_xkb_compose_feed_result;
pub const SDL_DYNWAYLANDFN_xkb_compose_state_get_status = ?*const fn (?*struct_xkb_compose_state) callconv(.c) enum_xkb_compose_status;
pub const SDL_DYNWAYLANDFN_xkb_compose_state_get_one_sym = ?*const fn (?*struct_xkb_compose_state) callconv(.c) xkb_keysym_t;
pub const SDL_DYNWAYLANDFN_xkb_keymap_key_for_each = ?*const fn (?*struct_xkb_keymap, xkb_keymap_key_iter_t, ?*anyopaque) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_xkb_keymap_num_layouts = ?*const fn (?*struct_xkb_keymap) callconv(.c) xkb_layout_index_t;
pub const SDL_DYNWAYLANDFN_xkb_keymap_key_get_syms_by_level = ?*const fn (?*struct_xkb_keymap, xkb_keycode_t, xkb_layout_index_t, xkb_level_index_t, [*c][*c]const xkb_keysym_t) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_xkb_keymap_num_levels_for_key = ?*const fn (?*struct_xkb_keymap, xkb_keycode_t, xkb_layout_index_t) callconv(.c) xkb_level_index_t;
pub const SDL_DYNWAYLANDFN_xkb_keysym_to_utf32 = ?*const fn (xkb_keysym_t) callconv(.c) u32;
pub const SDL_DYNWAYLANDFN_xkb_keymap_mod_get_index = ?*const fn (?*struct_xkb_keymap, [*c]const u8) callconv(.c) u32;
pub const SDL_DYNWAYLANDFN_xkb_keymap_layout_get_name = ?*const fn (?*struct_xkb_keymap, xkb_layout_index_t) callconv(.c) [*c]const u8;
pub const SDL_DYNWAYLANDFN_xkb_keymap_key_get_mods_for_level = ?*const fn (?*struct_xkb_keymap, xkb_keycode_t, xkb_layout_index_t, xkb_level_index_t, [*c]xkb_mod_mask_t, usize) callconv(.c) usize;
pub const SDL_DYNWAYLANDFN_xkb_keymap_mod_get_mask = ?*const fn (?*struct_xkb_keymap, [*c]const u8) callconv(.c) xkb_mod_mask_t;
pub const SDL_DYNWAYLANDFN_libdecor_unref = ?*const fn (?*struct_libdecor) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_new = ?*const fn (?*struct_wl_display, [*c]const struct_libdecor_interface) callconv(.c) ?*struct_libdecor;
pub const SDL_DYNWAYLANDFN_libdecor_decorate = ?*const fn (?*struct_libdecor, ?*struct_wl_surface, [*c]const struct_libdecor_frame_interface, ?*anyopaque) callconv(.c) ?*struct_libdecor_frame;
pub const SDL_DYNWAYLANDFN_libdecor_frame_unref = ?*const fn (?*struct_libdecor_frame) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_title = ?*const fn (?*struct_libdecor_frame, [*c]const u8) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_app_id = ?*const fn (?*struct_libdecor_frame, [*c]const u8) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_max_content_size = ?*const fn (frame: ?*struct_libdecor_frame, content_width: c_int, content_height: c_int) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_min_content_size = ?*const fn (frame: ?*struct_libdecor_frame, content_width: c_int, content_height: c_int) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_resize = ?*const fn (?*struct_libdecor_frame, ?*struct_wl_seat, u32, enum_libdecor_resize_edge) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_move = ?*const fn (?*struct_libdecor_frame, ?*struct_wl_seat, u32) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_commit = ?*const fn (?*struct_libdecor_frame, ?*struct_libdecor_state, ?*struct_libdecor_configuration) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_minimized = ?*const fn (?*struct_libdecor_frame) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_maximized = ?*const fn (?*struct_libdecor_frame) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_unset_maximized = ?*const fn (?*struct_libdecor_frame) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_fullscreen = ?*const fn (?*struct_libdecor_frame, ?*struct_wl_output) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_unset_fullscreen = ?*const fn (?*struct_libdecor_frame) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_capabilities = ?*const fn (?*struct_libdecor_frame, enum_libdecor_capabilities) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_unset_capabilities = ?*const fn (?*struct_libdecor_frame, enum_libdecor_capabilities) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_has_capability = ?*const fn (?*struct_libdecor_frame, enum_libdecor_capabilities) callconv(.c) bool;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_visibility = ?*const fn (?*struct_libdecor_frame, bool) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_is_visible = ?*const fn (?*struct_libdecor_frame) callconv(.c) bool;
pub const SDL_DYNWAYLANDFN_libdecor_frame_is_floating = ?*const fn (?*struct_libdecor_frame) callconv(.c) bool;
pub const SDL_DYNWAYLANDFN_libdecor_frame_set_parent = ?*const fn (?*struct_libdecor_frame, ?*struct_libdecor_frame) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_show_window_menu = ?*const fn (?*struct_libdecor_frame, ?*struct_wl_seat, u32, c_int, c_int) callconv(.c) void;
pub const struct_xdg_surface = opaque {};
pub const SDL_DYNWAYLANDFN_libdecor_frame_get_xdg_surface = ?*const fn (?*struct_libdecor_frame) callconv(.c) ?*struct_xdg_surface;
pub const struct_xdg_toplevel = opaque {};
pub const SDL_DYNWAYLANDFN_libdecor_frame_get_xdg_toplevel = ?*const fn (?*struct_libdecor_frame) callconv(.c) ?*struct_xdg_toplevel;
pub const SDL_DYNWAYLANDFN_libdecor_frame_translate_coordinate = ?*const fn (?*struct_libdecor_frame, c_int, c_int, [*c]c_int, [*c]c_int) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_map = ?*const fn (?*struct_libdecor_frame) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_state_new = ?*const fn (c_int, c_int) callconv(.c) ?*struct_libdecor_state;
pub const SDL_DYNWAYLANDFN_libdecor_state_free = ?*const fn (?*struct_libdecor_state) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_configuration_get_content_size = ?*const fn (?*struct_libdecor_configuration, ?*struct_libdecor_frame, [*c]c_int, [*c]c_int) callconv(.c) bool;
pub const SDL_DYNWAYLANDFN_libdecor_configuration_get_window_state = ?*const fn (?*struct_libdecor_configuration, [*c]enum_libdecor_window_state) callconv(.c) bool;
pub const SDL_DYNWAYLANDFN_libdecor_dispatch = ?*const fn (?*struct_libdecor, c_int) callconv(.c) c_int;
pub const SDL_DYNWAYLANDFN_libdecor_frame_get_min_content_size = ?*const fn (?*const struct_libdecor_frame, [*c]c_int, [*c]c_int) callconv(.c) void;
pub const SDL_DYNWAYLANDFN_libdecor_frame_get_max_content_size = ?*const fn (?*const struct_libdecor_frame, [*c]c_int, [*c]c_int) callconv(.c) void;
pub const enum_libdecor_wm_capabilities = c_uint;
pub const SDL_DYNWAYLANDFN_libdecor_frame_get_wm_capabilities = ?*const fn (?*struct_libdecor_frame) callconv(.c) enum_libdecor_wm_capabilities;
pub const waylanddynlib = extern struct {
    lib: ?*SDL_SharedObject = null,
    libname: [*c]const u8 = null,
    hint: [*c]const u8 = null,
    hint_default: bool = false,
};
pub var waylandlibs: [6]waylanddynlib = [6]waylanddynlib{
    waylanddynlib{
        .lib = null,
        .libname = "libwayland-client.so.0",
        .hint = null,
        .hint_default = @"false" != 0,
    },
    waylanddynlib{
        .lib = null,
        .libname = "libwayland-egl.so.1",
        .hint = null,
        .hint_default = @"false" != 0,
    },
    waylanddynlib{
        .lib = null,
        .libname = "libwayland-cursor.so.0",
        .hint = null,
        .hint_default = @"false" != 0,
    },
    waylanddynlib{
        .lib = null,
        .libname = "libxkbcommon.so.0",
        .hint = null,
        .hint_default = @"false" != 0,
    },
    waylanddynlib{
        .lib = null,
        .libname = "libdecor-0.so.0",
        .hint = "SDL_VIDEO_WAYLAND_ALLOW_LIBDECOR",
        .hint_default = @"true" != 0,
    },
    waylanddynlib{
        .lib = null,
        .libname = null,
        .hint = null,
        .hint_default = @"false" != 0,
    },
};
pub fn WAYLAND_GetSym(fnname: [*c]const u8, pHasModule: [*c]c_int, required: bool) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var @"fn": ?*anyopaque = null;
    _ = &@"fn";
    var dynlib: [*c]waylanddynlib = undefined;
    _ = &dynlib;
    {
        dynlib = @ptrCast(@alignCast(&waylandlibs));
        while (dynlib.*.libname != null) : (dynlib += 1) {
            if (dynlib.*.lib != null) {
                @"fn" = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(dynlib.*.lib, fnname))));
                if (@"fn" != null) {
                    break;
                }
            }
        }
    }
    if (!(@"fn" != null) and required) {
        pHasModule.* = 0;
    }
    return @"fn";
}
pub export var SDL_WAYLAND_HAVE_WAYLAND_CLIENT: c_int = 0;
pub export var WAYLAND_wl_proxy_marshal: SDL_DYNWAYLANDFN_wl_proxy_marshal = null;
pub export var WAYLAND_wl_proxy_create: SDL_DYNWAYLANDFN_wl_proxy_create = null;
pub export var WAYLAND_wl_proxy_destroy: SDL_DYNWAYLANDFN_wl_proxy_destroy = null;
pub export var WAYLAND_wl_proxy_add_listener: SDL_DYNWAYLANDFN_wl_proxy_add_listener = null;
pub export var WAYLAND_wl_proxy_set_user_data: SDL_DYNWAYLANDFN_wl_proxy_set_user_data = null;
pub export var WAYLAND_wl_proxy_get_user_data: SDL_DYNWAYLANDFN_wl_proxy_get_user_data = null;
pub export var WAYLAND_wl_proxy_get_version: SDL_DYNWAYLANDFN_wl_proxy_get_version = null;
pub export var WAYLAND_wl_proxy_get_id: SDL_DYNWAYLANDFN_wl_proxy_get_id = null;
pub export var WAYLAND_wl_proxy_get_class: SDL_DYNWAYLANDFN_wl_proxy_get_class = null;
pub export var WAYLAND_wl_proxy_set_queue: SDL_DYNWAYLANDFN_wl_proxy_set_queue = null;
pub export var WAYLAND_wl_proxy_create_wrapper: SDL_DYNWAYLANDFN_wl_proxy_create_wrapper = null;
pub export var WAYLAND_wl_proxy_wrapper_destroy: SDL_DYNWAYLANDFN_wl_proxy_wrapper_destroy = null;
pub export var WAYLAND_wl_display_connect: SDL_DYNWAYLANDFN_wl_display_connect = null;
pub export var WAYLAND_wl_display_connect_to_fd: SDL_DYNWAYLANDFN_wl_display_connect_to_fd = null;
pub export var WAYLAND_wl_display_disconnect: SDL_DYNWAYLANDFN_wl_display_disconnect = null;
pub export var WAYLAND_wl_display_get_fd: SDL_DYNWAYLANDFN_wl_display_get_fd = null;
pub export var WAYLAND_wl_display_dispatch: SDL_DYNWAYLANDFN_wl_display_dispatch = null;
pub export var WAYLAND_wl_display_dispatch_queue: SDL_DYNWAYLANDFN_wl_display_dispatch_queue = null;
pub export var WAYLAND_wl_display_dispatch_queue_pending: SDL_DYNWAYLANDFN_wl_display_dispatch_queue_pending = null;
pub export var WAYLAND_wl_display_dispatch_pending: SDL_DYNWAYLANDFN_wl_display_dispatch_pending = null;
pub export var WAYLAND_wl_display_prepare_read: SDL_DYNWAYLANDFN_wl_display_prepare_read = null;
pub export var WAYLAND_wl_display_prepare_read_queue: SDL_DYNWAYLANDFN_wl_display_prepare_read_queue = null;
pub export var WAYLAND_wl_display_read_events: SDL_DYNWAYLANDFN_wl_display_read_events = null;
pub export var WAYLAND_wl_display_cancel_read: SDL_DYNWAYLANDFN_wl_display_cancel_read = null;
pub export var WAYLAND_wl_display_get_error: SDL_DYNWAYLANDFN_wl_display_get_error = null;
pub export var WAYLAND_wl_display_flush: SDL_DYNWAYLANDFN_wl_display_flush = null;
pub export var WAYLAND_wl_display_roundtrip: SDL_DYNWAYLANDFN_wl_display_roundtrip = null;
pub export var WAYLAND_wl_display_create_queue: SDL_DYNWAYLANDFN_wl_display_create_queue = null;
pub export var WAYLAND_wl_event_queue_destroy: SDL_DYNWAYLANDFN_wl_event_queue_destroy = null;
pub export var WAYLAND_wl_log_set_handler_client: SDL_DYNWAYLANDFN_wl_log_set_handler_client = null;
pub export var WAYLAND_wl_list_init: SDL_DYNWAYLANDFN_wl_list_init = null;
pub export var WAYLAND_wl_list_insert: SDL_DYNWAYLANDFN_wl_list_insert = null;
pub export var WAYLAND_wl_list_remove: SDL_DYNWAYLANDFN_wl_list_remove = null;
pub export var WAYLAND_wl_list_length: SDL_DYNWAYLANDFN_wl_list_length = null;
pub export var WAYLAND_wl_list_empty: SDL_DYNWAYLANDFN_wl_list_empty = null;
pub export var WAYLAND_wl_list_insert_list: SDL_DYNWAYLANDFN_wl_list_insert_list = null;
pub export var WAYLAND_wl_array_init: SDL_DYNWAYLANDFN_wl_array_init = null;
pub export var WAYLAND_wl_array_release: SDL_DYNWAYLANDFN_wl_array_release = null;
pub export var WAYLAND_wl_array_add: SDL_DYNWAYLANDFN_wl_array_add = null;
pub export var WAYLAND_wl_array_copy: SDL_DYNWAYLANDFN_wl_array_copy = null;
pub export var WAYLAND_wl_proxy_marshal_constructor: SDL_DYNWAYLANDFN_wl_proxy_marshal_constructor = null;
pub export var WAYLAND_wl_proxy_marshal_constructor_versioned: SDL_DYNWAYLANDFN_wl_proxy_marshal_constructor_versioned = null;
pub export var WAYLAND_wl_proxy_set_tag: SDL_DYNWAYLANDFN_wl_proxy_set_tag = null;
pub export var WAYLAND_wl_proxy_get_tag: SDL_DYNWAYLANDFN_wl_proxy_get_tag = null;
pub export var WAYLAND_wl_proxy_marshal_flags: SDL_DYNWAYLANDFN_wl_proxy_marshal_flags = null;
pub export var WAYLAND_wl_proxy_marshal_array_flags: SDL_DYNWAYLANDFN_wl_proxy_marshal_array_flags = null;
pub export var WAYLAND_wl_display_create_queue_with_name: SDL_DYNWAYLANDFN_wl_display_create_queue_with_name = null;
pub export var SDL_WAYLAND_HAVE_WAYLAND_EGL: c_int = 0;
pub export var WAYLAND_wl_egl_window_create: SDL_DYNWAYLANDFN_wl_egl_window_create = null;
pub export var WAYLAND_wl_egl_window_destroy: SDL_DYNWAYLANDFN_wl_egl_window_destroy = null;
pub export var WAYLAND_wl_egl_window_resize: SDL_DYNWAYLANDFN_wl_egl_window_resize = null;
pub export var WAYLAND_wl_egl_window_get_attached_size: SDL_DYNWAYLANDFN_wl_egl_window_get_attached_size = null;
pub export var SDL_WAYLAND_HAVE_WAYLAND_CURSOR: c_int = 0;
pub export var WAYLAND_wl_cursor_theme_load: SDL_DYNWAYLANDFN_wl_cursor_theme_load = null;
pub export var WAYLAND_wl_cursor_theme_destroy: SDL_DYNWAYLANDFN_wl_cursor_theme_destroy = null;
pub export var WAYLAND_wl_cursor_theme_get_cursor: SDL_DYNWAYLANDFN_wl_cursor_theme_get_cursor = null;
pub export var WAYLAND_wl_cursor_image_get_buffer: SDL_DYNWAYLANDFN_wl_cursor_image_get_buffer = null;
pub export var WAYLAND_wl_cursor_frame: SDL_DYNWAYLANDFN_wl_cursor_frame = null;
pub export var SDL_WAYLAND_HAVE_WAYLAND_XKB: c_int = 0;
pub export var WAYLAND_xkb_state_key_get_syms: SDL_DYNWAYLANDFN_xkb_state_key_get_syms = null;
pub export var WAYLAND_xkb_keysym_to_utf8: SDL_DYNWAYLANDFN_xkb_keysym_to_utf8 = null;
pub export var WAYLAND_xkb_keymap_new_from_string: SDL_DYNWAYLANDFN_xkb_keymap_new_from_string = null;
pub export var WAYLAND_xkb_state_new: SDL_DYNWAYLANDFN_xkb_state_new = null;
pub export var WAYLAND_xkb_keymap_key_repeats: SDL_DYNWAYLANDFN_xkb_keymap_key_repeats = null;
pub export var WAYLAND_xkb_keymap_unref: SDL_DYNWAYLANDFN_xkb_keymap_unref = null;
pub export var WAYLAND_xkb_state_unref: SDL_DYNWAYLANDFN_xkb_state_unref = null;
pub export var WAYLAND_xkb_context_unref: SDL_DYNWAYLANDFN_xkb_context_unref = null;
pub export var WAYLAND_xkb_context_new: SDL_DYNWAYLANDFN_xkb_context_new = null;
pub export var WAYLAND_xkb_state_update_mask: SDL_DYNWAYLANDFN_xkb_state_update_mask = null;
pub export var WAYLAND_xkb_compose_table_new_from_locale: SDL_DYNWAYLANDFN_xkb_compose_table_new_from_locale = null;
pub export var WAYLAND_xkb_compose_state_reset: SDL_DYNWAYLANDFN_xkb_compose_state_reset = null;
pub export var WAYLAND_xkb_compose_table_unref: SDL_DYNWAYLANDFN_xkb_compose_table_unref = null;
pub export var WAYLAND_xkb_compose_state_new: SDL_DYNWAYLANDFN_xkb_compose_state_new = null;
pub export var WAYLAND_xkb_compose_state_unref: SDL_DYNWAYLANDFN_xkb_compose_state_unref = null;
pub export var WAYLAND_xkb_compose_state_feed: SDL_DYNWAYLANDFN_xkb_compose_state_feed = null;
pub export var WAYLAND_xkb_compose_state_get_status: SDL_DYNWAYLANDFN_xkb_compose_state_get_status = null;
pub export var WAYLAND_xkb_compose_state_get_one_sym: SDL_DYNWAYLANDFN_xkb_compose_state_get_one_sym = null;
pub export var WAYLAND_xkb_keymap_key_for_each: SDL_DYNWAYLANDFN_xkb_keymap_key_for_each = null;
pub export var WAYLAND_xkb_keymap_num_layouts: SDL_DYNWAYLANDFN_xkb_keymap_num_layouts = null;
pub export var WAYLAND_xkb_keymap_key_get_syms_by_level: SDL_DYNWAYLANDFN_xkb_keymap_key_get_syms_by_level = null;
pub export var WAYLAND_xkb_keymap_num_levels_for_key: SDL_DYNWAYLANDFN_xkb_keymap_num_levels_for_key = null;
pub export var WAYLAND_xkb_keysym_to_utf32: SDL_DYNWAYLANDFN_xkb_keysym_to_utf32 = null;
pub export var WAYLAND_xkb_keymap_mod_get_index: SDL_DYNWAYLANDFN_xkb_keymap_mod_get_index = null;
pub export var WAYLAND_xkb_keymap_layout_get_name: SDL_DYNWAYLANDFN_xkb_keymap_layout_get_name = null;
pub export var WAYLAND_xkb_keymap_key_get_mods_for_level: SDL_DYNWAYLANDFN_xkb_keymap_key_get_mods_for_level = null;
pub export var WAYLAND_xkb_keymap_mod_get_mask: SDL_DYNWAYLANDFN_xkb_keymap_mod_get_mask = null;
pub export var SDL_WAYLAND_HAVE_WAYLAND_LIBDECOR: c_int = 0;
pub export var WAYLAND_libdecor_unref: SDL_DYNWAYLANDFN_libdecor_unref = null;
pub export var WAYLAND_libdecor_new: SDL_DYNWAYLANDFN_libdecor_new = null;
pub export var WAYLAND_libdecor_decorate: SDL_DYNWAYLANDFN_libdecor_decorate = null;
pub export var WAYLAND_libdecor_frame_unref: SDL_DYNWAYLANDFN_libdecor_frame_unref = null;
pub export var WAYLAND_libdecor_frame_set_title: SDL_DYNWAYLANDFN_libdecor_frame_set_title = null;
pub export var WAYLAND_libdecor_frame_set_app_id: SDL_DYNWAYLANDFN_libdecor_frame_set_app_id = null;
pub export var WAYLAND_libdecor_frame_set_max_content_size: SDL_DYNWAYLANDFN_libdecor_frame_set_max_content_size = null;
pub export var WAYLAND_libdecor_frame_set_min_content_size: SDL_DYNWAYLANDFN_libdecor_frame_set_min_content_size = null;
pub export var WAYLAND_libdecor_frame_resize: SDL_DYNWAYLANDFN_libdecor_frame_resize = null;
pub export var WAYLAND_libdecor_frame_move: SDL_DYNWAYLANDFN_libdecor_frame_move = null;
pub export var WAYLAND_libdecor_frame_commit: SDL_DYNWAYLANDFN_libdecor_frame_commit = null;
pub export var WAYLAND_libdecor_frame_set_minimized: SDL_DYNWAYLANDFN_libdecor_frame_set_minimized = null;
pub export var WAYLAND_libdecor_frame_set_maximized: SDL_DYNWAYLANDFN_libdecor_frame_set_maximized = null;
pub export var WAYLAND_libdecor_frame_unset_maximized: SDL_DYNWAYLANDFN_libdecor_frame_unset_maximized = null;
pub export var WAYLAND_libdecor_frame_set_fullscreen: SDL_DYNWAYLANDFN_libdecor_frame_set_fullscreen = null;
pub export var WAYLAND_libdecor_frame_unset_fullscreen: SDL_DYNWAYLANDFN_libdecor_frame_unset_fullscreen = null;
pub export var WAYLAND_libdecor_frame_set_capabilities: SDL_DYNWAYLANDFN_libdecor_frame_set_capabilities = null;
pub export var WAYLAND_libdecor_frame_unset_capabilities: SDL_DYNWAYLANDFN_libdecor_frame_unset_capabilities = null;
pub export var WAYLAND_libdecor_frame_has_capability: SDL_DYNWAYLANDFN_libdecor_frame_has_capability = null;
pub export var WAYLAND_libdecor_frame_set_visibility: SDL_DYNWAYLANDFN_libdecor_frame_set_visibility = null;
pub export var WAYLAND_libdecor_frame_is_visible: SDL_DYNWAYLANDFN_libdecor_frame_is_visible = null;
pub export var WAYLAND_libdecor_frame_is_floating: SDL_DYNWAYLANDFN_libdecor_frame_is_floating = null;
pub export var WAYLAND_libdecor_frame_set_parent: SDL_DYNWAYLANDFN_libdecor_frame_set_parent = null;
pub export var WAYLAND_libdecor_frame_show_window_menu: SDL_DYNWAYLANDFN_libdecor_frame_show_window_menu = null;
pub export var WAYLAND_libdecor_frame_get_xdg_surface: SDL_DYNWAYLANDFN_libdecor_frame_get_xdg_surface = null;
pub export var WAYLAND_libdecor_frame_get_xdg_toplevel: SDL_DYNWAYLANDFN_libdecor_frame_get_xdg_toplevel = null;
pub export var WAYLAND_libdecor_frame_translate_coordinate: SDL_DYNWAYLANDFN_libdecor_frame_translate_coordinate = null;
pub export var WAYLAND_libdecor_frame_map: SDL_DYNWAYLANDFN_libdecor_frame_map = null;
pub export var WAYLAND_libdecor_state_new: SDL_DYNWAYLANDFN_libdecor_state_new = null;
pub export var WAYLAND_libdecor_state_free: SDL_DYNWAYLANDFN_libdecor_state_free = null;
pub export var WAYLAND_libdecor_configuration_get_content_size: SDL_DYNWAYLANDFN_libdecor_configuration_get_content_size = null;
pub export var WAYLAND_libdecor_configuration_get_window_state: SDL_DYNWAYLANDFN_libdecor_configuration_get_window_state = null;
pub export var WAYLAND_libdecor_dispatch: SDL_DYNWAYLANDFN_libdecor_dispatch = null;
pub export var WAYLAND_libdecor_frame_get_min_content_size: SDL_DYNWAYLANDFN_libdecor_frame_get_min_content_size = null;
pub export var WAYLAND_libdecor_frame_get_max_content_size: SDL_DYNWAYLANDFN_libdecor_frame_get_max_content_size = null;
pub export var WAYLAND_libdecor_frame_get_wm_capabilities: SDL_DYNWAYLANDFN_libdecor_frame_get_wm_capabilities = null;
pub var wayland_load_refcount: c_int = 0;
pub export fn SDL_WAYLAND_UnloadSymbols() void {
    @setEvalBranchQuota(100000);
    if (wayland_load_refcount > @as(c_int, 0)) {
        if ((blk: {
            const ref = &wayland_load_refcount;
            ref.* -= 1;
            break :blk ref.*;
        }) == @as(c_int, 0)) {
            var i: c_int = undefined;
            _ = &i;
            SDL_WAYLAND_HAVE_WAYLAND_CLIENT = 0;
            WAYLAND_wl_proxy_marshal = null;
            WAYLAND_wl_proxy_create = null;
            WAYLAND_wl_proxy_destroy = null;
            WAYLAND_wl_proxy_add_listener = null;
            WAYLAND_wl_proxy_set_user_data = null;
            WAYLAND_wl_proxy_get_user_data = null;
            WAYLAND_wl_proxy_get_version = null;
            WAYLAND_wl_proxy_get_id = null;
            WAYLAND_wl_proxy_get_class = null;
            WAYLAND_wl_proxy_set_queue = null;
            WAYLAND_wl_proxy_create_wrapper = null;
            WAYLAND_wl_proxy_wrapper_destroy = null;
            WAYLAND_wl_display_connect = null;
            WAYLAND_wl_display_connect_to_fd = null;
            WAYLAND_wl_display_disconnect = null;
            WAYLAND_wl_display_get_fd = null;
            WAYLAND_wl_display_dispatch = null;
            WAYLAND_wl_display_dispatch_queue = null;
            WAYLAND_wl_display_dispatch_queue_pending = null;
            WAYLAND_wl_display_dispatch_pending = null;
            WAYLAND_wl_display_prepare_read = null;
            WAYLAND_wl_display_prepare_read_queue = null;
            WAYLAND_wl_display_read_events = null;
            WAYLAND_wl_display_cancel_read = null;
            WAYLAND_wl_display_get_error = null;
            WAYLAND_wl_display_flush = null;
            WAYLAND_wl_display_roundtrip = null;
            WAYLAND_wl_display_create_queue = null;
            WAYLAND_wl_event_queue_destroy = null;
            WAYLAND_wl_log_set_handler_client = null;
            WAYLAND_wl_list_init = null;
            WAYLAND_wl_list_insert = null;
            WAYLAND_wl_list_remove = null;
            WAYLAND_wl_list_length = null;
            WAYLAND_wl_list_empty = null;
            WAYLAND_wl_list_insert_list = null;
            WAYLAND_wl_array_init = null;
            WAYLAND_wl_array_release = null;
            WAYLAND_wl_array_add = null;
            WAYLAND_wl_array_copy = null;
            WAYLAND_wl_proxy_marshal_constructor = null;
            WAYLAND_wl_proxy_marshal_constructor_versioned = null;
            WAYLAND_wl_proxy_set_tag = null;
            WAYLAND_wl_proxy_get_tag = null;
            WAYLAND_wl_proxy_marshal_flags = null;
            WAYLAND_wl_proxy_marshal_array_flags = null;
            WAYLAND_wl_display_create_queue_with_name = null;
            SDL_WAYLAND_HAVE_WAYLAND_EGL = 0;
            WAYLAND_wl_egl_window_create = null;
            WAYLAND_wl_egl_window_destroy = null;
            WAYLAND_wl_egl_window_resize = null;
            WAYLAND_wl_egl_window_get_attached_size = null;
            SDL_WAYLAND_HAVE_WAYLAND_CURSOR = 0;
            WAYLAND_wl_cursor_theme_load = null;
            WAYLAND_wl_cursor_theme_destroy = null;
            WAYLAND_wl_cursor_theme_get_cursor = null;
            WAYLAND_wl_cursor_image_get_buffer = null;
            WAYLAND_wl_cursor_frame = null;
            SDL_WAYLAND_HAVE_WAYLAND_XKB = 0;
            WAYLAND_xkb_state_key_get_syms = null;
            WAYLAND_xkb_keysym_to_utf8 = null;
            WAYLAND_xkb_keymap_new_from_string = null;
            WAYLAND_xkb_state_new = null;
            WAYLAND_xkb_keymap_key_repeats = null;
            WAYLAND_xkb_keymap_unref = null;
            WAYLAND_xkb_state_unref = null;
            WAYLAND_xkb_context_unref = null;
            WAYLAND_xkb_context_new = null;
            WAYLAND_xkb_state_update_mask = null;
            WAYLAND_xkb_compose_table_new_from_locale = null;
            WAYLAND_xkb_compose_state_reset = null;
            WAYLAND_xkb_compose_table_unref = null;
            WAYLAND_xkb_compose_state_new = null;
            WAYLAND_xkb_compose_state_unref = null;
            WAYLAND_xkb_compose_state_feed = null;
            WAYLAND_xkb_compose_state_get_status = null;
            WAYLAND_xkb_compose_state_get_one_sym = null;
            WAYLAND_xkb_keymap_key_for_each = null;
            WAYLAND_xkb_keymap_num_layouts = null;
            WAYLAND_xkb_keymap_key_get_syms_by_level = null;
            WAYLAND_xkb_keymap_num_levels_for_key = null;
            WAYLAND_xkb_keysym_to_utf32 = null;
            WAYLAND_xkb_keymap_mod_get_index = null;
            WAYLAND_xkb_keymap_layout_get_name = null;
            WAYLAND_xkb_keymap_key_get_mods_for_level = null;
            WAYLAND_xkb_keymap_mod_get_mask = null;
            SDL_WAYLAND_HAVE_WAYLAND_LIBDECOR = 0;
            WAYLAND_libdecor_unref = null;
            WAYLAND_libdecor_new = null;
            WAYLAND_libdecor_decorate = null;
            WAYLAND_libdecor_frame_unref = null;
            WAYLAND_libdecor_frame_set_title = null;
            WAYLAND_libdecor_frame_set_app_id = null;
            WAYLAND_libdecor_frame_set_max_content_size = null;
            WAYLAND_libdecor_frame_set_min_content_size = null;
            WAYLAND_libdecor_frame_resize = null;
            WAYLAND_libdecor_frame_move = null;
            WAYLAND_libdecor_frame_commit = null;
            WAYLAND_libdecor_frame_set_minimized = null;
            WAYLAND_libdecor_frame_set_maximized = null;
            WAYLAND_libdecor_frame_unset_maximized = null;
            WAYLAND_libdecor_frame_set_fullscreen = null;
            WAYLAND_libdecor_frame_unset_fullscreen = null;
            WAYLAND_libdecor_frame_set_capabilities = null;
            WAYLAND_libdecor_frame_unset_capabilities = null;
            WAYLAND_libdecor_frame_has_capability = null;
            WAYLAND_libdecor_frame_set_visibility = null;
            WAYLAND_libdecor_frame_is_visible = null;
            WAYLAND_libdecor_frame_is_floating = null;
            WAYLAND_libdecor_frame_set_parent = null;
            WAYLAND_libdecor_frame_show_window_menu = null;
            WAYLAND_libdecor_frame_get_xdg_surface = null;
            WAYLAND_libdecor_frame_get_xdg_toplevel = null;
            WAYLAND_libdecor_frame_translate_coordinate = null;
            WAYLAND_libdecor_frame_map = null;
            WAYLAND_libdecor_state_new = null;
            WAYLAND_libdecor_state_free = null;
            WAYLAND_libdecor_configuration_get_content_size = null;
            WAYLAND_libdecor_configuration_get_window_state = null;
            WAYLAND_libdecor_dispatch = null;
            WAYLAND_libdecor_frame_get_min_content_size = null;
            WAYLAND_libdecor_frame_get_max_content_size = null;
            WAYLAND_libdecor_frame_get_wm_capabilities = null;
            {
                i = 0;
                while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(waylandlibs)) / @sizeOf(@TypeOf(waylandlibs[@as(c_int, 0)])))) : (i += 1) {
                    if (waylandlibs[@bitCast(@as(isize, @intCast(i)))].lib != null) {
                        SDL_UnloadObject_REAL(waylandlibs[@bitCast(@as(isize, @intCast(i)))].lib);
                        waylandlibs[@bitCast(@as(isize, @intCast(i)))].lib = null;
                    }
                }
            }
        }
    }
}
pub export fn SDL_WAYLAND_LoadSymbols() bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if ((blk: {
        const ref = &wayland_load_refcount;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }) == @as(c_int, 0)) {
        var i: c_int = undefined;
        _ = &i;
        var thismod: [*c]c_int = null;
        _ = &thismod;
        {
            i = 0;
            while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(waylandlibs)) / @sizeOf(@TypeOf(waylandlibs[@as(c_int, 0)])))) : (i += 1) {
                if (waylandlibs[@bitCast(@as(isize, @intCast(i)))].libname != null) {
                    if ((waylandlibs[@bitCast(@as(isize, @intCast(i)))].hint != null) and !SDL_GetHintBoolean_REAL(waylandlibs[@bitCast(@as(isize, @intCast(i)))].hint, waylandlibs[@bitCast(@as(isize, @intCast(i)))].hint_default)) {
                        continue;
                    }
                    waylandlibs[@bitCast(@as(isize, @intCast(i)))].lib = SDL_LoadObject_REAL(waylandlibs[@bitCast(@as(isize, @intCast(i)))].libname);
                }
            }
        }
        SDL_WAYLAND_HAVE_WAYLAND_CLIENT = 1;
        SDL_WAYLAND_HAVE_WAYLAND_EGL = 1;
        SDL_WAYLAND_HAVE_WAYLAND_CURSOR = 1;
        SDL_WAYLAND_HAVE_WAYLAND_XKB = 1;
        SDL_WAYLAND_HAVE_WAYLAND_LIBDECOR = 1;
        thismod = &SDL_WAYLAND_HAVE_WAYLAND_CLIENT;
        WAYLAND_wl_proxy_marshal = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_marshal", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_create = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_create", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_destroy = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_destroy", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_add_listener = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_add_listener", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_set_user_data = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_set_user_data", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_get_user_data = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_get_user_data", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_get_version = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_get_version", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_get_id = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_get_id", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_get_class = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_get_class", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_set_queue = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_set_queue", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_create_wrapper = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_create_wrapper", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_wrapper_destroy = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_wrapper_destroy", thismod, @"true" != 0)));
        WAYLAND_wl_display_connect = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_connect", thismod, @"true" != 0)));
        WAYLAND_wl_display_connect_to_fd = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_connect_to_fd", thismod, @"true" != 0)));
        WAYLAND_wl_display_disconnect = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_disconnect", thismod, @"true" != 0)));
        WAYLAND_wl_display_get_fd = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_get_fd", thismod, @"true" != 0)));
        WAYLAND_wl_display_dispatch = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_dispatch", thismod, @"true" != 0)));
        WAYLAND_wl_display_dispatch_queue = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_dispatch_queue", thismod, @"true" != 0)));
        WAYLAND_wl_display_dispatch_queue_pending = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_dispatch_queue_pending", thismod, @"true" != 0)));
        WAYLAND_wl_display_dispatch_pending = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_dispatch_pending", thismod, @"true" != 0)));
        WAYLAND_wl_display_prepare_read = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_prepare_read", thismod, @"true" != 0)));
        WAYLAND_wl_display_prepare_read_queue = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_prepare_read_queue", thismod, @"true" != 0)));
        WAYLAND_wl_display_read_events = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_read_events", thismod, @"true" != 0)));
        WAYLAND_wl_display_cancel_read = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_cancel_read", thismod, @"true" != 0)));
        WAYLAND_wl_display_get_error = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_get_error", thismod, @"true" != 0)));
        WAYLAND_wl_display_flush = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_flush", thismod, @"true" != 0)));
        WAYLAND_wl_display_roundtrip = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_roundtrip", thismod, @"true" != 0)));
        WAYLAND_wl_display_create_queue = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_create_queue", thismod, @"true" != 0)));
        WAYLAND_wl_event_queue_destroy = @ptrCast(@alignCast(WAYLAND_GetSym("wl_event_queue_destroy", thismod, @"true" != 0)));
        WAYLAND_wl_log_set_handler_client = @ptrCast(@alignCast(WAYLAND_GetSym("wl_log_set_handler_client", thismod, @"true" != 0)));
        WAYLAND_wl_list_init = @ptrCast(@alignCast(WAYLAND_GetSym("wl_list_init", thismod, @"true" != 0)));
        WAYLAND_wl_list_insert = @ptrCast(@alignCast(WAYLAND_GetSym("wl_list_insert", thismod, @"true" != 0)));
        WAYLAND_wl_list_remove = @ptrCast(@alignCast(WAYLAND_GetSym("wl_list_remove", thismod, @"true" != 0)));
        WAYLAND_wl_list_length = @ptrCast(@alignCast(WAYLAND_GetSym("wl_list_length", thismod, @"true" != 0)));
        WAYLAND_wl_list_empty = @ptrCast(@alignCast(WAYLAND_GetSym("wl_list_empty", thismod, @"true" != 0)));
        WAYLAND_wl_list_insert_list = @ptrCast(@alignCast(WAYLAND_GetSym("wl_list_insert_list", thismod, @"true" != 0)));
        WAYLAND_wl_array_init = @ptrCast(@alignCast(WAYLAND_GetSym("wl_array_init", thismod, @"true" != 0)));
        WAYLAND_wl_array_release = @ptrCast(@alignCast(WAYLAND_GetSym("wl_array_release", thismod, @"true" != 0)));
        WAYLAND_wl_array_add = @ptrCast(@alignCast(WAYLAND_GetSym("wl_array_add", thismod, @"true" != 0)));
        WAYLAND_wl_array_copy = @ptrCast(@alignCast(WAYLAND_GetSym("wl_array_copy", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_marshal_constructor = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_marshal_constructor", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_marshal_constructor_versioned = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_marshal_constructor_versioned", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_set_tag = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_set_tag", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_get_tag = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_get_tag", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_marshal_flags = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_marshal_flags", thismod, @"true" != 0)));
        WAYLAND_wl_proxy_marshal_array_flags = @ptrCast(@alignCast(WAYLAND_GetSym("wl_proxy_marshal_array_flags", thismod, @"true" != 0)));
        WAYLAND_wl_display_create_queue_with_name = @ptrCast(@alignCast(WAYLAND_GetSym("wl_display_create_queue_with_name", thismod, @"false" != 0)));
        thismod = &SDL_WAYLAND_HAVE_WAYLAND_EGL;
        WAYLAND_wl_egl_window_create = @ptrCast(@alignCast(WAYLAND_GetSym("wl_egl_window_create", thismod, @"true" != 0)));
        WAYLAND_wl_egl_window_destroy = @ptrCast(@alignCast(WAYLAND_GetSym("wl_egl_window_destroy", thismod, @"true" != 0)));
        WAYLAND_wl_egl_window_resize = @ptrCast(@alignCast(WAYLAND_GetSym("wl_egl_window_resize", thismod, @"true" != 0)));
        WAYLAND_wl_egl_window_get_attached_size = @ptrCast(@alignCast(WAYLAND_GetSym("wl_egl_window_get_attached_size", thismod, @"true" != 0)));
        thismod = &SDL_WAYLAND_HAVE_WAYLAND_CURSOR;
        WAYLAND_wl_cursor_theme_load = @ptrCast(@alignCast(WAYLAND_GetSym("wl_cursor_theme_load", thismod, @"true" != 0)));
        WAYLAND_wl_cursor_theme_destroy = @ptrCast(@alignCast(WAYLAND_GetSym("wl_cursor_theme_destroy", thismod, @"true" != 0)));
        WAYLAND_wl_cursor_theme_get_cursor = @ptrCast(@alignCast(WAYLAND_GetSym("wl_cursor_theme_get_cursor", thismod, @"true" != 0)));
        WAYLAND_wl_cursor_image_get_buffer = @ptrCast(@alignCast(WAYLAND_GetSym("wl_cursor_image_get_buffer", thismod, @"true" != 0)));
        WAYLAND_wl_cursor_frame = @ptrCast(@alignCast(WAYLAND_GetSym("wl_cursor_frame", thismod, @"true" != 0)));
        thismod = &SDL_WAYLAND_HAVE_WAYLAND_XKB;
        WAYLAND_xkb_state_key_get_syms = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_state_key_get_syms", thismod, @"true" != 0)));
        WAYLAND_xkb_keysym_to_utf8 = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_keysym_to_utf8", thismod, @"true" != 0)));
        WAYLAND_xkb_keymap_new_from_string = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_keymap_new_from_string", thismod, @"true" != 0)));
        WAYLAND_xkb_state_new = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_state_new", thismod, @"true" != 0)));
        WAYLAND_xkb_keymap_key_repeats = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_keymap_key_repeats", thismod, @"true" != 0)));
        WAYLAND_xkb_keymap_unref = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_keymap_unref", thismod, @"true" != 0)));
        WAYLAND_xkb_state_unref = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_state_unref", thismod, @"true" != 0)));
        WAYLAND_xkb_context_unref = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_context_unref", thismod, @"true" != 0)));
        WAYLAND_xkb_context_new = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_context_new", thismod, @"true" != 0)));
        WAYLAND_xkb_state_update_mask = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_state_update_mask", thismod, @"true" != 0)));
        WAYLAND_xkb_compose_table_new_from_locale = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_compose_table_new_from_locale", thismod, @"true" != 0)));
        WAYLAND_xkb_compose_state_reset = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_compose_state_reset", thismod, @"true" != 0)));
        WAYLAND_xkb_compose_table_unref = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_compose_table_unref", thismod, @"true" != 0)));
        WAYLAND_xkb_compose_state_new = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_compose_state_new", thismod, @"true" != 0)));
        WAYLAND_xkb_compose_state_unref = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_compose_state_unref", thismod, @"true" != 0)));
        WAYLAND_xkb_compose_state_feed = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_compose_state_feed", thismod, @"true" != 0)));
        WAYLAND_xkb_compose_state_get_status = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_compose_state_get_status", thismod, @"true" != 0)));
        WAYLAND_xkb_compose_state_get_one_sym = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_compose_state_get_one_sym", thismod, @"true" != 0)));
        WAYLAND_xkb_keymap_key_for_each = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_keymap_key_for_each", thismod, @"true" != 0)));
        WAYLAND_xkb_keymap_num_layouts = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_keymap_num_layouts", thismod, @"true" != 0)));
        WAYLAND_xkb_keymap_key_get_syms_by_level = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_keymap_key_get_syms_by_level", thismod, @"true" != 0)));
        WAYLAND_xkb_keymap_num_levels_for_key = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_keymap_num_levels_for_key", thismod, @"true" != 0)));
        WAYLAND_xkb_keysym_to_utf32 = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_keysym_to_utf32", thismod, @"true" != 0)));
        WAYLAND_xkb_keymap_mod_get_index = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_keymap_mod_get_index", thismod, @"true" != 0)));
        WAYLAND_xkb_keymap_layout_get_name = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_keymap_layout_get_name", thismod, @"true" != 0)));
        WAYLAND_xkb_keymap_key_get_mods_for_level = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_keymap_key_get_mods_for_level", thismod, @"true" != 0)));
        WAYLAND_xkb_keymap_mod_get_mask = @ptrCast(@alignCast(WAYLAND_GetSym("xkb_keymap_mod_get_mask", thismod, @"true" != 0)));
        thismod = &SDL_WAYLAND_HAVE_WAYLAND_LIBDECOR;
        WAYLAND_libdecor_unref = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_unref", thismod, @"true" != 0)));
        WAYLAND_libdecor_new = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_new", thismod, @"true" != 0)));
        WAYLAND_libdecor_decorate = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_decorate", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_unref = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_unref", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_set_title = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_set_title", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_set_app_id = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_set_app_id", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_set_max_content_size = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_set_max_content_size", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_set_min_content_size = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_set_min_content_size", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_resize = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_resize", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_move = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_move", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_commit = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_commit", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_set_minimized = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_set_minimized", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_set_maximized = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_set_maximized", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_unset_maximized = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_unset_maximized", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_set_fullscreen = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_set_fullscreen", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_unset_fullscreen = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_unset_fullscreen", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_set_capabilities = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_set_capabilities", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_unset_capabilities = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_unset_capabilities", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_has_capability = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_has_capability", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_set_visibility = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_set_visibility", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_is_visible = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_is_visible", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_is_floating = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_is_floating", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_set_parent = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_set_parent", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_show_window_menu = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_show_window_menu", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_get_xdg_surface = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_get_xdg_surface", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_get_xdg_toplevel = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_get_xdg_toplevel", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_translate_coordinate = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_translate_coordinate", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_map = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_map", thismod, @"true" != 0)));
        WAYLAND_libdecor_state_new = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_state_new", thismod, @"true" != 0)));
        WAYLAND_libdecor_state_free = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_state_free", thismod, @"true" != 0)));
        WAYLAND_libdecor_configuration_get_content_size = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_configuration_get_content_size", thismod, @"true" != 0)));
        WAYLAND_libdecor_configuration_get_window_state = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_configuration_get_window_state", thismod, @"true" != 0)));
        WAYLAND_libdecor_dispatch = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_dispatch", thismod, @"true" != 0)));
        WAYLAND_libdecor_frame_get_min_content_size = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_get_min_content_size", thismod, @"false" != 0)));
        WAYLAND_libdecor_frame_get_max_content_size = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_get_max_content_size", thismod, @"false" != 0)));
        WAYLAND_libdecor_frame_get_wm_capabilities = @ptrCast(@alignCast(WAYLAND_GetSym("libdecor_frame_get_wm_capabilities", thismod, @"false" != 0)));
        if ((((SDL_WAYLAND_HAVE_WAYLAND_CLIENT != 0) and (SDL_WAYLAND_HAVE_WAYLAND_CURSOR != 0)) and (SDL_WAYLAND_HAVE_WAYLAND_EGL != 0)) and (SDL_WAYLAND_HAVE_WAYLAND_XKB != 0)) {
            _ = SDL_ClearError_REAL();
        } else {
            SDL_WAYLAND_UnloadSymbols();
            result = @"false" != 0;
        }
    }
    return result;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
