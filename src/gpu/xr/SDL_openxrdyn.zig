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
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub const SDL_FunctionPointer = ?*const fn () callconv(.c) void;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const struct_SDL_SharedObject = opaque {
};
pub const SDL_SharedObject = struct_SDL_SharedObject;
pub extern fn SDL_LoadObject_REAL(sofile: [*c]const u8) ?*SDL_SharedObject;
pub extern fn SDL_LoadFunction_REAL(handle: ?*SDL_SharedObject, name: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_UnloadObject_REAL(handle: ?*SDL_SharedObject) void;
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
pub const enum_XrStructureType = c_uint;
pub const XrStructureType = enum_XrStructureType;
pub const enum_XrFormFactor = c_uint;
pub const XrFormFactor = enum_XrFormFactor;
pub const XrInstanceCreateFlags = XrFlags64;
pub const XrSessionCreateFlags = XrFlags64;
pub const XrSwapchainCreateFlags = XrFlags64;
pub const XrSwapchainUsageFlags = XrFlags64;
pub const PFN_xrVoidFunction = ?*const fn () callconv(.c) void;
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
pub const PFN_xrGetInstanceProcAddr = ?*const fn (instance: XrInstance, name: [*c]const u8, function: [*c]PFN_xrVoidFunction) callconv(.c) XrResult;
pub const PFN_xrEnumerateApiLayerProperties = ?*const fn (propertyCapacityInput: u32, propertyCountOutput: [*c]u32, properties: [*c]XrApiLayerProperties) callconv(.c) XrResult;
pub const PFN_xrEnumerateInstanceExtensionProperties = ?*const fn (layerName: [*c]const u8, propertyCapacityInput: u32, propertyCountOutput: [*c]u32, properties: [*c]XrExtensionProperties) callconv(.c) XrResult;
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
pub export fn SDL_OPENXR_LoadInstanceSymbols(instance: XrInstance) [*c]XrInstancePfns {
    @setEvalBranchQuota(100000);
    var result: XrResult = undefined;
    _ = &result;
    var pfns: [*c]XrInstancePfns = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(XrInstancePfns))));
    _ = &pfns;
    result = OPENXR_xrGetInstanceProcAddr.?(instance, "xrEnumerateSwapchainFormats", @ptrCast(@alignCast(&pfns.*.xrEnumerateSwapchainFormats)));
    if (result != XR_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(pfns)));
        return null;
    }
    result = OPENXR_xrGetInstanceProcAddr.?(instance, "xrCreateSession", @ptrCast(@alignCast(&pfns.*.xrCreateSession)));
    if (result != XR_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(pfns)));
        return null;
    }
    result = OPENXR_xrGetInstanceProcAddr.?(instance, "xrGetSystem", @ptrCast(@alignCast(&pfns.*.xrGetSystem)));
    if (result != XR_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(pfns)));
        return null;
    }
    result = OPENXR_xrGetInstanceProcAddr.?(instance, "xrCreateSwapchain", @ptrCast(@alignCast(&pfns.*.xrCreateSwapchain)));
    if (result != XR_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(pfns)));
        return null;
    }
    result = OPENXR_xrGetInstanceProcAddr.?(instance, "xrEnumerateSwapchainImages", @ptrCast(@alignCast(&pfns.*.xrEnumerateSwapchainImages)));
    if (result != XR_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(pfns)));
        return null;
    }
    result = OPENXR_xrGetInstanceProcAddr.?(instance, "xrDestroyInstance", @ptrCast(@alignCast(&pfns.*.xrDestroyInstance)));
    if (result != XR_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(pfns)));
        return null;
    }
    result = OPENXR_xrGetInstanceProcAddr.?(instance, "xrDestroySwapchain", @ptrCast(@alignCast(&pfns.*.xrDestroySwapchain)));
    if (result != XR_SUCCESS) {
        SDL_free_REAL(@ptrCast(@alignCast(pfns)));
        return null;
    }
    return pfns;
}

