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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_strlcpy_REAL(dst: [*c]u8, src: [*c]const u8, maxlen: usize) usize;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub const SDL_PropertiesID = Uint32;
pub extern fn SDL_GetPointerProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetStringProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: [*c]const u8) [*c]const u8;
pub extern fn SDL_GetNumberProperty_REAL(props: SDL_PropertiesID, name: [*c]const u8, default_value: Sint64) Sint64;
pub extern fn SDL_GetAppMetadataProperty_REAL(name: [*c]const u8) [*c]const u8;
pub const SDL_LOG_CATEGORY_GPU: c_int = 9;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub extern fn SDL_LogInfo_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const XrVersion = u64;
pub const XrFlags64 = u64;
pub const XrSystemId = u64;
pub const struct_XrInstance_T = opaque {
};
pub const XrInstance = ?*struct_XrInstance_T;
pub const struct_XrSession_T = opaque {
};
pub const XrSession = ?*struct_XrSession_T;
pub const struct_XrSwapchain_T = opaque {
};
pub const XrSwapchain = ?*struct_XrSwapchain_T;
pub const XR_SUCCESS: c_int = 0;
pub const enum_XrResult = c_int;
pub const XrResult = enum_XrResult;
pub const XR_TYPE_INSTANCE_CREATE_INFO: c_int = 3;
pub const XR_TYPE_SYSTEM_GET_INFO: c_int = 4;
pub const enum_XrStructureType = c_uint;
pub const XrStructureType = enum_XrStructureType;
pub const XR_FORM_FACTOR_HEAD_MOUNTED_DISPLAY: c_int = 1;
pub const enum_XrFormFactor = c_uint;
pub const XrFormFactor = enum_XrFormFactor;
pub const XrInstanceCreateFlags = XrFlags64;
pub const XrSessionCreateFlags = XrFlags64;
pub const XrSwapchainCreateFlags = XrFlags64;
pub const XrSwapchainUsageFlags = XrFlags64;
pub const struct_XrApiLayerProperties = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*anyopaque = null,
    layerName: [256]u8 = @import("std").mem.zeroes([256]u8),
    specVersion: XrVersion = 0,
    layerVersion: u32 = 0,
    description: [256]u8 = @import("std").mem.zeroes([256]u8),
};
pub const XrApiLayerProperties = struct_XrApiLayerProperties;
pub const struct_XrExtensionProperties = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*anyopaque = null,
    extensionName: [128]u8 = @import("std").mem.zeroes([128]u8),
    extensionVersion: u32 = 0,
};
pub const XrExtensionProperties = struct_XrExtensionProperties;
pub const struct_XrApplicationInfo = extern struct {
    applicationName: [128]u8 = @import("std").mem.zeroes([128]u8),
    applicationVersion: u32 = 0,
    engineName: [128]u8 = @import("std").mem.zeroes([128]u8),
    engineVersion: u32 = 0,
    apiVersion: XrVersion = 0,
};
pub const XrApplicationInfo = struct_XrApplicationInfo;
pub const struct_XrInstanceCreateInfo = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
    createFlags: XrInstanceCreateFlags = 0,
    applicationInfo: XrApplicationInfo = @import("std").mem.zeroes(XrApplicationInfo),
    enabledApiLayerCount: u32 = 0,
    enabledApiLayerNames: [*c]const [*c]const u8 = null,
    enabledExtensionCount: u32 = 0,
    enabledExtensionNames: [*c]const [*c]const u8 = null,
};
pub const XrInstanceCreateInfo = struct_XrInstanceCreateInfo;
pub const struct_XrSystemGetInfo = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
    formFactor: XrFormFactor = @import("std").mem.zeroes(XrFormFactor),
};
pub const XrSystemGetInfo = struct_XrSystemGetInfo;
pub const struct_XrSessionCreateInfo = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
    createFlags: XrSessionCreateFlags = 0,
    systemId: XrSystemId = 0,
};
pub const XrSessionCreateInfo = struct_XrSessionCreateInfo;
pub const struct_XrSwapchainCreateInfo = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*const anyopaque = null,
    createFlags: XrSwapchainCreateFlags = 0,
    usageFlags: XrSwapchainUsageFlags = 0,
    format: i64 = 0,
    sampleCount: u32 = 0,
    width: u32 = 0,
    height: u32 = 0,
    faceCount: u32 = 0,
    arraySize: u32 = 0,
    mipCount: u32 = 0,
};
pub const XrSwapchainCreateInfo = struct_XrSwapchainCreateInfo;
pub const struct_XrSwapchainImageBaseHeader = extern struct {
    type: XrStructureType = @import("std").mem.zeroes(XrStructureType),
    next: ?*anyopaque = null,
};
pub const XrSwapchainImageBaseHeader = struct_XrSwapchainImageBaseHeader;
pub const PFN_xrEnumerateApiLayerProperties = ?*const fn (propertyCapacityInput: u32, propertyCountOutput: [*c]u32, properties: [*c]XrApiLayerProperties) callconv(.c) XrResult;
pub const PFN_xrCreateInstance = ?*const fn (createInfo: [*c]const XrInstanceCreateInfo, instance: [*c]XrInstance) callconv(.c) XrResult;
pub const PFN_xrDestroyInstance = ?*const fn (instance: XrInstance) callconv(.c) XrResult;
pub const PFN_xrGetSystem = ?*const fn (instance: XrInstance, getInfo: [*c]const XrSystemGetInfo, systemId: [*c]XrSystemId) callconv(.c) XrResult;
pub const PFN_xrCreateSession = ?*const fn (instance: XrInstance, createInfo: [*c]const XrSessionCreateInfo, session: [*c]XrSession) callconv(.c) XrResult;
pub const PFN_xrEnumerateSwapchainFormats = ?*const fn (session: XrSession, formatCapacityInput: u32, formatCountOutput: [*c]u32, formats: [*c]i64) callconv(.c) XrResult;
pub const PFN_xrCreateSwapchain = ?*const fn (session: XrSession, createInfo: [*c]const XrSwapchainCreateInfo, swapchain: [*c]XrSwapchain) callconv(.c) XrResult;
pub const PFN_xrDestroySwapchain = ?*const fn (swapchain: XrSwapchain) callconv(.c) XrResult;
pub const PFN_xrEnumerateSwapchainImages = ?*const fn (swapchain: XrSwapchain, imageCapacityInput: u32, imageCountOutput: [*c]u32, images: [*c]XrSwapchainImageBaseHeader) callconv(.c) XrResult;
pub extern fn xrDestroyInstance(instance: XrInstance) XrResult;
pub extern fn xrGetSystem(instance: XrInstance, getInfo: [*c]const XrSystemGetInfo, systemId: [*c]XrSystemId) XrResult;
pub extern fn xrCreateSession(instance: XrInstance, createInfo: [*c]const XrSessionCreateInfo, session: [*c]XrSession) XrResult;
pub extern fn xrEnumerateSwapchainFormats(session: XrSession, formatCapacityInput: u32, formatCountOutput: [*c]u32, formats: [*c]i64) XrResult;
pub extern fn xrCreateSwapchain(session: XrSession, createInfo: [*c]const XrSwapchainCreateInfo, swapchain: [*c]XrSwapchain) XrResult;
pub extern fn xrDestroySwapchain(swapchain: XrSwapchain) XrResult;
pub extern fn xrEnumerateSwapchainImages(swapchain: XrSwapchain, imageCapacityInput: u32, imageCountOutput: [*c]u32, images: [*c]XrSwapchainImageBaseHeader) XrResult;
pub const struct_XrInstancePfns = extern struct {
    xrEnumerateSwapchainFormats: PFN_xrEnumerateSwapchainFormats = null,
    xrCreateSession: PFN_xrCreateSession = null,
    xrGetSystem: PFN_xrGetSystem = null,
    xrCreateSwapchain: PFN_xrCreateSwapchain = null,
    xrEnumerateSwapchainImages: PFN_xrEnumerateSwapchainImages = null,
    xrDestroyInstance: PFN_xrDestroyInstance = null,
    xrDestroySwapchain: PFN_xrDestroySwapchain = null,
};
pub const XrInstancePfns = struct_XrInstancePfns;
pub extern fn SDL_OPENXR_LoadInstanceSymbols(instance: XrInstance) [*c]XrInstancePfns;
pub extern var OPENXR_xrEnumerateApiLayerProperties: PFN_xrEnumerateApiLayerProperties;
pub extern var OPENXR_xrCreateInstance: PFN_xrCreateInstance;
pub export fn SDL_OPENXR_INTERNAL_GPUInitOpenXR(debugMode: bool, gpuExtension: XrExtensionProperties, props: SDL_PropertiesID, instance: [*c]XrInstance, systemId: [*c]XrSystemId, xr: [*c][*c]XrInstancePfns) XrResult {
    @setEvalBranchQuota(100000);
    var xrResult: XrResult = undefined;
    _ = &xrResult;
    var validationLayersAvailable: bool = SDL_OPENXR_INTERNAL_ValidationLayerAvailable();
    _ = &validationLayersAvailable;
    var userApiLayerCount: Uint32 = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.gpu.device.create.xr.layers.count", 0))));
    _ = &userApiLayerCount;
    var userApiLayerNames: [*c]const [*c]const u8 = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.gpu.device.create.xr.layers.names", null)));
    _ = &userApiLayerNames;
    var userExtensionCount: Uint32 = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.gpu.device.create.xr.extensions.count", 0))));
    _ = &userExtensionCount;
    var userExtensionNames: [*c]const [*c]const u8 = @ptrCast(@alignCast(SDL_GetPointerProperty_REAL(props, "SDL.gpu.device.create.xr.extensions.names", null)));
    _ = &userExtensionNames;
    var apiLayerNames: [*c][*c]const u8 = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]const u8) *% @as(c_ulong, userApiLayerCount +% @as(Uint32, 1)))));
    _ = &apiLayerNames;
    if (userApiLayerCount > @as(Uint32, 0)) {
        _ = memcpy(@ptrCast(@alignCast(apiLayerNames)), @ptrCast(@alignCast(userApiLayerNames)), @sizeOf([*c]const u8) *% @as(c_ulong, userApiLayerCount));
    }
    apiLayerNames[userApiLayerCount] = "XR_APILAYER_LUNARG_core_validation";
    const platformExtensionCount: Uint32 = 1;
    _ = &platformExtensionCount;
    var extensionNames: [*c][*c]const u8 = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf([*c]const u8) *% @as(c_ulong, userExtensionCount +% platformExtensionCount))));
    _ = &extensionNames;
    if (userExtensionCount > @as(Uint32, 0)) {
        _ = memcpy(@ptrCast(@alignCast(extensionNames)), @ptrCast(@alignCast(userExtensionNames)), @sizeOf([*c]const u8) *% @as(c_ulong, userExtensionCount));
    }
    extensionNames[userExtensionCount] = @ptrCast(@alignCast(&gpuExtension.extensionName));
    var xrInstanceCreateInfo: XrInstanceCreateInfo = undefined;
    _ = &xrInstanceCreateInfo;
    _ = memset(@ptrCast(@alignCast(&xrInstanceCreateInfo)), 0, @sizeOf(@TypeOf(xrInstanceCreateInfo)));
    xrInstanceCreateInfo.type = XR_TYPE_INSTANCE_CREATE_INFO;
    xrInstanceCreateInfo.applicationInfo.apiVersion = @bitCast(@as(c_long, SDL_GetNumberProperty_REAL(props, "SDL.gpu.device.create.xr.version", @bitCast(@as(c_ulong, @truncate((((@as(c_ulonglong, @bitCast(@as(c_longlong, @as(c_int, 1)))) & @as(c_ulonglong, 65535)) << @intCast(@as(c_ulonglong, 48))) | ((@as(c_ulonglong, @bitCast(@as(c_longlong, @as(c_int, 0)))) & @as(c_ulonglong, 65535)) << @intCast(@as(c_ulonglong, 32)))) | (@as(c_ulonglong, @as(u32, @truncate(@as(c_ulonglong, @as(u64, @truncate((((@as(c_ulonglong, @bitCast(@as(c_longlong, @as(c_int, 1)))) & @as(c_ulonglong, 65535)) << @intCast(@as(c_ulonglong, 48))) | ((@as(c_ulonglong, @bitCast(@as(c_longlong, @as(c_int, 1)))) & @as(c_ulonglong, 65535)) << @intCast(@as(c_ulonglong, 32)))) | (@as(c_ulonglong, @bitCast(@as(c_longlong, @as(c_int, 63)))) & @as(c_ulonglong, 4294967295))))) & @as(c_ulonglong, 4294967295)))) & @as(c_ulonglong, 4294967295))))))));
    xrInstanceCreateInfo.enabledApiLayerCount = userApiLayerCount +% @as(Uint32, @bitCast(@as(c_int, if (debugMode and validationLayersAvailable) @as(c_int, 1) else @as(c_int, 0))));
    xrInstanceCreateInfo.enabledApiLayerNames = apiLayerNames;
    xrInstanceCreateInfo.enabledExtensionCount = userExtensionCount +% platformExtensionCount;
    xrInstanceCreateInfo.enabledExtensionNames = extensionNames;
    const applicationVersion: Uint32 = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.gpu.device.create.xr.application.version", 0))));
    _ = &applicationVersion;
    var applicationName: [*c]const u8 = SDL_GetStringProperty_REAL(props, "SDL.gpu.device.create.xr.application.name", null);
    _ = &applicationName;
    if (!(applicationName != null)) {
        applicationName = SDL_GetAppMetadataProperty_REAL("SDL.app.metadata.name");
    }
    _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&xrInstanceCreateInfo.applicationInfo.applicationName)), applicationName, XR_MAX_APPLICATION_NAME_SIZE);
    xrInstanceCreateInfo.applicationInfo.applicationVersion = applicationVersion;
    var engineName: [*c]const u8 = SDL_GetStringProperty_REAL(props, "SDL.gpu.device.create.xr.engine.name", "SDLGPU");
    _ = &engineName;
    var engineVersion: u32 = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.gpu.device.create.xr.engine.version", ((SDL_MAJOR_VERSION * @as(c_int, 1000000)) + (SDL_MINOR_VERSION * @as(c_int, 1000))) + SDL_MICRO_VERSION))));
    _ = &engineVersion;
    _ = SDL_strlcpy_REAL(@ptrCast(@alignCast(&xrInstanceCreateInfo.applicationInfo.engineName)), engineName, XR_MAX_APPLICATION_NAME_SIZE);
    xrInstanceCreateInfo.applicationInfo.engineVersion = engineVersion;
    if ((blk: {
        const tmp = OPENXR_xrCreateInstance.?(&xrInstanceCreateInfo, instance);
        xrResult = tmp;
        break :blk tmp;
    }) != XR_SUCCESS) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to create OpenXR instance");
        SDL_free_REAL(@ptrCast(@alignCast(apiLayerNames)));
        SDL_free_REAL(@ptrCast(@alignCast(extensionNames)));
        return @"false";
    }
    SDL_free_REAL(@ptrCast(@alignCast(apiLayerNames)));
    SDL_free_REAL(@ptrCast(@alignCast(extensionNames)));
    xr.* = SDL_OPENXR_LoadInstanceSymbols(instance.*);
    if (!(xr.* != null)) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to load required OpenXR instance symbols");
        return @"false";
    }
    var systemGetInfo: XrSystemGetInfo = undefined;
    _ = &systemGetInfo;
    _ = memset(@ptrCast(@alignCast(&systemGetInfo)), 0, @sizeOf(@TypeOf(systemGetInfo)));
    systemGetInfo.type = XR_TYPE_SYSTEM_GET_INFO;
    systemGetInfo.formFactor = @bitCast(@as(c_int, @truncate(SDL_GetNumberProperty_REAL(props, "SDL.gpu.device.create.xr.form_factor", XR_FORM_FACTOR_HEAD_MOUNTED_DISPLAY))));
    if ((blk: {
        const tmp = xr.*.*.xrGetSystem.?(instance.*, &systemGetInfo, systemId);
        xrResult = tmp;
        break :blk tmp;
    }) != XR_SUCCESS) {
        SDL_LogDebug_REAL(SDL_LOG_CATEGORY_GPU, "Failed to get OpenXR system");
        _ = xr.*.*.xrDestroyInstance.?(instance.*);
        SDL_free_REAL(@ptrCast(@alignCast(xr.*)));
        return @"false";
    }
    return @"true";
}

