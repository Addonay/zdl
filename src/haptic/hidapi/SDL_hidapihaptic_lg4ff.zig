// /*
//   Simple DirectMedia Layer
//   Copyright (C) 2025 Simon Wood <simon@mungewell.org>
//   Copyright (C) 2025 Michal Malý <madcatxster@devoid-pointer.net>
//   Copyright (C) 2025 Bernat Arlandis <berarma@hotmail.com>
//   Copyright (C) 2025 Katharine Chui <katharine.chui@gmail.com>
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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_getenv_REAL(name: [*c]const u8) [*c]const u8;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_atan2_REAL(y: f64, x: f64) f64;
pub extern fn SDL_sin_REAL(x: f64) f64;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
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
pub extern fn SDL_OutOfMemory_REAL() bool;
pub const SDL_PropertiesID = Uint32;
pub const struct_SDL_Thread = opaque {
};
pub const SDL_Thread = struct_SDL_Thread;
pub const SDL_ThreadFunction = ?*const fn (data: ?*anyopaque) callconv(.c) c_int;
pub extern fn SDL_CreateThreadRuntime_REAL(@"fn": SDL_ThreadFunction, name: [*c]const u8, data: ?*anyopaque, pfnBeginThread: SDL_FunctionPointer, pfnEndThread: SDL_FunctionPointer) ?*SDL_Thread;
pub extern fn SDL_WaitThread_REAL(thread: ?*SDL_Thread, status: [*c]c_int) void;
pub const struct_SDL_Mutex = opaque {
};
pub const SDL_Mutex = struct_SDL_Mutex;
pub extern fn SDL_CreateMutex_REAL() ?*SDL_Mutex;
pub extern fn SDL_LockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_UnlockMutex_REAL(mutex: ?*SDL_Mutex) void;
pub extern fn SDL_DestroyMutex_REAL(mutex: ?*SDL_Mutex) void;
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
pub const struct_joystick_hwdata_8 = opaque {};
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
    hwdata: ?*struct_joystick_hwdata_8 = null,
    props: SDL_PropertiesID = 0,
    ref_count: c_int = 0,
    next: [*c]struct_SDL_Joystick = null,
};
pub extern fn SDL_GetJoystickVendor_REAL(joystick: [*c]SDL_Joystick) Uint16;
pub extern fn SDL_GetJoystickProduct_REAL(joystick: [*c]SDL_Joystick) Uint16;
pub extern fn SDL_GetJoystickProductVersion_REAL(joystick: [*c]SDL_Joystick) Uint16;
pub extern fn SDL_GetJoystickID_REAL(joystick: [*c]SDL_Joystick) SDL_JoystickID;
pub extern fn SDL_SendJoystickEffect_REAL(joystick: [*c]SDL_Joystick, data: ?*const anyopaque, size: c_int) bool;
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
pub const struct_haptic_hweffect_15 = opaque {};
pub const struct_haptic_effect = extern struct {
    effect: SDL_HapticEffect = @import("std").mem.zeroes(SDL_HapticEffect),
    hweffect: ?*struct_haptic_hweffect_15 = null,
};
pub const struct_haptic_hwdata_16 = opaque {};
pub const SDL_HapticEffectID = c_int;
pub const struct_SDL_Haptic = extern struct {
    instance_id: SDL_HapticID = 0,
    name: [*c]u8 = null,
    effects: [*c]struct_haptic_effect = null,
    neffects: c_int = 0,
    nplaying: c_int = 0,
    supported: Uint32 = 0,
    naxes: c_int = 0,
    hwdata: ?*struct_haptic_hwdata_16 = null,
    ref_count: c_int = 0,
    rumble_id: SDL_HapticEffectID = 0,
    rumble_effect: SDL_HapticEffect = @import("std").mem.zeroes(SDL_HapticEffect),
    next: [*c]struct_SDL_Haptic = null,
};
pub const SDL_Haptic = struct_SDL_Haptic;
pub extern fn SDL_GetTicks_REAL() Uint64;
pub extern fn SDL_Delay_REAL(ms: Uint32) void;
pub const EMappingKind = c_uint;
pub const SDL_HIDAPI_HapticDriver = struct_SDL_HIDAPI_HapticDriver;
pub const struct_SDL_HIDAPI_HapticDevice = extern struct {
    haptic: [*c]SDL_Haptic = null,
    joystick: [*c]SDL_Joystick = null,
    driver: [*c]SDL_HIDAPI_HapticDriver = null,
    ctx: ?*anyopaque = null,
};
pub const SDL_HIDAPI_HapticDevice = struct_SDL_HIDAPI_HapticDevice;
pub const struct_SDL_HIDAPI_HapticDriver = extern struct {
    JoystickSupported: ?*const fn (joystick: [*c]SDL_Joystick) callconv(.c) bool = null,
    Open: ?*const fn (joystick: [*c]SDL_Joystick) callconv(.c) ?*anyopaque = null,
    Close: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) void = null,
    NumEffects: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) c_int = null,
    NumEffectsPlaying: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) c_int = null,
    GetFeatures: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) Uint32 = null,
    NumAxes: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) c_int = null,
    CreateEffect: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, data: [*c]const SDL_HapticEffect) callconv(.c) SDL_HapticEffectID = null,
    UpdateEffect: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID, data: [*c]const SDL_HapticEffect) callconv(.c) bool = null,
    RunEffect: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID, iterations: Uint32) callconv(.c) bool = null,
    StopEffect: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID) callconv(.c) bool = null,
    DestroyEffect: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID) callconv(.c) void = null,
    GetEffectStatus: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID) callconv(.c) bool = null,
    SetGain: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, gain: c_int) callconv(.c) bool = null,
    SetAutocenter: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice, autocenter: c_int) callconv(.c) bool = null,
    Pause: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) bool = null,
    Resume: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) bool = null,
    StopEffects: ?*const fn (device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) bool = null,
};
pub var supported_device_ids: [6]Uint32 = [6]Uint32{
    USB_DEVICE_ID_LOGITECH_G29_WHEEL,
    USB_DEVICE_ID_LOGITECH_G27_WHEEL,
    USB_DEVICE_ID_LOGITECH_G25_WHEEL,
    USB_DEVICE_ID_LOGITECH_DFGT_WHEEL,
    USB_DEVICE_ID_LOGITECH_DFP_WHEEL,
    USB_DEVICE_ID_LOGITECH_WHEEL,
};
pub const struct_lg4ff_effect_state = extern struct {
    effect: SDL_HapticEffect = @import("std").mem.zeroes(SDL_HapticEffect),
    start_at: Uint64 = 0,
    play_at: Uint64 = 0,
    stop_at: Uint64 = 0,
    flags: Uint32 = 0,
    time_playing: Uint64 = 0,
    updated_at: Uint64 = 0,
    phase: Uint32 = 0,
    phase_adj: Uint32 = 0,
    count: Uint32 = 0,
    direction_gain: f64 = 0,
    slope: Sint32 = 0,
    allocated: bool = false,
};
pub const struct_lg4ff_effect_parameters = extern struct {
    level: Sint32 = 0,
    d1: Sint32 = 0,
    d2: Sint32 = 0,
    k1: Sint32 = 0,
    k2: Sint32 = 0,
    clip: Uint32 = 0,
};
pub const struct_lg4ff_slot = extern struct {
    id: Sint32 = 0,
    parameters: struct_lg4ff_effect_parameters = @import("std").mem.zeroes(struct_lg4ff_effect_parameters),
    current_cmd: [7]Uint8 = @import("std").mem.zeroes([7]Uint8),
    cmd_op: Uint32 = 0,
    is_updated: bool = false,
    effect_type: Uint32 = 0,
};
pub const struct_lg4ff_device = extern struct {
    product_id: Uint16 = 0,
    release_number: Uint16 = 0,
    states: [16]struct_lg4ff_effect_state = @import("std").mem.zeroes([16]struct_lg4ff_effect_state),
    slots: [4]struct_lg4ff_slot = @import("std").mem.zeroes([4]struct_lg4ff_slot),
    effects_used: Sint32 = 0,
    gain: Sint32 = 0,
    app_gain: Sint32 = 0,
    spring_level: Sint32 = 0,
    damper_level: Sint32 = 0,
    friction_level: Sint32 = 0,
    peak_ffb_level: Sint32 = 0,
    hid_handle: [*c]SDL_Joystick = null,
    stop_thread: bool = false,
    thread: ?*SDL_Thread = null,
    thread_name_buf: [256]u8 = @import("std").mem.zeroes([256]u8),
    mutex: ?*SDL_Mutex = null,
    is_ffex: bool = false,
};
pub const lg4ff_device = struct_lg4ff_device;
pub fn get_time_ms() callconv(.c) Uint64 {
    @setEvalBranchQuota(100000);
    return SDL_GetTicks_REAL();
}
pub fn abs32(x: Sint32) callconv(.c) Sint32 {
    @setEvalBranchQuota(100000);
    return if (x < @as(c_int, 0)) -x else x;
}
pub fn abs64(x: Sint64) callconv(.c) Sint64 {
    @setEvalBranchQuota(100000);
    return if (x < @as(Sint64, 0)) -x else x;
}
pub fn effect_is_periodic(effect: [*c]const SDL_HapticEffect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return ((((@as(c_uint, @bitCast(@as(c_int, @as(c_int, effect.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) or (@as(c_uint, @bitCast(@as(c_int, @as(c_int, effect.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 3))))) or (@as(c_uint, @bitCast(@as(c_int, @as(c_int, effect.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 4))))) or (@as(c_uint, @bitCast(@as(c_int, @as(c_int, effect.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 5))))) or (@as(c_uint, @bitCast(@as(c_int, @as(c_int, effect.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 2))));
}
pub fn effect_is_condition(effect: [*c]const SDL_HapticEffect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return ((@as(c_uint, @bitCast(@as(c_int, @as(c_int, effect.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 7)))) or (@as(c_uint, @bitCast(@as(c_int, @as(c_int, effect.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 8))))) or (@as(c_uint, @bitCast(@as(c_int, @as(c_int, effect.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 10))));
}
pub fn to_linux_direction(src: [*c]SDL_HapticDirection) callconv(.c) Uint16 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "to_linux_direction".*;
    };
    _ = &static_local___func__;
    var tmp: Uint32 = undefined;
    _ = &tmp;
    var f: f32 = undefined;
    _ = &f;
    const static_local_sdl_assert_data = struct {
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
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
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
                return 0;
            },
            2 => {
                tmp = @bitCast(@as(c_int, @divTrunc(__helpers.signedRemainder(src.*.dir[@as(c_int, 0)], @as(c_int, 36000)) * @as(c_int, 32768), @as(c_int, 18000))));
                return @truncate(tmp);
            },
            3 => {
                tmp = @bitCast(@as(c_int, __helpers.signedRemainder(src.*.dir[@as(c_int, 0)] + @as(c_int, 9000), @as(c_int, 36000))));
                tmp = (tmp *% @as(Uint32, 32768)) / @as(Uint32, 18000);
                return @truncate(tmp);
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
                return @bitCast(@as(c_short, @truncate(if (src.*.dir[@as(c_int, 0)] >= @as(c_int, 0)) @as(c_int, 16384) else @as(c_int, 49152))));
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
                    sdl_pc = 11;
                    continue;
                }
            },
            8 => {
                return @bitCast(@as(c_short, @truncate(if (src.*.dir[@as(c_int, 1)] >= @as(c_int, 0)) @as(c_int, 32768) else @as(c_int, 0))));
            },
            9 => {
                f = @floatCast(SDL_atan2_REAL(@floatFromInt(src.*.dir[@as(c_int, 1)]), @floatFromInt(src.*.dir[@as(c_int, 0)])));
                tmp = @bitCast(@as(c_int, __helpers.signedRemainder(@as(Sint32, @intFromFloat((@as(f64, @floatCast(f)) * @as(f64, 18000.0)) / SDL_PI_D)) + @as(c_int, 45000), @as(c_int, 36000))));
                tmp = (tmp *% @as(Uint32, 32768)) / @as(Uint32, 18000);
                return @truncate(tmp);
            },
            10 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                return 16384;
            },
            12 => {
                {
                    sdl_pc = 13;
                    continue;
                }
            },
            13 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            14 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 15;
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
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapihaptic_lg4ff.c", 220);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 14;
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
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
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
                __builtin.debugtrap();
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
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn get_effect_direction(effect: [*c]SDL_HapticEffect) callconv(.c) Uint16 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [20:0]u8 = "get_effect_direction".*;
    };
    _ = &static_local___func__;
    var direction: Uint16 = undefined;
    _ = &direction;
    const static_local_sdl_assert_data = struct {
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
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                direction = 0;
                if (effect_is_periodic(effect)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                direction = to_linux_direction(&effect.*.periodic.direction);
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                if (effect_is_condition(effect)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                return direction;
            },
            4 => {
                direction = to_linux_direction(&effect.*.condition.direction);
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                switch (@as(c_int, effect.*.type)) {
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 0))) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 6))) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                direction = to_linux_direction(&effect.*.constant.direction);
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                direction = to_linux_direction(&effect.*.ramp.direction);
                {
                    sdl_pc = 7;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
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
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapihaptic_lg4ff.c", 242);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
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
                __builtin.debugtrap();
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
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn get_effect_replay_length(effect: [*c]SDL_HapticEffect) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "get_effect_replay_length".*;
    };
    _ = &static_local___func__;
    var length: Uint32 = undefined;
    _ = &length;
    const static_local_sdl_assert_data = struct {
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
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                length = 0;
                if (effect_is_periodic(effect)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                length = effect.*.periodic.length;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                if (effect_is_condition(effect)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                if (length == SDL_HAPTIC_INFINITY) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            4 => {
                length = effect.*.condition.length;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                switch (@as(c_int, effect.*.type)) {
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 0))) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 6))) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                length = effect.*.constant.length;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                length = effect.*.ramp.length;
                {
                    sdl_pc = 7;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
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
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapihaptic_lg4ff.c", 265);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
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
                __builtin.debugtrap();
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
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            23 => {
                length = 0;
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
                return length;
            },
            else => unreachable,
        }
    }
}
pub fn get_effect_replay_delay(effect: [*c]SDL_HapticEffect) callconv(.c) Uint16 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [23:0]u8 = "get_effect_replay_delay".*;
    };
    _ = &static_local___func__;
    var delay: Uint16 = undefined;
    _ = &delay;
    const static_local_sdl_assert_data = struct {
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
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                delay = 0;
                if (effect_is_periodic(effect)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                delay = effect.*.periodic.delay;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                if (effect_is_condition(effect)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                return delay;
            },
            4 => {
                delay = effect.*.condition.delay;
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                switch (@as(c_int, effect.*.type)) {
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 0))) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 6))) => {
                        sdl_pc = 9;
                        continue;
                    },
                    else => {
                        sdl_pc = 10;
                        continue;
                    },
                }
            },
            6 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            8 => {
                delay = effect.*.constant.delay;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                delay = effect.*.ramp.delay;
                {
                    sdl_pc = 7;
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
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 13;
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
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 15;
                    continue;
                } else {
                    sdl_pc = 16;
                    continue;
                }
            },
            15 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapihaptic_lg4ff.c", 292);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            18 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
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
                __builtin.debugtrap();
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
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn lg4ff_play_effect(device: [*c]struct_lg4ff_device, effect_id: SDL_HapticEffectID, value: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var state: [*c]struct_lg4ff_effect_state = undefined;
    _ = &state;
    var now: Uint64 = get_time_ms();
    _ = &now;
    state = &device.*.states[@bitCast(@as(isize, @intCast(effect_id)))];
    if (value > @as(c_int, 0)) {
        if (((&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_STARTED))))) != 0) {
            state.*.flags = 0;
        } else {
            device.*.effects_used += 1;
        }
        {
            (&state.*.flags).* = (&state.*.flags).* | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_STARTED))));
        }
        state.*.start_at = now;
        state.*.count = @bitCast(@as(c_int, value));
    } else {
        if (((&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_STARTED))))) != 0) {
            state.*.flags = 0;
            device.*.effects_used -= 1;
        }
    }
    return 0;
}
pub fn lg4ff_upload_effect(device: [*c]struct_lg4ff_device, effect: [*c]const SDL_HapticEffect, id: SDL_HapticEffectID) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var state: [*c]struct_lg4ff_effect_state = undefined;
    _ = &state;
    var now: Uint64 = get_time_ms();
    _ = &now;
    if (effect_is_periodic(effect) and (@as(c_int, effect.*.periodic.period) == @as(c_int, 0))) {
        return -@as(c_int, 1);
    }
    state = &device.*.states[@bitCast(@as(isize, @intCast(id)))];
    if ((((&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_STARTED))))) != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_int, effect.*.type) != @as(c_int, state.*.effect.type))))) != 0)) {
        return -@as(c_int, 1);
    }
    state.*.effect = effect.*;
    if (((&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_STARTED))))) != 0) {
        {
            (&state.*.flags).* = (&state.*.flags).* | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_UPDATING))));
        }
        state.*.updated_at = now;
    }
    return 0;
}
pub fn lg4ff_update_state(state: [*c]struct_lg4ff_effect_state, now: Uint64) callconv(.c) void {
    @setEvalBranchQuota(100000);
    _ = &now;
    var effect: [*c]SDL_HapticEffect = &state.*.effect;
    _ = &effect;
    var phase_time: Uint64 = undefined;
    _ = &phase_time;
    var effect_direction: Uint16 = get_effect_direction(effect);
    _ = &effect_direction;
    if (!(((&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_ALLSET))))) != 0)) {
        state.*.play_at = state.*.start_at +% @as(Uint64, @bitCast(@as(c_long, @as(c_int, get_effect_replay_delay(effect)))));
        if (!(((&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_UPDATING))))) != 0)) {
            state.*.updated_at = state.*.play_at;
        }
        state.*.direction_gain = SDL_sin_REAL((@as(f64, @floatFromInt(@divTrunc(@as(c_int, effect_direction) * @as(c_int, 360), @as(c_int, 65536)))) * SDL_PI_D) / @as(f64, 180.0));
        if (effect_is_periodic(effect)) {
            state.*.phase_adj = @bitCast(@as(c_int, @divTrunc(@as(c_int, effect.*.periodic.phase) * @as(c_int, 360), @as(c_int, effect.*.periodic.period))));
        }
        if (get_effect_replay_length(effect) != 0) {
            state.*.stop_at = state.*.play_at +% @as(Uint64, get_effect_replay_length(effect));
        }
    }
    {
        (&state.*.flags).* = (&state.*.flags).* | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_ALLSET))));
    }
    if (((&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_UPDATING))))) != 0) {
        {
            (&state.*.flags).* = (&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, ~(@as(c_int, 1) << @intCast(FF_EFFECT_PLAYING)))));
        }
        state.*.play_at = state.*.updated_at +% @as(Uint64, @bitCast(@as(c_long, @as(c_int, get_effect_replay_delay(effect)))));
        state.*.direction_gain = SDL_sin_REAL((@as(f64, @floatFromInt(@divTrunc(@as(c_int, effect_direction) * @as(c_int, 360), @as(c_int, 65536)))) * SDL_PI_D) / @as(f64, 180.0));
        if (get_effect_replay_length(effect) != 0) {
            state.*.stop_at = state.*.updated_at +% @as(Uint64, get_effect_replay_length(effect));
        }
        if (effect_is_periodic(effect)) {
            state.*.phase_adj = state.*.phase;
        }
    }
    {
        (&state.*.flags).* = (&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, ~(@as(c_int, 1) << @intCast(FF_EFFECT_UPDATING)))));
    }
    state.*.slope = 0;
    if (((@as(Uint32, @bitCast(@as(c_int, @intFromBool(@as(c_uint, @bitCast(@as(c_int, @as(c_int, effect.*.type)))) == (@as(c_uint, 1) << @intCast(@as(c_uint, 6))))))) != 0) and (effect.*.ramp.length != 0)) and (((effect.*.ramp.length -% @as(Uint32, @bitCast(@as(c_int, @as(c_int, effect.*.ramp.attack_length))))) -% @as(Uint32, @bitCast(@as(c_int, @as(c_int, effect.*.ramp.fade_length))))) != @as(Uint32, 0))) {
        state.*.slope = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, (@as(c_int, effect.*.ramp.end) - @as(c_int, effect.*.ramp.start)) << @intCast(@as(c_int, 16))))) / ((effect.*.ramp.length -% @as(Uint32, @bitCast(@as(c_int, @as(c_int, effect.*.ramp.attack_length))))) -% @as(Uint32, @bitCast(@as(c_int, @as(c_int, effect.*.ramp.fade_length))))))));
    }
    if ((!(((&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_PLAYING))))) != 0) and (now >= state.*.play_at)) and ((get_effect_replay_length(effect) == @as(Uint32, 0)) or (now < state.*.stop_at))) {
        {
            (&state.*.flags).* = (&state.*.flags).* | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_PLAYING))));
        }
    }
    if (((&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_PLAYING))))) != 0) {
        state.*.time_playing = now -% state.*.play_at;
        if (effect_is_periodic(effect)) {
            phase_time = now -% state.*.updated_at;
            state.*.phase = @truncate(((phase_time % @as(Uint64, @bitCast(@as(c_long, @as(c_int, effect.*.periodic.period))))) *% @as(Uint64, 360)) / @as(Uint64, @bitCast(@as(c_long, @as(c_int, effect.*.periodic.period)))));
            state.*.phase +%= state.*.phase_adj % @as(Uint32, 360);
        }
    }
}
pub fn lg4ff_calculate_constant(state: [*c]struct_lg4ff_effect_state) callconv(.c) Sint32 {
    @setEvalBranchQuota(100000);
    var constant: [*c]SDL_HapticConstant = @ptrCast(@alignCast(&state.*.effect));
    _ = &constant;
    var level_sign: Sint32 = undefined;
    _ = &level_sign;
    var level: Sint32 = constant.*.level;
    _ = &level;
    var d: Sint32 = undefined;
    _ = &d;
    var t: Sint32 = undefined;
    _ = &t;
    if (state.*.time_playing < @as(Uint64, @bitCast(@as(c_long, @as(c_int, constant.*.attack_length))))) {
        level_sign = if (level < @as(c_int, 0)) -@as(c_int, 1) else @as(c_int, 1);
        d = level - (level_sign * @as(c_int, constant.*.attack_level));
        level = @bitCast(@as(c_uint, @truncate(@as(Uint64, @bitCast(@as(c_long, level_sign * @as(c_int, constant.*.attack_level)))) +% ((@as(Uint64, @bitCast(@as(c_long, d))) *% state.*.time_playing) / @as(Uint64, @bitCast(@as(c_long, @as(c_int, constant.*.attack_length))))))));
    } else if ((constant.*.length != 0) and (@as(Uint32, @bitCast(@as(c_int, @as(c_int, constant.*.fade_length)))) != 0)) {
        t = @bitCast(@as(c_uint, @truncate((state.*.time_playing -% @as(Uint64, constant.*.length)) +% @as(Uint64, @bitCast(@as(c_long, @as(c_int, constant.*.fade_length)))))));
        if (t > @as(c_int, 0)) {
            level_sign = if (level < @as(c_int, 0)) -@as(c_int, 1) else @as(c_int, 1);
            d = level - (level_sign * @as(c_int, constant.*.fade_level));
            level = level - @divTrunc(d * t, @as(c_int, constant.*.fade_length));
        }
    }
    return @intFromFloat(state.*.direction_gain * @as(f64, @floatFromInt(level)));
}
pub fn lg4ff_calculate_ramp(state: [*c]struct_lg4ff_effect_state) callconv(.c) Sint32 {
    @setEvalBranchQuota(100000);
    var ramp: [*c]SDL_HapticRamp = @ptrCast(@alignCast(&state.*.effect));
    _ = &ramp;
    var level_sign: Sint32 = undefined;
    _ = &level_sign;
    var level: Sint32 = undefined;
    _ = &level;
    var d: Sint32 = undefined;
    _ = &d;
    var t: Sint32 = undefined;
    _ = &t;
    if (state.*.time_playing < @as(Uint64, @bitCast(@as(c_long, @as(c_int, ramp.*.attack_length))))) {
        level = ramp.*.start;
        level_sign = if (level < @as(c_int, 0)) -@as(c_int, 1) else @as(c_int, 1);
        t = @bitCast(@as(c_uint, @truncate(@as(Uint64, @bitCast(@as(c_long, @as(c_int, ramp.*.attack_length)))) -% state.*.time_playing)));
        d = level - (level_sign * @as(c_int, ramp.*.attack_level));
        level = (level_sign * @as(c_int, ramp.*.attack_level)) + @divTrunc(d * t, @as(c_int, ramp.*.attack_length));
    } else if (((ramp.*.length != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(state.*.time_playing >= @as(Uint64, ramp.*.length -% @as(Uint32, @bitCast(@as(c_int, @as(c_int, ramp.*.fade_length))))))))) != 0)) and (@as(c_int, ramp.*.fade_length) != 0)) {
        level = ramp.*.end;
        level_sign = if (level < @as(c_int, 0)) -@as(c_int, 1) else @as(c_int, 1);
        t = @bitCast(@as(c_uint, @truncate((state.*.time_playing -% @as(Uint64, ramp.*.length)) +% @as(Uint64, @bitCast(@as(c_long, @as(c_int, ramp.*.fade_length)))))));
        d = (level_sign * @as(c_int, ramp.*.fade_level)) - level;
        level = level - @divTrunc(d * t, @as(c_int, ramp.*.fade_length));
    } else {
        t = @bitCast(@as(c_uint, @truncate(state.*.time_playing -% @as(Uint64, @bitCast(@as(c_long, @as(c_int, ramp.*.attack_length)))))));
        level = @as(c_int, ramp.*.start) + ((t * state.*.slope) >> @intCast(@as(c_int, 16)));
    }
    return @intFromFloat(state.*.direction_gain * @as(f64, @floatFromInt(level)));
}
pub fn lg4ff_calculate_periodic(state: [*c]struct_lg4ff_effect_state) callconv(.c) Sint32 {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [24:0]u8 = "lg4ff_calculate_periodic".*;
    };
    _ = &static_local___func__;
    var periodic: [*c]SDL_HapticPeriodic = undefined;
    _ = &periodic;
    var magnitude: Sint32 = undefined;
    _ = &magnitude;
    var magnitude_sign: Sint32 = undefined;
    _ = &magnitude_sign;
    var level: Sint32 = undefined;
    _ = &level;
    var d: Sint32 = undefined;
    _ = &d;
    var t: Sint32 = undefined;
    _ = &t;
    const static_local_sdl_assert_data = struct {
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
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                periodic = @ptrCast(@alignCast(&state.*.effect));
                magnitude = periodic.*.magnitude;
                magnitude_sign = if (magnitude < @as(c_int, 0)) -@as(c_int, 1) else @as(c_int, 1);
                level = periodic.*.offset;
                if (state.*.time_playing < @as(Uint64, @bitCast(@as(c_long, @as(c_int, periodic.*.attack_length))))) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                d = magnitude - (magnitude_sign * @as(c_int, periodic.*.attack_level));
                magnitude = @bitCast(@as(c_uint, @truncate(@as(Uint64, @bitCast(@as(c_long, magnitude_sign * @as(c_int, periodic.*.attack_level)))) +% ((@as(Uint64, @bitCast(@as(c_long, d))) *% state.*.time_playing) / @as(Uint64, @bitCast(@as(c_long, @as(c_int, periodic.*.attack_length))))))));
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            2 => {
                if ((periodic.*.length != 0) and (@as(Uint32, @bitCast(@as(c_int, @as(c_int, periodic.*.fade_length)))) != 0)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            3 => {
                switch (@as(c_int, periodic.*.type)) {
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 1))) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 2))) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 3))) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 4))) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 5))) => {
                        sdl_pc = 15;
                        continue;
                    },
                    else => {
                        sdl_pc = 16;
                        continue;
                    },
                }
            },
            4 => {
                t = @bitCast(@as(c_uint, @truncate((state.*.time_playing -% @as(Uint64, get_effect_replay_length(&state.*.effect))) +% @as(Uint64, @bitCast(@as(c_long, @as(c_int, periodic.*.fade_length)))))));
                if (t > @as(c_int, 0)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
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
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            7 => {
                d = magnitude - (magnitude_sign * @as(c_int, periodic.*.fade_level));
                magnitude = magnitude - @divTrunc(d * t, @as(c_int, periodic.*.fade_length));
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
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                return @intFromFloat(state.*.direction_gain * @as(f64, @floatFromInt(level)));
            },
            11 => {
                level += @intFromFloat(SDL_sin_REAL((@as(f64, @floatFromInt(state.*.phase)) * SDL_PI_D) / @as(f64, 180.0)) * @as(f64, @floatFromInt(magnitude)));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            12 => {
                level += (if (state.*.phase < @as(Uint32, 180)) @as(c_int, 1) else -@as(c_int, 1)) * magnitude;
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            13 => {
                level += @truncate((abs64(@divTrunc((@as(Sint64, state.*.phase) * @as(Sint64, magnitude)) * @as(Sint64, 2), @as(Sint64, 360)) - @as(Sint64, magnitude)) * @as(Sint64, 2)) - @as(Sint64, magnitude));
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            14 => {
                {
                    const ref = &level;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, ref.*))) +% ((((state.*.phase *% @as(Uint32, @bitCast(@as(c_int, magnitude)))) *% @as(Uint32, 2)) / @as(Uint32, 360)) -% @as(Uint32, @bitCast(@as(c_int, magnitude)))))));
                }
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            15 => {
                {
                    const ref = &level;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, ref.*))) +% (@as(Uint32, @bitCast(@as(c_int, magnitude))) -% (((state.*.phase *% @as(Uint32, @bitCast(@as(c_int, magnitude)))) *% @as(Uint32, 2)) / @as(Uint32, 360))))));
                }
                {
                    sdl_pc = 10;
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
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 10;
                    continue;
                }
            },
            20 => {
                if (!(@as(c_int, 0) != 0)) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 22;
                    continue;
                }
            },
            21 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hidapihaptic_lg4ff.c", 527);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            22 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            24 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
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
                __builtin.debugtrap();
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
            else => unreachable,
        }
    }
}
pub fn lg4ff_calculate_spring(state: [*c]struct_lg4ff_effect_state, parameters: [*c]struct_lg4ff_effect_parameters) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var condition: [*c]SDL_HapticCondition = @ptrCast(@alignCast(&state.*.effect));
    _ = &condition;
    parameters.*.d1 = @as(Sint32, condition.*.center[@as(c_int, 0)]) - @divTrunc(@as(c_int, condition.*.deadband[@as(c_int, 0)]), @as(c_int, 2));
    parameters.*.d2 = @as(Sint32, condition.*.center[@as(c_int, 0)]) + @divTrunc(@as(c_int, condition.*.deadband[@as(c_int, 0)]), @as(c_int, 2));
    parameters.*.k1 = condition.*.left_coeff[@as(c_int, 0)];
    parameters.*.k2 = condition.*.right_coeff[@as(c_int, 0)];
    parameters.*.clip = condition.*.right_sat[@as(c_int, 0)];
}
pub fn lg4ff_calculate_resistance(state: [*c]struct_lg4ff_effect_state, parameters: [*c]struct_lg4ff_effect_parameters) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var condition: [*c]SDL_HapticCondition = @ptrCast(@alignCast(&state.*.effect));
    _ = &condition;
    parameters.*.k1 = condition.*.left_coeff[@as(c_int, 0)];
    parameters.*.k2 = condition.*.right_coeff[@as(c_int, 0)];
    parameters.*.clip = condition.*.right_sat[@as(c_int, 0)];
}
pub fn lg4ff_update_slot(slot: [*c]struct_lg4ff_slot, parameters: [*c]struct_lg4ff_effect_parameters) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var original_cmd: [7]Uint8 = undefined;
    _ = &original_cmd;
    var d1: Sint32 = undefined;
    _ = &d1;
    var d2: Sint32 = undefined;
    _ = &d2;
    var k1: Sint32 = undefined;
    _ = &k1;
    var k2: Sint32 = undefined;
    _ = &k2;
    var s1: Sint32 = undefined;
    _ = &s1;
    var s2: Sint32 = undefined;
    _ = &s2;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                _ = memcpy(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&original_cmd))))), @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&slot.*.current_cmd))))), @sizeOf(@TypeOf(original_cmd)));
                if ((@as(c_int, original_cmd[@as(c_int, 0)]) & @as(c_int, 15)) == @as(c_int, 1)) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                original_cmd[@as(c_int, 0)] = @bitCast(@as(i8, @truncate((@as(c_int, original_cmd[@as(c_int, 0)]) & @as(c_int, 240)) + @as(c_int, 12))));
                {
                    sdl_pc = 3;
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
                if (slot.*.effect_type == (@as(c_uint, 1) << @intCast(@as(c_uint, 0)))) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                if (slot.*.cmd_op == @as(Uint32, 0)) {
                    sdl_pc = 7;
                    continue;
                } else {
                    sdl_pc = 8;
                    continue;
                }
            },
            5 => {
                if (parameters.*.clip == @as(Uint32, 0)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            6 => {
                slot.*.current_cmd[@as(c_int, 0)] = @truncate(@as(Uint32, @bitCast(@as(c_int, @as(c_int, 16) << @intCast(slot.*.id)))) +% slot.*.cmd_op);
                if (slot.*.cmd_op == @as(Uint32, 3)) {
                    sdl_pc = 16;
                    continue;
                } else {
                    sdl_pc = 17;
                    continue;
                }
            },
            7 => {
                slot.*.cmd_op = 1;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                slot.*.cmd_op = 12;
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            9 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            10 => {
                slot.*.cmd_op = 3;
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                if (slot.*.cmd_op == @as(Uint32, 3)) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 14;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            13 => {
                slot.*.cmd_op = 1;
                {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                slot.*.cmd_op = 12;
                {
                    sdl_pc = 15;
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
                slot.*.current_cmd[@as(c_int, 1)] = 0;
                slot.*.current_cmd[@as(c_int, 2)] = 0;
                slot.*.current_cmd[@as(c_int, 3)] = 0;
                slot.*.current_cmd[@as(c_int, 4)] = 0;
                slot.*.current_cmd[@as(c_int, 5)] = 0;
                slot.*.current_cmd[@as(c_int, 6)] = 0;
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                switch (slot.*.effect_type) {
                    @as(c_uint, 1) << @intCast(@as(c_uint, 0)) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(c_uint, 1) << @intCast(@as(c_uint, 7)) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(c_uint, 1) << @intCast(@as(c_uint, 8)) => {
                        sdl_pc = 28;
                        continue;
                    },
                    @as(c_uint, 1) << @intCast(@as(c_uint, 10)) => {
                        sdl_pc = 29;
                        continue;
                    },
                    else => {
                        sdl_pc = 19;
                        continue;
                    },
                }
            },
            18 => {
                if (SDL_memcmp_REAL(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&original_cmd))))), @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&slot.*.current_cmd))))), @sizeOf(@TypeOf(original_cmd))) != 0) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            20 => {
                slot.*.current_cmd[@as(c_int, 1)] = 0;
                slot.*.current_cmd[@as(c_int, 2)] = 0;
                slot.*.current_cmd[@as(c_int, 3)] = 0;
                slot.*.current_cmd[@as(c_int, 4)] = 0;
                slot.*.current_cmd[@as(c_int, 5)] = 0;
                slot.*.current_cmd[@as(c_int, 6)] = 0;
                slot.*.current_cmd[@bitCast(@as(isize, @intCast(@as(c_int, 2) + slot.*.id)))] = @bitCast(@as(i8, @truncate((@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(if (parameters.*.level <= -@as(c_int, 32768)) -@as(c_int, 32768) else if (parameters.*.level > @as(c_int, 32767)) @as(c_int, 32767) else parameters.*.level))))) + @as(c_int, 32768)) >> @intCast(@as(c_int, 8)))));
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            21 => {
                d1 = @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(if (((parameters.*.d1 + @as(c_int, 32768)) & @as(c_int, 65535)) > @as(c_int, 65535)) @as(c_int, 65535) else (parameters.*.d1 + @as(c_int, 32768)) & @as(c_int, 65535)))))) >> @intCast(@as(c_int, 16) - @as(c_int, 11));
                d2 = @as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(if (((parameters.*.d2 + @as(c_int, 32768)) & @as(c_int, 65535)) > @as(c_int, 65535)) @as(c_int, 65535) else (parameters.*.d2 + @as(c_int, 32768)) & @as(c_int, 65535)))))) >> @intCast(@as(c_int, 16) - @as(c_int, 11));
                s1 = @intFromBool(parameters.*.k1 < @as(c_int, 0));
                s2 = @intFromBool(parameters.*.k2 < @as(c_int, 0));
                k1 = abs32(parameters.*.k1);
                k2 = abs32(parameters.*.k2);
                if (k1 < @as(c_int, 2048)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            22 => {
                d1 = 0;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                k1 -= 2048;
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                if (k2 < @as(c_int, 2048)) {
                    sdl_pc = 25;
                    continue;
                } else {
                    sdl_pc = 26;
                    continue;
                }
            },
            25 => {
                d2 = 2047;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            26 => {
                k2 -= 2048;
                {
                    sdl_pc = 27;
                    continue;
                }
            },
            27 => {
                slot.*.current_cmd[@as(c_int, 1)] = 11;
                slot.*.current_cmd[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(d1 >> @intCast(@as(c_int, 3)))));
                slot.*.current_cmd[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(d2 >> @intCast(@as(c_int, 3)))));
                slot.*.current_cmd[@as(c_int, 4)] = @bitCast(@as(i8, @truncate(((@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(if ((abs32(k2) * @as(c_int, 2)) > @as(c_int, 65535)) @as(c_int, 65535) else abs32(k2) * @as(c_int, 2)))))) >> @intCast(@as(c_int, 16) - @as(c_int, 4))) << @intCast(@as(c_int, 4))) + (@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(if ((abs32(k1) * @as(c_int, 2)) > @as(c_int, 65535)) @as(c_int, 65535) else abs32(k1) * @as(c_int, 2)))))) >> @intCast(@as(c_int, 16) - @as(c_int, 4))))));
                slot.*.current_cmd[@as(c_int, 5)] = @bitCast(@as(i8, @truncate(((((d2 & @as(c_int, 7)) << @intCast(@as(c_int, 5))) + ((d1 & @as(c_int, 7)) << @intCast(@as(c_int, 1)))) + (s2 << @intCast(@as(c_int, 4)))) + s1)));
                slot.*.current_cmd[@as(c_int, 6)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(Uint16, @truncate(if (parameters.*.clip > @as(Uint32, 65535)) @as(Uint32, 65535) else parameters.*.clip))) >> @intCast(@as(c_int, 16) - @as(c_int, 8)))));
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            28 => {
                s1 = @intFromBool(parameters.*.k1 < @as(c_int, 0));
                s2 = @intFromBool(parameters.*.k2 < @as(c_int, 0));
                slot.*.current_cmd[@as(c_int, 1)] = 12;
                slot.*.current_cmd[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(if ((abs32(parameters.*.k1) * @as(c_int, 2)) > @as(c_int, 65535)) @as(c_int, 65535) else abs32(parameters.*.k1) * @as(c_int, 2)))))) >> @intCast(@as(c_int, 16) - @as(c_int, 4)))));
                slot.*.current_cmd[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(s1)));
                slot.*.current_cmd[@as(c_int, 4)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(if ((abs32(parameters.*.k2) * @as(c_int, 2)) > @as(c_int, 65535)) @as(c_int, 65535) else abs32(parameters.*.k2) * @as(c_int, 2)))))) >> @intCast(@as(c_int, 16) - @as(c_int, 4)))));
                slot.*.current_cmd[@as(c_int, 5)] = @bitCast(@as(i8, @truncate(s2)));
                slot.*.current_cmd[@as(c_int, 6)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(Uint16, @truncate(if (parameters.*.clip > @as(Uint32, 65535)) @as(Uint32, 65535) else parameters.*.clip))) >> @intCast(@as(c_int, 16) - @as(c_int, 8)))));
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            29 => {
                s1 = @intFromBool(parameters.*.k1 < @as(c_int, 0));
                s2 = @intFromBool(parameters.*.k2 < @as(c_int, 0));
                slot.*.current_cmd[@as(c_int, 1)] = 14;
                slot.*.current_cmd[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(if ((abs32(parameters.*.k1) * @as(c_int, 2)) > @as(c_int, 65535)) @as(c_int, 65535) else abs32(parameters.*.k1) * @as(c_int, 2)))))) >> @intCast(@as(c_int, 16) - @as(c_int, 8)))));
                slot.*.current_cmd[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(if ((abs32(parameters.*.k2) * @as(c_int, 2)) > @as(c_int, 65535)) @as(c_int, 65535) else abs32(parameters.*.k2) * @as(c_int, 2)))))) >> @intCast(@as(c_int, 16) - @as(c_int, 8)))));
                slot.*.current_cmd[@as(c_int, 4)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(Uint16, @truncate(if (parameters.*.clip > @as(Uint32, 65535)) @as(Uint32, 65535) else parameters.*.clip))) >> @intCast(@as(c_int, 16) - @as(c_int, 8)))));
                slot.*.current_cmd[@as(c_int, 5)] = @bitCast(@as(i8, @truncate((s2 << @intCast(@as(c_int, 4))) + s1)));
                slot.*.current_cmd[@as(c_int, 6)] = 0;
                {
                    sdl_pc = 19;
                    continue;
                }
            },
            30 => {
                slot.*.is_updated = @as(c_int, 1) != 0;
                {
                    sdl_pc = 32;
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
                {}
            },
            else => unreachable,
        }
    }
}
pub fn lg4ff_init_slots(device: [*c]struct_lg4ff_device) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var parameters: struct_lg4ff_effect_parameters = undefined;
    _ = &parameters;
    var cmd: [7]Uint8 = [1]Uint8{
        0,
    } ++ @as([6]Uint8, @splat(0));
    _ = &cmd;
    var i: c_int = undefined;
    _ = &i;
    var ret: bool = undefined;
    _ = &ret;
    cmd[@as(c_int, 0)] = 13;
    cmd[@as(c_int, 1)] = 0;
    ret = SDL_SendJoystickEffect_REAL(device.*.hid_handle, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&cmd))))), 7);
    if (!ret) {
        return -@as(c_int, 1);
    }
    _ = memset(@ptrCast(@alignCast(&device.*.states)), 0, @sizeOf(@TypeOf(device.*.states)));
    _ = memset(@ptrCast(@alignCast(&device.*.slots)), 0, @sizeOf(@TypeOf(device.*.slots)));
    _ = memset(@ptrCast(@alignCast(&parameters)), 0, @sizeOf(@TypeOf(parameters)));
    device.*.slots[@as(c_int, 0)].effect_type = @as(c_uint, 1) << @intCast(@as(c_uint, 0));
    device.*.slots[@as(c_int, 1)].effect_type = @as(c_uint, 1) << @intCast(@as(c_uint, 7));
    device.*.slots[@as(c_int, 2)].effect_type = @as(c_uint, 1) << @intCast(@as(c_uint, 8));
    device.*.slots[@as(c_int, 3)].effect_type = @as(c_uint, 1) << @intCast(@as(c_uint, 10));
    {
        i = 0;
        while (i < @as(c_int, 4)) : (i += 1) {
            device.*.slots[@bitCast(@as(isize, @intCast(i)))].id = i;
            lg4ff_update_slot(&device.*.slots[@bitCast(@as(isize, @intCast(i)))], &parameters);
            ret = SDL_SendJoystickEffect_REAL(device.*.hid_handle, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&cmd))))), 7);
            if (!ret) {
                return -@as(c_int, 1);
            }
            device.*.slots[@bitCast(@as(isize, @intCast(i)))].is_updated = @as(c_int, 0) != 0;
        }
    }
    return 0;
}
pub fn lg4ff_timer(device: [*c]struct_lg4ff_device) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var slot: [*c]struct_lg4ff_slot = undefined;
    _ = &slot;
    var state: [*c]struct_lg4ff_effect_state = undefined;
    _ = &state;
    var parameters: [4]struct_lg4ff_effect_parameters = undefined;
    _ = &parameters;
    var now: Uint64 = undefined;
    _ = &now;
    var gain: Uint16 = undefined;
    _ = &gain;
    var count: Sint32 = undefined;
    _ = &count;
    var effect_id: Sint32 = undefined;
    _ = &effect_id;
    var i: c_int = undefined;
    _ = &i;
    var ffb_level: Sint32 = undefined;
    _ = &ffb_level;
    var status: c_int = undefined;
    _ = &status;
    var ret: bool = undefined;
    _ = &ret;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                now = get_time_ms();
                status = 0;
                _ = memset(@ptrCast(@alignCast(@as([*c]struct_lg4ff_effect_parameters, @ptrCast(@alignCast(&parameters))))), 0, @sizeOf(@TypeOf(parameters)));
                gain = @truncate((@as(Uint32, @bitCast(@as(c_int, device.*.gain))) *% @as(Uint32, @bitCast(@as(c_int, device.*.app_gain)))) / @as(Uint32, 65535));
                count = device.*.effects_used;
                effect_id = 0;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (effect_id < LG4FF_MAX_EFFECTS) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                if (!(count != 0)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            3 => {
                effect_id += 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                parameters[@as(c_int, 0)].level = @truncate(@divTrunc(@as(Sint64, parameters[@as(c_int, 0)].level) * @as(Sint64, @as(c_int, gain)), @as(Sint64, 65535)));
                parameters[@as(c_int, 1)].clip = (parameters[@as(c_int, 1)].clip *% @as(Uint32, @bitCast(@as(c_int, device.*.spring_level)))) / @as(Uint32, 100);
                parameters[@as(c_int, 2)].clip = (parameters[@as(c_int, 2)].clip *% @as(Uint32, @bitCast(@as(c_int, device.*.damper_level)))) / @as(Uint32, 100);
                parameters[@as(c_int, 3)].clip = (parameters[@as(c_int, 3)].clip *% @as(Uint32, @bitCast(@as(c_int, device.*.friction_level)))) / @as(Uint32, 100);
                ffb_level = abs32(parameters[@as(c_int, 0)].level);
                i = 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 4;
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
                state = &device.*.states[@bitCast(@as(isize, @intCast(effect_id)))];
                if (!(((&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_STARTED))))) != 0)) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                {
                    sdl_pc = 3;
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
                count -= 1;
                if (((&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_ALLSET))))) != 0) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                if ((get_effect_replay_length(&state.*.effect) != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(now >= state.*.stop_at)))) != 0)) {
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
                lg4ff_update_state(state, now);
                if (!(((&state.*.flags).* & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_PLAYING))))) != 0)) {
                    sdl_pc = 20;
                    continue;
                } else {
                    sdl_pc = 21;
                    continue;
                }
            },
            14 => {
                state.*.flags = 0;
                if (!((blk: {
                    const ref = &state.*.count;
                    ref.* -%= 1;
                    break :blk ref.*;
                }) != 0)) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
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
                    sdl_pc = 13;
                    continue;
                }
            },
            17 => {
                device.*.effects_used -= 1;
                {
                    sdl_pc = 3;
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
                (&state.*.flags).* = (&state.*.flags).* | @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_STARTED))));
                state.*.start_at = state.*.stop_at;
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 3;
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
                if (effect_is_periodic(&state.*.effect)) {
                    sdl_pc = 23;
                    continue;
                } else {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                parameters[@as(c_int, 0)].level += lg4ff_calculate_periodic(state);
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            24 => {
                switch (@as(c_int, state.*.effect.type)) {
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 0))) => {
                        sdl_pc = 27;
                        continue;
                    },
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 6))) => {
                        sdl_pc = 28;
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
                    @as(c_int, @as(c_uint, 1) << @intCast(@as(c_uint, 10))) => {
                        sdl_pc = 31;
                        continue;
                    },
                    else => {
                        sdl_pc = 26;
                        continue;
                    },
                }
            },
            25 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            26 => {
                {
                    sdl_pc = 25;
                    continue;
                }
            },
            27 => {
                parameters[@as(c_int, 0)].level += lg4ff_calculate_constant(state);
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            28 => {
                parameters[@as(c_int, 0)].level += lg4ff_calculate_ramp(state);
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            29 => {
                lg4ff_calculate_spring(state, &parameters[@as(c_int, 1)]);
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            30 => {
                lg4ff_calculate_resistance(state, &parameters[@as(c_int, 2)]);
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            31 => {
                lg4ff_calculate_resistance(state, &parameters[@as(c_int, 3)]);
                {
                    sdl_pc = 26;
                    continue;
                }
            },
            32 => {
                if (i < @as(c_int, 4)) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 35;
                    continue;
                }
            },
            33 => {
                parameters[@bitCast(@as(isize, @intCast(i)))].k1 = @truncate(@divTrunc(@as(Sint64, parameters[@bitCast(@as(isize, @intCast(i)))].k1) * @as(Sint64, @as(c_int, gain)), @as(Sint64, 65535)));
                parameters[@bitCast(@as(isize, @intCast(i)))].k2 = @truncate(@divTrunc(@as(Sint64, parameters[@bitCast(@as(isize, @intCast(i)))].k2) * @as(Sint64, @as(c_int, gain)), @as(Sint64, 65535)));
                parameters[@bitCast(@as(isize, @intCast(i)))].clip = (parameters[@bitCast(@as(isize, @intCast(i)))].clip *% @as(Uint32, @bitCast(@as(c_int, @as(c_int, gain))))) / @as(Uint32, 65535);
                ffb_level = @bitCast(@as(c_uint, @truncate(@as(Uint32, @bitCast(@as(c_int, ffb_level))) +% ((parameters[@bitCast(@as(isize, @intCast(i)))].clip *% @as(Uint32, 32767)) / @as(Uint32, 65535)))));
                {
                    sdl_pc = 34;
                    continue;
                }
            },
            34 => {
                i += 1;
                {
                    sdl_pc = 32;
                    continue;
                }
            },
            35 => {
                if (ffb_level > device.*.peak_ffb_level) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                device.*.peak_ffb_level = ffb_level;
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            37 => {
                {
                    sdl_pc = 38;
                    continue;
                }
            },
            38 => {
                i = 0;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            39 => {
                if (i < @as(c_int, 4)) {
                    sdl_pc = 40;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            40 => {
                slot = &device.*.slots[@bitCast(@as(isize, @intCast(i)))];
                lg4ff_update_slot(slot, &parameters[@bitCast(@as(isize, @intCast(i)))]);
                if (slot.*.is_updated) {
                    sdl_pc = 43;
                    continue;
                } else {
                    sdl_pc = 44;
                    continue;
                }
            },
            41 => {
                i += 1;
                {
                    sdl_pc = 39;
                    continue;
                }
            },
            42 => {
                return status;
            },
            43 => {
                ret = SDL_SendJoystickEffect_REAL(device.*.hid_handle, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&slot.*.current_cmd))))), 7);
                if (!ret) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 47;
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
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            46 => {
                status = -@as(c_int, 1);
                {
                    sdl_pc = 48;
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
                slot.*.is_updated = @as(c_int, 0) != 0;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_JoystickSupported(joystick: [*c]SDL_Joystick) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var vendor_id: Uint16 = SDL_GetJoystickVendor_REAL(joystick);
    _ = &vendor_id;
    var product_id: Uint16 = SDL_GetJoystickProduct_REAL(joystick);
    _ = &product_id;
    if (@as(c_int, vendor_id) != USB_VENDOR_ID_LOGITECH) {
        return @"false" != 0;
    }
    {
        var i: c_int = 0;
        _ = &i;
        while (@as(c_ulong, @bitCast(@as(c_long, i))) < (@sizeOf(@TypeOf(supported_device_ids)) / @sizeOf(@TypeOf(supported_device_ids[@as(c_int, 0)])))) : (i += 1) {
            if (supported_device_ids[@bitCast(@as(isize, @intCast(i)))] == @as(Uint32, @bitCast(@as(c_int, @as(c_int, product_id))))) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_ThreadFunction(ctx_in: ?*anyopaque) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var ctx: [*c]lg4ff_device = @ptrCast(@alignCast(ctx_in));
    _ = &ctx;
    while (true) {
        if (ctx.*.stop_thread) {
            return 0;
        }
        SDL_LockMutex_REAL(ctx.*.mutex);
        _ = lg4ff_timer(ctx);
        SDL_UnlockMutex_REAL(ctx.*.mutex);
        SDL_Delay_REAL(2);
    }
    return undefined;
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_GetEnvInt(env_name: [*c]const u8, min: c_int, max: c_int, def: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var env: [*c]const u8 = SDL_getenv_REAL(env_name);
    _ = &env;
    var value: c_int = 0;
    _ = &value;
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(env)))) == @as(?*anyopaque, null)) {
        return def;
    }
    value = SDL_atoi_REAL(env);
    if (value < min) {
        value = min;
    }
    if (value > max) {
        value = max;
    }
    return value;
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_Open(joystick: [*c]SDL_Joystick) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var ctx: [*c]lg4ff_device = undefined;
    _ = &ctx;
    if (!SDL_HIDAPI_HapticDriverLg4ff_JoystickSupported(joystick)) {
        _ = SDL_SetError_REAL("Device not supported by the lg4ff hidapi haptic driver");
        return null;
    }
    ctx = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(lg4ff_device))));
    if (@as(?*anyopaque, @ptrCast(@alignCast(ctx))) == @as(?*anyopaque, null)) {
        _ = SDL_OutOfMemory_REAL();
        return null;
    }
    _ = memset(@ptrCast(@alignCast(ctx)), 0, @sizeOf(@TypeOf(ctx.*)));
    ctx.*.hid_handle = joystick;
    if (lg4ff_init_slots(ctx) != @as(c_int, 0)) {
        _ = SDL_SetError_REAL("lg4ff hidapi driver failed initializing effect slots");
        SDL_free_REAL(@ptrCast(@alignCast(ctx)));
        return null;
    }
    ctx.*.mutex = SDL_CreateMutex_REAL();
    if (@as(?*anyopaque, @ptrCast(@alignCast(ctx.*.mutex))) == @as(?*anyopaque, null)) {
        SDL_free_REAL(@ptrCast(@alignCast(ctx)));
        return null;
    }
    ctx.*.spring_level = SDL_HIDAPI_HapticDriverLg4ff_GetEnvInt("SDL_HAPTIC_LG4FF_SPRING", 0, 100, 30);
    ctx.*.damper_level = SDL_HIDAPI_HapticDriverLg4ff_GetEnvInt("SDL_HAPTIC_LG4FF_DAMPER", 0, 100, 30);
    ctx.*.friction_level = SDL_HIDAPI_HapticDriverLg4ff_GetEnvInt("SDL_HAPTIC_LG4FF_FRICTION", 0, 100, 30);
    ctx.*.gain = SDL_HIDAPI_HapticDriverLg4ff_GetEnvInt("SDL_HAPTIC_LG4FF_GAIN", 0, 65535, 65535);
    ctx.*.app_gain = 65535;
    ctx.*.product_id = SDL_GetJoystickProduct_REAL(joystick);
    ctx.*.release_number = SDL_GetJoystickProductVersion_REAL(joystick);
    _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&ctx.*.thread_name_buf)), @sizeOf(@TypeOf(ctx.*.thread_name_buf)), "SDL_hidapihaptic_lg4ff %d %04x:%04x", SDL_GetJoystickID_REAL(joystick), USB_VENDOR_ID_LOGITECH, ctx.*.product_id);
    ctx.*.stop_thread = @"false" != 0;
    ctx.*.thread = SDL_CreateThreadRuntime_REAL(SDL_HIDAPI_HapticDriverLg4ff_ThreadFunction, @ptrCast(@alignCast(&ctx.*.thread_name_buf)), @ptrCast(@alignCast(ctx)), null, null);
    if (((@as(c_int, ctx.*.product_id) == USB_DEVICE_ID_LOGITECH_WHEEL) and ((@as(c_int, ctx.*.release_number) >> @intCast(@as(c_int, 8))) == @as(c_int, 33))) and ((@as(c_int, ctx.*.release_number) & @as(c_int, 255)) == @as(c_int, 0))) {
        ctx.*.is_ffex = @"true" != 0;
    } else {
        ctx.*.is_ffex = @"false" != 0;
    }
    return @ptrCast(@alignCast(ctx));
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_StopEffects(device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]lg4ff_device = @ptrCast(@alignCast(device.*.ctx));
    _ = &ctx;
    var i: c_int = undefined;
    _ = &i;
    SDL_LockMutex_REAL(ctx.*.mutex);
    {
        i = 0;
        while (i < LG4FF_MAX_EFFECTS) : (i += 1) {
            var state: [*c]struct_lg4ff_effect_state = &ctx.*.states[@bitCast(@as(isize, @intCast(i)))];
            _ = &state;
            state.*.flags = 0;
        }
    }
    SDL_UnlockMutex_REAL(ctx.*.mutex);
    return @"true" != 0;
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_Close(device: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]lg4ff_device = @ptrCast(@alignCast(device.*.ctx));
    _ = &ctx;
    _ = SDL_HIDAPI_HapticDriverLg4ff_StopEffects(device);
    SDL_Delay_REAL(50);
    ctx.*.stop_thread = @"true" != 0;
    SDL_WaitThread_REAL(ctx.*.thread, null);
    SDL_DestroyMutex_REAL(ctx.*.mutex);
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_NumEffects(_: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return LG4FF_MAX_EFFECTS;
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_GetFeatures(_: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    return ((((((((((((@as(c_uint, 1) << @intCast(@as(c_uint, 0))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 7)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 8)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 17)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 1)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 2)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 3)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 4)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 5)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 6)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 10)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 18)))) | (@as(c_uint, 1) << @intCast(@as(c_uint, 16)));
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_EffectSupported(device: [*c]SDL_HIDAPI_HapticDevice, effect: [*c]const SDL_HapticEffect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var features: Uint32 = SDL_HIDAPI_HapticDriverLg4ff_GetFeatures(device);
    _ = &features;
    return (if ((features & @as(Uint32, @bitCast(@as(c_int, @as(c_int, effect.*.type))))) != 0) @"true" else @"false") != 0;
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_NumAxes(_: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return 1;
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_CreateEffect(device: [*c]SDL_HIDAPI_HapticDevice, data: [*c]const SDL_HapticEffect) callconv(.c) SDL_HapticEffectID {
    @setEvalBranchQuota(100000);
    var ctx: [*c]lg4ff_device = @ptrCast(@alignCast(device.*.ctx));
    _ = &ctx;
    var i: SDL_HapticEffectID = undefined;
    _ = &i;
    var state_slot: SDL_HapticEffectID = -@as(c_int, 1);
    _ = &state_slot;
    var ret: c_int = undefined;
    _ = &ret;
    if (!SDL_HIDAPI_HapticDriverLg4ff_EffectSupported(device, data)) {
        _ = SDL_SetError_REAL("Unsupported effect");
        return -@as(c_int, 1);
    }
    SDL_LockMutex_REAL(ctx.*.mutex);
    {
        i = 0;
        while (i < LG4FF_MAX_EFFECTS) : (i += 1) {
            if (!ctx.*.states[@bitCast(@as(isize, @intCast(i)))].allocated) {
                state_slot = i;
                break;
            }
        }
    }
    if (state_slot == -@as(c_int, 1)) {
        SDL_UnlockMutex_REAL(ctx.*.mutex);
        _ = SDL_SetError_REAL("All effect slots in-use");
        return -@as(c_int, 1);
    }
    ret = lg4ff_upload_effect(ctx, data, state_slot);
    SDL_UnlockMutex_REAL(ctx.*.mutex);
    if (ret == @as(c_int, 0)) {
        ctx.*.states[@bitCast(@as(isize, @intCast(state_slot)))].allocated = @"true" != 0;
        return state_slot;
    } else {
        _ = SDL_SetError_REAL("Bad effect parameters");
        return -@as(c_int, 1);
    }
}
pub fn lg4ff_effect_slot_valid_active(ctx: [*c]lg4ff_device, arg_id: SDL_HapticEffectID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var id = arg_id;
    _ = &id;
    if ((id >= LG4FF_MAX_EFFECTS) or (id < @as(c_int, 0))) {
        return @"false" != 0;
    }
    if (!ctx.*.states[@bitCast(@as(isize, @intCast(id)))].allocated) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_UpdateEffect(device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID, data: [*c]const SDL_HapticEffect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]lg4ff_device = @ptrCast(@alignCast(device.*.ctx));
    _ = &ctx;
    var ret: c_int = undefined;
    _ = &ret;
    SDL_LockMutex_REAL(ctx.*.mutex);
    if (!lg4ff_effect_slot_valid_active(ctx, id)) {
        SDL_UnlockMutex_REAL(ctx.*.mutex);
        _ = SDL_SetError_REAL("Bad effect id");
        return @"false" != 0;
    }
    ret = lg4ff_upload_effect(ctx, data, id);
    SDL_UnlockMutex_REAL(ctx.*.mutex);
    return ret == @as(c_int, 0);
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_RunEffect(device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID, iterations: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]lg4ff_device = @ptrCast(@alignCast(device.*.ctx));
    _ = &ctx;
    var ret: c_int = undefined;
    _ = &ret;
    SDL_LockMutex_REAL(ctx.*.mutex);
    if (!lg4ff_effect_slot_valid_active(ctx, id)) {
        SDL_UnlockMutex_REAL(ctx.*.mutex);
        _ = SDL_SetError_REAL("Bad effect id");
        return @"false" != 0;
    }
    ret = lg4ff_play_effect(ctx, id, @bitCast(@as(c_uint, @truncate(iterations))));
    SDL_UnlockMutex_REAL(ctx.*.mutex);
    return ret == @as(c_int, 0);
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_StopEffect(device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_HIDAPI_HapticDriverLg4ff_RunEffect(device, id, 0);
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_DestroyEffect(device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var ctx: [*c]lg4ff_device = @ptrCast(@alignCast(device.*.ctx));
    _ = &ctx;
    var state: [*c]struct_lg4ff_effect_state = undefined;
    _ = &state;
    SDL_LockMutex_REAL(ctx.*.mutex);
    if (!lg4ff_effect_slot_valid_active(ctx, id)) {
        SDL_UnlockMutex_REAL(ctx.*.mutex);
        return;
    }
    state = &ctx.*.states[@bitCast(@as(isize, @intCast(id)))];
    state.*.flags = 0;
    state.*.allocated = @"false" != 0;
    SDL_UnlockMutex_REAL(ctx.*.mutex);
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_GetEffectStatus(device: [*c]SDL_HIDAPI_HapticDevice, id: SDL_HapticEffectID) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var ctx: [*c]lg4ff_device = @ptrCast(@alignCast(device.*.ctx));
    _ = &ctx;
    var ret: bool = @"false" != 0;
    _ = &ret;
    SDL_LockMutex_REAL(ctx.*.mutex);
    if (!lg4ff_effect_slot_valid_active(ctx, id)) {
        SDL_UnlockMutex_REAL(ctx.*.mutex);
        return @"false" != 0;
    }
    if (((&ctx.*.states[@bitCast(@as(isize, @intCast(id)))].flags).* & @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1) << @intCast(FF_EFFECT_STARTED))))) != 0) {
        ret = @"true" != 0;
    }
    SDL_UnlockMutex_REAL(ctx.*.mutex);
    return ret;
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_SetGain(device: [*c]SDL_HIDAPI_HapticDevice, arg_gain: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var gain = arg_gain;
    _ = &gain;
    var ctx: [*c]lg4ff_device = @ptrCast(@alignCast(device.*.ctx));
    _ = &ctx;
    if (gain > @as(c_int, 100)) {
        gain = 100;
    }
    if (gain < @as(c_int, 0)) {
        gain = 0;
    }
    ctx.*.app_gain = @divTrunc(@as(c_int, 65535) * gain, @as(c_int, 100));
    return @"true" != 0;
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_SetAutocenter(device: [*c]SDL_HIDAPI_HapticDevice, arg_autocenter: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var autocenter = arg_autocenter;
    _ = &autocenter;
    var ctx: [*c]lg4ff_device = @ptrCast(@alignCast(device.*.ctx));
    _ = &ctx;
    var cmd: [7]Uint8 = [1]Uint8{
        0,
    } ++ @as([6]Uint8, @splat(0));
    _ = &cmd;
    var ret: bool = undefined;
    _ = &ret;
    if (autocenter < @as(c_int, 0)) {
        autocenter = 0;
    }
    if (autocenter > @as(c_int, 100)) {
        autocenter = 100;
    }
    SDL_LockMutex_REAL(ctx.*.mutex);
    if (ctx.*.is_ffex) {
        var magnitude: c_int = @divTrunc(@as(c_int, 90) * autocenter, @as(c_int, 100));
        _ = &magnitude;
        cmd[@as(c_int, 0)] = 254;
        cmd[@as(c_int, 1)] = 3;
        cmd[@as(c_int, 2)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(magnitude))))) >> @intCast(@as(c_int, 14)))));
        cmd[@as(c_int, 3)] = @bitCast(@as(i8, @truncate(@as(c_int, @as(Uint16, @bitCast(@as(c_short, @truncate(magnitude))))) >> @intCast(@as(c_int, 14)))));
        cmd[@as(c_int, 4)] = @bitCast(@as(i8, @truncate(magnitude)));
        ret = SDL_SendJoystickEffect_REAL(ctx.*.hid_handle, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&cmd))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(cmd))))));
        if (!ret) {
            SDL_UnlockMutex_REAL(ctx.*.mutex);
            _ = SDL_SetError_REAL("Failed sending autocenter command");
            return @"false" != 0;
        }
    } else {
        var expand_a: Uint32 = undefined;
        _ = &expand_a;
        var expand_b: Uint32 = undefined;
        _ = &expand_b;
        var magnitude: c_int = @divTrunc(@as(c_int, 65535) * autocenter, @as(c_int, 100));
        _ = &magnitude;
        cmd[@as(c_int, 0)] = 245;
        ret = SDL_SendJoystickEffect_REAL(ctx.*.hid_handle, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&cmd))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(cmd))))));
        if (!ret) {
            SDL_UnlockMutex_REAL(ctx.*.mutex);
            _ = SDL_SetError_REAL("Failed sending autocenter disable command");
            return @"false" != 0;
        }
        if (magnitude == @as(c_int, 0)) {
            SDL_UnlockMutex_REAL(ctx.*.mutex);
            return @"true" != 0;
        }
        if (magnitude <= @as(c_int, 43690)) {
            expand_a = @bitCast(@as(c_int, @as(c_int, 12) * magnitude));
            expand_b = @bitCast(@as(c_int, @as(c_int, 128) * magnitude));
        } else {
            expand_a = @bitCast(@as(c_int, (@as(c_int, 12) * @as(c_int, 43690)) + (@as(c_int, 6) * (magnitude - @as(c_int, 43690)))));
            expand_b = @bitCast(@as(c_int, (@as(c_int, 128) * @as(c_int, 43690)) + (@as(c_int, 255) * (magnitude - @as(c_int, 43690)))));
        }
        expand_a = expand_a >> @intCast(@as(Uint32, 1));
        _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&cmd))))), 0, @sizeOf(@TypeOf(cmd)));
        cmd[@as(c_int, 0)] = 254;
        cmd[@as(c_int, 1)] = 13;
        cmd[@as(c_int, 2)] = @truncate(expand_a / @as(Uint32, 43690));
        cmd[@as(c_int, 3)] = @truncate(expand_a / @as(Uint32, 43690));
        cmd[@as(c_int, 4)] = @truncate(expand_b / @as(Uint32, 43690));
        ret = SDL_SendJoystickEffect_REAL(ctx.*.hid_handle, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&cmd))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(cmd))))));
        if (!ret) {
            SDL_UnlockMutex_REAL(ctx.*.mutex);
            _ = SDL_SetError_REAL("Failed sending autocenter magnitude command");
            return @"false" != 0;
        }
        _ = memset(@ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&cmd))))), 0, @sizeOf(@TypeOf(cmd)));
        cmd[@as(c_int, 0)] = 20;
        ret = SDL_SendJoystickEffect_REAL(ctx.*.hid_handle, @ptrCast(@alignCast(@as([*c]Uint8, @ptrCast(@alignCast(&cmd))))), @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(cmd))))));
        if (!ret) {
            SDL_UnlockMutex_REAL(ctx.*.mutex);
            _ = SDL_SetError_REAL("Failed sending autocenter enable command");
            return @"false" != 0;
        }
    }
    SDL_UnlockMutex_REAL(ctx.*.mutex);
    return @"true" != 0;
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_Pause(_: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn SDL_HIDAPI_HapticDriverLg4ff_Resume(_: [*c]SDL_HIDAPI_HapticDevice) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub export var SDL_HIDAPI_HapticDriverLg4ff: SDL_HIDAPI_HapticDriver = SDL_HIDAPI_HapticDriver{
    .JoystickSupported = SDL_HIDAPI_HapticDriverLg4ff_JoystickSupported,
    .Open = SDL_HIDAPI_HapticDriverLg4ff_Open,
    .Close = SDL_HIDAPI_HapticDriverLg4ff_Close,
    .NumEffects = SDL_HIDAPI_HapticDriverLg4ff_NumEffects,
    .NumEffectsPlaying = SDL_HIDAPI_HapticDriverLg4ff_NumEffects,
    .GetFeatures = SDL_HIDAPI_HapticDriverLg4ff_GetFeatures,
    .NumAxes = SDL_HIDAPI_HapticDriverLg4ff_NumAxes,
    .CreateEffect = SDL_HIDAPI_HapticDriverLg4ff_CreateEffect,
    .UpdateEffect = SDL_HIDAPI_HapticDriverLg4ff_UpdateEffect,
    .RunEffect = SDL_HIDAPI_HapticDriverLg4ff_RunEffect,
    .StopEffect = SDL_HIDAPI_HapticDriverLg4ff_StopEffect,
    .DestroyEffect = SDL_HIDAPI_HapticDriverLg4ff_DestroyEffect,
    .GetEffectStatus = SDL_HIDAPI_HapticDriverLg4ff_GetEffectStatus,
    .SetGain = SDL_HIDAPI_HapticDriverLg4ff_SetGain,
    .SetAutocenter = SDL_HIDAPI_HapticDriverLg4ff_SetAutocenter,
    .Pause = SDL_HIDAPI_HapticDriverLg4ff_Pause,
    .Resume = SDL_HIDAPI_HapticDriverLg4ff_Resume,
    .StopEffects = SDL_HIDAPI_HapticDriverLg4ff_StopEffects,
};

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_PI_D = @as(f64, 3.141592653589793238462643383279502884);
pub const SDL_HAPTIC_INFINITY = __helpers.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const SDL_HAPTIC_POLAR = @as(c_int, 0);
pub const SDL_HAPTIC_CARTESIAN = @as(c_int, 1);
pub const SDL_HAPTIC_SPHERICAL = @as(c_int, 2);
pub const SDL_HAPTIC_STEERING_AXIS = @as(c_int, 3);
pub const USB_VENDOR_ID_LOGITECH = @as(c_int, 0x046d);
pub const USB_DEVICE_ID_LOGITECH_G29_WHEEL = __helpers.promoteIntLiteral(c_int, 0xc24f, .hex);
pub const USB_DEVICE_ID_LOGITECH_G27_WHEEL = __helpers.promoteIntLiteral(c_int, 0xc29b, .hex);
pub const USB_DEVICE_ID_LOGITECH_G25_WHEEL = __helpers.promoteIntLiteral(c_int, 0xc299, .hex);
pub const USB_DEVICE_ID_LOGITECH_DFGT_WHEEL = __helpers.promoteIntLiteral(c_int, 0xc29a, .hex);
pub const USB_DEVICE_ID_LOGITECH_DFP_WHEEL = __helpers.promoteIntLiteral(c_int, 0xc298, .hex);
pub const USB_DEVICE_ID_LOGITECH_WHEEL = __helpers.promoteIntLiteral(c_int, 0xc294, .hex);
pub const LG4FF_MAX_EFFECTS = @as(c_int, 16);
pub const FF_EFFECT_STARTED = @as(c_int, 0);
pub const FF_EFFECT_ALLSET = @as(c_int, 1);
pub const FF_EFFECT_PLAYING = @as(c_int, 2);
pub const FF_EFFECT_UPDATING = @as(c_int, 3);