pub export var OPENXR_xrGetInstanceProcAddr: PFN_xrGetInstanceProcAddr = null;
pub export var OPENXR_xrEnumerateApiLayerProperties: PFN_xrEnumerateApiLayerProperties = null;
pub export var OPENXR_xrCreateInstance: PFN_xrCreateInstance = null;
pub export var OPENXR_xrEnumerateInstanceExtensionProperties: PFN_xrEnumerateInstanceExtensionProperties = null;
pub const SDL_OpenXR_LoadLibrary = SDL_OpenXR_LoadLibrary_REAL;
pub const SDL_OpenXR_UnloadLibrary = SDL_OpenXR_UnloadLibrary_REAL;
pub const SDL_OpenXR_GetXrGetInstanceProcAddr = SDL_OpenXR_GetXrGetInstanceProcAddr_REAL;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub var openxr_library_names: [2][*c]const u8 = [2][*c]const u8{
    "libopenxr_loader.so.1",
    null,
};
pub const openxrdynlib = extern struct {
    lib: ?*SDL_SharedObject = null,
};
pub var openxr_loader: openxrdynlib = openxrdynlib{
    .lib = null,
};
pub fn OPENXR_GetSym(fnname: [*c]const u8, _: [*c]bool) callconv(.c) ?*anyopaque {
    @setEvalBranchQuota(100000);
    var @"fn": ?*anyopaque = @ptrCast(@alignCast(@constCast(SDL_LoadFunction_REAL(openxr_loader.lib, fnname))));
    _ = &@"fn";
    return @"fn";
}
pub var openxr_load_refcount: c_int = 0;
pub export fn SDL_OpenXR_UnloadLibrary_REAL() void {
    @setEvalBranchQuota(100000);
    if (openxr_load_refcount > @as(c_int, 0)) {
        if ((blk: {
            const ref = &openxr_load_refcount;
            ref.* -= 1;
            break :blk ref.*;
        }) == @as(c_int, 0)) {
            OPENXR_xrGetInstanceProcAddr = null;
            OPENXR_xrEnumerateApiLayerProperties = null;
            OPENXR_xrCreateInstance = null;
            OPENXR_xrEnumerateInstanceExtensionProperties = null;
            SDL_UnloadObject_REAL(openxr_loader.lib);
            openxr_loader.lib = null;
        }
    }
}
pub export fn SDL_OpenXR_LoadLibrary_REAL() bool {
    @setEvalBranchQuota(100000);
    var result: bool = @"true" != 0;
    _ = &result;
    if ((blk: {
        const ref = &openxr_load_refcount;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }) == @as(c_int, 0)) {
        var path_hint: [*c]const u8 = SDL_GetHint_REAL("SDL_OPENXR_LIBRARY");
        _ = &path_hint;
        if ((path_hint != null) and (@as(c_int, path_hint.*) != 0)) {
            openxr_loader.lib = SDL_LoadObject_REAL(path_hint);
        }
        if (!(openxr_loader.lib != null)) {
            {
                var i: c_int = 0;
                _ = &i;
                while (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(openxr_library_names[@bitCast(@as(isize, @intCast(i)))])))) != @as(?*anyopaque, null)) : (i += 1) {
                    openxr_loader.lib = SDL_LoadObject_REAL(openxr_library_names[@bitCast(@as(isize, @intCast(i)))]);
                    if (openxr_loader.lib != null) {
                        break;
                    }
                }
            }
        }
        if (!(openxr_loader.lib != null)) {
            _ = SDL_SetError_REAL("Failed to load OpenXR loader library. On Windows, ensure openxr_loader.dll is in your application directory or PATH. On Linux, install the OpenXR loader package (libopenxr-loader) or set LD_LIBRARY_PATH. You can also use the SDL_HINT_OPENXR_LIBRARY hint to specify the loader path.");
            openxr_load_refcount -= 1;
            return @"false" != 0;
        }
        var failed: bool = @"false" != 0;
        _ = &failed;
        OPENXR_xrGetInstanceProcAddr = @ptrCast(@alignCast(OPENXR_GetSym("xrGetInstanceProcAddr", &failed)));
        OPENXR_xrEnumerateApiLayerProperties = @ptrCast(@alignCast(OPENXR_GetSym("xrEnumerateApiLayerProperties", &failed)));
        OPENXR_xrCreateInstance = @ptrCast(@alignCast(OPENXR_GetSym("xrCreateInstance", &failed)));
        OPENXR_xrEnumerateInstanceExtensionProperties = @ptrCast(@alignCast(OPENXR_GetSym("xrEnumerateInstanceExtensionProperties", &failed)));
        if (failed) {
            SDL_OpenXR_UnloadLibrary_REAL();
            result = @"false" != 0;
        }
    }
    return result;
}
pub export fn SDL_OpenXR_GetXrGetInstanceProcAddr_REAL() PFN_xrGetInstanceProcAddr {
    @setEvalBranchQuota(100000);
    if (@as(?*anyopaque, @ptrCast(@alignCast(@constCast(OPENXR_xrGetInstanceProcAddr)))) == @as(?*anyopaque, null)) {
        _ = SDL_SetError_REAL("The OpenXR loader has not been loaded");
    }
    return OPENXR_xrGetInstanceProcAddr;
}
