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
pub const Uint32 = u32;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub const SDL_PropertiesID = Uint32;
pub const struct_SDL_Sensor = extern struct {
    instance_id: SDL_SensorID = 0,
    name: [*c]u8 = null,
    type: SDL_SensorType = @import("std").mem.zeroes(SDL_SensorType),
    non_portable_type: c_int = 0,
    data: [16]f32 = @import("std").mem.zeroes([16]f32),
    driver: [*c]struct_SDL_SensorDriver = null,
    hwdata: ?*struct_sensor_hwdata_8 = null,
    props: SDL_PropertiesID = 0,
    ref_count: c_int = 0,
    next: [*c]struct_SDL_Sensor = null,
};
pub const SDL_Sensor = struct_SDL_Sensor;
pub const SDL_SensorID = Uint32;
pub const SDL_SENSOR_INVALID: c_int = -1;
pub const enum_SDL_SensorType = c_int;
pub const SDL_SensorType = enum_SDL_SensorType;
pub const @"true" = @as(c_int, 1);
pub const struct_SDL_SensorDriver = extern struct {
    Init: ?*const fn () callconv(.c) bool = null,
    GetCount: ?*const fn () callconv(.c) c_int = null,
    Detect: ?*const fn () callconv(.c) void = null,
    GetDeviceName: ?*const fn (device_index: c_int) callconv(.c) [*c]const u8 = null,
    GetDeviceType: ?*const fn (device_index: c_int) callconv(.c) SDL_SensorType = null,
    GetDeviceNonPortableType: ?*const fn (device_index: c_int) callconv(.c) c_int = null,
    GetDeviceInstanceID: ?*const fn (device_index: c_int) callconv(.c) SDL_SensorID = null,
    Open: ?*const fn (sensor: [*c]SDL_Sensor, device_index: c_int) callconv(.c) bool = null,
    Update: ?*const fn (sensor: [*c]SDL_Sensor) callconv(.c) void = null,
    Close: ?*const fn (sensor: [*c]SDL_Sensor) callconv(.c) void = null,
    Quit: ?*const fn () callconv(.c) void = null,
};
pub const struct_sensor_hwdata_8 = opaque {};
pub const SDL_SensorDriver = struct_SDL_SensorDriver;
pub fn SDL_DUMMY_SensorInit() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return @"true" != 0;
}
pub fn SDL_DUMMY_SensorGetCount() callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return 0;
}
pub fn SDL_DUMMY_SensorDetect() callconv(.c) void {}
pub fn SDL_DUMMY_SensorGetDeviceName(_: c_int) callconv(.c) [*c]const u8 {
    @setEvalBranchQuota(100000);
    return null;
}
pub fn SDL_DUMMY_SensorGetDeviceType(_: c_int) callconv(.c) SDL_SensorType {
    @setEvalBranchQuota(100000);
    return SDL_SENSOR_INVALID;
}
pub fn SDL_DUMMY_SensorGetDeviceNonPortableType(_: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    return -@as(c_int, 1);
}
pub fn SDL_DUMMY_SensorGetDeviceInstanceID(_: c_int) callconv(.c) SDL_SensorID {
    @setEvalBranchQuota(100000);
    return @bitCast(@as(c_int, -@as(c_int, 1)));
}
pub fn SDL_DUMMY_SensorOpen(_: [*c]SDL_Sensor, _: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    return SDL_SetError_REAL("That operation is not supported");
}
pub fn SDL_DUMMY_SensorUpdate(_: [*c]SDL_Sensor) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn SDL_DUMMY_SensorClose(_: [*c]SDL_Sensor) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn SDL_DUMMY_SensorQuit() callconv(.c) void {}
pub export var SDL_DUMMY_SensorDriver: SDL_SensorDriver = SDL_SensorDriver{
    .Init = SDL_DUMMY_SensorInit,
    .GetCount = SDL_DUMMY_SensorGetCount,
    .Detect = SDL_DUMMY_SensorDetect,
    .GetDeviceName = SDL_DUMMY_SensorGetDeviceName,
    .GetDeviceType = SDL_DUMMY_SensorGetDeviceType,
    .GetDeviceNonPortableType = SDL_DUMMY_SensorGetDeviceNonPortableType,
    .GetDeviceInstanceID = SDL_DUMMY_SensorGetDeviceInstanceID,
    .Open = SDL_DUMMY_SensorOpen,
    .Update = SDL_DUMMY_SensorUpdate,
    .Close = SDL_DUMMY_SensorClose,
    .Quit = SDL_DUMMY_SensorQuit,
};

