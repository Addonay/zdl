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
pub const __helpers = @import("std").zig.c_translation.helpers;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __time_t = c_long;
pub const __suseconds_t = c_long;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __syscall_slong_t = c_long;
pub const dev_t = __dev_t;
pub const time_t = __time_t;
pub const struct_timeval = extern struct {
    tv_sec: __time_t = 0,
    tv_usec: __suseconds_t = 0,
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_CompareCallback = ?*const fn (a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) c_int;
pub extern fn SDL_qsort_REAL(base: ?*anyopaque, nmemb: usize, size: usize, compare: SDL_CompareCallback) void;
pub extern fn SDL_isdigit_REAL(x: c_int) c_int;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strrchr_REAL(str: [*c]const u8, c: c_int) [*c]u8;
pub extern fn SDL_strstr_REAL(haystack: [*c]const u8, needle: [*c]const u8) [*c]u8;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_strncmp_REAL(str1: [*c]const u8, str2: [*c]const u8, maxlen: usize) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_floorf_REAL(x: f32) f32;
pub const SDL_ASSERTION_RETRY: c_int = 0;
pub const SDL_ASSERTION_BREAK: c_int = 1;
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
pub extern fn SDL_ReportAssertion_REAL(data: [*c]SDL_AssertData, func: [*c]const u8, file: [*c]const u8, line: c_int) SDL_AssertState;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_SetBooleanProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, value: bool) bool;
pub const struct_SDL_GUID = extern struct {
    data: [16]Uint8 = @import("std").mem.zeroes([16]Uint8),
};
pub const SDL_GUID = struct_SDL_GUID;
pub const enum_SDL_PowerState = c_int;
pub const SDL_PowerState = enum_SDL_PowerState;
pub const struct_SDL_Sensor = opaque {
};
pub const SDL_Sensor = struct_SDL_Sensor;
pub const SDL_SensorID = Uint32;
pub const SDL_SENSOR_ACCEL: c_int = 1;
pub const SDL_SENSOR_GYRO: c_int = 2;
pub const enum_SDL_SensorType = c_int;
pub const SDL_SensorType = enum_SDL_SensorType;
pub const SDL_JoystickID = Uint32;
pub const struct_SDL_JoystickAxisInfo = extern struct {
    initial_value: Sint16 = 0,
    value: Sint16 = 0,
    zero: Sint16 = 0,
    has_initial_value: bool = false,
    has_second_value: bool = false,
    sent_initial_value: bool = false,
    sending_initial_value: bool = false,
};
pub const SDL_JoystickAxisInfo = struct_SDL_JoystickAxisInfo;
pub const struct_SDL_JoystickBallData = extern struct {
    dx: c_int = 0,
    dy: c_int = 0,
};
pub const SDL_JoystickBallData = struct_SDL_JoystickBallData;
pub const struct_SDL_JoystickTouchpadFingerInfo = extern struct {
    down: bool = false,
    x: f32 = 0,
    y: f32 = 0,
    pressure: f32 = 0,
};
pub const SDL_JoystickTouchpadFingerInfo = struct_SDL_JoystickTouchpadFingerInfo;
pub const struct_SDL_JoystickTouchpadInfo = extern struct {
    nfingers: c_int = 0,
    fingers: [*c]SDL_JoystickTouchpadFingerInfo = null,
};
pub const SDL_JoystickTouchpadInfo = struct_SDL_JoystickTouchpadInfo;
pub const struct_SDL_JoystickSensorInfo = extern struct {
    type: SDL_SensorType = @import("std").mem.zeroes(SDL_SensorType),
    enabled: bool = false,
    rate: f32 = 0,
    data: [3]f32 = @import("std").mem.zeroes([3]f32),
};
pub const SDL_JoystickSensorInfo = struct_SDL_JoystickSensorInfo;
pub const enum_SDL_GamepadCapSenseType = c_int;
pub const SDL_GamepadCapSenseType = enum_SDL_GamepadCapSenseType;
pub const struct_SDL_JoystickCapSenseInfo = extern struct {
    type: SDL_GamepadCapSenseType = @import("std").mem.zeroes(SDL_GamepadCapSenseType),
    down: bool = false,
};
pub const SDL_JoystickCapSenseInfo = struct_SDL_JoystickCapSenseInfo;
pub const enum_SDL_JoystickConnectionState = c_int;
pub const SDL_JoystickConnectionState = enum_SDL_JoystickConnectionState;
pub const SDL_Joystick = struct_SDL_Joystick;
pub const struct_SDL_InputMapping = extern struct {
    kind: EMappingKind = @import("std").mem.zeroes(EMappingKind),
    target: Uint8 = 0,
    axis_reversed: bool = false,
    half_axis_positive: bool = false,
    half_axis_negative: bool = false,
};
pub const SDL_InputMapping = struct_SDL_InputMapping;
pub const struct_SDL_GamepadMapping = extern struct {
    a: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    b: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    x: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    y: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    back: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    guide: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    start: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    leftstick: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    rightstick: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    leftshoulder: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    rightshoulder: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    dpup: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    dpdown: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    dpleft: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    dpright: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc1: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc2: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc3: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc4: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc5: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    misc6: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    right_paddle1: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    left_paddle1: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    right_paddle2: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    left_paddle2: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    leftx: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    lefty: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    rightx: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    righty: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    lefttrigger: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    righttrigger: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
    touchpad: SDL_InputMapping = @import("std").mem.zeroes(SDL_InputMapping),
};
pub const SDL_GamepadMapping = struct_SDL_GamepadMapping;
pub const struct_SDL_JoystickDriver = extern struct {
    Init: ?*const fn () callconv(.c) bool = null,
    GetCount: ?*const fn () callconv(.c) c_int = null,
    Detect: ?*const fn () callconv(.c) void = null,
    IsDevicePresent: ?*const fn (vendor_id: Uint16, product_id: Uint16, version: Uint16, name: [*c]const u8) callconv(.c) bool = null,
    GetDeviceName: ?*const fn (device_index: c_int) callconv(.c) [*c]const u8 = null,
    GetDevicePath: ?*const fn (device_index: c_int) callconv(.c) [*c]const u8 = null,
    GetDeviceSteamVirtualGamepadSlot: ?*const fn (device_index: c_int) callconv(.c) c_int = null,
    GetDevicePlayerIndex: ?*const fn (device_index: c_int) callconv(.c) c_int = null,
    SetDevicePlayerIndex: ?*const fn (device_index: c_int, player_index: c_int) callconv(.c) void = null,
    GetDeviceGUID: ?*const fn (device_index: c_int) callconv(.c) SDL_GUID = null,
    GetDeviceInstanceID: ?*const fn (device_index: c_int) callconv(.c) SDL_JoystickID = null,
    Open: ?*const fn (joystick: [*c]SDL_Joystick, device_index: c_int) callconv(.c) bool = null,
    Rumble: ?*const fn (joystick: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool = null,
    RumbleTriggers: ?*const fn (joystick: [*c]SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16) callconv(.c) bool = null,
    SetLED: ?*const fn (joystick: [*c]SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) callconv(.c) bool = null,
    SendEffect: ?*const fn (joystick: [*c]SDL_Joystick, data: ?*const anyopaque, size: c_int) callconv(.c) bool = null,
    SetSensorsEnabled: ?*const fn (joystick: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool = null,
    Update: ?*const fn (joystick: [*c]SDL_Joystick) callconv(.c) void = null,
    Close: ?*const fn (joystick: [*c]SDL_Joystick) callconv(.c) void = null,
    Quit: ?*const fn () callconv(.c) void = null,
    GetGamepadMapping: ?*const fn (device_index: c_int, out: [*c]SDL_GamepadMapping) callconv(.c) bool = null,
};
pub const struct_SDL_joylist_item = extern struct {
    device_instance: SDL_JoystickID = 0,
    path: [*c]u8 = null,
    vendor: Uint16 = 0,
    product: Uint16 = 0,
    name: [*c]u8 = null,
    driver: [*c]u8 = null,
    guid: SDL_GUID = @import("std").mem.zeroes(SDL_GUID),
    devnum: dev_t = 0,
    steam_virtual_gamepad_slot: c_int = 0,
    hwdata: [*c]struct_joystick_hwdata = null,
    next: [*c]struct_SDL_joylist_item = null,
    checked_mapping: bool = false,
    mapping: [*c]SDL_GamepadMapping = null,
};
pub const struct_SDL_sensorlist_item = extern struct {
    path: [*c]u8 = null,
    devnum: dev_t = 0,
    hwdata: [*c]struct_joystick_hwdata = null,
    next: [*c]struct_SDL_sensorlist_item = null,
};
pub const __u16 = c_ushort;
pub const __s16 = c_short;
pub const struct_ff_trigger = extern struct {
    button: __u16 = 0,
    interval: __u16 = 0,
};
pub const struct_ff_replay = extern struct {
    length: __u16 = 0,
    delay: __u16 = 0,
};
pub const struct_ff_envelope = extern struct {
    attack_length: __u16 = 0,
    attack_level: __u16 = 0,
    fade_length: __u16 = 0,
    fade_level: __u16 = 0,
};
pub const struct_ff_constant_effect = extern struct {
    level: __s16 = 0,
    envelope: struct_ff_envelope = @import("std").mem.zeroes(struct_ff_envelope),
};
pub const struct_ff_ramp_effect = extern struct {
    start_level: __s16 = 0,
    end_level: __s16 = 0,
    envelope: struct_ff_envelope = @import("std").mem.zeroes(struct_ff_envelope),
};
pub const __u32 = c_uint;
pub const struct_ff_periodic_effect = extern struct {
    waveform: __u16 = 0,
    period: __u16 = 0,
    magnitude: __s16 = 0,
    offset: __s16 = 0,
    phase: __u16 = 0,
    envelope: struct_ff_envelope = @import("std").mem.zeroes(struct_ff_envelope),
    custom_len: __u32 = 0,
    custom_data: [*c]__s16 = null,
};
pub const struct_ff_condition_effect = extern struct {
    right_saturation: __u16 = 0,
    left_saturation: __u16 = 0,
    right_coeff: __s16 = 0,
    left_coeff: __s16 = 0,
    deadband: __u16 = 0,
    center: __s16 = 0,
};
pub const struct_ff_rumble_effect = extern struct {
    strong_magnitude: __u16 = 0,
    weak_magnitude: __u16 = 0,
};
pub const __u8 = u8;
pub const struct_ff_haptic_effect = extern struct {
    hid_usage: __u16 = 0,
    vendor_id: __u16 = 0,
    vendor_waveform_page: __u8 = 0,
    intensity: __u16 = 0,
    repeat_count: __u16 = 0,
    retrigger_period: __u16 = 0,
};
const union_unnamed_8 = extern union {
    constant: struct_ff_constant_effect,
    ramp: struct_ff_ramp_effect,
    periodic: struct_ff_periodic_effect,
    condition: [2]struct_ff_condition_effect,
    rumble: struct_ff_rumble_effect,
    haptic: struct_ff_haptic_effect,
};
pub const struct_ff_effect = extern struct {
    type: __u16 = 0,
    id: __s16 = 0,
    direction: __u16 = 0,
    trigger: struct_ff_trigger = @import("std").mem.zeroes(struct_ff_trigger),
    replay: struct_ff_replay = @import("std").mem.zeroes(struct_ff_replay),
    u: union_unnamed_8 = @import("std").mem.zeroes(union_unnamed_8),
};
pub const struct_hwdata_ball_9 = extern struct {
    axis: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const struct_hwdata_hat_10 = extern struct {
    axis: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const struct_axis_correct_11 = extern struct {
    use_deadzones: bool = false,
    coef: [3]c_int = @import("std").mem.zeroes([3]c_int),
    minimum: c_int = 0,
    maximum: c_int = 0,
    scale: f32 = 0,
};
pub const struct_hat_axis_correct_12 = extern struct {
    use_deadzones: bool = false,
    minimum: [2]c_int = @import("std").mem.zeroes([2]c_int),
    maximum: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const struct_joystick_hwdata = extern struct {
    fd: c_int = 0,
    fd_sensor: c_int = 0,
    item: [*c]struct_SDL_joylist_item = null,
    item_sensor: [*c]struct_SDL_sensorlist_item = null,
    guid: SDL_GUID = @import("std").mem.zeroes(SDL_GUID),
    fname: [*c]u8 = null,
    ff_rumble: bool = false,
    ff_sine: bool = false,
    effect: struct_ff_effect = @import("std").mem.zeroes(struct_ff_effect),
    effect_expiration: Uint32 = 0,
    balls: [*c]struct_hwdata_ball_9 = null,
    hats: [*c]struct_hwdata_hat_10 = null,
    key_map: [767]Uint8 = @import("std").mem.zeroes([767]Uint8),
    abs_map: [63]Uint8 = @import("std").mem.zeroes([63]Uint8),
    has_key: [767]bool = @import("std").mem.zeroes([767]bool),
    has_abs: [63]bool = @import("std").mem.zeroes([63]bool),
    has_accelerometer: bool = false,
    has_gyro: bool = false,
    classic: bool = false,
    key_pam: [*c]Uint16 = null,
    abs_pam: [*c]Uint8 = null,
    abs_correct: [63]struct_axis_correct_11 = @import("std").mem.zeroes([63]struct_axis_correct_11),
    accelerometer_scale: [3]f32 = @import("std").mem.zeroes([3]f32),
    gyro_scale: [3]f32 = @import("std").mem.zeroes([3]f32),
    gyro_data: [3]f32 = @import("std").mem.zeroes([3]f32),
    accel_data: [3]f32 = @import("std").mem.zeroes([3]f32),
    sensor_tick: Uint64 = 0,
    last_tick: Sint32 = 0,
    report_sensor: bool = false,
    fresh: bool = false,
    recovering_from_dropped: bool = false,
    recovering_from_dropped_sensor: bool = false,
    m_bSteamController: bool = false,
    hats_indices: [4]c_int = @import("std").mem.zeroes([4]c_int),
    has_hat: [4]bool = @import("std").mem.zeroes([4]bool),
    hat_correct: [4]struct_hat_axis_correct_12 = @import("std").mem.zeroes([4]struct_hat_axis_correct_12),
    gone: bool = false,
    sensor_gone: bool = false,
};
pub const struct_SDL_Joystick = extern struct {
    instance_id: SDL_JoystickID = 0,
    name: [*c]u8 = null,
    path: [*c]u8 = null,
    serial: [*c]u8 = null,
    guid: SDL_GUID = @import("std").mem.zeroes(SDL_GUID),
    firmware_version: Uint16 = 0,
    steam_handle: Uint64 = 0,
    swap_face_buttons: bool = false,
    is_virtual: bool = false,
    naxes: c_int = 0,
    axes: [*c]SDL_JoystickAxisInfo = null,
    nballs: c_int = 0,
    balls: [*c]SDL_JoystickBallData = null,
    nhats: c_int = 0,
    hats: [*c]Uint8 = null,
    nbuttons: c_int = 0,
    buttons: [*c]bool = null,
    ntouchpads: c_int = 0,
    touchpads: [*c]SDL_JoystickTouchpadInfo = null,
    nsensors: c_int = 0,
    nsensors_enabled: c_int = 0,
    sensors: [*c]SDL_JoystickSensorInfo = null,
    ncapsenses: c_int = 0,
    capsenses: [*c]SDL_JoystickCapSenseInfo = null,
    low_frequency_rumble: Uint16 = 0,
    high_frequency_rumble: Uint16 = 0,
    rumble_expiration: Uint64 = 0,
    rumble_resend: Uint64 = 0,
    left_trigger_rumble: Uint16 = 0,
    right_trigger_rumble: Uint16 = 0,
    trigger_rumble_expiration: Uint64 = 0,
    trigger_rumble_resend: Uint64 = 0,
    led_red: Uint8 = 0,
    led_green: Uint8 = 0,
    led_blue: Uint8 = 0,
    led_expiration: Uint64 = 0,
    attached: bool = false,
    connection_state: SDL_JoystickConnectionState = @import("std").mem.zeroes(SDL_JoystickConnectionState),
    battery_state: SDL_PowerState = @import("std").mem.zeroes(SDL_PowerState),
    battery_percent: c_int = 0,
    delayed_guide_button: bool = false,
    accel_sensor: SDL_SensorID = 0,
    accel: ?*SDL_Sensor = null,
    gyro_sensor: SDL_SensorID = 0,
    gyro: ?*SDL_Sensor = null,
    sensor_transform: [3][3]f32 = @import("std").mem.zeroes([3][3]f32),
    update_complete: Uint64 = 0,
    driver: [*c]struct_SDL_JoystickDriver = null,
    hwdata: [*c]struct_joystick_hwdata = null,
    props: SDL_PropertiesID = 0,
    ref_count: c_int = 0,
    next: [*c]struct_SDL_Joystick = null,
};
pub extern fn SDL_LockJoysticks_REAL() void;
pub extern fn SDL_UnlockJoysticks_REAL() void;
pub extern fn SDL_GetJoystickProperties_REAL(joystick: [*c]SDL_Joystick) SDL_PropertiesID;
pub extern fn SDL_GetJoystickVendor_REAL(joystick: [*c]SDL_Joystick) Uint16;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetHintBoolean_REAL(name: [*c]const u8, default_value: bool) bool;
pub const SDL_LOG_CATEGORY_INPUT: c_int = 7;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogWarn_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const SDL_SANDBOX_NONE: c_int = 0;
pub const enum_SDL_Sandbox = c_uint;
pub const SDL_Sandbox = enum_SDL_Sandbox;
pub extern fn SDL_GetSandbox_REAL() SDL_Sandbox;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_GetTicksNS_REAL() Uint64;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub extern fn SDL_startswith(string: [*c]const u8, prefix: [*c]const u8) bool;
pub const SDL_OBJECT_TYPE_JOYSTICK: c_int = 4;
pub const SDL_ObjectType = c_uint;
pub extern fn SDL_GetNextObjectID() Uint32;
pub extern fn SDL_SetObjectValid(object: ?*anyopaque, @"type": SDL_ObjectType, valid: bool) void;
pub const struct_stat = extern struct {
    st_dev: __dev_t = 0,
    st_ino: __ino_t = 0,
    st_nlink: __nlink_t = 0,
    st_mode: __mode_t = 0,
    st_uid: __uid_t = 0,
    st_gid: __gid_t = 0,
    __pad0: c_int = 0,
    st_rdev: __dev_t = 0,
    st_size: __off_t = 0,
    st_blksize: __blksize_t = 0,
    st_blocks: __blkcnt_t = 0,
    st_atim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_mtim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_ctim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    __glibc_reserved: [3]__syscall_slong_t = @import("std").mem.zeroes([3]__syscall_slong_t),
};
pub extern fn stat(noalias __file: [*c]const u8, noalias __buf: [*c]struct_stat) c_int;
pub extern fn fstat(__fd: c_int, __buf: [*c]struct_stat) c_int;
pub const __s32 = c_int;
pub extern fn __errno_location() [*c]c_int;
pub extern fn fcntl(__fd: c_int, __cmd: c_int, ...) c_int;
pub extern fn open(__file: [*c]const u8, __oflag: c_int, ...) c_int;
pub const IN_CLOEXEC: c_int = 524288;
pub const IN_NONBLOCK: c_int = 2048;
pub const struct_inotify_event = extern struct {
    wd: c_int = 0,
    mask: u32 = 0,
    cookie: u32 = 0,
    len: u32 = 0,
    _name: [0]u8 = @import("std").mem.zeroes([0]u8),
    pub fn name(_self: anytype) __helpers.FlexibleArrayType(@TypeOf(_self), @typeInfo(@TypeOf(_self.*._name)).array.child) {
        return @ptrCast(@alignCast(&_self.*._name));
    }
};
pub extern fn inotify_init1(__flags: c_int) c_int;
pub extern fn inotify_add_watch(__fd: c_int, __name: [*c]const u8, __mask: u32) c_int;
pub extern fn ioctl(__fd: c_int, __request: c_ulong, ...) c_int;
pub extern fn close(__fd: c_int) c_int;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn write(__fd: c_int, __buf: ?*const anyopaque, __n: usize) isize;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub const struct_dirent = extern struct {
    d_ino: __ino_t = 0,
    d_off: __off_t = 0,
    d_reclen: c_ushort = 0,
    d_type: u8 = 0,
    d_name: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub extern fn scandir(noalias __dir: [*c]const u8, noalias __namelist: [*c][*c][*c]struct_dirent, __selector: ?*const fn ([*c]const struct_dirent) callconv(.c) c_int, __cmp: ?*const fn ([*c][*c]const struct_dirent, [*c][*c]const struct_dirent) callconv(.c) c_int) c_int;
pub extern fn alphasort(__e1: [*c][*c]const struct_dirent, __e2: [*c][*c]const struct_dirent) c_int;
pub const struct_input_event = extern struct {
    time: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    type: __u16 = 0,
    code: __u16 = 0,
    value: __s32 = 0,
};
pub const struct_input_id = extern struct {
    bustype: __u16 = 0,
    vendor: __u16 = 0,
    product: __u16 = 0,
    version: __u16 = 0,
};
pub const struct_input_absinfo = extern struct {
    value: __s32 = 0,
    minimum: __s32 = 0,
    maximum: __s32 = 0,
    fuzz: __s32 = 0,
    flat: __s32 = 0,
    resolution: __s32 = 0,
};
pub const struct_js_event = extern struct {
    time: __u32 = 0,
    value: __s16 = 0,
    type: __u8 = 0,
    number: __u8 = 0,
};
pub extern fn SDL_EVDEV_GetEventTimestamp(event: [*c]struct_input_event) Uint64;
pub extern fn SDL_AssertJoysticksLocked() void;
pub extern fn SDL_JoystickHandledByAnotherDriver(driver: [*c]struct_SDL_JoystickDriver, vendor_id: Uint16, product_id: Uint16, version: Uint16, name: [*c]const u8) bool;
pub extern fn SDL_CreateJoystickName(vendor: Uint16, product: Uint16, vendor_name: [*c]const u8, product_name: [*c]const u8) [*c]u8;
pub extern fn SDL_CreateJoystickGUID(bus: Uint16, vendor: Uint16, product: Uint16, version: Uint16, vendor_name: [*c]const u8, product_name: [*c]const u8, driver_signature: Uint8, driver_data: Uint8) SDL_GUID;
pub extern fn SDL_ShouldIgnoreJoystick(vendor_id: Uint16, product_id: Uint16, version: Uint16, name: [*c]const u8) bool;
pub extern fn SDL_PrivateJoystickAddSensor(joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, rate: f32) void;
pub extern fn SDL_PrivateJoystickAdded(instance_id: SDL_JoystickID) void;
pub extern fn SDL_PrivateJoystickRemoved(instance_id: SDL_JoystickID) void;
pub extern fn SDL_SendJoystickAxis(timestamp: Uint64, joystick: [*c]SDL_Joystick, axis: Uint8, value: Sint16) void;
pub extern fn SDL_SendJoystickBall(timestamp: Uint64, joystick: [*c]SDL_Joystick, ball: Uint8, xrel: Sint16, yrel: Sint16) void;
pub extern fn SDL_SendJoystickHat(timestamp: Uint64, joystick: [*c]SDL_Joystick, hat: Uint8, value: Uint8) void;
pub extern fn SDL_SendJoystickButton(timestamp: Uint64, joystick: [*c]SDL_Joystick, button: Uint8, down: bool) void;
pub extern fn SDL_SendJoystickSensor(timestamp: Uint64, joystick: [*c]SDL_Joystick, @"type": SDL_SensorType, sensor_timestamp: Uint64, data: [*c]const f32, num_values: c_int) void;
pub const EMappingKind_Button: c_int = 1;
pub const EMappingKind_Axis: c_int = 2;
pub const EMappingKind_Hat: c_int = 3;
pub const EMappingKind = c_uint;
pub const SDL_JoystickDriver = struct_SDL_JoystickDriver;
pub const SDL_UDEV_DEVICE_JOYSTICK: c_int = 4;
pub const SDL_UDEV_DEVICE_ACCELEROMETER: c_int = 32;
pub extern fn SDL_EVDEV_GuessDeviceClass(bitmask_props: [*c]const c_ulong, bitmask_ev: [*c]const c_ulong, bitmask_abs: [*c]const c_ulong, bitmask_key: [*c]const c_ulong, bitmask_rel: [*c]const c_ulong) c_int;
pub const SDL_UDEV_DEVICEADDED: c_int = 1;
pub const SDL_UDEV_DEVICEREMOVED: c_int = 2;
pub const SDL_UDEV_deviceevent = c_uint;
pub const SDL_UDEV_Callback = ?*const fn (udev_type: SDL_UDEV_deviceevent, udev_class: c_int, devpath: [*c]const u8) callconv(.c) void;
pub extern fn SDL_UDEV_Init() bool;
pub extern fn SDL_UDEV_Quit() void;
pub extern fn SDL_UDEV_Scan() bool;
pub extern fn SDL_UDEV_GetProductInfo(device_path: [*c]const u8, inpid: [*c]struct_input_id, class: [*c]c_int, driver: [*c][*c]u8) bool;
pub extern fn SDL_UDEV_GetProductSerial(device_path: [*c]const u8) [*c]u8;
pub extern fn SDL_UDEV_AddCallback(cb: SDL_UDEV_Callback) bool;
pub extern fn SDL_UDEV_DelCallback(cb: SDL_UDEV_Callback) void;
pub const ENUMERATION_UNSET: c_int = 0;
pub const ENUMERATION_LIBUDEV: c_int = 1;
pub const ENUMERATION_FALLBACK: c_int = 2;
pub const EnumerationMethod = c_uint;
pub var enumeration_method: EnumerationMethod = ENUMERATION_UNSET;
pub const SDL_joylist_item = struct_SDL_joylist_item;
pub const SDL_sensorlist_item = struct_SDL_sensorlist_item;
pub var SDL_classic_joysticks: bool = @"false" != 0;
pub var SDL_joylist: [*c]SDL_joylist_item = null;
pub var SDL_joylist_tail: [*c]SDL_joylist_item = null;
pub var numjoysticks: c_int = 0;
pub var SDL_sensorlist: [*c]SDL_sensorlist_item = null;
pub var inotify_fd: c_int = -@as(c_int, 1);
pub var last_joy_detect_time: Uint64 = 0;
pub var last_input_dir_mtime: time_t = 0;
pub fn FixupDeviceInfoForMapping(fd: c_int, inpid: [*c]struct_input_id) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (((@as(c_int, inpid.*.vendor) == @as(c_int, 1118)) and (@as(c_int, inpid.*.product) == @as(c_int, 2821))) and (@as(c_int, inpid.*.version) == @as(c_int, 2307))) {
        var keybit: [12]c_ulong = [1]c_ulong{
            0,
        } ++ @as([11]c_ulong, @splat(0));
        _ = &keybit;
        if ((@as(c_ulong, @bitCast(@as(c_long, @intFromBool(ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 32) + EV_KEY) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(keybit)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&keybit)))) >= @as(c_int, 0))))) != 0) and (((keybit[@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 704)))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 704)))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0)) {
            inpid.*.version = 2306;
        }
    }
    if ((@as(c_int, inpid.*.vendor) == @as(c_int, 12880)) and ((@as(c_int, inpid.*.product) == @as(c_int, 4097)) or (@as(c_int, inpid.*.product) == @as(c_int, 4098)))) {
        inpid.*.version = 0;
    }
}
pub fn IsVirtualJoystick(vendor: Uint16, product: Uint16, version: Uint16, name: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((((@as(c_int, vendor) == USB_VENDOR_MICROSOFT) and (@as(c_int, product) == USB_PRODUCT_XBOX_ONE_S)) and (@as(c_int, version) == @as(c_int, 0))) and (SDL_strcmp_REAL(name, "Xbox One S Controller") == @as(c_int, 0))) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn GetSteamVirtualGamepadSlot(fd: c_int, slot: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var name: [128]u8 = undefined;
    _ = &name;
    if (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(name)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]u8, @ptrCast(@alignCast(&name)))) > @as(c_int, 0)) {
        var digits: [*c]const u8 = SDL_strstr_REAL(@ptrCast(@alignCast(&name)), "pad ");
        _ = &digits;
        if (digits != null) {
            digits += @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 4)))));
            if (SDL_isdigit_REAL(digits.*) != 0) {
                slot.* = SDL_atoi_REAL(digits);
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn GuessDeviceClass(fd: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var propbit: [1]c_ulong = [1]c_ulong{
        0,
    };
    _ = &propbit;
    var evbit: [1]c_ulong = [1]c_ulong{
        0,
    };
    _ = &evbit;
    var keybit: [12]c_ulong = [1]c_ulong{
        0,
    } ++ @as([11]c_ulong, @splat(0));
    _ = &keybit;
    var absbit: [1]c_ulong = [1]c_ulong{
        0,
    };
    _ = &absbit;
    var relbit: [1]c_ulong = [1]c_ulong{
        0,
    };
    _ = &relbit;
    if ((((ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 32) + @as(c_int, 0)) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(evbit)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&evbit)))) < @as(c_int, 0)) or (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 32) + EV_KEY) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(keybit)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&keybit)))) < @as(c_int, 0))) or (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 32) + EV_REL) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(relbit)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&relbit)))) < @as(c_int, 0))) or (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 32) + EV_ABS) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(absbit)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&absbit)))) < @as(c_int, 0))) {
        return 0;
    }
    _ = ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 9) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(propbit)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&propbit))));
    return SDL_EVDEV_GuessDeviceClass(@ptrCast(@alignCast(&propbit)), @ptrCast(@alignCast(&evbit)), @ptrCast(@alignCast(&absbit)), @ptrCast(@alignCast(&keybit)), @ptrCast(@alignCast(&relbit)));
}
pub fn GuessIsJoystick(fd: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((GuessDeviceClass(fd) & SDL_UDEV_DEVICE_JOYSTICK) != 0) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn GuessIsSensor(fd: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((GuessDeviceClass(fd) & SDL_UDEV_DEVICE_ACCELEROMETER) != 0) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn IsJoystick(path: [*c]const u8, fd: [*c]c_int, name_return: [*c][*c]u8, vendor_return: [*c]Uint16, product_return: [*c]Uint16, guid: [*c]SDL_GUID, driver_return: [*c][*c]u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var inpid: struct_input_id = undefined;
    _ = &inpid;
    var name: [*c]u8 = undefined;
    _ = &name;
    var driver: [*c]u8 = undefined;
    _ = &driver;
    var product_string: [128]u8 = undefined;
    _ = &product_string;
    var class: c_int = undefined;
    _ = &class;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                name = null;
                driver = null;
                class = 0;
                _ = memset(@ptrCast(@alignCast(&inpid)), 0, @sizeOf(@TypeOf(inpid)));
                if (SDL_UDEV_GetProductInfo(path, &inpid, &class, &driver) and !((class & SDL_UDEV_DEVICE_JOYSTICK) != 0)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_free_REAL(@ptrCast(@alignCast(driver)));
                SDL_free_REAL(@ptrCast(@alignCast(name)));
                return @"false" != 0;
            },
            2 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                if ((fd != null) and (fd.* < @as(c_int, 0))) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                fd.* = open(path, O_RDONLY | __O_CLOEXEC, @as(c_int, 0));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (!(fd != null) or (fd.* < @as(c_int, 0))) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                if (ioctl(fd.*, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'j') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 19) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(product_string)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]u8, @ptrCast(@alignCast(&product_string)))) <= @as(c_int, 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                if (((enumeration_method != @as(EnumerationMethod, ENUMERATION_LIBUDEV)) and !(class != 0)) and !GuessIsJoystick(fd.*)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                name = SDL_CreateJoystickName(inpid.vendor, inpid.product, null, @ptrCast(@alignCast(&product_string)));
                if (!(name != null)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if (ioctl(fd.*, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_id) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &inpid) < @as(c_int, 0)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                if (ioctl(fd.*, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(product_string)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]u8, @ptrCast(@alignCast(&product_string)))) < @as(c_int, 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (!IsVirtualJoystick(inpid.vendor, inpid.product, inpid.version, name) and SDL_JoystickHandledByAnotherDriver(&SDL_LINUX_JoystickDriver, inpid.vendor, inpid.product, inpid.version, name)) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 1;
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
                FixupDeviceInfoForMapping(fd.*, &inpid);
                if (SDL_ShouldIgnoreJoystick(inpid.vendor, inpid.product, inpid.version, name)) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                name_return.* = name;
                driver_return.* = driver;
                vendor_return.* = inpid.vendor;
                product_return.* = inpid.product;
                guid.* = SDL_CreateJoystickGUID(inpid.bustype, inpid.vendor, inpid.product, inpid.version, null, @ptrCast(@alignCast(&product_string)), 0, 0);
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub fn IsSensor(path: [*c]const u8, fd: [*c]c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var inpid: struct_input_id = undefined;
    _ = &inpid;
    var class: c_int = 0;
    _ = &class;
    _ = memset(@ptrCast(@alignCast(&inpid)), 0, @sizeOf(@TypeOf(inpid)));
    if (SDL_UDEV_GetProductInfo(path, &inpid, &class, null) and !((class & SDL_UDEV_DEVICE_ACCELEROMETER) != 0)) {
        return @"false" != 0;
    }
    if ((fd != null) and (fd.* < @as(c_int, 0))) {
        fd.* = open(path, O_RDONLY | __O_CLOEXEC, @as(c_int, 0));
    }
    if (!(fd != null) or (fd.* < @as(c_int, 0))) {
        return @"false" != 0;
    }
    if (!(class != 0) and !GuessIsSensor(fd.*)) {
        return @"false" != 0;
    }
    if (ioctl(fd.*, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_id) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &inpid) < @as(c_int, 0)) {
        return @"false" != 0;
    }
    if ((@as(c_int, inpid.vendor) == USB_VENDOR_NINTENDO) and (@as(c_int, inpid.product) == USB_PRODUCT_NINTENDO_WII_REMOTE)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn joystick_udev_callback(udev_type: SDL_UDEV_deviceevent, udev_class: c_int, devpath: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(devpath != null)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                return;
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                switch (udev_type) {
                    @as(SDL_UDEV_deviceevent, SDL_UDEV_DEVICEADDED) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(SDL_UDEV_deviceevent, SDL_UDEV_DEVICEREMOVED) => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
                        continue;
                    },
                }
            },
            4 => {
                {}
            },
            5 => {
                if (!((udev_class & (SDL_UDEV_DEVICE_JOYSTICK | SDL_UDEV_DEVICE_ACCELEROMETER)) != 0)) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                return;
            },
            7 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            8 => {
                if (SDL_classic_joysticks) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                if (!IsJoystickJSNode(devpath)) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            10 => {
                if (IsJoystickJSNode(devpath)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            11 => {
                SDL_Delay_REAL(10);
                MaybeAddDevice(devpath);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            12 => {
                return;
            },
            13 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            15 => {
                return;
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            18 => {
                MaybeRemoveDevice(devpath);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn FreeJoylistItem(item: [*c]SDL_joylist_item) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_free_REAL(@ptrCast(@alignCast(item.*.mapping)));
    SDL_free_REAL(@ptrCast(@alignCast(item.*.path)));
    SDL_free_REAL(@ptrCast(@alignCast(item.*.name)));
    SDL_free_REAL(@ptrCast(@alignCast(item.*.driver)));
    SDL_free_REAL(@ptrCast(@alignCast(item)));
}
pub fn FreeSensorlistItem(item: [*c]SDL_sensorlist_item) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_free_REAL(@ptrCast(@alignCast(item.*.path)));
    SDL_free_REAL(@ptrCast(@alignCast(item)));
}
pub fn MaybeAddDevice(path: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sb: struct_stat = undefined;
    _ = &sb;
    var fd: c_int = undefined;
    _ = &fd;
    var name: [*c]u8 = undefined;
    _ = &name;
    var driver: [*c]u8 = undefined;
    _ = &driver;
    var vendor: Uint16 = undefined;
    _ = &vendor;
    var product: Uint16 = undefined;
    _ = &product;
    var guid: SDL_GUID = undefined;
    _ = &guid;
    var item: [*c]SDL_joylist_item = undefined;
    _ = &item;
    var item_sensor: [*c]SDL_sensorlist_item = undefined;
    _ = &item_sensor;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                fd = -@as(c_int, 1);
                name = null;
                driver = null;
                if (!(path != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                _ = close(fd);
                SDL_UnlockJoysticks_REAL();
                {}
            },
            2 => {
                return;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                fd = open(path, O_RDONLY | __O_CLOEXEC, @as(c_int, 0));
                if (fd < @as(c_int, 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                return;
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                if (fstat(fd, &sb) == -@as(c_int, 1)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = close(fd);
                return;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                SDL_LockJoysticks_REAL();
                item = SDL_joylist;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                if (item != null) {
                    sdl_pc = 12;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                if (sb.st_rdev == item.*.devnum) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            13 => {
                item = item.*.next;
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            14 => {
                item_sensor = SDL_sensorlist;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            18 => {
                if (item_sensor != null) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                if (sb.st_rdev == item_sensor.*.devnum) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            20 => {
                item_sensor = item_sensor.*.next;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            21 => {
                if (IsJoystick(path, &fd, &name, &vendor, &product, &guid, &driver)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            25 => {
                item = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_joylist_item))));
                if (!(item != null)) {
                    sdl_pc = 28;
                    continue;
                } else {
                    sdl_pc = 29;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                if (IsSensor(path, &fd)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 41;
                    continue;
                }
            },
            28 => {
                SDL_free_REAL(@ptrCast(@alignCast(name)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            29 => {
                {
                    sdl_pc = 30;
                    continue;
                }
            },
            30 => {
                item.*.devnum = sb.st_rdev;
                item.*.steam_virtual_gamepad_slot = -@as(c_int, 1);
                item.*.path = SDL_strdup_REAL(path);
                item.*.vendor = vendor;
                item.*.product = product;
                item.*.name = name;
                item.*.guid = guid;
                item.*.driver = driver;
                if ((@as(c_int, vendor) == USB_VENDOR_VALVE) and (@as(c_int, product) == USB_PRODUCT_STEAM_VIRTUAL_GAMEPAD)) {
                    sdl_pc = 31;
                    continue;
                } else {
                    sdl_pc = 32;
                    continue;
                }
            },
            31 => {
                _ = GetSteamVirtualGamepadSlot(fd, &item.*.steam_virtual_gamepad_slot);
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                {
                    sdl_pc = 33;
                    continue;
                }
            },
            33 => {
                if (!(item.*.path != null) or !(item.*.name != null)) {
                    sdl_pc = 34;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                FreeJoylistItem(item);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                item.*.device_instance = SDL_GetNextObjectID();
                if (!(SDL_joylist_tail != null)) {
                    sdl_pc = 37;
                    continue;
                } else {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                SDL_joylist = blk: {
                    const tmp = item;
                    SDL_joylist_tail = tmp;
                    break :blk tmp;
                };
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                SDL_joylist_tail.*.next = item;
                SDL_joylist_tail = item;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                numjoysticks += 1;
                SDL_PrivateJoystickAdded(item.*.device_instance);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            40 => {
                item_sensor = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_sensorlist_item))));
                if (!(item_sensor != null)) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 42;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                item_sensor.*.devnum = sb.st_rdev;
                item_sensor.*.path = SDL_strdup_REAL(path);
                if (!(item_sensor.*.path != null)) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
                    continue;
                }
            },
            46 => {
                FreeSensorlistItem(item_sensor);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            47 => {
                {
                    sdl_pc = 48;
                    continue;
                }
            },
            48 => {
                item_sensor.*.next = SDL_sensorlist;
                SDL_sensorlist = item_sensor;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn RemoveJoylistItem(item: [*c]SDL_joylist_item, prev: [*c]SDL_joylist_item) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "RemoveJoylistItem".*;
    };
    _ = &static_local___func__;
    SDL_AssertJoysticksLocked();
    if (item.*.hwdata != null) {
        item.*.hwdata.*.item = null;
    }
    if (prev != null) {
        prev.*.next = item.*.next;
    } else {
        while (true) {
            while (!(SDL_joylist == item)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "SDL_joylist == item",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysjoystick.c", 579);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        SDL_joylist = item.*.next;
    }
    if (item == SDL_joylist_tail) {
        SDL_joylist_tail = prev;
    }
    numjoysticks -= 1;
    SDL_PrivateJoystickRemoved(item.*.device_instance);
    FreeJoylistItem(item);
}
pub fn RemoveSensorlistItem(item: [*c]SDL_sensorlist_item, prev: [*c]SDL_sensorlist_item) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "RemoveSensorlistItem".*;
    };
    _ = &static_local___func__;
    SDL_AssertJoysticksLocked();
    if (item.*.hwdata != null) {
        item.*.hwdata.*.item_sensor = null;
    }
    if (prev != null) {
        prev.*.next = item.*.next;
    } else {
        while (true) {
            while (!(SDL_sensorlist == item)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "SDL_sensorlist == item",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysjoystick.c", 605);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        SDL_sensorlist = item.*.next;
    }
    FreeSensorlistItem(item);
}
pub fn MaybeRemoveDevice(path: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_joylist_item = undefined;
    _ = &item;
    var prev: [*c]SDL_joylist_item = undefined;
    _ = &prev;
    var item_sensor: [*c]SDL_sensorlist_item = undefined;
    _ = &item_sensor;
    var prev_sensor: [*c]SDL_sensorlist_item = undefined;
    _ = &prev_sensor;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                prev = null;
                prev_sensor = null;
                if (!(path != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_UnlockJoysticks_REAL();
                {}
            },
            2 => {
                return;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                SDL_LockJoysticks_REAL();
                item = SDL_joylist;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                if (item != null) {
                    sdl_pc = 6;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            6 => {
                if (SDL_strcmp_REAL(path, item.*.path) == @as(c_int, 0)) {
                    sdl_pc = 9;
                    continue;
                } else {
                    sdl_pc = 10;
                    continue;
                }
            },
            7 => {
                item = item.*.next;
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            8 => {
                item_sensor = SDL_sensorlist;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            9 => {
                RemoveJoylistItem(item, prev);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            11 => {
                prev = item;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            12 => {
                if (item_sensor != null) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            13 => {
                if (SDL_strcmp_REAL(path, item_sensor.*.path) == @as(c_int, 0)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            14 => {
                item_sensor = item_sensor.*.next;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            16 => {
                RemoveSensorlistItem(item_sensor, prev_sensor);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                prev_sensor = item_sensor;
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn HandlePendingRemovals() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var prev: [*c]SDL_joylist_item = null;
    _ = &prev;
    var item: [*c]SDL_joylist_item = null;
    _ = &item;
    var prev_sensor: [*c]SDL_sensorlist_item = null;
    _ = &prev_sensor;
    var item_sensor: [*c]SDL_sensorlist_item = null;
    _ = &item_sensor;
    SDL_AssertJoysticksLocked();
    item = SDL_joylist;
    while (item != null) {
        if ((item.*.hwdata != null) and item.*.hwdata.*.gone) {
            RemoveJoylistItem(item, prev);
            if (prev != null) {
                item = prev.*.next;
            } else {
                item = SDL_joylist;
            }
        } else {
            prev = item;
            item = item.*.next;
        }
    }
    item_sensor = SDL_sensorlist;
    while (item_sensor != null) {
        if ((item_sensor.*.hwdata != null) and item_sensor.*.hwdata.*.sensor_gone) {
            RemoveSensorlistItem(item_sensor, prev_sensor);
            if (prev_sensor != null) {
                item_sensor = prev_sensor.*.next;
            } else {
                item_sensor = SDL_sensorlist;
            }
        } else {
            prev_sensor = item_sensor;
            item_sensor = item_sensor.*.next;
        }
    }
}
pub fn StrIsInteger(string: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var p: [*c]const u8 = undefined;
    _ = &p;
    if (@as(c_int, string.*) == @as(c_int, '\x00')) {
        return @"false" != 0;
    }
    {
        p = string;
        while (@as(c_int, p.*) != @as(c_int, '\x00')) : (p += 1) {
            if ((@as(c_int, p.*) < @as(c_int, '0')) or (@as(c_int, p.*) > @as(c_int, '9'))) {
                return @"false" != 0;
            }
        }
    }
    return @"true" != 0;
}
pub fn IsJoystickJSNode(arg_node: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var node = arg_node;
    _ = &node;
    var last_slash: [*c]const u8 = SDL_strrchr_REAL(node, '/');
    _ = &last_slash;
    if (last_slash != null) {
        node = last_slash + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    }
    return SDL_startswith(node, "js") and StrIsInteger(node + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))));
}
pub fn IsJoystickEventNode(arg_node: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var node = arg_node;
    _ = &node;
    var last_slash: [*c]const u8 = SDL_strrchr_REAL(node, '/');
    _ = &last_slash;
    if (last_slash != null) {
        node = last_slash + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 1)))));
    }
    return SDL_startswith(node, "event") and StrIsInteger(node + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 5))))));
}
pub fn IsJoystickDeviceNode(node: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (SDL_classic_joysticks) {
        return IsJoystickJSNode(node);
    } else {
        return IsJoystickEventNode(node);
    }
}
pub fn SDL_inotify_init1() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return inotify_init1(IN_NONBLOCK | IN_CLOEXEC);
}
pub fn LINUX_InotifyJoystickDetect() callconv(.c) void {
    @setEvalBranchQuota(100000);
    const union_unnamed_29 = extern union {
        event: struct_inotify_event,
        storage: [4096]u8,
        enough_for_inotify: [272]u8,
    };
    _ = &union_unnamed_29;
    var buf: union_unnamed_29 = undefined;
    _ = &buf;
    var bytes: isize = undefined;
    _ = &bytes;
    var remain: usize = 0;
    _ = &remain;
    var len: usize = undefined;
    _ = &len;
    var path: [4096]u8 = undefined;
    _ = &path;
    bytes = read(inotify_fd, @ptrCast(@alignCast(&buf)), @sizeOf(@TypeOf(buf)));
    if (bytes > @as(isize, 0)) {
        remain = @bitCast(@as(c_long, bytes));
    }
    while (remain > @as(usize, 0)) {
        if (buf.event.len > @as(u32, 0)) {
            if (IsJoystickDeviceNode(buf.event.name())) {
                _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&path)), @sizeOf(@TypeOf(path)) / @sizeOf(@TypeOf(path[@as(c_int, 0)])), "/dev/input/%s", buf.event.name());
                if ((buf.event.mask & @as(u32, @bitCast(@as(c_int, (IN_CREATE | IN_MOVED_TO) | IN_ATTRIB)))) != 0) {
                    MaybeAddDevice(@ptrCast(@alignCast(&path)));
                } else if ((buf.event.mask & @as(u32, @bitCast(@as(c_int, IN_DELETE | IN_MOVED_FROM)))) != 0) {
                    MaybeRemoveDevice(@ptrCast(@alignCast(&path)));
                }
            }
        }
        len = @sizeOf(struct_inotify_event) +% @as(c_ulong, buf.event.len);
        remain -%= len;
        if (remain != @as(usize, 0)) {
            _ = memmove(@ptrCast(@alignCast(&buf.storage[@as(c_int, 0)])), @ptrCast(@alignCast(&buf.storage[len])), remain);
        }
    }
}
pub fn get_event_joystick_index(event: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var joystick_index: c_int = -@as(c_int, 1);
    _ = &joystick_index;
    var i: c_int = undefined;
    _ = &i;
    var count: c_int = undefined;
    _ = &count;
    var entries: [*c][*c]struct_dirent = null;
    _ = &entries;
    var path: [4096]u8 = undefined;
    _ = &path;
    _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&path)), @sizeOf(@TypeOf(path)) / @sizeOf(@TypeOf(path[@as(c_int, 0)])), "/sys/class/input/event%d/device", event);
    count = scandir(@ptrCast(@alignCast(&path)), &entries, null, alphasort);
    {
        i = 0;
        while (i < count) : (i += 1) {
            if (SDL_strncmp_REAL(@ptrCast(@alignCast(&entries[@bitCast(@as(isize, @intCast(i)))].*.d_name)), "js", 2) == @as(c_int, 0)) {
                joystick_index = SDL_atoi_REAL(@as([*c]u8, @ptrCast(@alignCast(&entries[@bitCast(@as(isize, @intCast(i)))].*.d_name))) + @as(usize, @bitCast(@as(isize, @intCast(@as(c_int, 2))))));
            }
            free(@ptrCast(@alignCast(entries[@bitCast(@as(isize, @intCast(i)))])));
        }
    }
    free(@ptrCast(@alignCast(entries)));
    return joystick_index;
}
pub fn filter_entries(entry: [*c]const struct_dirent) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return @intFromBool(IsJoystickDeviceNode(@ptrCast(@alignCast(&entry.*.d_name))));
}
pub fn sort_entries(_a: ?*const anyopaque, _b: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var a: [*c][*c]const struct_dirent = @ptrCast(@alignCast(@constCast(_a)));
    _ = &a;
    var b: [*c][*c]const struct_dirent = @ptrCast(@alignCast(@constCast(_b)));
    _ = &b;
    var numA: c_int = undefined;
    _ = &numA;
    var numB: c_int = undefined;
    _ = &numB;
    var offset: c_int = undefined;
    _ = &offset;
    if (SDL_classic_joysticks) {
        offset = 2;
        numA = SDL_atoi_REAL(@as([*c]u8, @ptrCast(@constCast(@alignCast(&a.*.*.d_name)))) + @as(usize, @bitCast(@as(isize, @intCast(offset)))));
        numB = SDL_atoi_REAL(@as([*c]u8, @ptrCast(@constCast(@alignCast(&b.*.*.d_name)))) + @as(usize, @bitCast(@as(isize, @intCast(offset)))));
    } else {
        offset = 5;
        numA = SDL_atoi_REAL(@as([*c]u8, @ptrCast(@constCast(@alignCast(&a.*.*.d_name)))) + @as(usize, @bitCast(@as(isize, @intCast(offset)))));
        numB = SDL_atoi_REAL(@as([*c]u8, @ptrCast(@constCast(@alignCast(&b.*.*.d_name)))) + @as(usize, @bitCast(@as(isize, @intCast(offset)))));
        {
            var jsA: c_int = get_event_joystick_index(numA);
            _ = &jsA;
            var jsB: c_int = get_event_joystick_index(numB);
            _ = &jsB;
            if ((jsA >= @as(c_int, 0)) and (jsB >= @as(c_int, 0))) {
                numA = jsA;
                numB = jsB;
            } else if (jsA >= @as(c_int, 0)) {
                return -@as(c_int, 1);
            } else if (jsB >= @as(c_int, 0)) {
                return 1;
            }
        }
    }
    return numA - numB;
}
pub const VirtualGamepadEntry = extern struct {
    path: [*c]u8 = null,
    slot: c_int = 0,
};
pub fn sort_virtual_gamepads(_a: ?*const anyopaque, _b: ?*const anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var a: [*c]const VirtualGamepadEntry = @ptrCast(@alignCast(_a));
    _ = &a;
    var b: [*c]const VirtualGamepadEntry = @ptrCast(@alignCast(_b));
    _ = &b;
    return a.*.slot - b.*.slot;
}
pub fn LINUX_ScanSteamVirtualGamepads() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var count: c_int = undefined;
    _ = &count;
    var fd: c_int = undefined;
    _ = &fd;
    var entries: [*c][*c]struct_dirent = null;
    _ = &entries;
    var path: [4096]u8 = undefined;
    _ = &path;
    var inpid: struct_input_id = undefined;
    _ = &inpid;
    var num_virtual_gamepads: c_int = 0;
    _ = &num_virtual_gamepads;
    var virtual_gamepad_slot: c_int = undefined;
    _ = &virtual_gamepad_slot;
    var virtual_gamepads: [*c]VirtualGamepadEntry = null;
    _ = &virtual_gamepads;
    var class: c_int = undefined;
    _ = &class;
    count = scandir("/dev/input", &entries, filter_entries, null);
    {
        i = 0;
        while (i < count) : (i += 1) {
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&path)), @sizeOf(@TypeOf(path)) / @sizeOf(@TypeOf(path[@as(c_int, 0)])), "/dev/input/%s", @as([*c]u8, @ptrCast(@alignCast(&entries[@bitCast(@as(isize, @intCast(i)))].*.d_name))));
            class = 0;
            _ = memset(@ptrCast(@alignCast(&inpid)), 0, @sizeOf(@TypeOf(inpid)));
            if (SDL_UDEV_GetProductInfo(@ptrCast(@alignCast(&path)), &inpid, &class, null) and ((@as(c_int, inpid.vendor) != USB_VENDOR_VALVE) or (@as(c_int, inpid.product) != USB_PRODUCT_STEAM_VIRTUAL_GAMEPAD))) {
                free(@ptrCast(@alignCast(entries[@bitCast(@as(isize, @intCast(i)))])));
                continue;
            }
            fd = open(@ptrCast(@alignCast(&path)), O_RDONLY | __O_CLOEXEC, @as(c_int, 0));
            if (fd >= @as(c_int, 0)) {
                if ((((ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 2) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_id) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &inpid) == @as(c_int, 0)) and (@as(c_int, inpid.vendor) == USB_VENDOR_VALVE)) and (@as(c_int, inpid.product) == USB_PRODUCT_STEAM_VIRTUAL_GAMEPAD)) and GetSteamVirtualGamepadSlot(fd, &virtual_gamepad_slot)) {
                    var new_virtual_gamepads: [*c]VirtualGamepadEntry = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(virtual_gamepads)), @as(c_ulong, @bitCast(@as(c_long, num_virtual_gamepads + @as(c_int, 1)))) *% @sizeOf(@TypeOf(virtual_gamepads.*)))));
                    _ = &new_virtual_gamepads;
                    if (new_virtual_gamepads != null) {
                        var entry: [*c]VirtualGamepadEntry = &new_virtual_gamepads[@bitCast(@as(isize, @intCast(num_virtual_gamepads)))];
                        _ = &entry;
                        entry.*.path = SDL_strdup_REAL(@ptrCast(@alignCast(&path)));
                        entry.*.slot = virtual_gamepad_slot;
                        if (entry.*.path != null) {
                            virtual_gamepads = new_virtual_gamepads;
                            num_virtual_gamepads += 1;
                        } else {
                            SDL_free_REAL(@ptrCast(@alignCast(entry.*.path)));
                            SDL_free_REAL(@ptrCast(@alignCast(new_virtual_gamepads)));
                        }
                    }
                }
                _ = close(fd);
            }
            free(@ptrCast(@alignCast(entries[@bitCast(@as(isize, @intCast(i)))])));
        }
    }
    free(@ptrCast(@alignCast(entries)));
    if (num_virtual_gamepads > @as(c_int, 1)) {
        SDL_qsort_REAL(@ptrCast(@alignCast(virtual_gamepads)), @bitCast(@as(c_long, num_virtual_gamepads)), @sizeOf(@TypeOf(virtual_gamepads.*)), sort_virtual_gamepads);
    }
    {
        i = 0;
        while (i < num_virtual_gamepads) : (i += 1) {
            MaybeAddDevice(virtual_gamepads[@bitCast(@as(isize, @intCast(i)))].path);
            SDL_free_REAL(@ptrCast(@alignCast(virtual_gamepads[@bitCast(@as(isize, @intCast(i)))].path)));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(virtual_gamepads)));
}
pub fn LINUX_ScanInputDevices() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var count: c_int = undefined;
    _ = &count;
    var entries: [*c][*c]struct_dirent = null;
    _ = &entries;
    var path: [4096]u8 = undefined;
    _ = &path;
    count = scandir("/dev/input", &entries, filter_entries, null);
    if (count > @as(c_int, 1)) {
        SDL_qsort_REAL(@ptrCast(@alignCast(entries)), @bitCast(@as(c_long, count)), @sizeOf(@TypeOf(entries.*)), sort_entries);
    }
    {
        i = 0;
        while (i < count) : (i += 1) {
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&path)), @sizeOf(@TypeOf(path)) / @sizeOf(@TypeOf(path[@as(c_int, 0)])), "/dev/input/%s", @as([*c]u8, @ptrCast(@alignCast(&entries[@bitCast(@as(isize, @intCast(i)))].*.d_name))));
            MaybeAddDevice(@ptrCast(@alignCast(&path)));
            free(@ptrCast(@alignCast(entries[@bitCast(@as(isize, @intCast(i)))])));
        }
    }
    free(@ptrCast(@alignCast(entries)));
}
pub fn LINUX_FallbackJoystickDetect() callconv(.c) void {
    @setEvalBranchQuota(100000);
    const SDL_JOY_DETECT_INTERVAL_MS: Uint32 = 3000;
    _ = &SDL_JOY_DETECT_INTERVAL_MS;
    var now: Uint64 = SDL_GetTicks_REAL();
    _ = &now;
    if (!(last_joy_detect_time != 0) or (now >= (last_joy_detect_time +% @as(Uint64, SDL_JOY_DETECT_INTERVAL_MS)))) {
        var sb: struct_stat = undefined;
        _ = &sb;
        if ((stat("/dev/input", &sb) == @as(c_int, 0)) and (sb.st_mtim.tv_sec != last_input_dir_mtime)) {
            LINUX_ScanSteamVirtualGamepads();
            LINUX_ScanInputDevices();
            last_input_dir_mtime = sb.st_mtim.tv_sec;
        }
        last_joy_detect_time = now;
    }
}
pub fn LINUX_JoystickDetect() callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (enumeration_method == @as(EnumerationMethod, ENUMERATION_LIBUDEV)) {} else if ((inotify_fd >= @as(c_int, 0)) and (last_joy_detect_time != @as(Uint64, 0))) {
        LINUX_InotifyJoystickDetect();
    } else {
        LINUX_FallbackJoystickDetect();
    }
    HandlePendingRemovals();
}
pub fn LINUX_JoystickIsDevicePresent(_: Uint16, _: Uint16, _: Uint16, _: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"false" != 0;
}
pub fn LINUX_JoystickInit() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var devices: [*c]const u8 = SDL_GetHint_REAL("SDL_JOYSTICK_DEVICE");
    _ = &devices;
    var udev_initialized: bool = SDL_UDEV_Init();
    _ = &udev_initialized;
    SDL_classic_joysticks = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_LINUX_CLASSIC", @"false" != 0);
    enumeration_method = ENUMERATION_UNSET;
    if (devices != null) {
        var envcopy: [*c]u8 = undefined;
        _ = &envcopy;
        var envpath: [*c]u8 = undefined;
        _ = &envpath;
        var delim: [*c]u8 = undefined;
        _ = &delim;
        envcopy = SDL_strdup_REAL(devices);
        envpath = envcopy;
        while (envpath != null) {
            delim = SDL_strchr_REAL(envpath, ':');
            if (delim != null) {
                (blk: {
                    const ref = &delim;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = '\x00';
            }
            MaybeAddDevice(envpath);
            envpath = delim;
        }
        SDL_free_REAL(@ptrCast(@alignCast(envcopy)));
    }
    last_joy_detect_time = 0;
    last_input_dir_mtime = 0;
    LINUX_JoystickDetect();
    if (enumeration_method == @as(EnumerationMethod, ENUMERATION_UNSET)) {
        if (SDL_GetHintBoolean_REAL("SDL_JOYSTICK_DISABLE_UDEV", @"false" != 0)) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "udev disabled by SDL_JOYSTICK_DISABLE_UDEV");
            enumeration_method = ENUMERATION_FALLBACK;
        } else if (SDL_GetSandbox_REAL() != @as(SDL_Sandbox, SDL_SANDBOX_NONE)) {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "Container detected, disabling udev integration");
            enumeration_method = ENUMERATION_FALLBACK;
        } else {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "Using udev for joystick device discovery");
            enumeration_method = ENUMERATION_LIBUDEV;
        }
    }
    if (enumeration_method == @as(EnumerationMethod, ENUMERATION_LIBUDEV)) {
        if (udev_initialized) {
            if (!SDL_UDEV_AddCallback(joystick_udev_callback)) {
                SDL_UDEV_Quit();
                return SDL_SetError_REAL("Could not set up joystick <-> udev callback");
            }
            _ = SDL_UDEV_Scan();
        } else {
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_INPUT, "udev init failed, disabling udev integration");
            enumeration_method = ENUMERATION_FALLBACK;
        }
    } else {
        if (udev_initialized) {
            SDL_UDEV_Quit();
        }
    }
    if (enumeration_method != @as(EnumerationMethod, ENUMERATION_LIBUDEV)) {
        inotify_fd = SDL_inotify_init1();
        if (inotify_fd < @as(c_int, 0)) {
            SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Unable to initialize inotify, falling back to polling: %s", strerror(__errno_location().*));
        } else {
            if (inotify_add_watch(inotify_fd, "/dev/input", @bitCast(@as(c_int, ((IN_CREATE | IN_DELETE) | (IN_MOVED_FROM | IN_MOVED_TO)) | IN_ATTRIB))) < @as(c_int, 0)) {
                _ = close(inotify_fd);
                inotify_fd = -@as(c_int, 1);
                SDL_LogWarn_REAL(SDL_LOG_CATEGORY_INPUT, "Unable to add inotify watch, falling back to polling: %s", strerror(__errno_location().*));
            }
        }
    }
    return @"true" != 0;
}
pub fn LINUX_JoystickGetCount() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    return numjoysticks;
}
pub fn GetJoystickByDevIndex(arg_device_index: c_int) callconv(.c) [*c]SDL_joylist_item {
    @setEvalBranchQuota(100000);
    var device_index = arg_device_index;
    _ = &device_index;
    const static_local___func__ = struct {
        const __func__: [21:0]u8 = "GetJoystickByDevIndex".*;
    };
    _ = &static_local___func__;
    var item: [*c]SDL_joylist_item = undefined;
    _ = &item;
    SDL_AssertJoysticksLocked();
    if ((device_index < @as(c_int, 0)) or (device_index >= numjoysticks)) {
        return null;
    }
    item = SDL_joylist;
    while (device_index > @as(c_int, 0)) {
        while (true) {
            while (!(@as(?*anyopaque, @ptrCast(@alignCast(item))) != @as(?*anyopaque, null))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "item != ((void*)0)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysjoystick.c", 1119);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        device_index -= 1;
        item = item.*.next;
    }
    return item;
}
pub fn LINUX_JoystickGetDeviceName(device_index: c_int) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    return GetJoystickByDevIndex(device_index).*.name;
}
pub fn LINUX_JoystickGetDevicePath(device_index: c_int) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    return GetJoystickByDevIndex(device_index).*.path;
}
pub fn LINUX_JoystickGetDeviceSteamVirtualGamepadSlot(device_index: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return GetJoystickByDevIndex(device_index).*.steam_virtual_gamepad_slot;
}
pub fn LINUX_JoystickGetDevicePlayerIndex(_: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn LINUX_JoystickSetDevicePlayerIndex(_: c_int, _: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn LINUX_JoystickGetDeviceGUID(device_index: c_int) callconv(.c) SDL_GUID {
    @setEvalBranchQuota(100000);
    return GetJoystickByDevIndex(device_index).*.guid;
}
pub fn LINUX_JoystickGetDeviceInstanceID(device_index: c_int) callconv(.c) SDL_JoystickID {
    @setEvalBranchQuota(100000);
    return GetJoystickByDevIndex(device_index).*.device_instance;
}
pub fn allocate_balldata(joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    joystick.*.hwdata.*.balls = @ptrCast(@alignCast(SDL_calloc_REAL(@bitCast(@as(c_long, joystick.*.nballs)), @sizeOf(struct_hwdata_ball_9))));
    if (@as(?*anyopaque, @ptrCast(@alignCast(joystick.*.hwdata.*.balls))) == @as(?*anyopaque, null)) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn allocate_hatdata(joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    joystick.*.hwdata.*.hats = @ptrCast(@alignCast(SDL_malloc_REAL(@as(c_ulong, @bitCast(@as(c_long, joystick.*.nhats))) *% @sizeOf(struct_hwdata_hat_10))));
    if (!(joystick.*.hwdata.*.hats != null)) {
        return @"false" != 0;
    }
    {
        i = 0;
        while (i < joystick.*.nhats) : (i += 1) {
            joystick.*.hwdata.*.hats[@bitCast(@as(isize, @intCast(i)))].axis[@as(c_int, 0)] = 1;
            joystick.*.hwdata.*.hats[@bitCast(@as(isize, @intCast(i)))].axis[@as(c_int, 1)] = 1;
        }
    }
    return @"true" != 0;
}
pub fn GuessIfAxesAreDigitalHat(absinfo_x: [*c]struct_input_absinfo, absinfo_y: [*c]struct_input_absinfo) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (!(absinfo_x != null) and !(absinfo_y != null)) {
        return @"false" != 0;
    }
    if (SDL_GetHintBoolean_REAL("SDL_JOYSTICK_LINUX_DIGITAL_HATS", @"false" != 0)) {
        return @"true" != 0;
    }
    if ((!(absinfo_x != null) or ((absinfo_x.*.minimum == -@as(c_int, 1)) and (absinfo_x.*.maximum == @as(c_int, 1)))) and (!(absinfo_y != null) or ((absinfo_y.*.minimum == -@as(c_int, 1)) and (absinfo_y.*.maximum == @as(c_int, 1))))) {
        return @"true" != 0;
    }
    if ((!(absinfo_x != null) or ((!(absinfo_x.*.fuzz != 0) and !(absinfo_x.*.flat != 0)) and !(absinfo_x.*.resolution != 0))) and (!(absinfo_y != null) or ((!(absinfo_y.*.fuzz != 0) and !(absinfo_y.*.flat != 0)) and !(absinfo_y.*.resolution != 0)))) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn ConfigJoystick(joystick: [*c]SDL_Joystick, fd: c_int, arg_fd_sensor: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var fd_sensor = arg_fd_sensor;
    _ = &fd_sensor;
    var i: c_int = undefined;
    _ = &i;
    var t: c_int = undefined;
    _ = &t;
    var keybit: [12]c_ulong = [1]c_ulong{
        0,
    } ++ @as([11]c_ulong, @splat(0));
    _ = &keybit;
    var absbit: [1]c_ulong = [1]c_ulong{
        0,
    };
    _ = &absbit;
    var relbit: [1]c_ulong = [1]c_ulong{
        0,
    };
    _ = &relbit;
    var ffbit: [2]c_ulong = [1]c_ulong{
        0,
    } ++ @as([1]c_ulong, @splat(0));
    _ = &ffbit;
    var key_pam_size: Uint8 = undefined;
    _ = &key_pam_size;
    var abs_pam_size: Uint8 = undefined;
    _ = &abs_pam_size;
    var use_deadzones: bool = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_LINUX_DEADZONES", @"false" != 0);
    _ = &use_deadzones;
    var use_hat_deadzones: bool = SDL_GetHintBoolean_REAL("SDL_JOYSTICK_LINUX_HAT_DEADZONES", @"true" != 0);
    _ = &use_hat_deadzones;
    SDL_AssertJoysticksLocked();
    if (((ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 32) + EV_KEY) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(keybit)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&keybit)))) >= @as(c_int, 0)) and (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 32) + EV_ABS) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(absbit)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&absbit)))) >= @as(c_int, 0))) and (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 32) + EV_REL) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(relbit)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&relbit)))) >= @as(c_int, 0))) {
        {
            i = BTN_JOYSTICK;
            while (i < KEY_MAX) : (i += 1) {
                if (((keybit[@as(c_ulong, @bitCast(@as(c_long, i))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, i))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
                    joystick.*.hwdata.*.key_map[@bitCast(@as(isize, @intCast(i)))] = @bitCast(@as(i8, @truncate(joystick.*.nbuttons)));
                    joystick.*.hwdata.*.has_key[@bitCast(@as(isize, @intCast(i)))] = @"true" != 0;
                    joystick.*.nbuttons += 1;
                }
            }
        }
        {
            i = 0;
            while (i < BTN_JOYSTICK) : (i += 1) {
                if (((keybit[@as(c_ulong, @bitCast(@as(c_long, i))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, i))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
                    joystick.*.hwdata.*.key_map[@bitCast(@as(isize, @intCast(i)))] = @bitCast(@as(i8, @truncate(joystick.*.nbuttons)));
                    joystick.*.hwdata.*.has_key[@bitCast(@as(isize, @intCast(i)))] = @"true" != 0;
                    joystick.*.nbuttons += 1;
                }
            }
        }
        {
            i = ABS_HAT0X;
            while (i <= ABS_HAT3Y) : (i += 2) {
                var hat_x: c_int = -@as(c_int, 1);
                _ = &hat_x;
                var hat_y: c_int = -@as(c_int, 1);
                _ = &hat_y;
                var absinfo_x: struct_input_absinfo = undefined;
                _ = &absinfo_x;
                var absinfo_y: struct_input_absinfo = undefined;
                _ = &absinfo_y;
                if (((absbit[@as(c_ulong, @bitCast(@as(c_long, i))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, i))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
                    hat_x = ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + i) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &absinfo_x);
                }
                if (((absbit[@as(c_ulong, @bitCast(@as(c_long, i + @as(c_int, 1)))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, i + @as(c_int, 1)))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
                    hat_y = ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + (i + @as(c_int, 1))) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &absinfo_y);
                }
                if (GuessIfAxesAreDigitalHat(@ptrCast(@alignCast(if (hat_x < @as(c_int, 0)) @as(?*anyopaque, null) else @as(?*anyopaque, @ptrCast(@alignCast(&absinfo_x))))), @ptrCast(@alignCast(if (hat_y < @as(c_int, 0)) @as(?*anyopaque, null) else @as(?*anyopaque, @ptrCast(@alignCast(&absinfo_y))))))) {
                    const hat_index: c_int = @divTrunc(i - ABS_HAT0X, @as(c_int, 2));
                    _ = &hat_index;
                    var correct: [*c]struct_hat_axis_correct_12 = &joystick.*.hwdata.*.hat_correct[@bitCast(@as(isize, @intCast(hat_index)))];
                    _ = &correct;
                    joystick.*.hwdata.*.hats_indices[@bitCast(@as(isize, @intCast(hat_index)))] = joystick.*.nhats;
                    joystick.*.hwdata.*.has_hat[@bitCast(@as(isize, @intCast(hat_index)))] = @"true" != 0;
                    correct.*.use_deadzones = use_hat_deadzones;
                    correct.*.minimum[@as(c_int, 0)] = if (hat_x < @as(c_int, 0)) -@as(c_int, 1) else absinfo_x.minimum;
                    correct.*.maximum[@as(c_int, 0)] = if (hat_x < @as(c_int, 0)) @as(c_int, 1) else absinfo_x.maximum;
                    correct.*.minimum[@as(c_int, 1)] = if (hat_y < @as(c_int, 0)) -@as(c_int, 1) else absinfo_y.minimum;
                    correct.*.maximum[@as(c_int, 1)] = if (hat_y < @as(c_int, 0)) @as(c_int, 1) else absinfo_y.maximum;
                    joystick.*.nhats += 1;
                }
            }
        }
        {
            i = 0;
            while (i < ABS_MAX) : (i += 1) {
                if (((i >= ABS_HAT0X) and (i <= ABS_HAT3Y)) and joystick.*.hwdata.*.has_hat[@bitCast(@as(isize, @intCast(@divTrunc(i - ABS_HAT0X, @as(c_int, 2)))))]) {
                    continue;
                }
                if (((absbit[@as(c_ulong, @bitCast(@as(c_long, i))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, i))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
                    var absinfo: struct_input_absinfo = undefined;
                    _ = &absinfo;
                    var correct: [*c]struct_axis_correct_11 = &joystick.*.hwdata.*.abs_correct[@bitCast(@as(isize, @intCast(i)))];
                    _ = &correct;
                    if (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + i) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &absinfo) < @as(c_int, 0)) {
                        continue;
                    }
                    joystick.*.hwdata.*.abs_map[@bitCast(@as(isize, @intCast(i)))] = @bitCast(@as(i8, @truncate(joystick.*.naxes)));
                    joystick.*.hwdata.*.has_abs[@bitCast(@as(isize, @intCast(i)))] = @"true" != 0;
                    correct.*.minimum = absinfo.minimum;
                    correct.*.maximum = absinfo.maximum;
                    if (correct.*.minimum != correct.*.maximum) {
                        if (use_deadzones) {
                            correct.*.use_deadzones = @"true" != 0;
                            correct.*.coef[@as(c_int, 0)] = (absinfo.maximum + absinfo.minimum) - (@as(c_int, 2) * absinfo.flat);
                            correct.*.coef[@as(c_int, 1)] = (absinfo.maximum + absinfo.minimum) + (@as(c_int, 2) * absinfo.flat);
                            t = (absinfo.maximum - absinfo.minimum) - (@as(c_int, 4) * absinfo.flat);
                            if (t != @as(c_int, 0)) {
                                correct.*.coef[@as(c_int, 2)] = @divTrunc(@as(c_int, 1) << @intCast(@as(c_int, 28)), t);
                            } else {
                                correct.*.coef[@as(c_int, 2)] = 0;
                            }
                        } else {
                            var value_range: f32 = @floatFromInt(correct.*.maximum - correct.*.minimum);
                            _ = &value_range;
                            var output_range: f32 = @floatFromInt(SDL_JOYSTICK_AXIS_MAX - -@as(c_int, 32768));
                            _ = &output_range;
                            correct.*.scale = output_range / value_range;
                        }
                    }
                    joystick.*.naxes += 1;
                }
            }
        }
        if ((((relbit[@as(c_ulong, @bitCast(@as(c_long, REL_X))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, REL_X))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) or (((relbit[@as(c_ulong, @bitCast(@as(c_long, REL_Y))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, REL_Y))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0)) {
            joystick.*.nballs += 1;
        }
    } else if ((ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'j') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 18) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(__u8) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &key_pam_size, @as(usize, @sizeOf(@TypeOf(key_pam_size)))) >= @as(c_int, 0)) and (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'j') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 17) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(__u8) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &abs_pam_size, @as(usize, @sizeOf(@TypeOf(abs_pam_size)))) >= @as(c_int, 0))) {
        var len: usize = undefined;
        _ = &len;
        joystick.*.hwdata.*.classic = @"true" != 0;
        len = @as(c_ulong, @bitCast(@as(c_long, (KEY_MAX - BTN_MISC) + @as(c_int, 1)))) *% @sizeOf(@TypeOf(joystick.*.hwdata.*.key_pam.*));
        joystick.*.hwdata.*.key_pam = @ptrCast(@alignCast(SDL_calloc_REAL(1, len)));
        if (joystick.*.hwdata.*.key_pam != null) {
            if (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'j') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 52) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf([512]__u16) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), joystick.*.hwdata.*.key_pam, len) < @as(c_int, 0)) {
                SDL_free_REAL(@ptrCast(@alignCast(joystick.*.hwdata.*.key_pam)));
                joystick.*.hwdata.*.key_pam = null;
                key_pam_size = 0;
            }
        } else {
            key_pam_size = 0;
        }
        {
            i = 0;
            while (i < @as(c_int, key_pam_size)) : (i += 1) {
                var code: Uint16 = joystick.*.hwdata.*.key_pam[@bitCast(@as(isize, @intCast(i)))];
                _ = &code;
                joystick.*.hwdata.*.key_map[code] = @bitCast(@as(i8, @truncate(joystick.*.nbuttons)));
                joystick.*.hwdata.*.has_key[code] = @"true" != 0;
                joystick.*.nbuttons += 1;
            }
        }
        len = @as(c_ulong, @bitCast(@as(c_long, ABS_MAX + @as(c_int, 1)))) *% @sizeOf(@TypeOf(joystick.*.hwdata.*.abs_pam.*));
        joystick.*.hwdata.*.abs_pam = @ptrCast(@alignCast(SDL_calloc_REAL(1, len)));
        if (joystick.*.hwdata.*.abs_pam != null) {
            if (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'j') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 50) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf([64]__u8) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), joystick.*.hwdata.*.abs_pam, len) < @as(c_int, 0)) {
                SDL_free_REAL(@ptrCast(@alignCast(joystick.*.hwdata.*.abs_pam)));
                joystick.*.hwdata.*.abs_pam = null;
                abs_pam_size = 0;
            }
        } else {
            abs_pam_size = 0;
        }
        {
            i = 0;
            while (i < @as(c_int, abs_pam_size)) : (i += 1) {
                var code: Uint8 = joystick.*.hwdata.*.abs_pam[@bitCast(@as(isize, @intCast(i)))];
                _ = &code;
                if ((@as(c_int, code) >= ABS_HAT0X) and (@as(c_int, code) <= ABS_HAT3Y)) {
                    var hat_index: c_int = @divTrunc(@as(c_int, code) - ABS_HAT0X, @as(c_int, 2));
                    _ = &hat_index;
                    if (!joystick.*.hwdata.*.has_hat[@bitCast(@as(isize, @intCast(hat_index)))]) {
                        joystick.*.hwdata.*.hats_indices[@bitCast(@as(isize, @intCast(hat_index)))] = blk: {
                            const ref = &joystick.*.nhats;
                            const tmp = ref.*;
                            ref.* += 1;
                            break :blk tmp;
                        };
                        joystick.*.hwdata.*.has_hat[@bitCast(@as(isize, @intCast(hat_index)))] = @"true" != 0;
                        joystick.*.hwdata.*.hat_correct[@bitCast(@as(isize, @intCast(hat_index)))].minimum[@as(c_int, 0)] = -@as(c_int, 1);
                        joystick.*.hwdata.*.hat_correct[@bitCast(@as(isize, @intCast(hat_index)))].maximum[@as(c_int, 0)] = 1;
                        joystick.*.hwdata.*.hat_correct[@bitCast(@as(isize, @intCast(hat_index)))].minimum[@as(c_int, 1)] = -@as(c_int, 1);
                        joystick.*.hwdata.*.hat_correct[@bitCast(@as(isize, @intCast(hat_index)))].maximum[@as(c_int, 1)] = 1;
                    }
                } else {
                    joystick.*.hwdata.*.abs_map[code] = @bitCast(@as(i8, @truncate(joystick.*.naxes)));
                    joystick.*.hwdata.*.has_abs[code] = @"true" != 0;
                    joystick.*.naxes += 1;
                }
            }
        }
    }
    if ((fd_sensor >= @as(c_int, 0)) and (ioctl(fd_sensor, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 32) + EV_ABS) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(absbit)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&absbit)))) >= @as(c_int, 0))) {
        if ((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((((absbit[@as(c_ulong, @bitCast(@as(c_long, ABS_X))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_X))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) and (((absbit[@as(c_ulong, @bitCast(@as(c_long, ABS_Y))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_Y))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) and (((absbit[@as(c_ulong, @bitCast(@as(c_long, ABS_Z))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_Z))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0)) {
            joystick.*.hwdata.*.has_accelerometer = @"true" != 0;
            {
                i = 0;
                while (i < @as(c_int, 3)) : (i += 1) {
                    var absinfo: struct_input_absinfo = undefined;
                    _ = &absinfo;
                    if (ioctl(fd_sensor, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + (ABS_X + i)) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &absinfo) < @as(c_int, 0)) {
                        joystick.*.hwdata.*.has_accelerometer = @"false" != 0;
                        break;
                    }
                    joystick.*.hwdata.*.accelerometer_scale[@bitCast(@as(isize, @intCast(i)))] = @floatFromInt(absinfo.resolution);
                }
            }
        }
        if ((@as(c_ulong, @bitCast(@as(c_long, @intFromBool((((absbit[@as(c_ulong, @bitCast(@as(c_long, ABS_RX))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_RX))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) and (((absbit[@as(c_ulong, @bitCast(@as(c_long, ABS_RY))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_RY))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0))))) != 0) and (((absbit[@as(c_ulong, @bitCast(@as(c_long, ABS_RZ))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, ABS_RZ))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0)) {
            joystick.*.hwdata.*.has_gyro = @"true" != 0;
            {
                i = 0;
                while (i < @as(c_int, 3)) : (i += 1) {
                    var absinfo: struct_input_absinfo = undefined;
                    _ = &absinfo;
                    if (ioctl(fd_sensor, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + (ABS_RX + i)) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &absinfo) < @as(c_int, 0)) {
                        joystick.*.hwdata.*.has_gyro = @"false" != 0;
                        break;
                    }
                    joystick.*.hwdata.*.gyro_scale[@bitCast(@as(isize, @intCast(i)))] = @floatFromInt(absinfo.resolution);
                }
            }
        }
    }
    if (joystick.*.nballs > @as(c_int, 0)) {
        if (!allocate_balldata(joystick)) {
            joystick.*.nballs = 0;
        }
    }
    if (joystick.*.nhats > @as(c_int, 0)) {
        if (!allocate_hatdata(joystick)) {
            joystick.*.nhats = 0;
        }
    }
    if (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 32) + EV_FF) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(ffbit)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&ffbit)))) >= @as(c_int, 0)) {
        if (((ffbit[@as(c_ulong, @bitCast(@as(c_long, FF_RUMBLE))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_RUMBLE))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
            joystick.*.hwdata.*.ff_rumble = @"true" != 0;
        }
        if (((ffbit[@as(c_ulong, @bitCast(@as(c_long, FF_SINE))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_SINE))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
            joystick.*.hwdata.*.ff_sine = @"true" != 0;
        }
    }
}
pub fn PrepareJoystickHwdata(joystick: [*c]SDL_Joystick, item: [*c]SDL_joylist_item, item_sensor: [*c]SDL_sensorlist_item) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    joystick.*.hwdata.*.item = item;
    joystick.*.hwdata.*.item_sensor = item_sensor;
    joystick.*.hwdata.*.guid = item.*.guid;
    joystick.*.hwdata.*.effect.id = @truncate(-@as(c_int, 1));
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&joystick.*.hwdata.*.key_map))))), 255, @sizeOf(@TypeOf(joystick.*.hwdata.*.key_map)));
    _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&joystick.*.hwdata.*.abs_map))))), 255, @sizeOf(@TypeOf(joystick.*.hwdata.*.abs_map)));
    var fd: c_int = -@as(c_int, 1);
    _ = &fd;
    var fd_sensor: c_int = -@as(c_int, 1);
    _ = &fd_sensor;
    fd = open(item.*.path, O_RDWR | __O_CLOEXEC, @as(c_int, 0));
    if (fd < @as(c_int, 0)) {
        fd = open(item.*.path, O_RDONLY | __O_CLOEXEC, @as(c_int, 0));
    }
    if (fd < @as(c_int, 0)) {
        return SDL_SetError_REAL("Unable to open %s", item.*.path);
    }
    if (item_sensor != null) {
        fd_sensor = open(item_sensor.*.path, O_RDONLY | __O_CLOEXEC, @as(c_int, 0));
    }
    joystick.*.hwdata.*.fd = fd;
    joystick.*.hwdata.*.fd_sensor = fd_sensor;
    joystick.*.hwdata.*.fname = SDL_strdup_REAL(item.*.path);
    if (!(joystick.*.hwdata.*.fname != null)) {
        _ = close(fd);
        if (fd_sensor >= @as(c_int, 0)) {
            _ = close(fd_sensor);
        }
        return @"false" != 0;
    }
    _ = fcntl(fd, F_SETFL, O_NONBLOCK);
    if (fd_sensor >= @as(c_int, 0)) {
        _ = fcntl(fd_sensor, F_SETFL, O_NONBLOCK);
    }
    ConfigJoystick(joystick, fd, fd_sensor);
    return @"true" != 0;
}
pub fn GetSensor(item: [*c]SDL_joylist_item) callconv(.c) [*c]SDL_sensorlist_item {
    @setEvalBranchQuota(100000);
    var item_sensor: [*c]SDL_sensorlist_item = undefined;
    _ = &item_sensor;
    var uniq_item: [128]u8 = undefined;
    _ = &uniq_item;
    var fd_item: c_int = -@as(c_int, 1);
    _ = &fd_item;
    SDL_AssertJoysticksLocked();
    if (!(item != null) or !(SDL_sensorlist != null)) {
        return null;
    }
    _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&uniq_item))))), 0, @sizeOf(@TypeOf(uniq_item)));
    fd_item = open(item.*.path, O_RDONLY | __O_CLOEXEC, @as(c_int, 0));
    if (fd_item < @as(c_int, 0)) {
        return null;
    }
    if (ioctl(fd_item, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) << @intCast(_IOC_NRSHIFT))))) | ((@sizeOf(@TypeOf(uniq_item)) -% @as(c_ulong, 1)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &uniq_item) < @as(c_int, 0)) {
        _ = close(fd_item);
        return null;
    }
    _ = close(fd_item);
    {
        item_sensor = SDL_sensorlist;
        while (item_sensor != null) : (item_sensor = item_sensor.*.next) {
            var uniq_sensor: [128]u8 = undefined;
            _ = &uniq_sensor;
            var fd_sensor: c_int = -@as(c_int, 1);
            _ = &fd_sensor;
            if (item_sensor.*.hwdata != null) {
                continue;
            }
            _ = memset(@ptrCast(@alignCast(@as([*c]u8, @ptrCast(@alignCast(&uniq_sensor))))), 0, @sizeOf(@TypeOf(uniq_sensor)));
            fd_sensor = open(item_sensor.*.path, O_RDONLY | __O_CLOEXEC, @as(c_int, 0));
            if (fd_sensor < @as(c_int, 0)) {
                continue;
            }
            if (ioctl(fd_sensor, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 8) << @intCast(_IOC_NRSHIFT))))) | ((@sizeOf(@TypeOf(uniq_sensor)) -% @as(c_ulong, 1)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &uniq_sensor) < @as(c_int, 0)) {
                _ = close(fd_sensor);
                continue;
            }
            _ = close(fd_sensor);
            if (SDL_strcmp_REAL(@ptrCast(@alignCast(&uniq_item)), @ptrCast(@alignCast(&uniq_sensor))) == @as(c_int, 0)) {
                return item_sensor;
            }
        }
    }
    return null;
}
pub fn LINUX_JoystickOpen(joystick: [*c]SDL_Joystick, device_index: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "LINUX_JoystickOpen".*;
    };
    _ = &static_local___func__;
    var item: [*c]SDL_joylist_item = undefined;
    _ = &item;
    var item_sensor: [*c]SDL_sensorlist_item = undefined;
    _ = &item_sensor;
    SDL_AssertJoysticksLocked();
    item = GetJoystickByDevIndex(device_index);
    if (!(item != null)) {
        return SDL_SetError_REAL("No such device");
    }
    joystick.*.hwdata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(joystick.*.hwdata.*)))));
    if (!(joystick.*.hwdata != null)) {
        return @"false" != 0;
    }
    item_sensor = GetSensor(item);
    if (!PrepareJoystickHwdata(joystick, item, item_sensor)) {
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.hwdata)));
        joystick.*.hwdata = null;
        return @"false" != 0;
    }
    while (true) {
        while (!(@as(?*anyopaque, @ptrCast(@alignCast(item.*.hwdata))) == @as(?*anyopaque, null))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "item->hwdata == ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysjoystick.c", 1610);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    while (true) {
        while (!(!(item_sensor != null) or (@as(?*anyopaque, @ptrCast(@alignCast(item_sensor.*.hwdata))) == @as(?*anyopaque, null)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!item_sensor || item_sensor->hwdata == ((void*)0)",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysjoystick.c", 1611);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    item.*.hwdata = joystick.*.hwdata;
    if (item_sensor != null) {
        item_sensor.*.hwdata = joystick.*.hwdata;
    }
    joystick.*.serial = SDL_UDEV_GetProductSerial(item.*.path);
    joystick.*.hwdata.*.fresh = @"true" != 0;
    if (joystick.*.hwdata.*.has_gyro) {
        SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_GYRO, 0.0);
    }
    if (joystick.*.hwdata.*.has_accelerometer) {
        SDL_PrivateJoystickAddSensor(joystick, SDL_SENSOR_ACCEL, 0.0);
    }
    if (joystick.*.hwdata.*.fd_sensor >= @as(c_int, 0)) {
        _ = close(joystick.*.hwdata.*.fd_sensor);
        joystick.*.hwdata.*.fd_sensor = -@as(c_int, 1);
    }
    if (joystick.*.hwdata.*.ff_rumble or joystick.*.hwdata.*.ff_sine) {
        _ = SDL_SetBooleanProperty_REAL(SDL_GetJoystickProperties_REAL(joystick), "SDL.joystick.cap.rumble", @"true" != 0);
    }
    return @"true" != 0;
}
pub fn LINUX_JoystickRumble(joystick: [*c]SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var event: struct_input_event = undefined;
    _ = &event;
    SDL_AssertJoysticksLocked();
    if (joystick.*.hwdata.*.ff_rumble) {
        var effect: [*c]struct_ff_effect = &joystick.*.hwdata.*.effect;
        _ = &effect;
        effect.*.type = FF_RUMBLE;
        effect.*.replay.length = SDL_MAX_RUMBLE_DURATION_MS;
        effect.*.u.rumble.strong_magnitude = low_frequency_rumble;
        effect.*.u.rumble.weak_magnitude = high_frequency_rumble;
    } else if (joystick.*.hwdata.*.ff_sine) {
        var magnitude: Sint16 = @truncate(@divTrunc(@divTrunc(@as(c_int, low_frequency_rumble), @as(c_int, 2)) + @divTrunc(@as(c_int, high_frequency_rumble), @as(c_int, 2)), @as(c_int, 2)));
        _ = &magnitude;
        var effect: [*c]struct_ff_effect = &joystick.*.hwdata.*.effect;
        _ = &effect;
        effect.*.type = FF_PERIODIC;
        effect.*.replay.length = SDL_MAX_RUMBLE_DURATION_MS;
        effect.*.u.periodic.waveform = FF_SINE;
        effect.*.u.periodic.magnitude = magnitude;
    } else {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (ioctl(joystick.*.hwdata.*.fd, @as(c_ulong, ((_IOC_WRITE << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 128) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_ff_effect) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &joystick.*.hwdata.*.effect) < @as(c_int, 0)) {
        joystick.*.hwdata.*.effect.id = @truncate(-@as(c_int, 1));
        if (ioctl(joystick.*.hwdata.*.fd, @as(c_ulong, ((_IOC_WRITE << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 128) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_ff_effect) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &joystick.*.hwdata.*.effect) < @as(c_int, 0)) {
            return SDL_SetError_REAL("Couldn't update rumble effect: %s", strerror(__errno_location().*));
        }
    }
    event.type = EV_FF;
    event.code = @bitCast(@as(c_short, joystick.*.hwdata.*.effect.id));
    event.value = 1;
    if (write(joystick.*.hwdata.*.fd, @ptrCast(@alignCast(&event)), @sizeOf(@TypeOf(event))) < @as(isize, 0)) {
        return SDL_SetError_REAL("Couldn't start rumble effect: %s", strerror(__errno_location().*));
    }
    return @"true" != 0;
}
pub fn LINUX_JoystickRumbleTriggers(_: [*c]SDL_Joystick, _: Uint16, _: Uint16) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn LINUX_JoystickSetLED(_: [*c]SDL_Joystick, _: Uint8, _: Uint8, _: Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn LINUX_JoystickSendEffect(_: [*c]SDL_Joystick, _: ?*const anyopaque, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn LINUX_JoystickSetSensorsEnabled(joystick: [*c]SDL_Joystick, enabled: bool) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [31:0]u8 = "LINUX_JoystickSetSensorsEnabled".*;
    };
    _ = &static_local___func__;
    SDL_AssertJoysticksLocked();
    if (!joystick.*.hwdata.*.has_accelerometer and !joystick.*.hwdata.*.has_gyro) {
        return SDL_SetError_REAL("That operation is not supported");
    }
    if (@as(c_int, @intFromBool(enabled)) == @as(c_int, @intFromBool(joystick.*.hwdata.*.report_sensor))) {
        return @"true" != 0;
    }
    if (enabled) {
        if (!(joystick.*.hwdata.*.item_sensor != null)) {
            return SDL_SetError_REAL("Sensors unplugged.");
        }
        joystick.*.hwdata.*.fd_sensor = open(joystick.*.hwdata.*.item_sensor.*.path, O_RDONLY | __O_CLOEXEC, @as(c_int, 0));
        if (joystick.*.hwdata.*.fd_sensor < @as(c_int, 0)) {
            return SDL_SetError_REAL("Couldn't open sensor file %s.", joystick.*.hwdata.*.item_sensor.*.path);
        }
        _ = fcntl(joystick.*.hwdata.*.fd_sensor, F_SETFL, O_NONBLOCK);
    } else {
        while (true) {
            while (!(joystick.*.hwdata.*.fd_sensor >= @as(c_int, 0))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "joystick->hwdata->fd_sensor >= 0",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysjoystick.c", 1721);
                _ = &sdl_assert_state;
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    continue;
                } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    __builtin.debugtrap();
                }
                break;
            }
            if (!(@as(c_int, 0) != 0)) break;
        }
        _ = close(joystick.*.hwdata.*.fd_sensor);
        joystick.*.hwdata.*.fd_sensor = -@as(c_int, 1);
    }
    joystick.*.hwdata.*.report_sensor = enabled;
    return @"true" != 0;
}
pub fn HandleHat(timestamp: Uint64, stick: [*c]SDL_Joystick, hatidx: c_int, axis: c_int, arg_value: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var value = arg_value;
    _ = &value;
    var hatnum: c_int = undefined;
    _ = &hatnum;
    var the_hat: [*c]struct_hwdata_hat_10 = undefined;
    _ = &the_hat;
    var correct: [*c]struct_hat_axis_correct_12 = undefined;
    _ = &correct;
    var position_map: [3][3]Uint8 = [3][3]Uint8{
        [3]Uint8{
            @truncate(SDL_HAT_LEFT | SDL_HAT_UP),
            SDL_HAT_UP,
            @truncate(SDL_HAT_RIGHT | SDL_HAT_UP),
        },
        [3]Uint8{
            SDL_HAT_LEFT,
            SDL_HAT_CENTERED,
            SDL_HAT_RIGHT,
        },
        [3]Uint8{
            @truncate(SDL_HAT_LEFT | SDL_HAT_DOWN),
            SDL_HAT_DOWN,
            @truncate(SDL_HAT_RIGHT | SDL_HAT_DOWN),
        },
    };
    _ = &position_map;
    SDL_AssertJoysticksLocked();
    hatnum = stick.*.hwdata.*.hats_indices[@bitCast(@as(isize, @intCast(hatidx)))];
    the_hat = &stick.*.hwdata.*.hats[@bitCast(@as(isize, @intCast(hatnum)))];
    correct = &stick.*.hwdata.*.hat_correct[@bitCast(@as(isize, @intCast(hatidx)))];
    if (value < @as(c_int, 0)) {
        if (value <= correct.*.minimum[@bitCast(@as(isize, @intCast(axis)))]) {
            correct.*.minimum[@bitCast(@as(isize, @intCast(axis)))] = value;
            value = 0;
        } else if (!correct.*.use_deadzones or (value < @divTrunc(correct.*.minimum[@bitCast(@as(isize, @intCast(axis)))], @as(c_int, 3)))) {
            value = 0;
        } else {
            value = 1;
        }
    } else if (value > @as(c_int, 0)) {
        if (value >= correct.*.maximum[@bitCast(@as(isize, @intCast(axis)))]) {
            correct.*.maximum[@bitCast(@as(isize, @intCast(axis)))] = value;
            value = 2;
        } else if (!correct.*.use_deadzones or (value > @divTrunc(correct.*.maximum[@bitCast(@as(isize, @intCast(axis)))], @as(c_int, 3)))) {
            value = 2;
        } else {
            value = 1;
        }
    } else {
        value = 1;
    }
    if (value != the_hat.*.axis[@bitCast(@as(isize, @intCast(axis)))]) {
        the_hat.*.axis[@bitCast(@as(isize, @intCast(axis)))] = value;
        SDL_SendJoystickHat(timestamp, stick, @bitCast(@as(i8, @truncate(hatnum))), position_map[@bitCast(@as(isize, @intCast(the_hat.*.axis[@as(c_int, 1)])))][@bitCast(@as(isize, @intCast(the_hat.*.axis[@as(c_int, 0)])))]);
    }
}
pub fn HandleBall(stick: [*c]SDL_Joystick, ball: Uint8, axis: c_int, value: c_int) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    stick.*.hwdata.*.balls[ball].axis[@bitCast(@as(isize, @intCast(axis)))] += value;
}
pub fn AxisCorrect(joystick: [*c]SDL_Joystick, which: c_int, arg_value: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var value = arg_value;
    _ = &value;
    var correct: [*c]struct_axis_correct_11 = undefined;
    _ = &correct;
    SDL_AssertJoysticksLocked();
    correct = &joystick.*.hwdata.*.abs_correct[@bitCast(@as(isize, @intCast(which)))];
    if (correct.*.minimum != correct.*.maximum) {
        if (correct.*.use_deadzones) {
            value *= 2;
            if (value > correct.*.coef[@as(c_int, 0)]) {
                if (value < correct.*.coef[@as(c_int, 1)]) {
                    return 0;
                }
                value -= correct.*.coef[@as(c_int, 1)];
            } else {
                value -= correct.*.coef[@as(c_int, 0)];
            }
            value *= correct.*.coef[@as(c_int, 2)];
            value >>= @intCast(@as(c_int, 13));
        } else {
            value = @intFromFloat(SDL_floorf_REAL(((@as(f32, @floatFromInt(value - correct.*.minimum)) * correct.*.scale) + @as(f32, @floatFromInt(-@as(c_int, 32768)))) + @as(f32, 0.5)));
        }
    }
    if (value < -@as(c_int, 32768)) {
        return -@as(c_int, 32768);
    }
    if (value > SDL_JOYSTICK_AXIS_MAX) {
        return SDL_JOYSTICK_AXIS_MAX;
    }
    return value;
}
pub fn PollAllValues(timestamp: Uint64, joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [13:0]u8 = "PollAllValues".*;
    };
    _ = &static_local___func__;
    var absinfo: struct_input_absinfo = undefined;
    _ = &absinfo;
    var keyinfo: [12]c_ulong = undefined;
    _ = &keyinfo;
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    {
        i = ABS_X;
        while (i < ABS_MAX) : (i += 1) {
            if (joystick.*.hwdata.*.has_abs[@bitCast(@as(isize, @intCast(i)))]) {
                if (ioctl(joystick.*.hwdata.*.fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + i) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &absinfo) >= @as(c_int, 0)) {
                    absinfo.value = AxisCorrect(joystick, i, absinfo.value);
                    SDL_SendJoystickAxis(timestamp, joystick, joystick.*.hwdata.*.abs_map[@bitCast(@as(isize, @intCast(i)))], @truncate(absinfo.value));
                }
            }
        }
    }
    {
        i = ABS_HAT0X;
        while (i <= ABS_HAT3Y) : (i += 1) {
            const baseaxis: c_int = i - ABS_HAT0X;
            _ = &baseaxis;
            const hatidx: c_int = @divTrunc(baseaxis, @as(c_int, 2));
            _ = &hatidx;
            while (true) {
                while (!(@as(c_ulong, @bitCast(@as(c_long, hatidx))) < (@sizeOf(@TypeOf(joystick.*.hwdata.*.has_hat)) / @sizeOf(@TypeOf(joystick.*.hwdata.*.has_hat[@as(c_int, 0)]))))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "hatidx < (sizeof(joystick->hwdata->has_hat)/sizeof(joystick->hwdata->has_hat[0]))",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysjoystick.c", 1851);
                    _ = &sdl_assert_state;
                    if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                        continue;
                    } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                        __builtin.debugtrap();
                    }
                    break;
                }
                if (!(@as(c_int, 0) != 0)) break;
            }
            if (joystick.*.hwdata.*.has_hat[@bitCast(@as(isize, @intCast(hatidx)))]) {
                if (ioctl(joystick.*.hwdata.*.fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + i) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &absinfo) >= @as(c_int, 0)) {
                    const hataxis: c_int = __helpers.signedRemainder(baseaxis, @as(c_int, 2));
                    _ = &hataxis;
                    HandleHat(timestamp, joystick, hatidx, hataxis, absinfo.value);
                }
            }
        }
    }
    _ = memset(@ptrCast(@alignCast(@as([*c]c_ulong, @ptrCast(@alignCast(&keyinfo))))), 0, @sizeOf(@TypeOf(keyinfo)));
    if (ioctl(joystick.*.hwdata.*.fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 24) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(keyinfo)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&keyinfo)))) >= @as(c_int, 0)) {
        {
            i = 0;
            while (i < KEY_MAX) : (i += 1) {
                if (joystick.*.hwdata.*.has_key[@bitCast(@as(isize, @intCast(i)))]) {
                    var down: bool = ((keyinfo[@as(c_ulong, @bitCast(@as(c_long, i))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, i))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0;
                    _ = &down;
                    SDL_SendJoystickButton(timestamp, joystick, joystick.*.hwdata.*.key_map[@bitCast(@as(isize, @intCast(i)))], down);
                }
            }
        }
    }
}
pub fn CorrectSensorData(hwdata: [*c]struct_joystick_hwdata, values: [*c]f32, data: [*c]f32) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (@as(c_int, hwdata.*.item.*.vendor) == USB_VENDOR_NINTENDO) {
        data[@as(c_int, 0)] = -values[@as(c_int, 1)];
        data[@as(c_int, 1)] = values[@as(c_int, 2)];
        data[@as(c_int, 2)] = -values[@as(c_int, 0)];
    } else {
        data[@as(c_int, 0)] = values[@as(c_int, 0)];
        data[@as(c_int, 1)] = values[@as(c_int, 1)];
        data[@as(c_int, 2)] = values[@as(c_int, 2)];
    }
}
pub fn PollAllSensors(timestamp: Uint64, joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [14:0]u8 = "PollAllSensors".*;
    };
    _ = &static_local___func__;
    var absinfo: struct_input_absinfo = undefined;
    _ = &absinfo;
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    while (true) {
        while (!(joystick.*.hwdata.*.fd_sensor >= @as(c_int, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "joystick->hwdata->fd_sensor >= 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysjoystick.c", 1901);
            _ = &sdl_assert_state;
            if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                continue;
            } else if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                __builtin.debugtrap();
            }
            break;
        }
        if (!(@as(c_int, 0) != 0)) break;
    }
    if (joystick.*.hwdata.*.has_gyro) {
        var values: [3]f32 = [3]f32{
            0.0,
            0.0,
            0.0,
        };
        _ = &values;
        {
            i = 0;
            while (i < @as(c_int, 3)) : (i += 1) {
                if (ioctl(joystick.*.hwdata.*.fd_sensor, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + (ABS_RX + i)) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &absinfo) >= @as(c_int, 0)) {
                    values[@bitCast(@as(isize, @intCast(i)))] = (@as(f32, @floatFromInt(absinfo.value)) * (SDL_PI_F / @as(f32, 180.0))) / joystick.*.hwdata.*.gyro_scale[@bitCast(@as(isize, @intCast(i)))];
                }
            }
        }
        var data: [3]f32 = undefined;
        _ = &data;
        CorrectSensorData(joystick.*.hwdata, @ptrCast(@alignCast(&values)), @ptrCast(@alignCast(&data)));
        SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, joystick.*.hwdata.*.sensor_tick *% @as(Uint64, SDL_NS_PER_US), @ptrCast(@alignCast(&data)), 3);
    }
    if (joystick.*.hwdata.*.has_accelerometer) {
        var values: [3]f32 = [3]f32{
            0.0,
            0.0,
            0.0,
        };
        _ = &values;
        {
            i = 0;
            while (i < @as(c_int, 3)) : (i += 1) {
                if (ioctl(joystick.*.hwdata.*.fd_sensor, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 64) + (ABS_X + i)) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_input_absinfo) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &absinfo) >= @as(c_int, 0)) {
                    values[@bitCast(@as(isize, @intCast(i)))] = (@as(f32, @floatFromInt(absinfo.value)) * SDL_STANDARD_GRAVITY) / joystick.*.hwdata.*.accelerometer_scale[@bitCast(@as(isize, @intCast(i)))];
                }
            }
        }
        var data: [3]f32 = undefined;
        _ = &data;
        CorrectSensorData(joystick.*.hwdata, @ptrCast(@alignCast(&values)), @ptrCast(@alignCast(&data)));
        SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, joystick.*.hwdata.*.sensor_tick *% @as(Uint64, SDL_NS_PER_US), @ptrCast(@alignCast(&data)), 3);
    }
}
pub fn HandleInputEvents(joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "HandleInputEvents".*;
    };
    _ = &static_local___func__;
    var events: [32]struct_input_event = undefined;
    _ = &events;
    var i: c_int = undefined;
    _ = &i;
    var len: c_int = undefined;
    _ = &len;
    var code: c_int = undefined;
    _ = &code;
    var hat_index: c_int = undefined;
    _ = &hat_index;
    var ticks: Uint64 = undefined;
    _ = &ticks;
    var event: [*c]struct_input_event = undefined;
    _ = &event;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "joystick->hwdata->fd_sensor >= 0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var j: c_uint = undefined;
    _ = &j;
    var event_1: [*c]struct_input_event = undefined;
    _ = &event_1;
    const static_local_sdl_assert_data_2 = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data_2;
    var sdl_assert_state_3: SDL_AssertState = undefined;
    _ = &sdl_assert_state_3;
    var tick: Sint32 = undefined;
    _ = &tick;
    var delta: Sint32 = undefined;
    _ = &delta;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var data: [3]f32 = undefined;
    _ = &data;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                SDL_AssertJoysticksLocked();
                if (joystick.*.hwdata.*.fresh) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                ticks = SDL_GetTicksNS_REAL();
                PollAllValues(ticks, joystick);
                if (joystick.*.hwdata.*.report_sensor) {
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
                __errno_location().* = 0;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            4 => {
                PollAllSensors(ticks, joystick);
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                joystick.*.hwdata.*.fresh = @"false" != 0;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                if ((blk: {
                    const tmp = @as(c_int, @truncate(read(joystick.*.hwdata.*.fd, @ptrCast(@alignCast(@as([*c]struct_input_event, @ptrCast(@alignCast(&events))))), @sizeOf(@TypeOf(events)))));
                    len = tmp;
                    break :blk tmp;
                }) > @as(c_int, 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                {
                    const ref = &len;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, ref.*))) / @sizeOf(@TypeOf(events[@as(c_int, 0)])))));
                }
                i = 0;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                if (__errno_location().* == ENODEV) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            10 => {
                if (i < len) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
                    continue;
                }
            },
            11 => {
                event = &events[@bitCast(@as(isize, @intCast(i)))];
                code = event.*.code;
                if (joystick.*.hwdata.*.recovering_from_dropped and ((@as(c_int, event.*.type) != EV_SYN) or (code != SYN_REPORT))) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            12 => {
                i += 1;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                switch (@as(c_int, event.*.type)) {
                    EV_KEY => {
                        sdl_pc = 18;
                        continue;
                    },
                    EV_ABS => {
                        sdl_pc = 19;
                        continue;
                    },
                    EV_REL => {
                        sdl_pc = 33;
                        continue;
                    },
                    EV_SYN => {
                        sdl_pc = 38;
                        continue;
                    },
                    else => {
                        sdl_pc = 46;
                        continue;
                    },
                }
            },
            17 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            18 => {
                SDL_SendJoystickButton(SDL_EVDEV_GetEventTimestamp(event), joystick, joystick.*.hwdata.*.key_map[@bitCast(@as(isize, @intCast(code)))], event.*.value != @as(c_int, 0));
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            19 => {
                switch (code) {
                    ABS_HAT0X => {
                        sdl_pc = 21;
                        continue;
                    },
                    ABS_HAT0Y => {
                        sdl_pc = 22;
                        continue;
                    },
                    ABS_HAT1X => {
                        sdl_pc = 23;
                        continue;
                    },
                    ABS_HAT1Y => {
                        sdl_pc = 24;
                        continue;
                    },
                    ABS_HAT2X => {
                        sdl_pc = 25;
                        continue;
                    },
                    ABS_HAT2Y => {
                        sdl_pc = 26;
                        continue;
                    },
                    ABS_HAT3X => {
                        sdl_pc = 27;
                        continue;
                    },
                    ABS_HAT3Y => {
                        sdl_pc = 28;
                        continue;
                    },
                    else => {
                        sdl_pc = 32;
                        continue;
                    },
                }
            },
            20 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 23;
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
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 27;
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
                hat_index = @divTrunc(code - ABS_HAT0X, @as(c_int, 2));
                if (joystick.*.hwdata.*.has_hat[@bitCast(@as(isize, @intCast(hat_index)))]) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            29 => {
                HandleHat(SDL_EVDEV_GetEventTimestamp(event), joystick, hat_index, __helpers.signedRemainder(code, @as(c_int, 2)), event.*.value);
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            32 => {
                event.*.value = AxisCorrect(joystick, code, event.*.value);
                SDL_SendJoystickAxis(SDL_EVDEV_GetEventTimestamp(event), joystick, joystick.*.hwdata.*.abs_map[@bitCast(@as(isize, @intCast(code)))], @truncate(event.*.value));
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            33 => {
                switch (code) {
                    REL_X => {
                        sdl_pc = 35;
                        continue;
                    },
                    REL_Y => {
                        sdl_pc = 36;
                        continue;
                    },
                    else => {
                        sdl_pc = 37;
                        continue;
                    },
                }
            },
            34 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            35 => {
                {
                    sdl_pc = 36;
                    continue;
                }
            },
            36 => {
                code -= REL_X;
                HandleBall(joystick, @bitCast(@as(i8, @truncate(@divTrunc(code, @as(c_int, 2))))), __helpers.signedRemainder(code, @as(c_int, 2)), event.*.value);
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            38 => {
                switch (code) {
                    SYN_DROPPED => {
                        sdl_pc = 40;
                        continue;
                    },
                    SYN_REPORT => {
                        sdl_pc = 41;
                        continue;
                    },
                    else => {
                        sdl_pc = 45;
                        continue;
                    },
                }
            },
            39 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            40 => {
                joystick.*.hwdata.*.recovering_from_dropped = @"true" != 0;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            41 => {
                if (joystick.*.hwdata.*.recovering_from_dropped) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                joystick.*.hwdata.*.recovering_from_dropped = @"false" != 0;
                PollAllValues(SDL_GetTicksNS_REAL(), joystick);
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            43 => {
                {
                    sdl_pc = 44;
                    continue;
                }
            },
            44 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            46 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            47 => {
                joystick.*.hwdata.*.gone = @"true" != 0;
                __errno_location().* = 0;
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                if (joystick.*.hwdata.*.report_sensor) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 53;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                if (__errno_location().* == ENODEV) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            54 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            56 => {
                if (!(joystick.*.hwdata.*.fd_sensor >= @as(c_int, 0))) {
                    sdl_pc = 57;
                    continue;
                } else {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysjoystick.c", 2046);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 56;
                    continue;
                }
            },
            60 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            61 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            62 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            65 => {
                if ((blk: {
                    const tmp = @as(c_int, @truncate(read(joystick.*.hwdata.*.fd_sensor, @ptrCast(@alignCast(@as([*c]struct_input_event, @ptrCast(@alignCast(&events))))), @sizeOf(@TypeOf(events)))));
                    len = tmp;
                    break :blk tmp;
                }) > @as(c_int, 0)) {
                    sdl_pc = 66;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                {
                    const ref = &len;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, ref.*))) / @sizeOf(@TypeOf(events[@as(c_int, 0)])))));
                }
                i = 0;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            67 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            68 => {
                if (i < len) {
                    sdl_pc = 69;
                    continue;
                } else {
                    sdl_pc = 71;
                    continue;
                }
            },
            69 => {
                event_1 = &events[@bitCast(@as(isize, @intCast(i)))];
                code = event_1.*.code;
                if (joystick.*.hwdata.*.recovering_from_dropped_sensor and ((@as(c_int, event_1.*.type) != EV_SYN) or (code != SYN_REPORT))) {
                    sdl_pc = 72;
                    continue;
                } else {
                    sdl_pc = 73;
                    continue;
                }
            },
            70 => {
                i += 1;
                {
                    sdl_pc = 68;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 65;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            73 => {
                {
                    sdl_pc = 74;
                    continue;
                }
            },
            74 => {
                switch (@as(c_int, event_1.*.type)) {
                    EV_KEY => {
                        sdl_pc = 76;
                        continue;
                    },
                    EV_ABS => {
                        sdl_pc = 89;
                        continue;
                    },
                    EV_MSC => {
                        sdl_pc = 97;
                        continue;
                    },
                    EV_SYN => {
                        sdl_pc = 104;
                        continue;
                    },
                    else => {
                        sdl_pc = 112;
                        continue;
                    },
                }
            },
            75 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 77;
                    continue;
                }
            },
            77 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            78 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            80 => {
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                sdl_assert_state_3 = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data_2.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_sysjoystick.c", 2065);
                if (sdl_assert_state_3 == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            82 => {
                {
                    sdl_pc = 78;
                    continue;
                }
            },
            83 => {
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            84 => {
                if (sdl_assert_state_3 == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            86 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            89 => {
                switch (code) {
                    ABS_X => {
                        sdl_pc = 91;
                        continue;
                    },
                    ABS_Y => {
                        sdl_pc = 92;
                        continue;
                    },
                    ABS_Z => {
                        sdl_pc = 93;
                        continue;
                    },
                    ABS_RX => {
                        sdl_pc = 94;
                        continue;
                    },
                    ABS_RY => {
                        sdl_pc = 95;
                        continue;
                    },
                    ABS_RZ => {
                        sdl_pc = 96;
                        continue;
                    },
                    else => {
                        sdl_pc = 90;
                        continue;
                    },
                }
            },
            90 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            91 => {
                {
                    sdl_pc = 92;
                    continue;
                }
            },
            92 => {
                {
                    sdl_pc = 93;
                    continue;
                }
            },
            93 => {
                j = @bitCast(@as(c_int, code - ABS_X));
                joystick.*.hwdata.*.accel_data[j] = (@as(f32, @floatFromInt(event_1.*.value)) * SDL_STANDARD_GRAVITY) / joystick.*.hwdata.*.accelerometer_scale[j];
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            94 => {
                {
                    sdl_pc = 95;
                    continue;
                }
            },
            95 => {
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
                j = @bitCast(@as(c_int, code - ABS_RX));
                joystick.*.hwdata.*.gyro_data[j] = (@as(f32, @floatFromInt(event_1.*.value)) * (SDL_PI_F / @as(f32, 180.0))) / joystick.*.hwdata.*.gyro_scale[j];
                {
                    sdl_pc = 90;
                    continue;
                }
            },
            97 => {
                if (code == MSC_TIMESTAMP) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                tick = event_1.*.value;
                if (joystick.*.hwdata.*.last_tick <= tick) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            101 => {
                delta = tick - joystick.*.hwdata.*.last_tick;
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                delta = ((@as(c_int, 2147483647) - joystick.*.hwdata.*.last_tick) + tick) + @as(c_int, 1);
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                joystick.*.hwdata.*.sensor_tick +%= @bitCast(@as(c_long, delta));
                joystick.*.hwdata.*.last_tick = tick;
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            104 => {
                switch (code) {
                    SYN_DROPPED => {
                        sdl_pc = 106;
                        continue;
                    },
                    SYN_REPORT => {
                        sdl_pc = 107;
                        continue;
                    },
                    else => {
                        sdl_pc = 111;
                        continue;
                    },
                }
            },
            105 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            106 => {
                joystick.*.hwdata.*.recovering_from_dropped_sensor = @"true" != 0;
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            107 => {
                if (joystick.*.hwdata.*.recovering_from_dropped_sensor) {
                    sdl_pc = 108;
                    continue;
                } else {
                    sdl_pc = 109;
                    continue;
                }
            },
            108 => {
                joystick.*.hwdata.*.recovering_from_dropped_sensor = @"false" != 0;
                PollAllSensors(SDL_GetTicksNS_REAL(), joystick);
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            109 => {
                timestamp = SDL_EVDEV_GetEventTimestamp(event_1);
                CorrectSensorData(joystick.*.hwdata, @ptrCast(@alignCast(&joystick.*.hwdata.*.gyro_data)), @ptrCast(@alignCast(&data)));
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_GYRO, joystick.*.hwdata.*.sensor_tick *% @as(Uint64, SDL_NS_PER_US), @ptrCast(@alignCast(&data)), 3);
                CorrectSensorData(joystick.*.hwdata, @ptrCast(@alignCast(&joystick.*.hwdata.*.accel_data)), @ptrCast(@alignCast(&data)));
                SDL_SendJoystickSensor(timestamp, joystick, SDL_SENSOR_ACCEL, joystick.*.hwdata.*.sensor_tick *% @as(Uint64, SDL_NS_PER_US), @ptrCast(@alignCast(&data)), 3);
                {
                    sdl_pc = 110;
                    continue;
                }
            },
            110 => {
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            112 => {
                {
                    sdl_pc = 75;
                    continue;
                }
            },
            113 => {
                joystick.*.hwdata.*.sensor_gone = @"true" != 0;
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            114 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            115 => {
                {}
            },
            else => unreachable,
        }
    }
}
pub fn HandleClassicEvents(joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var events: [32]struct_js_event = undefined;
    _ = &events;
    var i: c_int = undefined;
    _ = &i;
    var len: c_int = undefined;
    _ = &len;
    var code: c_int = undefined;
    _ = &code;
    var hat_index: c_int = undefined;
    _ = &hat_index;
    var timestamp: Uint64 = undefined;
    _ = &timestamp;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                timestamp = SDL_GetTicksNS_REAL();
                SDL_AssertJoysticksLocked();
                joystick.*.hwdata.*.fresh = @"false" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if ((blk: {
                    const tmp = @as(c_int, @truncate(read(joystick.*.hwdata.*.fd, @ptrCast(@alignCast(@as([*c]struct_js_event, @ptrCast(@alignCast(&events))))), @sizeOf(@TypeOf(events)))));
                    len = tmp;
                    break :blk tmp;
                }) > @as(c_int, 0)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                {
                    const ref = &len;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(c_ulong, @bitCast(@as(c_long, ref.*))) / @sizeOf(@TypeOf(events[@as(c_int, 0)])))));
                }
                i = 0;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                {}
            },
            4 => {
                if (i < len) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 7;
                    continue;
                }
            },
            5 => {
                switch (@as(c_int, events[@bitCast(@as(isize, @intCast(i)))].type)) {
                    JS_EVENT_BUTTON => {
                        sdl_pc = 9;
                        continue;
                    },
                    JS_EVENT_AXIS => {
                        sdl_pc = 10;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            6 => {
                i += 1;
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            9 => {
                code = joystick.*.hwdata.*.key_pam[events[@bitCast(@as(isize, @intCast(i)))].number];
                SDL_SendJoystickButton(timestamp, joystick, joystick.*.hwdata.*.key_map[@bitCast(@as(isize, @intCast(code)))], @as(c_int, events[@bitCast(@as(isize, @intCast(i)))].value) != @as(c_int, 0));
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            10 => {
                code = joystick.*.hwdata.*.abs_pam[events[@bitCast(@as(isize, @intCast(i)))].number];
                switch (code) {
                    ABS_HAT0X => {
                        sdl_pc = 12;
                        continue;
                    },
                    ABS_HAT0Y => {
                        sdl_pc = 13;
                        continue;
                    },
                    ABS_HAT1X => {
                        sdl_pc = 14;
                        continue;
                    },
                    ABS_HAT1Y => {
                        sdl_pc = 15;
                        continue;
                    },
                    ABS_HAT2X => {
                        sdl_pc = 16;
                        continue;
                    },
                    ABS_HAT2Y => {
                        sdl_pc = 17;
                        continue;
                    },
                    ABS_HAT3X => {
                        sdl_pc = 18;
                        continue;
                    },
                    ABS_HAT3Y => {
                        sdl_pc = 19;
                        continue;
                    },
                    else => {
                        sdl_pc = 23;
                        continue;
                    },
                }
            },
            11 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 17;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                hat_index = @divTrunc(code - ABS_HAT0X, @as(c_int, 2));
                if (joystick.*.hwdata.*.has_hat[@bitCast(@as(isize, @intCast(hat_index)))]) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                HandleHat(timestamp, joystick, hat_index, __helpers.signedRemainder(code, @as(c_int, 2)), events[@bitCast(@as(isize, @intCast(i)))].value);
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            23 => {
                SDL_SendJoystickAxis(timestamp, joystick, joystick.*.hwdata.*.abs_map[@bitCast(@as(isize, @intCast(code)))], events[@bitCast(@as(isize, @intCast(i)))].value);
                {
                    sdl_pc = 11;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn LINUX_JoystickUpdate(joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    SDL_AssertJoysticksLocked();
    if (joystick.*.hwdata.*.classic) {
        HandleClassicEvents(joystick);
    } else {
        HandleInputEvents(joystick);
    }
    {
        i = 0;
        while (i < joystick.*.nballs) : (i += 1) {
            var xrel: c_int = undefined;
            _ = &xrel;
            var yrel: c_int = undefined;
            _ = &yrel;
            xrel = joystick.*.hwdata.*.balls[@bitCast(@as(isize, @intCast(i)))].axis[@as(c_int, 0)];
            yrel = joystick.*.hwdata.*.balls[@bitCast(@as(isize, @intCast(i)))].axis[@as(c_int, 1)];
            if ((xrel != 0) or (yrel != 0)) {
                joystick.*.hwdata.*.balls[@bitCast(@as(isize, @intCast(i)))].axis[@as(c_int, 0)] = 0;
                joystick.*.hwdata.*.balls[@bitCast(@as(isize, @intCast(i)))].axis[@as(c_int, 1)] = 0;
                SDL_SendJoystickBall(0, joystick, @bitCast(@as(i8, @truncate(i))), @truncate(xrel), @truncate(yrel));
            }
        }
    }
}
pub fn LINUX_JoystickClose(joystick: [*c]SDL_Joystick) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    if (joystick.*.hwdata != null) {
        if (@as(c_int, joystick.*.hwdata.*.effect.id) >= @as(c_int, 0)) {
            _ = ioctl(joystick.*.hwdata.*.fd, @as(c_ulong, ((_IOC_WRITE << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 129) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(c_int) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), joystick.*.hwdata.*.effect.id);
            joystick.*.hwdata.*.effect.id = @truncate(-@as(c_int, 1));
        }
        if (joystick.*.hwdata.*.fd >= @as(c_int, 0)) {
            _ = close(joystick.*.hwdata.*.fd);
        }
        if (joystick.*.hwdata.*.fd_sensor >= @as(c_int, 0)) {
            _ = close(joystick.*.hwdata.*.fd_sensor);
        }
        if (joystick.*.hwdata.*.item != null) {
            joystick.*.hwdata.*.item.*.hwdata = null;
        }
        if (joystick.*.hwdata.*.item_sensor != null) {
            joystick.*.hwdata.*.item_sensor.*.hwdata = null;
        }
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.hwdata.*.key_pam)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.hwdata.*.abs_pam)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.hwdata.*.hats)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.hwdata.*.balls)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.hwdata.*.fname)));
        SDL_free_REAL(@ptrCast(@alignCast(joystick.*.hwdata)));
    }
}
pub fn LINUX_JoystickQuit() callconv(.c) void {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_joylist_item = null;
    _ = &item;
    var next: [*c]SDL_joylist_item = null;
    _ = &next;
    var item_sensor: [*c]SDL_sensorlist_item = null;
    _ = &item_sensor;
    var next_sensor: [*c]SDL_sensorlist_item = null;
    _ = &next_sensor;
    SDL_AssertJoysticksLocked();
    if (inotify_fd >= @as(c_int, 0)) {
        _ = close(inotify_fd);
        inotify_fd = -@as(c_int, 1);
    }
    {
        item = SDL_joylist;
        while (item != null) : (item = next) {
            next = item.*.next;
            FreeJoylistItem(item);
        }
    }
    {
        item_sensor = SDL_sensorlist;
        while (item_sensor != null) : (item_sensor = next_sensor) {
            next_sensor = item_sensor.*.next;
            FreeSensorlistItem(item_sensor);
        }
    }
    SDL_joylist = blk: {
        const tmp = @as([*c]SDL_joylist_item, null);
        SDL_joylist_tail = tmp;
        break :blk tmp;
    };
    SDL_sensorlist = null;
    numjoysticks = 0;
    if (enumeration_method == @as(EnumerationMethod, ENUMERATION_LIBUDEV)) {
        SDL_UDEV_DelCallback(joystick_udev_callback);
        SDL_UDEV_Quit();
    }
}
pub fn LINUX_JoystickGetGamepadMapping(device_index: c_int, out: [*c]SDL_GamepadMapping) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var joystick: [*c]SDL_Joystick = undefined;
    _ = &joystick;
    var item: [*c]SDL_joylist_item = undefined;
    _ = &item;
    const MAPPED_TRIGGER_LEFT: c_int = 1;
    _ = &MAPPED_TRIGGER_LEFT;
    const MAPPED_TRIGGER_RIGHT: c_int = 2;
    _ = &MAPPED_TRIGGER_RIGHT;
    const MAPPED_TRIGGER_BOTH: c_int = 3;
    _ = &MAPPED_TRIGGER_BOTH;
    const MAPPED_DPAD_UP: c_int = 1;
    _ = &MAPPED_DPAD_UP;
    const MAPPED_DPAD_DOWN: c_int = 2;
    _ = &MAPPED_DPAD_DOWN;
    const MAPPED_DPAD_LEFT: c_int = 4;
    _ = &MAPPED_DPAD_LEFT;
    const MAPPED_DPAD_RIGHT: c_int = 8;
    _ = &MAPPED_DPAD_RIGHT;
    const MAPPED_DPAD_ALL: c_int = 15;
    _ = &MAPPED_DPAD_ALL;
    const MAPPED_LEFT_PADDLE1: c_int = 1;
    _ = &MAPPED_LEFT_PADDLE1;
    const MAPPED_RIGHT_PADDLE1: c_int = 2;
    _ = &MAPPED_RIGHT_PADDLE1;
    const MAPPED_LEFT_PADDLE2: c_int = 4;
    _ = &MAPPED_LEFT_PADDLE2;
    const MAPPED_RIGHT_PADDLE2: c_int = 8;
    _ = &MAPPED_RIGHT_PADDLE2;
    const MAPPED_PADDLE_ALL: c_int = 15;
    _ = &MAPPED_PADDLE_ALL;
    const enum_unnamed_30 = c_uint;
    _ = &enum_unnamed_30;
    var mapped: c_uint = undefined;
    _ = &mapped;
    var result: bool = undefined;
    _ = &result;
    var hat: c_int = undefined;
    _ = &hat;
    var hat_1: c_int = undefined;
    _ = &hat_1;
    var hat_2: c_int = undefined;
    _ = &hat_2;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                item = GetJoystickByDevIndex(device_index);
                result = @"false" != 0;
                SDL_AssertJoysticksLocked();
                if (item.*.checked_mapping) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                LINUX_JoystickClose(joystick);
                SDL_SetObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK, @"false" != 0);
                SDL_free_REAL(@ptrCast(@alignCast(joystick)));
                return result;
            },
            2 => {
                if (item.*.mapping != null) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                joystick = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(joystick.*)))));
                if (!(joystick != null)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            5 => {
                _ = memcpy(@ptrCast(@alignCast(out)), @ptrCast(@alignCast(item.*.mapping)), @sizeOf(@TypeOf(out.*)));
                return @"true" != 0;
            },
            6 => {
                return @"false" != 0;
            },
            7 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            8 => {
                return @"false" != 0;
            },
            9 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                _ = memcpy(@ptrCast(@alignCast(&joystick.*.guid)), @ptrCast(@alignCast(&item.*.guid)), @sizeOf(@TypeOf(item.*.guid)));
                joystick.*.hwdata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(joystick.*.hwdata.*)))));
                if (!(joystick.*.hwdata != null)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                SDL_free_REAL(@ptrCast(@alignCast(joystick)));
                return @"false" != 0;
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                SDL_SetObjectValid(@ptrCast(@alignCast(joystick)), SDL_OBJECT_TYPE_JOYSTICK, @"true" != 0);
                item.*.checked_mapping = @"true" != 0;
                if (!PrepareJoystickHwdata(joystick, item, null)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                if (!joystick.*.hwdata.*.has_key[BTN_GAMEPAD]) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                if (joystick.*.hwdata.*.has_key[BTN_SOUTH]) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                out.*.a.kind = EMappingKind_Button;
                out.*.a.target = joystick.*.hwdata.*.key_map[BTN_SOUTH];
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            22 => {
                if (joystick.*.hwdata.*.has_key[BTN_EAST]) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                out.*.b.kind = EMappingKind_Button;
                out.*.b.target = joystick.*.hwdata.*.key_map[BTN_EAST];
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            25 => {
                if (@as(c_int, SDL_GetJoystickVendor_REAL(joystick)) == USB_VENDOR_SONY) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                if (joystick.*.hwdata.*.has_key[BTN_WEST]) {
                    sdl_pc = 29;
                    continue;
                } else {
                    sdl_pc = 30;
                    continue;
                }
            },
            27 => {
                if (joystick.*.hwdata.*.has_key[BTN_NORTH]) {
                    sdl_pc = 35;
                    continue;
                } else {
                    sdl_pc = 36;
                    continue;
                }
            },
            28 => {
                if (joystick.*.hwdata.*.has_key[BTN_SELECT]) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            29 => {
                out.*.x.kind = EMappingKind_Button;
                out.*.x.target = joystick.*.hwdata.*.key_map[BTN_WEST];
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 31;
                    continue;
                }
            },
            31 => {
                if (joystick.*.hwdata.*.has_key[BTN_NORTH]) {
                    sdl_pc = 32;
                    continue;
                } else {
                    sdl_pc = 33;
                    continue;
                }
            },
            32 => {
                out.*.y.kind = EMappingKind_Button;
                out.*.y.target = joystick.*.hwdata.*.key_map[BTN_NORTH];
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            35 => {
                out.*.x.kind = EMappingKind_Button;
                out.*.x.target = joystick.*.hwdata.*.key_map[BTN_NORTH];
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                {
                    sdl_pc = 37;
                    continue;
                }
            },
            37 => {
                if (joystick.*.hwdata.*.has_key[BTN_WEST]) {
                    sdl_pc = 38;
                    continue;
                } else {
                    sdl_pc = 39;
                    continue;
                }
            },
            38 => {
                out.*.y.kind = EMappingKind_Button;
                out.*.y.target = joystick.*.hwdata.*.key_map[BTN_WEST];
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 40;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 28;
                    continue;
                }
            },
            41 => {
                out.*.back.kind = EMappingKind_Button;
                out.*.back.target = joystick.*.hwdata.*.key_map[BTN_SELECT];
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                if (joystick.*.hwdata.*.has_key[BTN_START]) {
                    sdl_pc = 44;
                    continue;
                } else {
                    sdl_pc = 45;
                    continue;
                }
            },
            44 => {
                out.*.start.kind = EMappingKind_Button;
                out.*.start.target = joystick.*.hwdata.*.key_map[BTN_START];
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            45 => {
                {
                    sdl_pc = 46;
                    continue;
                }
            },
            46 => {
                if (joystick.*.hwdata.*.has_key[BTN_THUMBL]) {
                    sdl_pc = 47;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            47 => {
                out.*.leftstick.kind = EMappingKind_Button;
                out.*.leftstick.target = joystick.*.hwdata.*.key_map[BTN_THUMBL];
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            48 => {
                {
                    sdl_pc = 49;
                    continue;
                }
            },
            49 => {
                if (joystick.*.hwdata.*.has_key[BTN_THUMBR]) {
                    sdl_pc = 50;
                    continue;
                } else {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                out.*.rightstick.kind = EMappingKind_Button;
                out.*.rightstick.target = joystick.*.hwdata.*.key_map[BTN_THUMBR];
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 52;
                    continue;
                }
            },
            52 => {
                if (joystick.*.hwdata.*.has_key[BTN_MODE]) {
                    sdl_pc = 53;
                    continue;
                } else {
                    sdl_pc = 54;
                    continue;
                }
            },
            53 => {
                out.*.guide.kind = EMappingKind_Button;
                out.*.guide.target = joystick.*.hwdata.*.key_map[BTN_MODE];
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            54 => {
                {
                    sdl_pc = 55;
                    continue;
                }
            },
            55 => {
                mapped = 0;
                if (joystick.*.hwdata.*.has_key[BTN_TL]) {
                    sdl_pc = 56;
                    continue;
                } else {
                    sdl_pc = 57;
                    continue;
                }
            },
            56 => {
                out.*.leftshoulder.kind = EMappingKind_Button;
                out.*.leftshoulder.target = joystick.*.hwdata.*.key_map[BTN_TL];
                mapped |= 1;
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            57 => {
                {
                    sdl_pc = 58;
                    continue;
                }
            },
            58 => {
                if (joystick.*.hwdata.*.has_key[BTN_TR]) {
                    sdl_pc = 59;
                    continue;
                } else {
                    sdl_pc = 60;
                    continue;
                }
            },
            59 => {
                out.*.rightshoulder.kind = EMappingKind_Button;
                out.*.rightshoulder.target = joystick.*.hwdata.*.key_map[BTN_TR];
                mapped |= 2;
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            60 => {
                {
                    sdl_pc = 61;
                    continue;
                }
            },
            61 => {
                if ((mapped != @as(c_uint, 3)) and joystick.*.hwdata.*.has_hat[@as(c_int, 1)]) {
                    sdl_pc = 62;
                    continue;
                } else {
                    sdl_pc = 63;
                    continue;
                }
            },
            62 => {
                hat = joystick.*.hwdata.*.hats_indices[@as(c_int, 1)] << @intCast(@as(c_int, 4));
                out.*.leftshoulder.kind = EMappingKind_Hat;
                out.*.rightshoulder.kind = EMappingKind_Hat;
                out.*.leftshoulder.target = @bitCast(@as(i8, @truncate(hat | @as(c_int, 4))));
                out.*.rightshoulder.target = @bitCast(@as(i8, @truncate(hat | @as(c_int, 2))));
                mapped |= 3;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            63 => {
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                if (!((mapped & @as(c_uint, 1)) != 0) and joystick.*.hwdata.*.has_abs[ABS_HAT1Y]) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 66;
                    continue;
                }
            },
            65 => {
                out.*.leftshoulder.kind = EMappingKind_Axis;
                out.*.leftshoulder.target = joystick.*.hwdata.*.abs_map[ABS_HAT1Y];
                mapped |= 1;
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            66 => {
                {
                    sdl_pc = 67;
                    continue;
                }
            },
            67 => {
                if (!((mapped & @as(c_uint, 2)) != 0) and joystick.*.hwdata.*.has_abs[ABS_HAT1X]) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            68 => {
                out.*.rightshoulder.kind = EMappingKind_Axis;
                out.*.rightshoulder.target = joystick.*.hwdata.*.abs_map[ABS_HAT1X];
                mapped |= 2;
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            69 => {
                {
                    sdl_pc = 70;
                    continue;
                }
            },
            70 => {
                mapped = 0;
                if (joystick.*.hwdata.*.has_abs[ABS_HAT2Y]) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                out.*.lefttrigger.kind = EMappingKind_Axis;
                out.*.lefttrigger.target = joystick.*.hwdata.*.abs_map[ABS_HAT2Y];
                mapped |= MAPPED_TRIGGER_LEFT;
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            72 => {
                if (joystick.*.hwdata.*.has_abs[ABS_BRAKE]) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            73 => {
                if (joystick.*.hwdata.*.has_abs[ABS_HAT2X]) {
                    sdl_pc = 80;
                    continue;
                } else {
                    sdl_pc = 81;
                    continue;
                }
            },
            74 => {
                out.*.lefttrigger.kind = EMappingKind_Axis;
                out.*.lefttrigger.target = joystick.*.hwdata.*.abs_map[ABS_BRAKE];
                mapped |= MAPPED_TRIGGER_LEFT;
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            75 => {
                if (joystick.*.hwdata.*.has_abs[ABS_Z]) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            76 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            77 => {
                out.*.lefttrigger.kind = EMappingKind_Axis;
                out.*.lefttrigger.target = joystick.*.hwdata.*.abs_map[ABS_Z];
                mapped |= MAPPED_TRIGGER_LEFT;
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            78 => {
                {
                    sdl_pc = 79;
                    continue;
                }
            },
            79 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            80 => {
                out.*.righttrigger.kind = EMappingKind_Axis;
                out.*.righttrigger.target = joystick.*.hwdata.*.abs_map[ABS_HAT2X];
                mapped |= MAPPED_TRIGGER_RIGHT;
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            81 => {
                if (joystick.*.hwdata.*.has_abs[ABS_GAS]) {
                    sdl_pc = 83;
                    continue;
                } else {
                    sdl_pc = 84;
                    continue;
                }
            },
            82 => {
                if ((mapped != @as(c_uint, MAPPED_TRIGGER_BOTH)) and joystick.*.hwdata.*.has_hat[@as(c_int, 2)]) {
                    sdl_pc = 89;
                    continue;
                } else {
                    sdl_pc = 90;
                    continue;
                }
            },
            83 => {
                out.*.righttrigger.kind = EMappingKind_Axis;
                out.*.righttrigger.target = joystick.*.hwdata.*.abs_map[ABS_GAS];
                mapped |= MAPPED_TRIGGER_RIGHT;
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            84 => {
                if (joystick.*.hwdata.*.has_abs[ABS_RZ]) {
                    sdl_pc = 86;
                    continue;
                } else {
                    sdl_pc = 87;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            86 => {
                out.*.righttrigger.kind = EMappingKind_Axis;
                out.*.righttrigger.target = joystick.*.hwdata.*.abs_map[ABS_RZ];
                mapped |= MAPPED_TRIGGER_RIGHT;
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            87 => {
                {
                    sdl_pc = 88;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 85;
                    continue;
                }
            },
            89 => {
                hat_1 = joystick.*.hwdata.*.hats_indices[@as(c_int, 2)] << @intCast(@as(c_int, 4));
                out.*.lefttrigger.kind = EMappingKind_Hat;
                out.*.righttrigger.kind = EMappingKind_Hat;
                out.*.lefttrigger.target = @bitCast(@as(i8, @truncate(hat_1 | @as(c_int, 4))));
                out.*.righttrigger.target = @bitCast(@as(i8, @truncate(hat_1 | @as(c_int, 2))));
                mapped |= MAPPED_TRIGGER_BOTH;
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            90 => {
                {
                    sdl_pc = 91;
                    continue;
                }
            },
            91 => {
                if (!((mapped & @as(c_uint, MAPPED_TRIGGER_LEFT)) != 0) and joystick.*.hwdata.*.has_key[BTN_TL2]) {
                    sdl_pc = 92;
                    continue;
                } else {
                    sdl_pc = 93;
                    continue;
                }
            },
            92 => {
                out.*.lefttrigger.kind = EMappingKind_Button;
                out.*.lefttrigger.target = joystick.*.hwdata.*.key_map[BTN_TL2];
                mapped |= MAPPED_TRIGGER_LEFT;
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            93 => {
                {
                    sdl_pc = 94;
                    continue;
                }
            },
            94 => {
                if (!((mapped & @as(c_uint, MAPPED_TRIGGER_RIGHT)) != 0) and joystick.*.hwdata.*.has_key[BTN_TR2]) {
                    sdl_pc = 95;
                    continue;
                } else {
                    sdl_pc = 96;
                    continue;
                }
            },
            95 => {
                out.*.righttrigger.kind = EMappingKind_Button;
                out.*.righttrigger.target = joystick.*.hwdata.*.key_map[BTN_TR2];
                mapped |= MAPPED_TRIGGER_RIGHT;
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            96 => {
                {
                    sdl_pc = 97;
                    continue;
                }
            },
            97 => {
                mapped = 0;
                if (joystick.*.hwdata.*.has_key[BTN_DPAD_UP]) {
                    sdl_pc = 98;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            98 => {
                out.*.dpup.kind = EMappingKind_Button;
                out.*.dpup.target = joystick.*.hwdata.*.key_map[BTN_DPAD_UP];
                mapped |= MAPPED_DPAD_UP;
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            99 => {
                {
                    sdl_pc = 100;
                    continue;
                }
            },
            100 => {
                if (joystick.*.hwdata.*.has_key[BTN_DPAD_DOWN]) {
                    sdl_pc = 101;
                    continue;
                } else {
                    sdl_pc = 102;
                    continue;
                }
            },
            101 => {
                out.*.dpdown.kind = EMappingKind_Button;
                out.*.dpdown.target = joystick.*.hwdata.*.key_map[BTN_DPAD_DOWN];
                mapped |= MAPPED_DPAD_DOWN;
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 103;
                    continue;
                }
            },
            103 => {
                if (joystick.*.hwdata.*.has_key[BTN_DPAD_LEFT]) {
                    sdl_pc = 104;
                    continue;
                } else {
                    sdl_pc = 105;
                    continue;
                }
            },
            104 => {
                out.*.dpleft.kind = EMappingKind_Button;
                out.*.dpleft.target = joystick.*.hwdata.*.key_map[BTN_DPAD_LEFT];
                mapped |= MAPPED_DPAD_LEFT;
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            105 => {
                {
                    sdl_pc = 106;
                    continue;
                }
            },
            106 => {
                if (joystick.*.hwdata.*.has_key[BTN_DPAD_RIGHT]) {
                    sdl_pc = 107;
                    continue;
                } else {
                    sdl_pc = 108;
                    continue;
                }
            },
            107 => {
                out.*.dpright.kind = EMappingKind_Button;
                out.*.dpright.target = joystick.*.hwdata.*.key_map[BTN_DPAD_RIGHT];
                mapped |= MAPPED_DPAD_RIGHT;
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            108 => {
                {
                    sdl_pc = 109;
                    continue;
                }
            },
            109 => {
                if (mapped != @as(c_uint, MAPPED_DPAD_ALL)) {
                    sdl_pc = 110;
                    continue;
                } else {
                    sdl_pc = 111;
                    continue;
                }
            },
            110 => {
                if (joystick.*.hwdata.*.has_hat[@as(c_int, 0)]) {
                    sdl_pc = 113;
                    continue;
                } else {
                    sdl_pc = 114;
                    continue;
                }
            },
            111 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            112 => {
                if (joystick.*.hwdata.*.has_abs[ABS_X] and joystick.*.hwdata.*.has_abs[ABS_Y]) {
                    sdl_pc = 125;
                    continue;
                } else {
                    sdl_pc = 126;
                    continue;
                }
            },
            113 => {
                hat_2 = joystick.*.hwdata.*.hats_indices[@as(c_int, 0)] << @intCast(@as(c_int, 4));
                out.*.dpleft.kind = EMappingKind_Hat;
                out.*.dpright.kind = EMappingKind_Hat;
                out.*.dpup.kind = EMappingKind_Hat;
                out.*.dpdown.kind = EMappingKind_Hat;
                out.*.dpleft.target = @bitCast(@as(i8, @truncate(hat_2 | @as(c_int, 8))));
                out.*.dpright.target = @bitCast(@as(i8, @truncate(hat_2 | @as(c_int, 2))));
                out.*.dpup.target = @bitCast(@as(i8, @truncate(hat_2 | @as(c_int, 1))));
                out.*.dpdown.target = @bitCast(@as(i8, @truncate(hat_2 | @as(c_int, 4))));
                mapped |= MAPPED_DPAD_ALL;
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            114 => {
                if (joystick.*.hwdata.*.has_abs[ABS_HAT0X] and joystick.*.hwdata.*.has_abs[ABS_HAT0Y]) {
                    sdl_pc = 116;
                    continue;
                } else {
                    sdl_pc = 117;
                    continue;
                }
            },
            115 => {
                {
                    sdl_pc = 112;
                    continue;
                }
            },
            116 => {
                out.*.dpleft.kind = EMappingKind_Axis;
                out.*.dpright.kind = EMappingKind_Axis;
                out.*.dpup.kind = EMappingKind_Axis;
                out.*.dpdown.kind = EMappingKind_Axis;
                out.*.dpleft.target = joystick.*.hwdata.*.abs_map[ABS_HAT0X];
                out.*.dpright.target = joystick.*.hwdata.*.abs_map[ABS_HAT0X];
                out.*.dpup.target = joystick.*.hwdata.*.abs_map[ABS_HAT0Y];
                out.*.dpdown.target = joystick.*.hwdata.*.abs_map[ABS_HAT0Y];
                mapped |= MAPPED_DPAD_ALL;
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            117 => {
                if ((item.*.driver != null) and (SDL_strcmp_REAL(item.*.driver, "xpad") == @as(c_int, 0))) {
                    sdl_pc = 119;
                    continue;
                } else {
                    sdl_pc = 120;
                    continue;
                }
            },
            118 => {
                {
                    sdl_pc = 115;
                    continue;
                }
            },
            119 => {
                if (((joystick.*.hwdata.*.has_key[BTN_TRIGGER_HAPPY1] and joystick.*.hwdata.*.has_key[BTN_TRIGGER_HAPPY2]) and joystick.*.hwdata.*.has_key[BTN_TRIGGER_HAPPY3]) and joystick.*.hwdata.*.has_key[BTN_TRIGGER_HAPPY4]) {
                    sdl_pc = 122;
                    continue;
                } else {
                    sdl_pc = 123;
                    continue;
                }
            },
            120 => {
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            121 => {
                {
                    sdl_pc = 118;
                    continue;
                }
            },
            122 => {
                out.*.dpleft.kind = EMappingKind_Button;
                out.*.dpright.kind = EMappingKind_Button;
                out.*.dpup.kind = EMappingKind_Button;
                out.*.dpdown.kind = EMappingKind_Button;
                out.*.dpleft.target = joystick.*.hwdata.*.key_map[BTN_TRIGGER_HAPPY1];
                out.*.dpright.target = joystick.*.hwdata.*.key_map[BTN_TRIGGER_HAPPY2];
                out.*.dpup.target = joystick.*.hwdata.*.key_map[BTN_TRIGGER_HAPPY3];
                out.*.dpdown.target = joystick.*.hwdata.*.key_map[BTN_TRIGGER_HAPPY4];
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            123 => {
                {
                    sdl_pc = 124;
                    continue;
                }
            },
            124 => {
                {
                    sdl_pc = 121;
                    continue;
                }
            },
            125 => {
                out.*.leftx.kind = EMappingKind_Axis;
                out.*.lefty.kind = EMappingKind_Axis;
                out.*.leftx.target = joystick.*.hwdata.*.abs_map[ABS_X];
                out.*.lefty.target = joystick.*.hwdata.*.abs_map[ABS_Y];
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            126 => {
                {
                    sdl_pc = 127;
                    continue;
                }
            },
            127 => {
                if (joystick.*.hwdata.*.has_abs[ABS_RX] and joystick.*.hwdata.*.has_abs[ABS_RY]) {
                    sdl_pc = 128;
                    continue;
                } else {
                    sdl_pc = 129;
                    continue;
                }
            },
            128 => {
                out.*.rightx.kind = EMappingKind_Axis;
                out.*.righty.kind = EMappingKind_Axis;
                out.*.rightx.target = joystick.*.hwdata.*.abs_map[ABS_RX];
                out.*.righty.target = joystick.*.hwdata.*.abs_map[ABS_RY];
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            129 => {
                if (joystick.*.hwdata.*.has_abs[ABS_Z] and joystick.*.hwdata.*.has_abs[ABS_RZ]) {
                    sdl_pc = 131;
                    continue;
                } else {
                    sdl_pc = 132;
                    continue;
                }
            },
            130 => {
                mapped = 0;
                if (joystick.*.hwdata.*.has_key[BTN_GRIPR]) {
                    sdl_pc = 134;
                    continue;
                } else {
                    sdl_pc = 135;
                    continue;
                }
            },
            131 => {
                out.*.rightx.kind = EMappingKind_Axis;
                out.*.righty.kind = EMappingKind_Axis;
                out.*.rightx.target = joystick.*.hwdata.*.abs_map[ABS_Z];
                out.*.righty.target = joystick.*.hwdata.*.abs_map[ABS_RZ];
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            132 => {
                {
                    sdl_pc = 133;
                    continue;
                }
            },
            133 => {
                {
                    sdl_pc = 130;
                    continue;
                }
            },
            134 => {
                out.*.right_paddle1.kind = EMappingKind_Button;
                out.*.right_paddle1.target = joystick.*.hwdata.*.key_map[BTN_GRIPR];
                mapped |= MAPPED_RIGHT_PADDLE1;
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            135 => {
                {
                    sdl_pc = 136;
                    continue;
                }
            },
            136 => {
                if (joystick.*.hwdata.*.has_key[BTN_GRIPL]) {
                    sdl_pc = 137;
                    continue;
                } else {
                    sdl_pc = 138;
                    continue;
                }
            },
            137 => {
                out.*.left_paddle1.kind = EMappingKind_Button;
                out.*.left_paddle1.target = joystick.*.hwdata.*.key_map[BTN_GRIPL];
                mapped |= MAPPED_LEFT_PADDLE1;
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            138 => {
                {
                    sdl_pc = 139;
                    continue;
                }
            },
            139 => {
                if (joystick.*.hwdata.*.has_key[BTN_GRIPR2]) {
                    sdl_pc = 140;
                    continue;
                } else {
                    sdl_pc = 141;
                    continue;
                }
            },
            140 => {
                out.*.right_paddle2.kind = EMappingKind_Button;
                out.*.right_paddle2.target = joystick.*.hwdata.*.key_map[BTN_GRIPR2];
                mapped |= MAPPED_RIGHT_PADDLE2;
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            141 => {
                {
                    sdl_pc = 142;
                    continue;
                }
            },
            142 => {
                if (joystick.*.hwdata.*.has_key[BTN_GRIPL2]) {
                    sdl_pc = 143;
                    continue;
                } else {
                    sdl_pc = 144;
                    continue;
                }
            },
            143 => {
                out.*.left_paddle2.kind = EMappingKind_Button;
                out.*.left_paddle2.target = joystick.*.hwdata.*.key_map[BTN_GRIPL2];
                mapped |= MAPPED_LEFT_PADDLE2;
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            144 => {
                {
                    sdl_pc = 145;
                    continue;
                }
            },
            145 => {
                if ((mapped != @as(c_uint, MAPPED_PADDLE_ALL)) and (@as(c_int, SDL_GetJoystickVendor_REAL(joystick)) == USB_VENDOR_MICROSOFT)) {
                    sdl_pc = 146;
                    continue;
                } else {
                    sdl_pc = 147;
                    continue;
                }
            },
            146 => {
                if (((joystick.*.hwdata.*.has_key[BTN_TRIGGER_HAPPY5] and joystick.*.hwdata.*.has_key[BTN_TRIGGER_HAPPY6]) and joystick.*.hwdata.*.has_key[BTN_TRIGGER_HAPPY7]) and joystick.*.hwdata.*.has_key[BTN_TRIGGER_HAPPY8]) {
                    sdl_pc = 149;
                    continue;
                } else {
                    sdl_pc = 150;
                    continue;
                }
            },
            147 => {
                {
                    sdl_pc = 148;
                    continue;
                }
            },
            148 => {
                if (joystick.*.hwdata.*.has_key[KEY_RECORD]) {
                    sdl_pc = 152;
                    continue;
                } else {
                    sdl_pc = 153;
                    continue;
                }
            },
            149 => {
                out.*.right_paddle1.kind = EMappingKind_Button;
                out.*.right_paddle1.target = joystick.*.hwdata.*.key_map[BTN_TRIGGER_HAPPY5];
                out.*.left_paddle1.kind = EMappingKind_Button;
                out.*.left_paddle1.target = joystick.*.hwdata.*.key_map[BTN_TRIGGER_HAPPY7];
                out.*.right_paddle2.kind = EMappingKind_Button;
                out.*.right_paddle2.target = joystick.*.hwdata.*.key_map[BTN_TRIGGER_HAPPY6];
                out.*.left_paddle2.kind = EMappingKind_Button;
                out.*.left_paddle2.target = joystick.*.hwdata.*.key_map[BTN_TRIGGER_HAPPY8];
                mapped = MAPPED_PADDLE_ALL;
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            150 => {
                {
                    sdl_pc = 151;
                    continue;
                }
            },
            151 => {
                {
                    sdl_pc = 148;
                    continue;
                }
            },
            152 => {
                out.*.misc1.kind = EMappingKind_Button;
                out.*.misc1.target = joystick.*.hwdata.*.key_map[KEY_RECORD];
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            153 => {
                {
                    sdl_pc = 154;
                    continue;
                }
            },
            154 => {
                item.*.mapping = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(item.*.mapping.*)))));
                if (item.*.mapping != null) {
                    sdl_pc = 155;
                    continue;
                } else {
                    sdl_pc = 156;
                    continue;
                }
            },
            155 => {
                _ = memcpy(@ptrCast(@alignCast(item.*.mapping)), @ptrCast(@alignCast(out)), @sizeOf(@TypeOf(out.*)));
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            156 => {
                {
                    sdl_pc = 157;
                    continue;
                }
            },
            157 => {
                result = @"true" != 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub export var SDL_LINUX_JoystickDriver: SDL_JoystickDriver = SDL_JoystickDriver{
    .Init = LINUX_JoystickInit,
    .GetCount = LINUX_JoystickGetCount,
    .Detect = LINUX_JoystickDetect,
    .IsDevicePresent = LINUX_JoystickIsDevicePresent,
    .GetDeviceName = LINUX_JoystickGetDeviceName,
    .GetDevicePath = LINUX_JoystickGetDevicePath,
    .GetDeviceSteamVirtualGamepadSlot = LINUX_JoystickGetDeviceSteamVirtualGamepadSlot,
    .GetDevicePlayerIndex = LINUX_JoystickGetDevicePlayerIndex,
    .SetDevicePlayerIndex = LINUX_JoystickSetDevicePlayerIndex,
    .GetDeviceGUID = LINUX_JoystickGetDeviceGUID,
    .GetDeviceInstanceID = LINUX_JoystickGetDeviceInstanceID,
    .Open = LINUX_JoystickOpen,
    .Rumble = LINUX_JoystickRumble,
    .RumbleTriggers = LINUX_JoystickRumbleTriggers,
    .SetLED = LINUX_JoystickSetLED,
    .SendEffect = LINUX_JoystickSendEffect,
    .SetSensorsEnabled = LINUX_JoystickSetSensorsEnabled,
    .Update = LINUX_JoystickUpdate,
    .Close = LINUX_JoystickClose,
    .Quit = LINUX_JoystickQuit,
    .GetGamepadMapping = LINUX_JoystickGetGamepadMapping,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_PI_F = @as(f32, 3.141592653589793238462643383279502884);
pub const SDL_STANDARD_GRAVITY = @as(f32, 9.80665);
pub const SDL_JOYSTICK_AXIS_MAX = @as(c_int, 32767);
pub const SDL_HAT_CENTERED = @as(c_uint, 0x00);
pub const SDL_HAT_UP = @as(c_uint, 0x01);
pub const SDL_HAT_RIGHT = @as(c_uint, 0x02);
pub const SDL_HAT_DOWN = @as(c_uint, 0x04);
pub const SDL_HAT_LEFT = @as(c_uint, 0x08);
pub const SDL_NS_PER_US = @as(c_int, 1000);
pub const ENODEV = @as(c_int, 19);
pub const O_RDONLY = @as(c_int, 0o0);
pub const O_RDWR = @as(c_int, 0o2);
pub const O_NONBLOCK = @as(c_int, 0o4000);
pub const __O_CLOEXEC = __helpers.promoteIntLiteral(c_int, 0o2000000, .octal);
pub const F_SETFL = @as(c_int, 4);
pub const IN_ATTRIB = @as(c_int, 0x00000004);
pub const IN_MOVED_FROM = @as(c_int, 0x00000040);
pub const IN_MOVED_TO = @as(c_int, 0x00000080);
pub const IN_CREATE = @as(c_int, 0x00000100);
pub const IN_DELETE = @as(c_int, 0x00000200);
pub const _IOC_NRBITS = @as(c_int, 8);
pub const _IOC_TYPEBITS = @as(c_int, 8);
pub const _IOC_SIZEBITS = @as(c_int, 14);
pub const _IOC_NRSHIFT = @as(c_int, 0);
pub const _IOC_WRITE = @as(c_uint, 1);
pub const _IOC_READ = @as(c_uint, 2);
pub const EV_SYN = @as(c_int, 0x00);
pub const EV_KEY = @as(c_int, 0x01);
pub const EV_REL = @as(c_int, 0x02);
pub const EV_ABS = @as(c_int, 0x03);
pub const EV_MSC = @as(c_int, 0x04);
pub const EV_FF = @as(c_int, 0x15);
pub const SYN_REPORT = @as(c_int, 0);
pub const SYN_DROPPED = @as(c_int, 3);
pub const KEY_RECORD = @as(c_int, 167);
pub const BTN_MISC = @as(c_int, 0x100);
pub const BTN_JOYSTICK = @as(c_int, 0x120);
pub const BTN_GAMEPAD = @as(c_int, 0x130);
pub const BTN_SOUTH = @as(c_int, 0x130);
pub const BTN_EAST = @as(c_int, 0x131);
pub const BTN_NORTH = @as(c_int, 0x133);
pub const BTN_WEST = @as(c_int, 0x134);
pub const BTN_TL = @as(c_int, 0x136);
pub const BTN_TR = @as(c_int, 0x137);
pub const BTN_TL2 = @as(c_int, 0x138);
pub const BTN_TR2 = @as(c_int, 0x139);
pub const BTN_SELECT = @as(c_int, 0x13a);
pub const BTN_START = @as(c_int, 0x13b);
pub const BTN_MODE = @as(c_int, 0x13c);
pub const BTN_THUMBL = @as(c_int, 0x13d);
pub const BTN_THUMBR = @as(c_int, 0x13e);
pub const BTN_DPAD_UP = @as(c_int, 0x220);
pub const BTN_DPAD_DOWN = @as(c_int, 0x221);
pub const BTN_DPAD_LEFT = @as(c_int, 0x222);
pub const BTN_DPAD_RIGHT = @as(c_int, 0x223);
pub const BTN_GRIPL = @as(c_int, 0x224);
pub const BTN_GRIPR = @as(c_int, 0x225);
pub const BTN_GRIPL2 = @as(c_int, 0x226);
pub const BTN_GRIPR2 = @as(c_int, 0x227);
pub const BTN_TRIGGER_HAPPY1 = @as(c_int, 0x2c0);
pub const BTN_TRIGGER_HAPPY2 = @as(c_int, 0x2c1);
pub const BTN_TRIGGER_HAPPY3 = @as(c_int, 0x2c2);
pub const BTN_TRIGGER_HAPPY4 = @as(c_int, 0x2c3);
pub const BTN_TRIGGER_HAPPY5 = @as(c_int, 0x2c4);
pub const BTN_TRIGGER_HAPPY6 = @as(c_int, 0x2c5);
pub const BTN_TRIGGER_HAPPY7 = @as(c_int, 0x2c6);
pub const BTN_TRIGGER_HAPPY8 = @as(c_int, 0x2c7);
pub const KEY_MAX = @as(c_int, 0x2ff);
pub const REL_X = @as(c_int, 0x00);
pub const REL_Y = @as(c_int, 0x01);
pub const ABS_X = @as(c_int, 0x00);
pub const ABS_Y = @as(c_int, 0x01);
pub const ABS_Z = @as(c_int, 0x02);
pub const ABS_RX = @as(c_int, 0x03);
pub const ABS_RY = @as(c_int, 0x04);
pub const ABS_RZ = @as(c_int, 0x05);
pub const ABS_GAS = @as(c_int, 0x09);
pub const ABS_BRAKE = @as(c_int, 0x0a);
pub const ABS_HAT0X = @as(c_int, 0x10);
pub const ABS_HAT0Y = @as(c_int, 0x11);
pub const ABS_HAT1X = @as(c_int, 0x12);
pub const ABS_HAT1Y = @as(c_int, 0x13);
pub const ABS_HAT2X = @as(c_int, 0x14);
pub const ABS_HAT2Y = @as(c_int, 0x15);
pub const ABS_HAT3X = @as(c_int, 0x16);
pub const ABS_HAT3Y = @as(c_int, 0x17);
pub const ABS_MAX = @as(c_int, 0x3f);
pub const MSC_TIMESTAMP = @as(c_int, 0x05);
pub const FF_RUMBLE = @as(c_int, 0x50);
pub const FF_PERIODIC = @as(c_int, 0x51);
pub const FF_SINE = @as(c_int, 0x5a);
pub const JS_EVENT_BUTTON = @as(c_int, 0x01);
pub const JS_EVENT_AXIS = @as(c_int, 0x02);
pub const SDL_MAX_RUMBLE_DURATION_MS = __helpers.promoteIntLiteral(c_int, 0xFFFF, .hex);
pub const USB_VENDOR_MICROSOFT = @as(c_int, 0x045e);
pub const USB_VENDOR_NINTENDO = @as(c_int, 0x057e);
pub const USB_VENDOR_SONY = @as(c_int, 0x054c);
pub const USB_VENDOR_VALVE = @as(c_int, 0x28de);
pub const USB_PRODUCT_NINTENDO_WII_REMOTE = @as(c_int, 0x0306);
pub const USB_PRODUCT_XBOX_ONE_S = @as(c_int, 0x02ea);
pub const USB_PRODUCT_STEAM_VIRTUAL_GAMEPAD = @as(c_int, 0x11ff);
