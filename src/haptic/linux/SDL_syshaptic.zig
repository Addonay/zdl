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
pub const struct_timeval = extern struct {
    tv_sec: __time_t = 0,
    tv_usec: __suseconds_t = 0,
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t = 0,
    tv_nsec: __syscall_slong_t = 0,
};
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
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
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strdup_REAL(str: [*c]const u8) [*c]u8;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_atan2f_REAL(y: f32, x: f32) f32;
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
pub const struct_SDL_joylist_item = opaque {};
pub const struct_SDL_sensorlist_item = opaque {};
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
    item: ?*struct_SDL_joylist_item = null,
    item_sensor: ?*struct_SDL_sensorlist_item = null,
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
pub const SDL_HapticID = Uint32;
pub const SDL_HapticEffectType = Uint16;
pub const SDL_HapticDirectionType = Uint8;
pub const struct_SDL_HapticDirection = extern struct {
    type: SDL_HapticDirectionType = 0,
    dir: [3]Sint32 = @import("std").mem.zeroes([3]Sint32),
};
pub const SDL_HapticDirection = struct_SDL_HapticDirection;
pub const struct_SDL_HapticConstant = extern struct {
    type: SDL_HapticEffectType = 0,
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = 0,
    delay: Uint16 = 0,
    button: Uint16 = 0,
    interval: Uint16 = 0,
    level: Sint16 = 0,
    attack_length: Uint16 = 0,
    attack_level: Uint16 = 0,
    fade_length: Uint16 = 0,
    fade_level: Uint16 = 0,
};
pub const SDL_HapticConstant = struct_SDL_HapticConstant;
pub const struct_SDL_HapticPeriodic = extern struct {
    type: SDL_HapticEffectType = 0,
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = 0,
    delay: Uint16 = 0,
    button: Uint16 = 0,
    interval: Uint16 = 0,
    period: Uint16 = 0,
    magnitude: Sint16 = 0,
    offset: Sint16 = 0,
    phase: Uint16 = 0,
    attack_length: Uint16 = 0,
    attack_level: Uint16 = 0,
    fade_length: Uint16 = 0,
    fade_level: Uint16 = 0,
};
pub const SDL_HapticPeriodic = struct_SDL_HapticPeriodic;
pub const struct_SDL_HapticCondition = extern struct {
    type: SDL_HapticEffectType = 0,
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = 0,
    delay: Uint16 = 0,
    button: Uint16 = 0,
    interval: Uint16 = 0,
    right_sat: [3]Uint16 = @import("std").mem.zeroes([3]Uint16),
    left_sat: [3]Uint16 = @import("std").mem.zeroes([3]Uint16),
    right_coeff: [3]Sint16 = @import("std").mem.zeroes([3]Sint16),
    left_coeff: [3]Sint16 = @import("std").mem.zeroes([3]Sint16),
    deadband: [3]Uint16 = @import("std").mem.zeroes([3]Uint16),
    center: [3]Sint16 = @import("std").mem.zeroes([3]Sint16),
};
pub const SDL_HapticCondition = struct_SDL_HapticCondition;
pub const struct_SDL_HapticRamp = extern struct {
    type: SDL_HapticEffectType = 0,
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = 0,
    delay: Uint16 = 0,
    button: Uint16 = 0,
    interval: Uint16 = 0,
    start: Sint16 = 0,
    end: Sint16 = 0,
    attack_length: Uint16 = 0,
    attack_level: Uint16 = 0,
    fade_length: Uint16 = 0,
    fade_level: Uint16 = 0,
};
pub const SDL_HapticRamp = struct_SDL_HapticRamp;
pub const struct_SDL_HapticLeftRight = extern struct {
    type: SDL_HapticEffectType = 0,
    length: Uint32 = 0,
    large_magnitude: Uint16 = 0,
    small_magnitude: Uint16 = 0,
};
pub const SDL_HapticLeftRight = struct_SDL_HapticLeftRight;
pub const struct_SDL_HapticCustom = extern struct {
    type: SDL_HapticEffectType = 0,
    direction: SDL_HapticDirection = @import("std").mem.zeroes(SDL_HapticDirection),
    length: Uint32 = 0,
    delay: Uint16 = 0,
    button: Uint16 = 0,
    interval: Uint16 = 0,
    channels: Uint8 = 0,
    period: Uint16 = 0,
    samples: Uint16 = 0,
    data: [*c]Uint16 = null,
    attack_length: Uint16 = 0,
    attack_level: Uint16 = 0,
    fade_length: Uint16 = 0,
    fade_level: Uint16 = 0,
};
pub const SDL_HapticCustom = struct_SDL_HapticCustom;
pub const union_SDL_HapticEffect = extern union {
    type: SDL_HapticEffectType,
    constant: SDL_HapticConstant,
    periodic: SDL_HapticPeriodic,
    condition: SDL_HapticCondition,
    ramp: SDL_HapticRamp,
    leftright: SDL_HapticLeftRight,
    custom: SDL_HapticCustom,
};
pub const SDL_HapticEffect = union_SDL_HapticEffect;
pub const struct_haptic_hweffect = extern struct {
    effect: struct_ff_effect = @import("std").mem.zeroes(struct_ff_effect),
};
pub const struct_haptic_effect = extern struct {
    effect: SDL_HapticEffect = @import("std").mem.zeroes(SDL_HapticEffect),
    hweffect: [*c]struct_haptic_hweffect = null,
};
pub const struct_haptic_hwdata = extern struct {
    fd: c_int = 0,
    fname: [*c]u8 = null,
};
pub const SDL_HapticEffectID = c_int;
pub const struct_SDL_Haptic = extern struct {
    instance_id: SDL_HapticID = 0,
    name: [*c]u8 = null,
    effects: [*c]struct_haptic_effect = null,
    neffects: c_int = 0,
    nplaying: c_int = 0,
    supported: Uint32 = 0,
    naxes: c_int = 0,
    hwdata: [*c]struct_haptic_hwdata = null,
    ref_count: c_int = 0,
    rumble_id: SDL_HapticEffectID = 0,
    rumble_effect: SDL_HapticEffect = @import("std").mem.zeroes(SDL_HapticEffect),
    next: [*c]struct_SDL_Haptic = null,
};
pub const SDL_Haptic = struct_SDL_Haptic;
pub extern fn SDL_GetNextObjectID() Uint32;
pub extern fn SDL_AssertJoysticksLocked() void;
pub const EMappingKind = c_uint;
pub const SDL_JoystickDriver = struct_SDL_JoystickDriver;
pub extern var SDL_LINUX_JoystickDriver: SDL_JoystickDriver;
pub extern fn ioctl(__fd: c_int, __request: c_ulong, ...) c_int;
pub const __s32 = c_int;
pub const struct_input_event = extern struct {
    time: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    type: __u16 = 0,
    code: __u16 = 0,
    value: __s32 = 0,
};
pub const SDL_UDEV_DEVICE_JOYSTICK: c_int = 4;
pub const SDL_UDEV_DEVICEADDED: c_int = 1;
pub const SDL_UDEV_DEVICEREMOVED: c_int = 2;
pub const SDL_UDEV_deviceevent = c_uint;
pub const SDL_UDEV_Callback = ?*const fn (udev_type: SDL_UDEV_deviceevent, udev_class: c_int, devpath: [*c]const u8) callconv(.c) void;
pub extern fn SDL_UDEV_Init() bool;
pub extern fn SDL_UDEV_Quit() void;
pub extern fn SDL_UDEV_Scan() bool;
pub extern fn SDL_UDEV_AddCallback(cb: SDL_UDEV_Callback) bool;
pub extern fn SDL_UDEV_DelCallback(cb: SDL_UDEV_Callback) void;
pub extern fn close(__fd: c_int) c_int;
pub extern fn write(__fd: c_int, __buf: ?*const anyopaque, __n: usize) isize;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
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
pub extern fn open(__file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn __errno_location() [*c]c_int;
pub extern fn fstat(__fd: c_int, __buf: [*c]struct_stat) c_int;
pub const struct_SDL_hapticlist_item = extern struct {
    instance_id: SDL_HapticID = 0,
    fname: [*c]u8 = null,
    haptic: [*c]SDL_Haptic = null,
    dev_num: dev_t = 0,
    next: [*c]struct_SDL_hapticlist_item = null,
};
pub const SDL_hapticlist_item = struct_SDL_hapticlist_item;
pub var SDL_hapticlist: [*c]SDL_hapticlist_item = null;
pub var SDL_hapticlist_tail: [*c]SDL_hapticlist_item = null;
pub var numhaptics: c_int = 0;
pub fn EV_IsHaptic(fd: c_int) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var features: [16]c_ulong = undefined;
    _ = &features;
    var ret: Uint32 = 0;
    _ = &ret;
    if (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 32) + EV_FF) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(features)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&features)))) < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("Haptic: Unable to get device's features: %s", strerror(__errno_location().*));
        return 0;
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_CONSTANT))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_CONSTANT))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 0));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_SINE))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_SINE))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 1));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_SQUARE))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_SQUARE))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 2));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_TRIANGLE))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_TRIANGLE))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 3));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_SAW_UP))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_SAW_UP))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 4));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_SAW_DOWN))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_SAW_DOWN))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 5));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_RAMP))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_RAMP))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 6));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_SPRING))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_SPRING))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 7));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_FRICTION))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_FRICTION))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 10));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_DAMPER))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_DAMPER))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 8));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_INERTIA))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_INERTIA))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 9));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_CUSTOM))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_CUSTOM))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 15));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_GAIN))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_GAIN))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 16));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_AUTOCENTER))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_AUTOCENTER))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 17));
    }
    if (((features[@as(c_ulong, @bitCast(@as(c_long, FF_RUMBLE))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, FF_RUMBLE))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != 0) {
        ret |= @as(c_uint, 1) << @intCast(@as(c_uint, 11));
    }
    return ret;
}
pub fn EV_IsMouse(fd: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var argp: [40]c_ulong = undefined;
    _ = &argp;
    if (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, (@as(c_int, 32) + EV_KEY) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(argp)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]c_ulong, @ptrCast(@alignCast(&argp)))) < @as(c_int, 0)) {
        return @"false" != 0;
    }
    if (((argp[@as(c_ulong, @bitCast(@as(c_long, BTN_MOUSE))) / (@sizeOf(c_ulong) *% @as(c_ulong, 8))] >> @intCast(@as(c_ulong, @bitCast(@as(c_long, BTN_MOUSE))) % (@sizeOf(c_ulong) *% @as(c_ulong, 8)))) & @as(c_ulong, 1)) != @as(c_ulong, 0)) {
        return @"true" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_SYS_HapticInit() bool {
    @setEvalBranchQuota(100000);
    const joydev_pattern: [18:0]u8 = "/dev/input/event%d".*;
    _ = &joydev_pattern;
    var path: [4096]u8 = undefined;
    _ = &path;
    var i: c_int = undefined;
    _ = &i;
    var j: c_int = undefined;
    _ = &j;
    i = 0;
    {
        j = 0;
        while (j < MAX_HAPTICS) : (j += 1) {
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&path)), PATH_MAX, @ptrCast(@alignCast(&joydev_pattern)), blk: {
                const ref = &i;
                const tmp = ref.*;
                ref.* += 1;
                break :blk tmp;
            });
            _ = MaybeAddDevice(@ptrCast(@alignCast(&path)));
        }
    }
    if (!SDL_UDEV_Init()) {
        return SDL_SetError_REAL("Could not initialize UDEV");
    }
    if (!SDL_UDEV_AddCallback(haptic_udev_callback)) {
        SDL_UDEV_Quit();
        return SDL_SetError_REAL("Could not setup haptic <-> udev callback");
    }
    _ = SDL_UDEV_Scan();
    return @"true" != 0;
}
pub export fn SDL_SYS_NumHaptics() c_int {
    @setEvalBranchQuota(100000);
    return numhaptics;
}
pub fn HapticByDevIndex(arg_device_index: c_int) callconv(.c) [*c]SDL_hapticlist_item {
    @setEvalBranchQuota(100000);
    var device_index = arg_device_index;
    _ = &device_index;
    const static_local___func__ = struct {
        const __func__: [16:0]u8 = "HapticByDevIndex".*;
    };
    _ = &static_local___func__;
    var item: [*c]SDL_hapticlist_item = SDL_hapticlist;
    _ = &item;
    if ((device_index < @as(c_int, 0)) or (device_index >= numhaptics)) {
        return null;
    }
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
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_syshaptic.c", 190);
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
pub fn HapticByInstanceID(instance_id: SDL_HapticID) callconv(.c) [*c]SDL_hapticlist_item {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_hapticlist_item = undefined;
    _ = &item;
    {
        item = SDL_hapticlist;
        while (item != null) : (item = item.*.next) {
            if (instance_id == item.*.instance_id) {
                return item;
            }
        }
    }
    return null;
}
pub fn haptic_udev_callback(udev_type: SDL_UDEV_deviceevent, udev_class: c_int, devpath: [*c]const u8) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                if (!(devpath != null) or !((udev_class & SDL_UDEV_DEVICE_JOYSTICK) != 0)) {
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
                        sdl_pc = 6;
                        continue;
                    },
                    else => {
                        sdl_pc = 7;
                        continue;
                    },
                }
            },
            4 => {
                {}
            },
            5 => {
                _ = MaybeAddDevice(devpath);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            6 => {
                _ = MaybeRemoveDevice(devpath);
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn MaybeAddDevice(path: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sb: struct_stat = undefined;
    _ = &sb;
    var fd: c_int = undefined;
    _ = &fd;
    var supported: Uint32 = undefined;
    _ = &supported;
    var item: [*c]SDL_hapticlist_item = undefined;
    _ = &item;
    if (!(path != null)) {
        return @"false" != 0;
    }
    fd = open(path, O_RDWR | __O_CLOEXEC, @as(c_int, 0));
    if (fd < @as(c_int, 0)) {
        return @"false" != 0;
    }
    if (fstat(fd, &sb) != @as(c_int, 0)) {
        _ = close(fd);
        return @"false" != 0;
    }
    {
        item = SDL_hapticlist;
        while (item != null) : (item = item.*.next) {
            if (item.*.dev_num == sb.st_rdev) {
                _ = close(fd);
                return @"false" != 0;
            }
        }
    }
    supported = EV_IsHaptic(fd);
    _ = close(fd);
    if (!(supported != 0)) {
        return @"false" != 0;
    }
    item = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_hapticlist_item))));
    if (!(item != null)) {
        return @"false" != 0;
    }
    item.*.instance_id = SDL_GetNextObjectID();
    item.*.fname = SDL_strdup_REAL(path);
    if (!(item.*.fname != null)) {
        SDL_free_REAL(@ptrCast(@alignCast(item)));
        return @"false" != 0;
    }
    item.*.dev_num = sb.st_rdev;
    if (!(SDL_hapticlist_tail != null)) {
        SDL_hapticlist = blk: {
            const tmp = item;
            SDL_hapticlist_tail = tmp;
            break :blk tmp;
        };
    } else {
        SDL_hapticlist_tail.*.next = item;
        SDL_hapticlist_tail = item;
    }
    numhaptics += 1;
    return @"true" != 0;
}
pub fn MaybeRemoveDevice(path: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [17:0]u8 = "MaybeRemoveDevice".*;
    };
    _ = &static_local___func__;
    var item: [*c]SDL_hapticlist_item = undefined;
    _ = &item;
    var prev: [*c]SDL_hapticlist_item = null;
    _ = &prev;
    if (!(path != null)) {
        return @"false" != 0;
    }
    {
        item = SDL_hapticlist;
        while (item != null) : (item = item.*.next) {
            if (SDL_strcmp_REAL(path, item.*.fname) == @as(c_int, 0)) {
                const result: bool = (if (item.*.haptic != null) @"true" else @"false") != 0;
                _ = &result;
                if (prev != null) {
                    prev.*.next = item.*.next;
                } else {
                    while (true) {
                        while (!(SDL_hapticlist == item)) {
                            const static_local_sdl_assert_data = struct {
                                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                    .always_ignore = @"false" != 0,
                                    .trigger_count = 0,
                                    .condition = "SDL_hapticlist == item",
                                    .filename = null,
                                    .linenum = 0,
                                    .function = null,
                                    .next = null,
                                };
                            };
                            _ = &static_local_sdl_assert_data;
                            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_syshaptic.c", 320);
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
                    SDL_hapticlist = item.*.next;
                }
                if (item == SDL_hapticlist_tail) {
                    SDL_hapticlist_tail = prev;
                }
                numhaptics -= 1;
                SDL_free_REAL(@ptrCast(@alignCast(item.*.fname)));
                SDL_free_REAL(@ptrCast(@alignCast(item)));
                return result;
            }
            prev = item;
        }
    }
    return @"false" != 0;
}
pub export fn SDL_SYS_HapticInstanceID(index_1: c_int) SDL_HapticID {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_hapticlist_item = undefined;
    _ = &item;
    item = HapticByDevIndex(index_1);
    if (item != null) {
        return item.*.instance_id;
    }
    return 0;
}
pub fn SDL_SYS_HapticNameFromFD(fd: c_int) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    const static_local_namebuf = struct {
        var namebuf: [128]u8 = @import("std").mem.zeroes([128]u8);
    };
    _ = &static_local_namebuf;
    if (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 6) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(@TypeOf(static_local_namebuf.namebuf)) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), @as([*c]u8, @ptrCast(@alignCast(&static_local_namebuf.namebuf)))) <= @as(c_int, 0)) {
        return null;
    }
    return @ptrCast(@alignCast(&static_local_namebuf.namebuf));
}
pub export fn SDL_SYS_HapticName(index_1: c_int) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_hapticlist_item = undefined;
    _ = &item;
    var fd: c_int = undefined;
    _ = &fd;
    var name: [*c]const u8 = null;
    _ = &name;
    item = HapticByDevIndex(index_1);
    if (item != null) {
        fd = open(item.*.fname, O_RDONLY | __O_CLOEXEC, @as(c_int, 0));
        if (fd >= @as(c_int, 0)) {
            name = SDL_SYS_HapticNameFromFD(fd);
            if (!(name != null)) {
                name = item.*.fname;
            }
            _ = close(fd);
        }
    }
    return name;
}
pub fn SDL_SYS_HapticOpenFromFD(haptic: [*c]SDL_Haptic, fd: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                haptic.*.hwdata = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(haptic.*.hwdata.*)))));
                if (!(haptic.*.hwdata != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                _ = close(fd);
                if (haptic.*.hwdata != null) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
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
                haptic.*.hwdata.*.fd = fd;
                haptic.*.supported = EV_IsHaptic(fd);
                haptic.*.naxes = 2;
                if (ioctl(fd, @as(c_ulong, ((_IOC_READ << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 132) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(c_int) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &haptic.*.neffects) < @as(c_int, 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                _ = SDL_SetError_REAL("Haptic: Unable to query device memory: %s", strerror(__errno_location().*));
                {
                    sdl_pc = 1;
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
                haptic.*.nplaying = haptic.*.neffects;
                haptic.*.effects = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(struct_haptic_effect) *% @as(c_ulong, @bitCast(@as(c_long, haptic.*.neffects))))));
                if (!(haptic.*.effects != null)) {
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
                _ = memset(@ptrCast(@alignCast(haptic.*.effects)), 0, @sizeOf(struct_haptic_effect) *% @as(c_ulong, @bitCast(@as(c_long, haptic.*.neffects))));
                return @"true" != 0;
            },
            11 => {
                SDL_free_REAL(@ptrCast(@alignCast(haptic.*.hwdata)));
                haptic.*.hwdata = null;
                {
                    sdl_pc = 13;
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
                return @"false" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SYS_HapticOpen(haptic: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    var fd: c_int = undefined;
    _ = &fd;
    var item: [*c]SDL_hapticlist_item = undefined;
    _ = &item;
    item = HapticByInstanceID(haptic.*.instance_id);
    fd = open(item.*.fname, O_RDWR | __O_CLOEXEC, @as(c_int, 0));
    if (fd < @as(c_int, 0)) {
        return SDL_SetError_REAL("Haptic: Unable to open %s: %s", item.*.fname, strerror(__errno_location().*));
    }
    if (!SDL_SYS_HapticOpenFromFD(haptic, fd)) {
        return @"false" != 0;
    }
    haptic.*.hwdata.*.fname = SDL_strdup_REAL(item.*.fname);
    return @"true" != 0;
}
pub export fn SDL_SYS_HapticMouse() c_int {
    @setEvalBranchQuota(100000);
    var fd: c_int = undefined;
    _ = &fd;
    var device_index: c_int = 0;
    _ = &device_index;
    var item: [*c]SDL_hapticlist_item = undefined;
    _ = &item;
    {
        item = SDL_hapticlist;
        while (item != null) : (item = item.*.next) {
            fd = open(item.*.fname, O_RDWR | __O_CLOEXEC, @as(c_int, 0));
            if (fd < @as(c_int, 0)) {
                return @intFromBool(SDL_SetError_REAL("Haptic: Unable to open %s: %s", item.*.fname, strerror(__errno_location().*)));
            }
            if (EV_IsMouse(fd)) {
                _ = close(fd);
                return device_index;
            }
            _ = close(fd);
            device_index += 1;
        }
    }
    return -@as(c_int, 1);
}
pub export fn SDL_SYS_JoystickIsHaptic(joystick: [*c]SDL_Joystick) bool {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    if (joystick.*.driver != (&SDL_LINUX_JoystickDriver)) {
        return @"false" != 0;
    }
    if (EV_IsHaptic(joystick.*.hwdata.*.fd) != 0) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_SYS_JoystickSameHaptic(haptic: [*c]SDL_Haptic, joystick: [*c]SDL_Joystick) bool {
    @setEvalBranchQuota(100000);
    SDL_AssertJoysticksLocked();
    if (joystick.*.driver != (&SDL_LINUX_JoystickDriver)) {
        return @"false" != 0;
    }
    if (SDL_strcmp_REAL(joystick.*.hwdata.*.fname, haptic.*.hwdata.*.fname) == @as(c_int, 0)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_SYS_HapticOpenFromJoystick(haptic: [*c]SDL_Haptic, joystick: [*c]SDL_Joystick) bool {
    @setEvalBranchQuota(100000);
    var fd: c_int = undefined;
    _ = &fd;
    var item: [*c]SDL_hapticlist_item = undefined;
    _ = &item;
    var name: [*c]const u8 = undefined;
    _ = &name;
    SDL_AssertJoysticksLocked();
    if (joystick.*.driver != (&SDL_LINUX_JoystickDriver)) {
        return @"false" != 0;
    }
    {
        item = SDL_hapticlist;
        while (item != null) : (item = item.*.next) {
            if (SDL_strcmp_REAL(item.*.fname, joystick.*.hwdata.*.fname) == @as(c_int, 0)) {
                haptic.*.instance_id = item.*.instance_id;
                break;
            }
        }
    }
    fd = open(joystick.*.hwdata.*.fname, O_RDWR | __O_CLOEXEC, @as(c_int, 0));
    if (fd < @as(c_int, 0)) {
        return SDL_SetError_REAL("Haptic: Unable to open %s: %s", joystick.*.hwdata.*.fname, strerror(__errno_location().*));
    }
    if (!SDL_SYS_HapticOpenFromFD(haptic, fd)) {
        return @"false" != 0;
    }
    haptic.*.hwdata.*.fname = SDL_strdup_REAL(joystick.*.hwdata.*.fname);
    name = SDL_SYS_HapticNameFromFD(fd);
    if (name != null) {
        haptic.*.name = SDL_strdup_REAL(name);
    }
    return @"true" != 0;
}
pub export fn SDL_SYS_HapticClose(haptic: [*c]SDL_Haptic) void {
    @setEvalBranchQuota(100000);
    if (haptic.*.hwdata != null) {
        SDL_free_REAL(@ptrCast(@alignCast(haptic.*.effects)));
        haptic.*.effects = null;
        haptic.*.neffects = 0;
        _ = close(haptic.*.hwdata.*.fd);
        SDL_free_REAL(@ptrCast(@alignCast(haptic.*.hwdata.*.fname)));
        SDL_free_REAL(@ptrCast(@alignCast(haptic.*.hwdata)));
        haptic.*.hwdata = null;
    }
    _ = memset(@ptrCast(@alignCast(haptic)), 0, @sizeOf(@TypeOf(haptic.*)));
}
pub export fn SDL_SYS_HapticQuit() void {
    @setEvalBranchQuota(100000);
    var item: [*c]SDL_hapticlist_item = null;
    _ = &item;
    var next: [*c]SDL_hapticlist_item = null;
    _ = &next;
    {
        item = SDL_hapticlist;
        while (item != null) : (item = next) {
            next = item.*.next;
            SDL_free_REAL(@ptrCast(@alignCast(item.*.fname)));
            SDL_free_REAL(@ptrCast(@alignCast(item)));
        }
    }
    SDL_UDEV_DelCallback(haptic_udev_callback);
    SDL_UDEV_Quit();
    numhaptics = 0;
    SDL_hapticlist = null;
    SDL_hapticlist_tail = null;
}
pub fn SDL_SYS_ToButton(button: Uint16) callconv(.c) Uint16 {
    @setEvalBranchQuota(100000);
    var ff_button: Uint16 = undefined;
    _ = &ff_button;
    ff_button = 0;
    if (@as(c_int, button) != @as(c_int, 0)) {
        ff_button = @bitCast(@as(c_short, @truncate((BTN_GAMEPAD + @as(c_int, button)) - @as(c_int, 1))));
    }
    return ff_button;
}
pub fn SDL_SYS_ToDirection(dest: [*c]Uint16, src: [*c]const SDL_HapticDirection) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var tmp: Uint32 = undefined;
    _ = &tmp;
    var f: f32 = undefined;
    _ = &f;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@as(c_int, src.*.type)) {
                    SDL_HAPTIC_POLAR => {
                        sdl_pc = 2;
                        continue;
                    },
                    SDL_HAPTIC_SPHERICAL => {
                        sdl_pc = 3;
                        continue;
                    },
                    SDL_HAPTIC_CARTESIAN => {
                        sdl_pc = 4;
                        continue;
                    },
                    SDL_HAPTIC_STEERING_AXIS => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
                        continue;
                    },
                }
            },
            1 => {
                return @"true" != 0;
            },
            2 => {
                tmp = @bitCast(@as(c_int, @divTrunc(__helpers.signedRemainder(src.*.dir[@as(c_int, 0)], @as(c_int, 36000)) * @as(c_int, 32768), @as(c_int, 18000))));
                dest.* = @truncate(tmp);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                tmp = @bitCast(@as(c_int, __helpers.signedRemainder(src.*.dir[@as(c_int, 0)] + @as(c_int, 9000), @as(c_int, 36000))));
                tmp = (tmp *% @as(Uint32, 32768)) / @as(Uint32, 18000);
                dest.* = @truncate(tmp);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                if (!(src.*.dir[@as(c_int, 1)] != 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                dest.* = @bitCast(@as(c_short, @truncate(if (src.*.dir[@as(c_int, 0)] >= @as(c_int, 0)) @as(c_int, 16384) else @as(c_int, 49152))));
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            6 => {
                if (!(src.*.dir[@as(c_int, 0)] != 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
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
                dest.* = @bitCast(@as(c_short, @truncate(if (src.*.dir[@as(c_int, 1)] >= @as(c_int, 0)) @as(c_int, 32768) else @as(c_int, 0))));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            9 => {
                f = SDL_atan2f_REAL(@floatFromInt(src.*.dir[@as(c_int, 1)]), @floatFromInt(src.*.dir[@as(c_int, 0)]));
                tmp = @bitCast(@as(c_int, __helpers.signedRemainder(@as(Sint32, @intFromFloat((@as(f64, @floatCast(f)) * @as(f64, 18000.0)) / SDL_PI_D)) + @as(c_int, 45000), @as(c_int, 36000))));
                tmp = (tmp *% @as(Uint32, 32768)) / @as(Uint32, 18000);
                dest.* = @truncate(tmp);
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                dest.* = 16384;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                return SDL_SetError_REAL("Haptic: Unsupported direction type.");
            },
            else => unreachable,
        }
    }
}
pub fn SDL_SYS_ToFFEffect(dest: [*c]struct_ff_effect, src: [*c]const SDL_HapticEffect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var constant: [*c]const SDL_HapticConstant = undefined;
    _ = &constant;
    var periodic: [*c]const SDL_HapticPeriodic = undefined;
    _ = &periodic;
    var condition: [*c]const SDL_HapticCondition = undefined;
    _ = &condition;
    var ramp: [*c]const SDL_HapticRamp = undefined;
    _ = &ramp;
    var leftright: [*c]const SDL_HapticLeftRight = undefined;
    _ = &leftright;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                _ = memset(@ptrCast(@alignCast(dest)), 0, @sizeOf(@TypeOf(dest.*)));
                switch (@as(c_int, src.*.type)) {
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 0))) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 1))) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 2))) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 3))) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 4))) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 5))) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 7))) => {
                        sdl_pc = 29;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 8))) => {
                        sdl_pc = 30;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 9))) => {
                        sdl_pc = 31;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 10))) => {
                        sdl_pc = 32;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 6))) => {
                        sdl_pc = 48;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 11))) => {
                        sdl_pc = 52;
                        continue;
                    },
                    else => {
                        sdl_pc = 53;
                        continue;
                    },
                }
            },
            1 => {
                return @"true" != 0;
            },
            2 => {
                constant = &src.*.constant;
                dest.*.type = FF_CONSTANT;
                if (!SDL_SYS_ToDirection(&dest.*.direction, &constant.*.direction)) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                return @"false" != 0;
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                dest.*.replay.length = @truncate(if (constant.*.length == SDL_HAPTIC_INFINITY) @as(Uint32, 0) else if (constant.*.length > @as(Uint32, 32767)) @as(Uint32, 32767) else constant.*.length);
                dest.*.replay.delay = @bitCast(@as(c_short, @truncate(if (@as(c_int, constant.*.delay) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, constant.*.delay))));
                dest.*.trigger.button = SDL_SYS_ToButton(constant.*.button);
                dest.*.trigger.interval = @bitCast(@as(c_short, @truncate(if (@as(c_int, constant.*.interval) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, constant.*.interval))));
                dest.*.u.constant.level = constant.*.level;
                dest.*.u.constant.envelope.attack_length = @bitCast(@as(c_short, @truncate(if (@as(c_int, constant.*.attack_length) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, constant.*.attack_length))));
                dest.*.u.constant.envelope.attack_level = @bitCast(@as(c_short, @truncate(if (@as(c_int, constant.*.attack_level) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, constant.*.attack_level))));
                dest.*.u.constant.envelope.fade_length = @bitCast(@as(c_short, @truncate(if (@as(c_int, constant.*.fade_length) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, constant.*.fade_length))));
                dest.*.u.constant.envelope.fade_level = @bitCast(@as(c_short, @truncate(if (@as(c_int, constant.*.fade_level) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, constant.*.fade_level))));
                {
                    sdl_pc = 1;
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
                {
                    sdl_pc = 8;
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
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            10 => {
                periodic = &src.*.periodic;
                dest.*.type = FF_PERIODIC;
                if (!SDL_SYS_ToDirection(&dest.*.direction, &periodic.*.direction)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                return @"false" != 0;
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                dest.*.replay.length = @truncate(if (periodic.*.length == SDL_HAPTIC_INFINITY) @as(Uint32, 0) else if (periodic.*.length > @as(Uint32, 32767)) @as(Uint32, 32767) else periodic.*.length);
                dest.*.replay.delay = @bitCast(@as(c_short, @truncate(if (@as(c_int, periodic.*.delay) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, periodic.*.delay))));
                dest.*.trigger.button = SDL_SYS_ToButton(periodic.*.button);
                dest.*.trigger.interval = @bitCast(@as(c_short, @truncate(if (@as(c_int, periodic.*.interval) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, periodic.*.interval))));
                if (@as(c_uint, @bitCast(@as(c_int, @as(c_int, periodic.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                dest.*.u.periodic.waveform = FF_SINE;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                if (@as(c_uint, @bitCast(@as(c_int, @as(c_int, periodic.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                dest.*.u.periodic.period = @bitCast(@as(c_short, @truncate(if (@as(c_int, periodic.*.period) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, periodic.*.period))));
                dest.*.u.periodic.magnitude = periodic.*.magnitude;
                dest.*.u.periodic.offset = periodic.*.offset;
                dest.*.u.periodic.phase = @truncate((@as(Uint32, periodic.*.phase) *% @as(c_uint, 65536)) / @as(Uint32, 36000));
                dest.*.u.periodic.envelope.attack_length = @bitCast(@as(c_short, @truncate(if (@as(c_int, periodic.*.attack_length) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, periodic.*.attack_length))));
                dest.*.u.periodic.envelope.attack_level = @bitCast(@as(c_short, @truncate(if (@as(c_int, periodic.*.attack_level) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, periodic.*.attack_level))));
                dest.*.u.periodic.envelope.fade_length = @bitCast(@as(c_short, @truncate(if (@as(c_int, periodic.*.fade_length) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, periodic.*.fade_length))));
                dest.*.u.periodic.envelope.fade_level = @bitCast(@as(c_short, @truncate(if (@as(c_int, periodic.*.fade_level) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, periodic.*.fade_level))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            17 => {
                dest.*.u.periodic.waveform = FF_SQUARE;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                if (@as(c_uint, @bitCast(@as(c_int, @as(c_int, periodic.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 3)))) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                dest.*.u.periodic.waveform = FF_TRIANGLE;
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                if (@as(c_uint, @bitCast(@as(c_int, @as(c_int, periodic.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 4)))) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                dest.*.u.periodic.waveform = FF_SAW_UP;
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                if (@as(c_uint, @bitCast(@as(c_int, @as(c_int, periodic.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) {
                    sdl_pc = 26;
                    continue;
                } else {
                    sdl_pc = 27;
                    continue;
                }
            },
            25 => {
                {
                    sdl_pc = 22;
                    continue;
                }
            },
            26 => {
                dest.*.u.periodic.waveform = FF_SAW_DOWN;
                {
                    sdl_pc = 28;
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
                    sdl_pc = 25;
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
                condition = &src.*.condition;
                if (@as(c_uint, @bitCast(@as(c_int, @as(c_int, condition.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 7)))) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                dest.*.type = FF_SPRING;
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            34 => {
                if (@as(c_uint, @bitCast(@as(c_int, @as(c_int, condition.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 8)))) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            35 => {
                if (!SDL_SYS_ToDirection(&dest.*.direction, &condition.*.direction)) {
                    sdl_pc = 45;
                    continue;
                } else {
                    sdl_pc = 46;
                    continue;
                }
            },
            36 => {
                dest.*.type = FF_DAMPER;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                if (@as(c_uint, @bitCast(@as(c_int, @as(c_int, condition.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 9)))) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            38 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            39 => {
                dest.*.type = FF_INERTIA;
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            40 => {
                if (@as(c_uint, @bitCast(@as(c_int, @as(c_int, condition.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 10)))) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            41 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            42 => {
                dest.*.type = FF_FRICTION;
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
                    sdl_pc = 41;
                    continue;
                }
            },
            45 => {
                return @"false" != 0;
            },
            46 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            47 => {
                dest.*.replay.length = @truncate(if (condition.*.length == SDL_HAPTIC_INFINITY) @as(Uint32, 0) else if (condition.*.length > @as(Uint32, 32767)) @as(Uint32, 32767) else condition.*.length);
                dest.*.replay.delay = @bitCast(@as(c_short, @truncate(if (@as(c_int, condition.*.delay) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, condition.*.delay))));
                dest.*.trigger.button = SDL_SYS_ToButton(condition.*.button);
                dest.*.trigger.interval = @bitCast(@as(c_short, @truncate(if (@as(c_int, condition.*.interval) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, condition.*.interval))));
                dest.*.u.condition[@as(c_int, 0)].right_saturation = condition.*.right_sat[@as(c_int, 0)];
                dest.*.u.condition[@as(c_int, 0)].left_saturation = condition.*.left_sat[@as(c_int, 0)];
                dest.*.u.condition[@as(c_int, 0)].right_coeff = condition.*.right_coeff[@as(c_int, 0)];
                dest.*.u.condition[@as(c_int, 0)].left_coeff = condition.*.left_coeff[@as(c_int, 0)];
                dest.*.u.condition[@as(c_int, 0)].deadband = condition.*.deadband[@as(c_int, 0)];
                dest.*.u.condition[@as(c_int, 0)].center = condition.*.center[@as(c_int, 0)];
                dest.*.u.condition[@as(c_int, 1)].right_saturation = condition.*.right_sat[@as(c_int, 1)];
                dest.*.u.condition[@as(c_int, 1)].left_saturation = condition.*.left_sat[@as(c_int, 1)];
                dest.*.u.condition[@as(c_int, 1)].right_coeff = condition.*.right_coeff[@as(c_int, 1)];
                dest.*.u.condition[@as(c_int, 1)].left_coeff = condition.*.left_coeff[@as(c_int, 1)];
                dest.*.u.condition[@as(c_int, 1)].deadband = condition.*.deadband[@as(c_int, 1)];
                dest.*.u.condition[@as(c_int, 1)].center = condition.*.center[@as(c_int, 1)];
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            48 => {
                ramp = &src.*.ramp;
                dest.*.type = FF_RAMP;
                if (!SDL_SYS_ToDirection(&dest.*.direction, &ramp.*.direction)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            49 => {
                return @"false" != 0;
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                dest.*.replay.length = @truncate(if (ramp.*.length == SDL_HAPTIC_INFINITY) @as(Uint32, 0) else if (ramp.*.length > @as(Uint32, 32767)) @as(Uint32, 32767) else ramp.*.length);
                dest.*.replay.delay = @bitCast(@as(c_short, @truncate(if (@as(c_int, ramp.*.delay) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, ramp.*.delay))));
                dest.*.trigger.button = SDL_SYS_ToButton(ramp.*.button);
                dest.*.trigger.interval = @bitCast(@as(c_short, @truncate(if (@as(c_int, ramp.*.interval) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, ramp.*.interval))));
                dest.*.u.ramp.start_level = ramp.*.start;
                dest.*.u.ramp.end_level = ramp.*.end;
                dest.*.u.ramp.envelope.attack_length = @bitCast(@as(c_short, @truncate(if (@as(c_int, ramp.*.attack_length) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, ramp.*.attack_length))));
                dest.*.u.ramp.envelope.attack_level = @bitCast(@as(c_short, @truncate(if (@as(c_int, ramp.*.attack_level) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, ramp.*.attack_level))));
                dest.*.u.ramp.envelope.fade_length = @bitCast(@as(c_short, @truncate(if (@as(c_int, ramp.*.fade_length) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, ramp.*.fade_length))));
                dest.*.u.ramp.envelope.fade_level = @bitCast(@as(c_short, @truncate(if (@as(c_int, ramp.*.fade_level) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, ramp.*.fade_level))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            52 => {
                leftright = &src.*.leftright;
                dest.*.type = FF_RUMBLE;
                dest.*.direction = 16384;
                dest.*.replay.length = @truncate(if (leftright.*.length == SDL_HAPTIC_INFINITY) @as(Uint32, 0) else if (leftright.*.length > @as(Uint32, 32767)) @as(Uint32, 32767) else leftright.*.length);
                dest.*.trigger.button = 0;
                dest.*.trigger.interval = 0;
                dest.*.u.rumble.strong_magnitude = @bitCast(@as(c_short, @truncate((if (@as(c_int, leftright.*.large_magnitude) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, leftright.*.large_magnitude)) * @as(c_int, 2))));
                dest.*.u.rumble.weak_magnitude = @bitCast(@as(c_short, @truncate((if (@as(c_int, leftright.*.small_magnitude) > @as(c_int, 32767)) @as(c_int, 32767) else @as(c_int, leftright.*.small_magnitude)) * @as(c_int, 2))));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            53 => {
                return SDL_SetError_REAL("Haptic: Unknown effect type.");
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SYS_HapticNewEffect(haptic: [*c]SDL_Haptic, effect: [*c]struct_haptic_effect, base: [*c]const SDL_HapticEffect) bool {
    @setEvalBranchQuota(100000);
    var linux_effect: [*c]struct_ff_effect = undefined;
    _ = &linux_effect;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                effect.*.hweffect = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(struct_haptic_hweffect))));
                if (!(effect.*.hweffect != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_free_REAL(@ptrCast(@alignCast(effect.*.hweffect)));
                effect.*.hweffect = null;
                return @"false" != 0;
            },
            2 => {
                return @"false" != 0;
            },
            3 => {
                {
                    sdl_pc = 4;
                    continue;
                }
            },
            4 => {
                linux_effect = &effect.*.hweffect.*.effect;
                if (!SDL_SYS_ToFFEffect(linux_effect, base)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 1;
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
                linux_effect.*.id = @truncate(-@as(c_int, 1));
                if (ioctl(haptic.*.hwdata.*.fd, @as(c_ulong, ((_IOC_WRITE << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 128) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_ff_effect) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), linux_effect) < @as(c_int, 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = SDL_SetError_REAL("Haptic: Error uploading effect to the device: %s", strerror(__errno_location().*));
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
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_SYS_HapticUpdateEffect(haptic: [*c]SDL_Haptic, effect: [*c]struct_haptic_effect, data: [*c]const SDL_HapticEffect) bool {
    @setEvalBranchQuota(100000);
    var linux_effect: struct_ff_effect = undefined;
    _ = &linux_effect;
    if (!SDL_SYS_ToFFEffect(&linux_effect, data)) {
        return @"false" != 0;
    }
    linux_effect.id = effect.*.hweffect.*.effect.id;
    if (ioctl(haptic.*.hwdata.*.fd, @as(c_ulong, ((_IOC_WRITE << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 128) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(struct_ff_effect) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), &linux_effect) < @as(c_int, 0)) {
        return SDL_SetError_REAL("Haptic: Error updating the effect: %s", strerror(__errno_location().*));
    }
    _ = memcpy(@ptrCast(@alignCast(&effect.*.hweffect.*.effect)), @ptrCast(@alignCast(&linux_effect)), @sizeOf(struct_ff_effect));
    return @"true" != 0;
}
pub export fn SDL_SYS_HapticRunEffect(haptic: [*c]SDL_Haptic, effect: [*c]struct_haptic_effect, iterations: Uint32) bool {
    @setEvalBranchQuota(100000);
    var run: struct_input_event = undefined;
    _ = &run;
    run.type = EV_FF;
    run.code = @bitCast(@as(c_short, effect.*.hweffect.*.effect.id));
    run.value = @bitCast(@as(c_uint, @truncate(if (iterations > @as(Uint32, __INT_MAX__)) @as(Uint32, __INT_MAX__) else iterations)));
    if (write(haptic.*.hwdata.*.fd, @ptrCast(@alignCast(&run)), @sizeOf(@TypeOf(run))) < @as(isize, 0)) {
        return SDL_SetError_REAL("Haptic: Unable to run the effect: %s", strerror(__errno_location().*));
    }
    return @"true" != 0;
}
pub export fn SDL_SYS_HapticStopEffect(haptic: [*c]SDL_Haptic, effect: [*c]struct_haptic_effect) bool {
    @setEvalBranchQuota(100000);
    var stop: struct_input_event = undefined;
    _ = &stop;
    stop.type = EV_FF;
    stop.code = @bitCast(@as(c_short, effect.*.hweffect.*.effect.id));
    stop.value = 0;
    if (write(haptic.*.hwdata.*.fd, @ptrCast(@alignCast(&stop)), @sizeOf(@TypeOf(stop))) < @as(isize, 0)) {
        return SDL_SetError_REAL("Haptic: Unable to stop the effect: %s", strerror(__errno_location().*));
    }
    return @"true" != 0;
}
pub export fn SDL_SYS_HapticDestroyEffect(haptic: [*c]SDL_Haptic, effect: [*c]struct_haptic_effect) void {
    @setEvalBranchQuota(100000);
    if (ioctl(haptic.*.hwdata.*.fd, @as(c_ulong, ((_IOC_WRITE << @intCast(@as(c_uint, @bitCast(@as(c_int, ((_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS) + _IOC_SIZEBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 'E') << @intCast(_IOC_NRSHIFT + _IOC_NRBITS))))) | @as(c_uint, @bitCast(@as(c_int, @as(c_int, 129) << @intCast(_IOC_NRSHIFT))))) | (@sizeOf(c_int) << @intCast(@as(c_ulong, @bitCast(@as(c_long, (_IOC_NRSHIFT + _IOC_NRBITS) + _IOC_TYPEBITS))))), effect.*.hweffect.*.effect.id) < @as(c_int, 0)) {
        _ = SDL_SetError_REAL("Haptic: Error removing the effect from the device: %s", strerror(__errno_location().*));
    }
    SDL_free_REAL(@ptrCast(@alignCast(effect.*.hweffect)));
    effect.*.hweffect = null;
}
pub export fn SDL_SYS_HapticGetEffectStatus(_: [*c]SDL_Haptic, _: [*c]struct_haptic_effect) c_int {
    @setEvalBranchQuota(100000);
    _ = SDL_SetError_REAL("That operation is not supported");
    return -@as(c_int, 1);
}
pub export fn SDL_SYS_HapticSetGain(haptic: [*c]SDL_Haptic, gain: c_int) bool {
    @setEvalBranchQuota(100000);
    var ie: struct_input_event = undefined;
    _ = &ie;
    ie.type = EV_FF;
    ie.code = FF_GAIN;
    ie.value = @bitCast(@as(c_uint, @truncate((@as(c_ulong, 65535) *% @as(c_ulong, @bitCast(@as(c_long, gain)))) / @as(c_ulong, 100))));
    if (write(haptic.*.hwdata.*.fd, @ptrCast(@alignCast(&ie)), @sizeOf(@TypeOf(ie))) < @as(isize, 0)) {
        return SDL_SetError_REAL("Haptic: Error setting gain: %s", strerror(__errno_location().*));
    }
    return @"true" != 0;
}
pub export fn SDL_SYS_HapticSetAutocenter(haptic: [*c]SDL_Haptic, autocenter: c_int) bool {
    @setEvalBranchQuota(100000);
    var ie: struct_input_event = undefined;
    _ = &ie;
    ie.type = EV_FF;
    ie.code = FF_AUTOCENTER;
    ie.value = @bitCast(@as(c_uint, @truncate((@as(c_ulong, 65535) *% @as(c_ulong, @bitCast(@as(c_long, autocenter)))) / @as(c_ulong, 100))));
    if (write(haptic.*.hwdata.*.fd, @ptrCast(@alignCast(&ie)), @sizeOf(@TypeOf(ie))) < @as(isize, 0)) {
        return SDL_SetError_REAL("Haptic: Error setting autocenter: %s", strerror(__errno_location().*));
    }
    return @"true" != 0;
}
pub export fn SDL_SYS_HapticPause(_: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_SYS_HapticResume(_: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub export fn SDL_SYS_HapticStopAll(haptic: [*c]SDL_Haptic) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < haptic.*.neffects) : (i += 1) {
            if (@as(?*anyopaque, @ptrCast(@alignCast(haptic.*.effects[@bitCast(@as(isize, @intCast(i)))].hweffect))) != @as(?*anyopaque, null)) {
                if (!SDL_SYS_HapticStopEffect(haptic, &haptic.*.effects[@bitCast(@as(isize, @intCast(i)))])) {
                    return SDL_SetError_REAL("Haptic: Error while trying to stop all playing effects.");
                }
            }
        }
    }
    return @"true" != 0;
}

pub const __INT_MAX__ = __helpers.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_PI_D = @as(f64, 3.141592653589793238462643383279502884);
pub const SDL_HAPTIC_INFINITY = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const SDL_HAPTIC_POLAR = @as(c_int, 0);
pub const SDL_HAPTIC_CARTESIAN = @as(c_int, 1);
pub const SDL_HAPTIC_SPHERICAL = @as(c_int, 2);
pub const SDL_HAPTIC_STEERING_AXIS = @as(c_int, 3);
pub const _IOC_NRBITS = @as(c_int, 8);
pub const _IOC_TYPEBITS = @as(c_int, 8);
pub const _IOC_SIZEBITS = @as(c_int, 14);
pub const _IOC_NRSHIFT = @as(c_int, 0);
pub const _IOC_WRITE = @as(c_uint, 1);
pub const _IOC_READ = @as(c_uint, 2);
pub const EV_KEY = @as(c_int, 0x01);
pub const EV_FF = @as(c_int, 0x15);
pub const BTN_MOUSE = @as(c_int, 0x110);
pub const BTN_GAMEPAD = @as(c_int, 0x130);
pub const FF_RUMBLE = @as(c_int, 0x50);
pub const FF_PERIODIC = @as(c_int, 0x51);
pub const FF_CONSTANT = @as(c_int, 0x52);
pub const FF_SPRING = @as(c_int, 0x53);
pub const FF_FRICTION = @as(c_int, 0x54);
pub const FF_DAMPER = @as(c_int, 0x55);
pub const FF_INERTIA = @as(c_int, 0x56);
pub const FF_RAMP = @as(c_int, 0x57);
pub const FF_SQUARE = @as(c_int, 0x58);
pub const FF_TRIANGLE = @as(c_int, 0x59);
pub const FF_SINE = @as(c_int, 0x5a);
pub const FF_SAW_UP = @as(c_int, 0x5b);
pub const FF_SAW_DOWN = @as(c_int, 0x5c);
pub const FF_CUSTOM = @as(c_int, 0x5d);
pub const FF_GAIN = @as(c_int, 0x60);
pub const FF_AUTOCENTER = @as(c_int, 0x61);
pub const O_RDONLY = @as(c_int, 0o0);
pub const O_RDWR = @as(c_int, 0o2);
pub const __O_CLOEXEC = __helpers.promoteIntLiteral(c_int, 0o2000000, .octal);
pub const PATH_MAX = @as(c_int, 4096);
pub const MAX_HAPTICS = @as(c_int, 32);
pub inline fn CLAMP(x: anytype) @TypeOf(if (__helpers.cast(bool, x > @as(c_int, 32767))) @as(c_int, 32767) else x) {
    @setEvalBranchQuota(100000);
    _ = &x;
    return if (__helpers.cast(bool, x > @as(c_int, 32767))) @as(c_int, 32767) else x;
}