pub const SDL_OpenXR_LoadLibrary = @compileError("unable to translate macro: undefined identifier `SDL_OpenXR_LoadLibrary_REAL`");
// /home/addo/dev/stupid/zdl/.ref/SDL/src/dynapi/SDL_dynapi_overrides.h:1305:9
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const SDL_MAJOR_VERSION = @as(c_int, 3);
pub const SDL_MINOR_VERSION = @as(c_int, 5);
pub const SDL_MICRO_VERSION = @as(c_int, 0);
pub const XR_MAX_APPLICATION_NAME_SIZE = @as(c_int, 128);
pub fn SDL_OPENXR_INTERNAL_ValidationLayerAvailable() callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var apiLayerCount: Uint32 = undefined;
    _ = &apiLayerCount;
    if (OPENXR_xrEnumerateApiLayerProperties.?(0, &apiLayerCount, null) < @as(c_int, 0)) {
        return @"false" != 0;
    }
    if (apiLayerCount <= @as(Uint32, 0)) {
        return @"false" != 0;
    }
    var apiLayerProperties: [*c]XrApiLayerProperties = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(XrApiLayerProperties) *% @as(c_ulong, apiLayerCount))));
    _ = &apiLayerProperties;
    if (OPENXR_xrEnumerateApiLayerProperties.?(apiLayerCount, &apiLayerCount, apiLayerProperties) < @as(c_int, 0)) {
        SDL_free_REAL(@ptrCast(@alignCast(apiLayerProperties)));
        return @"false" != 0;
    }
    var found: bool = @"false" != 0;
    _ = &found;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < apiLayerCount) : (i +%= 1) {
            var apiLayer: XrApiLayerProperties = apiLayerProperties[i];
            _ = &apiLayer;
            SDL_LogInfo_REAL(SDL_LOG_CATEGORY_GPU, "api layer available: %s", @as([*c]u8, @ptrCast(@alignCast(&apiLayer.layerName))));
            if (SDL_strcmp_REAL(@ptrCast(@alignCast(&apiLayer.layerName)), "XR_APILAYER_LUNARG_core_validation") == @as(c_int, 0)) {
                found = @"true" != 0;
                break;
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(apiLayerProperties)));
    return found;
}
