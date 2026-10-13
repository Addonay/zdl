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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint32 = u32;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_atoi_REAL(str: [*c]const u8) c_int;
pub extern fn SDL_SetError_REAL(fmt: [*c]const u8, ...) bool;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const SDL_LOG_CATEGORY_VIDEO: c_int = 5;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const VkBool32 = u32;
pub const VkFlags = u32;
pub const struct_VkInstance_T = opaque {
};
pub const VkInstance = ?*struct_VkInstance_T;
pub const struct_VkPhysicalDevice_T = opaque {};
pub const VkPhysicalDevice = ?*struct_VkPhysicalDevice_T;
pub const VK_SUCCESS: c_int = 0;
pub const VK_NOT_READY: c_int = 1;
pub const VK_TIMEOUT: c_int = 2;
pub const VK_EVENT_SET: c_int = 3;
pub const VK_EVENT_RESET: c_int = 4;
pub const VK_INCOMPLETE: c_int = 5;
pub const VK_ERROR_OUT_OF_HOST_MEMORY: c_int = -1;
pub const VK_ERROR_OUT_OF_DEVICE_MEMORY: c_int = -2;
pub const VK_ERROR_INITIALIZATION_FAILED: c_int = -3;
pub const VK_ERROR_DEVICE_LOST: c_int = -4;
pub const VK_ERROR_MEMORY_MAP_FAILED: c_int = -5;
pub const VK_ERROR_LAYER_NOT_PRESENT: c_int = -6;
pub const VK_ERROR_EXTENSION_NOT_PRESENT: c_int = -7;
pub const VK_ERROR_FEATURE_NOT_PRESENT: c_int = -8;
pub const VK_ERROR_INCOMPATIBLE_DRIVER: c_int = -9;
pub const VK_ERROR_TOO_MANY_OBJECTS: c_int = -10;
pub const VK_ERROR_FORMAT_NOT_SUPPORTED: c_int = -11;
pub const VK_ERROR_FRAGMENTED_POOL: c_int = -12;
pub const VK_ERROR_UNKNOWN: c_int = -13;
pub const VK_ERROR_OUT_OF_POOL_MEMORY: c_int = -1000069000;
pub const VK_ERROR_INVALID_EXTERNAL_HANDLE: c_int = -1000072003;
pub const VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS: c_int = -1000257000;
pub const VK_ERROR_FRAGMENTATION: c_int = -1000161000;
pub const VK_ERROR_SURFACE_LOST_KHR: c_int = -1000000000;
pub const VK_ERROR_NATIVE_WINDOW_IN_USE_KHR: c_int = -1000000001;
pub const VK_SUBOPTIMAL_KHR: c_int = 1000001003;
pub const VK_ERROR_OUT_OF_DATE_KHR: c_int = -1000001004;
pub const VK_ERROR_INCOMPATIBLE_DISPLAY_KHR: c_int = -1000003001;
pub const VK_ERROR_INVALID_SHADER_NV: c_int = -1000012000;
pub const VK_ERROR_INVALID_DRM_FORMAT_MODIFIER_PLANE_LAYOUT_EXT: c_int = -1000158000;
pub const VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT: c_int = -1000255000;
pub const VK_THREAD_IDLE_KHR: c_int = 1000268000;
pub const VK_THREAD_DONE_KHR: c_int = 1000268001;
pub const VK_OPERATION_DEFERRED_KHR: c_int = 1000268002;
pub const VK_OPERATION_NOT_DEFERRED_KHR: c_int = 1000268003;
pub const VK_ERROR_VALIDATION_FAILED_EXT: c_int = -1000011001;
pub const VK_ERROR_NOT_PERMITTED_EXT: c_int = -1000174001;
pub const VK_PIPELINE_COMPILE_REQUIRED_EXT: c_int = 1000297000;
pub const enum_VkResult = c_int;
pub const VkResult = enum_VkResult;
pub const VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR: c_int = 1000002001;
pub const enum_VkStructureType = c_uint;
pub const VkStructureType = enum_VkStructureType;
pub const enum_VkSystemAllocationScope = c_uint;
pub const VkSystemAllocationScope = enum_VkSystemAllocationScope;
pub const enum_VkInternalAllocationType = c_uint;
pub const VkInternalAllocationType = enum_VkInternalAllocationType;
pub const struct_VkExtent2D = extern struct {
    width: u32 = 0,
    height: u32 = 0,
};
pub const VkExtent2D = struct_VkExtent2D;
pub const struct_VkOffset2D = extern struct {
    x: i32 = 0,
    y: i32 = 0,
};
pub const VkOffset2D = struct_VkOffset2D;
pub const PFN_vkAllocationFunction = ?*const fn (pUserData: ?*anyopaque, size: usize, alignment: usize, allocationScope: VkSystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_vkFreeFunction = ?*const fn (pUserData: ?*anyopaque, pMemory: ?*anyopaque) callconv(.c) void;
pub const PFN_vkInternalAllocationNotification = ?*const fn (pUserData: ?*anyopaque, size: usize, allocationType: VkInternalAllocationType, allocationScope: VkSystemAllocationScope) callconv(.c) void;
pub const PFN_vkInternalFreeNotification = ?*const fn (pUserData: ?*anyopaque, size: usize, allocationType: VkInternalAllocationType, allocationScope: VkSystemAllocationScope) callconv(.c) void;
pub const PFN_vkReallocationFunction = ?*const fn (pUserData: ?*anyopaque, pOriginal: ?*anyopaque, size: usize, alignment: usize, allocationScope: VkSystemAllocationScope) callconv(.c) ?*anyopaque;
pub const PFN_vkVoidFunction = ?*const fn () callconv(.c) void;
pub const struct_VkAllocationCallbacks = extern struct {
    pUserData: ?*anyopaque = null,
    pfnAllocation: PFN_vkAllocationFunction = null,
    pfnReallocation: PFN_vkReallocationFunction = null,
    pfnFree: PFN_vkFreeFunction = null,
    pfnInternalAllocation: PFN_vkInternalAllocationNotification = null,
    pfnInternalFree: PFN_vkInternalFreeNotification = null,
};
pub const VkAllocationCallbacks = struct_VkAllocationCallbacks;
pub const struct_VkExtensionProperties = extern struct {
    extensionName: [256]u8 = @import("std").mem.zeroes([256]u8),
    specVersion: u32 = 0,
};
pub const VkExtensionProperties = struct_VkExtensionProperties;
pub const PFN_vkEnumeratePhysicalDevices = ?*const fn (instance: VkInstance, pPhysicalDeviceCount: [*c]u32, pPhysicalDevices: [*c]VkPhysicalDevice) callconv(.c) VkResult;
pub const PFN_vkGetInstanceProcAddr = ?*const fn (instance: VkInstance, pName: [*c]const u8) callconv(.c) PFN_vkVoidFunction;
pub const PFN_vkEnumerateInstanceExtensionProperties = ?*const fn (pLayerName: [*c]const u8, pPropertyCount: [*c]u32, pProperties: [*c]VkExtensionProperties) callconv(.c) VkResult;
pub const struct_VkSurfaceKHR_T = opaque {};
pub const VkSurfaceKHR = ?*struct_VkSurfaceKHR_T;
pub const VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR: c_int = 1;
pub const enum_VkSurfaceTransformFlagBitsKHR = c_uint;
pub const VkSurfaceTransformFlagBitsKHR = enum_VkSurfaceTransformFlagBitsKHR;
pub const VkSurfaceTransformFlagsKHR = VkFlags;
pub const PFN_vkDestroySurfaceKHR = ?*const fn (instance: VkInstance, surface: VkSurfaceKHR, pAllocator: [*c]const VkAllocationCallbacks) callconv(.c) void;
pub const struct_VkDisplayKHR_T = opaque {};
pub const VkDisplayKHR = ?*struct_VkDisplayKHR_T;
pub const struct_VkDisplayModeKHR_T = opaque {};
pub const VkDisplayModeKHR = ?*struct_VkDisplayModeKHR_T;
pub const VK_DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR: c_int = 1;
pub const VK_DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR: c_int = 2;
pub const VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR: c_int = 4;
pub const VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR: c_int = 8;
pub const enum_VkDisplayPlaneAlphaFlagBitsKHR = c_uint;
pub const VkDisplayPlaneAlphaFlagBitsKHR = enum_VkDisplayPlaneAlphaFlagBitsKHR;
pub const VkDisplayPlaneAlphaFlagsKHR = VkFlags;
pub const VkDisplaySurfaceCreateFlagsKHR = VkFlags;
pub const struct_VkDisplayModeParametersKHR = extern struct {
    visibleRegion: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    refreshRate: u32 = 0,
};
pub const VkDisplayModeParametersKHR = struct_VkDisplayModeParametersKHR;
pub const struct_VkDisplayModePropertiesKHR = extern struct {
    displayMode: VkDisplayModeKHR = null,
    parameters: VkDisplayModeParametersKHR = @import("std").mem.zeroes(VkDisplayModeParametersKHR),
};
pub const VkDisplayModePropertiesKHR = struct_VkDisplayModePropertiesKHR;
pub const struct_VkDisplayPlaneCapabilitiesKHR = extern struct {
    supportedAlpha: VkDisplayPlaneAlphaFlagsKHR = 0,
    minSrcPosition: VkOffset2D = @import("std").mem.zeroes(VkOffset2D),
    maxSrcPosition: VkOffset2D = @import("std").mem.zeroes(VkOffset2D),
    minSrcExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    maxSrcExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    minDstPosition: VkOffset2D = @import("std").mem.zeroes(VkOffset2D),
    maxDstPosition: VkOffset2D = @import("std").mem.zeroes(VkOffset2D),
    minDstExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    maxDstExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
};
pub const VkDisplayPlaneCapabilitiesKHR = struct_VkDisplayPlaneCapabilitiesKHR;
pub const struct_VkDisplayPlanePropertiesKHR = extern struct {
    currentDisplay: VkDisplayKHR = null,
    currentStackIndex: u32 = 0,
};
pub const VkDisplayPlanePropertiesKHR = struct_VkDisplayPlanePropertiesKHR;
pub const struct_VkDisplayPropertiesKHR = extern struct {
    display: VkDisplayKHR = null,
    displayName: [*c]const u8 = null,
    physicalDimensions: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    physicalResolution: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
    supportedTransforms: VkSurfaceTransformFlagsKHR = 0,
    planeReorderPossible: VkBool32 = 0,
    persistentContent: VkBool32 = 0,
};
pub const VkDisplayPropertiesKHR = struct_VkDisplayPropertiesKHR;
pub const struct_VkDisplaySurfaceCreateInfoKHR = extern struct {
    sType: VkStructureType = @import("std").mem.zeroes(VkStructureType),
    pNext: ?*const anyopaque = null,
    flags: VkDisplaySurfaceCreateFlagsKHR = 0,
    displayMode: VkDisplayModeKHR = null,
    planeIndex: u32 = 0,
    planeStackIndex: u32 = 0,
    transform: VkSurfaceTransformFlagBitsKHR = @import("std").mem.zeroes(VkSurfaceTransformFlagBitsKHR),
    globalAlpha: f32 = 0,
    alphaMode: VkDisplayPlaneAlphaFlagBitsKHR = @import("std").mem.zeroes(VkDisplayPlaneAlphaFlagBitsKHR),
    imageExtent: VkExtent2D = @import("std").mem.zeroes(VkExtent2D),
};
pub const VkDisplaySurfaceCreateInfoKHR = struct_VkDisplaySurfaceCreateInfoKHR;
pub const PFN_vkGetPhysicalDeviceDisplayPropertiesKHR = ?*const fn (physicalDevice: VkPhysicalDevice, pPropertyCount: [*c]u32, pProperties: [*c]VkDisplayPropertiesKHR) callconv(.c) VkResult;
pub const PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR = ?*const fn (physicalDevice: VkPhysicalDevice, pPropertyCount: [*c]u32, pProperties: [*c]VkDisplayPlanePropertiesKHR) callconv(.c) VkResult;
pub const PFN_vkGetDisplayPlaneSupportedDisplaysKHR = ?*const fn (physicalDevice: VkPhysicalDevice, planeIndex: u32, pDisplayCount: [*c]u32, pDisplays: [*c]VkDisplayKHR) callconv(.c) VkResult;
pub const PFN_vkGetDisplayModePropertiesKHR = ?*const fn (physicalDevice: VkPhysicalDevice, display: VkDisplayKHR, pPropertyCount: [*c]u32, pProperties: [*c]VkDisplayModePropertiesKHR) callconv(.c) VkResult;
pub const PFN_vkGetDisplayPlaneCapabilitiesKHR = ?*const fn (physicalDevice: VkPhysicalDevice, mode: VkDisplayModeKHR, planeIndex: u32, pCapabilities: [*c]VkDisplayPlaneCapabilitiesKHR) callconv(.c) VkResult;
pub const PFN_vkCreateDisplayPlaneSurfaceKHR = ?*const fn (instance: VkInstance, pCreateInfo: [*c]const VkDisplaySurfaceCreateInfoKHR, pAllocator: [*c]const VkAllocationCallbacks, pSurface: [*c]VkSurfaceKHR) callconv(.c) VkResult;
pub export fn SDL_Vulkan_GetResultString(result: VkResult) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (result) {
                    VK_SUCCESS => {
                        sdl_pc = 2;
                        continue;
                    },
                    VK_NOT_READY => {
                        sdl_pc = 3;
                        continue;
                    },
                    VK_TIMEOUT => {
                        sdl_pc = 4;
                        continue;
                    },
                    VK_EVENT_SET => {
                        sdl_pc = 5;
                        continue;
                    },
                    VK_EVENT_RESET => {
                        sdl_pc = 6;
                        continue;
                    },
                    VK_INCOMPLETE => {
                        sdl_pc = 7;
                        continue;
                    },
                    VK_ERROR_OUT_OF_HOST_MEMORY => {
                        sdl_pc = 8;
                        continue;
                    },
                    VK_ERROR_OUT_OF_DEVICE_MEMORY => {
                        sdl_pc = 9;
                        continue;
                    },
                    VK_ERROR_INITIALIZATION_FAILED => {
                        sdl_pc = 10;
                        continue;
                    },
                    VK_ERROR_DEVICE_LOST => {
                        sdl_pc = 11;
                        continue;
                    },
                    VK_ERROR_MEMORY_MAP_FAILED => {
                        sdl_pc = 12;
                        continue;
                    },
                    VK_ERROR_LAYER_NOT_PRESENT => {
                        sdl_pc = 13;
                        continue;
                    },
                    VK_ERROR_EXTENSION_NOT_PRESENT => {
                        sdl_pc = 14;
                        continue;
                    },
                    VK_ERROR_FEATURE_NOT_PRESENT => {
                        sdl_pc = 15;
                        continue;
                    },
                    VK_ERROR_INCOMPATIBLE_DRIVER => {
                        sdl_pc = 16;
                        continue;
                    },
                    VK_ERROR_TOO_MANY_OBJECTS => {
                        sdl_pc = 17;
                        continue;
                    },
                    VK_ERROR_FORMAT_NOT_SUPPORTED => {
                        sdl_pc = 18;
                        continue;
                    },
                    VK_ERROR_FRAGMENTED_POOL => {
                        sdl_pc = 19;
                        continue;
                    },
                    VK_ERROR_UNKNOWN => {
                        sdl_pc = 20;
                        continue;
                    },
                    VK_ERROR_OUT_OF_POOL_MEMORY => {
                        sdl_pc = 21;
                        continue;
                    },
                    VK_ERROR_INVALID_EXTERNAL_HANDLE => {
                        sdl_pc = 22;
                        continue;
                    },
                    VK_ERROR_FRAGMENTATION => {
                        sdl_pc = 23;
                        continue;
                    },
                    VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS => {
                        sdl_pc = 24;
                        continue;
                    },
                    VK_ERROR_SURFACE_LOST_KHR => {
                        sdl_pc = 25;
                        continue;
                    },
                    VK_ERROR_NATIVE_WINDOW_IN_USE_KHR => {
                        sdl_pc = 26;
                        continue;
                    },
                    VK_SUBOPTIMAL_KHR => {
                        sdl_pc = 27;
                        continue;
                    },
                    VK_ERROR_OUT_OF_DATE_KHR => {
                        sdl_pc = 28;
                        continue;
                    },
                    VK_ERROR_INCOMPATIBLE_DISPLAY_KHR => {
                        sdl_pc = 29;
                        continue;
                    },
                    VK_ERROR_VALIDATION_FAILED_EXT => {
                        sdl_pc = 30;
                        continue;
                    },
                    VK_ERROR_INVALID_SHADER_NV => {
                        sdl_pc = 31;
                        continue;
                    },
                    VK_ERROR_INVALID_DRM_FORMAT_MODIFIER_PLANE_LAYOUT_EXT => {
                        sdl_pc = 32;
                        continue;
                    },
                    VK_ERROR_NOT_PERMITTED_EXT => {
                        sdl_pc = 33;
                        continue;
                    },
                    VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT => {
                        sdl_pc = 34;
                        continue;
                    },
                    VK_THREAD_IDLE_KHR => {
                        sdl_pc = 35;
                        continue;
                    },
                    VK_THREAD_DONE_KHR => {
                        sdl_pc = 36;
                        continue;
                    },
                    VK_OPERATION_DEFERRED_KHR => {
                        sdl_pc = 37;
                        continue;
                    },
                    VK_OPERATION_NOT_DEFERRED_KHR => {
                        sdl_pc = 38;
                        continue;
                    },
                    VK_PIPELINE_COMPILE_REQUIRED_EXT => {
                        sdl_pc = 39;
                        continue;
                    },
                    else => {
                        sdl_pc = 40;
                        continue;
                    },
                }
            },
            1 => {
                if (result < @as(c_int, 0)) {
                    sdl_pc = 41;
                    continue;
                } else {
                    sdl_pc = 42;
                    continue;
                }
            },
            2 => {
                return "VK_SUCCESS";
            },
            3 => {
                return "VK_NOT_READY";
            },
            4 => {
                return "VK_TIMEOUT";
            },
            5 => {
                return "VK_EVENT_SET";
            },
            6 => {
                return "VK_EVENT_RESET";
            },
            7 => {
                return "VK_INCOMPLETE";
            },
            8 => {
                return "VK_ERROR_OUT_OF_HOST_MEMORY";
            },
            9 => {
                return "VK_ERROR_OUT_OF_DEVICE_MEMORY";
            },
            10 => {
                return "VK_ERROR_INITIALIZATION_FAILED";
            },
            11 => {
                return "VK_ERROR_DEVICE_LOST";
            },
            12 => {
                return "VK_ERROR_MEMORY_MAP_FAILED";
            },
            13 => {
                return "VK_ERROR_LAYER_NOT_PRESENT";
            },
            14 => {
                return "VK_ERROR_EXTENSION_NOT_PRESENT";
            },
            15 => {
                return "VK_ERROR_FEATURE_NOT_PRESENT";
            },
            16 => {
                return "VK_ERROR_INCOMPATIBLE_DRIVER";
            },
            17 => {
                return "VK_ERROR_TOO_MANY_OBJECTS";
            },
            18 => {
                return "VK_ERROR_FORMAT_NOT_SUPPORTED";
            },
            19 => {
                return "VK_ERROR_FRAGMENTED_POOL";
            },
            20 => {
                return "VK_ERROR_UNKNOWN";
            },
            21 => {
                return "VK_ERROR_OUT_OF_POOL_MEMORY";
            },
            22 => {
                return "VK_ERROR_INVALID_EXTERNAL_HANDLE";
            },
            23 => {
                return "VK_ERROR_FRAGMENTATION";
            },
            24 => {
                return "VK_ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS";
            },
            25 => {
                return "VK_ERROR_SURFACE_LOST_KHR";
            },
            26 => {
                return "VK_ERROR_NATIVE_WINDOW_IN_USE_KHR";
            },
            27 => {
                return "VK_SUBOPTIMAL_KHR";
            },
            28 => {
                return "VK_ERROR_OUT_OF_DATE_KHR";
            },
            29 => {
                return "VK_ERROR_INCOMPATIBLE_DISPLAY_KHR";
            },
            30 => {
                return "VK_ERROR_VALIDATION_FAILED_EXT";
            },
            31 => {
                return "VK_ERROR_INVALID_SHADER_NV";
            },
            32 => {
                return "VK_ERROR_INVALID_DRM_FORMAT_MODIFIER_PLANE_LAYOUT_EXT";
            },
            33 => {
                return "VK_ERROR_NOT_PERMITTED_EXT";
            },
            34 => {
                return "VK_ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT";
            },
            35 => {
                return "VK_THREAD_IDLE_KHR";
            },
            36 => {
                return "VK_THREAD_DONE_KHR";
            },
            37 => {
                return "VK_OPERATION_DEFERRED_KHR";
            },
            38 => {
                return "VK_OPERATION_NOT_DEFERRED_KHR";
            },
            39 => {
                return "VK_PIPELINE_COMPILE_REQUIRED_EXT";
            },
            40 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            41 => {
                return "VK_ERROR_<Unknown>";
            },
            42 => {
                {
                    sdl_pc = 43;
                    continue;
                }
            },
            43 => {
                return "VK_<Unknown>";
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_Vulkan_CreateInstanceExtensionsList(vkEnumerateInstanceExtensionProperties: PFN_vkEnumerateInstanceExtensionProperties, extensionCount: [*c]Uint32) [*c]VkExtensionProperties {
    @setEvalBranchQuota(100000);
    var count: Uint32 = 0;
    _ = &count;
    var rc: VkResult = vkEnumerateInstanceExtensionProperties.?(null, &count, null);
    _ = &rc;
    var result: [*c]VkExtensionProperties = undefined;
    _ = &result;
    if (rc == VK_ERROR_INCOMPATIBLE_DRIVER) {
        _ = SDL_SetError_REAL("You probably don't have a working Vulkan driver installed. %s %s %s(%d)", @as([*c]u8, @as([*c]u8, @constCast("Getting Vulkan extensions failed:"))), @as([*c]u8, @as([*c]u8, @constCast("vkEnumerateInstanceExtensionProperties returned"))), SDL_Vulkan_GetResultString(rc), rc);
        return null;
    } else if (rc != VK_SUCCESS) {
        _ = SDL_SetError_REAL("Getting Vulkan extensions failed: vkEnumerateInstanceExtensionProperties returned %s(%d)", SDL_Vulkan_GetResultString(rc), rc);
        return null;
    }
    if (count == @as(Uint32, 0)) {
        result = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(VkExtensionProperties))));
    } else {
        result = @ptrCast(@alignCast(SDL_calloc_REAL(count, @sizeOf(VkExtensionProperties))));
    }
    if (!(result != null)) {
        return null;
    }
    rc = vkEnumerateInstanceExtensionProperties.?(null, &count, result);
    if (rc != VK_SUCCESS) {
        _ = SDL_SetError_REAL("Getting Vulkan extensions failed: vkEnumerateInstanceExtensionProperties returned %s(%d)", SDL_Vulkan_GetResultString(rc), rc);
        SDL_free_REAL(@ptrCast(@alignCast(result)));
        return null;
    }
    extensionCount.* = count;
    return result;
}
pub const alphaModes: [4]VkDisplayPlaneAlphaFlagBitsKHR = [4]VkDisplayPlaneAlphaFlagBitsKHR{
    VK_DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR,
    VK_DISPLAY_PLANE_ALPHA_GLOBAL_BIT_KHR,
    VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_BIT_KHR,
    VK_DISPLAY_PLANE_ALPHA_PER_PIXEL_PREMULTIPLIED_BIT_KHR,
};
pub export fn SDL_Vulkan_Display_CreateSurface(vkGetInstanceProcAddr_: ?*anyopaque, instance: VkInstance, allocator: [*c]const struct_VkAllocationCallbacks, surface: [*c]VkSurfaceKHR) bool {
    @setEvalBranchQuota(100000);
    var vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr = undefined;
    _ = &vkGetInstanceProcAddr;
    var vkEnumeratePhysicalDevices: PFN_vkEnumeratePhysicalDevices = undefined;
    _ = &vkEnumeratePhysicalDevices;
    var vkGetPhysicalDeviceDisplayPropertiesKHR: PFN_vkGetPhysicalDeviceDisplayPropertiesKHR = undefined;
    _ = &vkGetPhysicalDeviceDisplayPropertiesKHR;
    var vkGetDisplayModePropertiesKHR: PFN_vkGetDisplayModePropertiesKHR = undefined;
    _ = &vkGetDisplayModePropertiesKHR;
    var vkGetPhysicalDeviceDisplayPlanePropertiesKHR: PFN_vkGetPhysicalDeviceDisplayPlanePropertiesKHR = undefined;
    _ = &vkGetPhysicalDeviceDisplayPlanePropertiesKHR;
    var vkGetDisplayPlaneCapabilitiesKHR: PFN_vkGetDisplayPlaneCapabilitiesKHR = undefined;
    _ = &vkGetDisplayPlaneCapabilitiesKHR;
    var vkGetDisplayPlaneSupportedDisplaysKHR: PFN_vkGetDisplayPlaneSupportedDisplaysKHR = undefined;
    _ = &vkGetDisplayPlaneSupportedDisplaysKHR;
    var vkCreateDisplayPlaneSurfaceKHR: PFN_vkCreateDisplayPlaneSurfaceKHR = undefined;
    _ = &vkCreateDisplayPlaneSurfaceKHR;
    var createInfo: VkDisplaySurfaceCreateInfoKHR = undefined;
    _ = &createInfo;
    var rc: VkResult = undefined;
    _ = &rc;
    var physicalDeviceCount: u32 = undefined;
    _ = &physicalDeviceCount;
    var physicalDevices: [*c]VkPhysicalDevice = undefined;
    _ = &physicalDevices;
    var physicalDeviceIndex: u32 = undefined;
    _ = &physicalDeviceIndex;
    var chosenDisplayId: [*c]const u8 = undefined;
    _ = &chosenDisplayId;
    var displayId: c_int = undefined;
    _ = &displayId;
    var physicalDevice: VkPhysicalDevice = undefined;
    _ = &physicalDevice;
    var displayPropertiesCount: u32 = undefined;
    _ = &displayPropertiesCount;
    var displayProperties: [*c]VkDisplayPropertiesKHR = undefined;
    _ = &displayProperties;
    var displayModePropertiesCount: u32 = undefined;
    _ = &displayModePropertiesCount;
    var displayModeProperties: [*c]VkDisplayModePropertiesKHR = undefined;
    _ = &displayModeProperties;
    var bestMatchIndex: c_int = undefined;
    _ = &bestMatchIndex;
    var refreshRate: u32 = undefined;
    _ = &refreshRate;
    var i: u32 = undefined;
    _ = &i;
    var displayPlanePropertiesCount: u32 = undefined;
    _ = &displayPlanePropertiesCount;
    var planeIndex: c_int = undefined;
    _ = &planeIndex;
    var display: VkDisplayKHR = undefined;
    _ = &display;
    var displayPlaneProperties: [*c]VkDisplayPlanePropertiesKHR = undefined;
    _ = &displayPlaneProperties;
    var extent: VkExtent2D = undefined;
    _ = &extent;
    var planeCaps: VkDisplayPlaneCapabilitiesKHR = undefined;
    _ = &planeCaps;
    var planeSupportedDisplaysCount: u32 = undefined;
    _ = &planeSupportedDisplaysCount;
    var planeSupportedDisplays: [*c]VkDisplayKHR = undefined;
    _ = &planeSupportedDisplays;
    var j: u32 = undefined;
    _ = &j;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                vkGetInstanceProcAddr = @ptrCast(@alignCast(vkGetInstanceProcAddr_));
                vkEnumeratePhysicalDevices = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkEnumeratePhysicalDevices"))));
                vkGetPhysicalDeviceDisplayPropertiesKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkGetPhysicalDeviceDisplayPropertiesKHR"))));
                vkGetDisplayModePropertiesKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkGetDisplayModePropertiesKHR"))));
                vkGetPhysicalDeviceDisplayPlanePropertiesKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkGetPhysicalDeviceDisplayPlanePropertiesKHR"))));
                vkGetDisplayPlaneCapabilitiesKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkGetDisplayPlaneCapabilitiesKHR"))));
                vkGetDisplayPlaneSupportedDisplaysKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkGetDisplayPlaneSupportedDisplaysKHR"))));
                vkCreateDisplayPlaneSurfaceKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkCreateDisplayPlaneSurfaceKHR"))));
                physicalDeviceCount = 0;
                physicalDevices = null;
                displayId = 0;
                if ((((((!(vkEnumeratePhysicalDevices != null) or !(vkGetPhysicalDeviceDisplayPropertiesKHR != null)) or !(vkGetDisplayModePropertiesKHR != null)) or !(vkGetPhysicalDeviceDisplayPlanePropertiesKHR != null)) or !(vkGetDisplayPlaneCapabilitiesKHR != null)) or !(vkGetDisplayPlaneSupportedDisplaysKHR != null)) or !(vkCreateDisplayPlaneSurfaceKHR != null)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 3;
                    continue;
                }
            },
            1 => {
                SDL_free_REAL(@ptrCast(@alignCast(physicalDevices)));
                return @"false" != 0;
            },
            2 => {
                _ = SDL_SetError_REAL("VK_KHR_display extension is not enabled in the Vulkan instance.");
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
                chosenDisplayId = SDL_GetHint_REAL("SDL_VULKAN_DISPLAY");
                if (chosenDisplayId != null) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                displayId = SDL_atoi_REAL(chosenDisplayId);
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
                rc = vkEnumeratePhysicalDevices.?(instance, &physicalDeviceCount, null);
                if (rc != VK_SUCCESS) {
                    sdl_pc = 8;
                    continue;
                } else {
                    sdl_pc = 9;
                    continue;
                }
            },
            8 => {
                _ = SDL_SetError_REAL("Could not enumerate Vulkan physical devices");
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
                if (physicalDeviceCount == @as(u32, 0)) {
                    sdl_pc = 11;
                    continue;
                } else {
                    sdl_pc = 12;
                    continue;
                }
            },
            11 => {
                _ = SDL_SetError_REAL("No Vulkan physical devices");
                {
                    sdl_pc = 1;
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
                physicalDevices = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkPhysicalDevice) *% @as(c_ulong, physicalDeviceCount))));
                if (!(physicalDevices != null)) {
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
                rc = vkEnumeratePhysicalDevices.?(instance, &physicalDeviceCount, physicalDevices);
                if (rc != VK_SUCCESS) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                _ = SDL_SetError_REAL("Error enumerating physical devices");
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
                physicalDeviceIndex = 0;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                if (physicalDeviceIndex < physicalDeviceCount) {
                    sdl_pc = 21;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            21 => {
                physicalDevice = physicalDevices[physicalDeviceIndex];
                displayPropertiesCount = 0;
                displayProperties = null;
                displayModePropertiesCount = 0;
                displayModeProperties = null;
                bestMatchIndex = -@as(c_int, 1);
                refreshRate = 0;
                displayPlanePropertiesCount = 0;
                planeIndex = -@as(c_int, 1);
                displayPlaneProperties = null;
                planeCaps = VkDisplayPlaneCapabilitiesKHR{
                    .supportedAlpha = 0,
                    .minSrcPosition = @import("std").mem.zeroes(VkOffset2D),
                    .maxSrcPosition = @import("std").mem.zeroes(VkOffset2D),
                    .minSrcExtent = @import("std").mem.zeroes(VkExtent2D),
                    .maxSrcExtent = @import("std").mem.zeroes(VkExtent2D),
                    .minDstPosition = @import("std").mem.zeroes(VkOffset2D),
                    .maxDstPosition = @import("std").mem.zeroes(VkOffset2D),
                    .minDstExtent = @import("std").mem.zeroes(VkExtent2D),
                    .maxDstExtent = @import("std").mem.zeroes(VkExtent2D),
                };
                rc = vkGetPhysicalDeviceDisplayPropertiesKHR.?(physicalDevice, &displayPropertiesCount, null);
                if ((rc != VK_SUCCESS) or (displayPropertiesCount == @as(u32, 0))) {
                    sdl_pc = 24;
                    continue;
                } else {
                    sdl_pc = 25;
                    continue;
                }
            },
            22 => {
                physicalDeviceIndex +%= 1;
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            23 => {
                SDL_free_REAL(@ptrCast(@alignCast(physicalDevices)));
                physicalDevices = null;
                if (physicalDeviceIndex == physicalDeviceCount) {
                    sdl_pc = 103;
                    continue;
                } else {
                    sdl_pc = 104;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 22;
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
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "vulkandisplay: Number of display properties for device %u: %u", physicalDeviceIndex, displayPropertiesCount);
                if ((displayId < @as(c_int, 0)) or (@as(u32, @bitCast(@as(c_int, displayId))) >= displayPropertiesCount)) {
                    sdl_pc = 27;
                    continue;
                } else {
                    sdl_pc = 28;
                    continue;
                }
            },
            27 => {
                {
                    const ref = &displayId;
                    ref.* = @bitCast(@as(c_uint, @truncate(@as(u32, @bitCast(@as(c_int, ref.*))) -% displayPropertiesCount)));
                }
                {
                    sdl_pc = 22;
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
                displayProperties = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkDisplayPropertiesKHR) *% @as(c_ulong, displayPropertiesCount))));
                if (!(displayProperties != null)) {
                    sdl_pc = 30;
                    continue;
                } else {
                    sdl_pc = 31;
                    continue;
                }
            },
            30 => {
                {
                    sdl_pc = 1;
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
                rc = vkGetPhysicalDeviceDisplayPropertiesKHR.?(physicalDevice, &displayPropertiesCount, displayProperties);
                if ((rc != VK_SUCCESS) or (displayPropertiesCount == @as(u32, 0))) {
                    sdl_pc = 33;
                    continue;
                } else {
                    sdl_pc = 34;
                    continue;
                }
            },
            33 => {
                SDL_free_REAL(@ptrCast(@alignCast(displayProperties)));
                _ = SDL_SetError_REAL("Error enumerating physical device displays");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            34 => {
                {
                    sdl_pc = 35;
                    continue;
                }
            },
            35 => {
                display = displayProperties[@bitCast(@as(isize, @intCast(displayId)))].display;
                extent = displayProperties[@bitCast(@as(isize, @intCast(displayId)))].physicalResolution;
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "vulkandisplay: Display: %s Native resolution: %ux%u", displayProperties[@bitCast(@as(isize, @intCast(displayId)))].displayName, extent.width, extent.height);
                SDL_free_REAL(@ptrCast(@alignCast(displayProperties)));
                displayProperties = null;
                rc = vkGetDisplayModePropertiesKHR.?(physicalDevice, display, &displayModePropertiesCount, null);
                if ((rc != VK_SUCCESS) or (displayModePropertiesCount == @as(u32, 0))) {
                    sdl_pc = 36;
                    continue;
                } else {
                    sdl_pc = 37;
                    continue;
                }
            },
            36 => {
                _ = SDL_SetError_REAL("Error enumerating display modes");
                {
                    sdl_pc = 1;
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
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "vulkandisplay: Number of display modes: %u", displayModePropertiesCount);
                displayModeProperties = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkDisplayModePropertiesKHR) *% @as(c_ulong, displayModePropertiesCount))));
                if (!(displayModeProperties != null)) {
                    sdl_pc = 39;
                    continue;
                } else {
                    sdl_pc = 40;
                    continue;
                }
            },
            39 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            40 => {
                {
                    sdl_pc = 41;
                    continue;
                }
            },
            41 => {
                rc = vkGetDisplayModePropertiesKHR.?(physicalDevice, display, &displayModePropertiesCount, displayModeProperties);
                if ((rc != VK_SUCCESS) or (displayModePropertiesCount == @as(u32, 0))) {
                    sdl_pc = 42;
                    continue;
                } else {
                    sdl_pc = 43;
                    continue;
                }
            },
            42 => {
                _ = SDL_SetError_REAL("Error enumerating display modes");
                SDL_free_REAL(@ptrCast(@alignCast(displayModeProperties)));
                {
                    sdl_pc = 1;
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
                i = 0;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            45 => {
                if (i < displayModePropertiesCount) {
                    sdl_pc = 46;
                    continue;
                } else {
                    sdl_pc = 48;
                    continue;
                }
            },
            46 => {
                if (((displayModeProperties[i].parameters.visibleRegion.width == extent.width) and (displayModeProperties[i].parameters.visibleRegion.height == extent.height)) and (displayModeProperties[i].parameters.refreshRate > refreshRate)) {
                    sdl_pc = 49;
                    continue;
                } else {
                    sdl_pc = 50;
                    continue;
                }
            },
            47 => {
                i +%= 1;
                {
                    sdl_pc = 45;
                    continue;
                }
            },
            48 => {
                if (bestMatchIndex < @as(c_int, 0)) {
                    sdl_pc = 52;
                    continue;
                } else {
                    sdl_pc = 53;
                    continue;
                }
            },
            49 => {
                bestMatchIndex = @bitCast(@as(c_uint, @truncate(i)));
                refreshRate = displayModeProperties[i].parameters.refreshRate;
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            50 => {
                {
                    sdl_pc = 51;
                    continue;
                }
            },
            51 => {
                {
                    sdl_pc = 47;
                    continue;
                }
            },
            52 => {
                _ = SDL_SetError_REAL("Found no matching display mode");
                SDL_free_REAL(@ptrCast(@alignCast(displayModeProperties)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            53 => {
                {
                    sdl_pc = 54;
                    continue;
                }
            },
            54 => {
                _ = memset(@ptrCast(@alignCast(&createInfo)), 0, @sizeOf(@TypeOf(createInfo)));
                createInfo.displayMode = displayModeProperties[@bitCast(@as(isize, @intCast(bestMatchIndex)))].displayMode;
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "vulkandisplay: Matching mode %ux%u with refresh rate %u", displayModeProperties[@bitCast(@as(isize, @intCast(bestMatchIndex)))].parameters.visibleRegion.width, displayModeProperties[@bitCast(@as(isize, @intCast(bestMatchIndex)))].parameters.visibleRegion.height, refreshRate);
                SDL_free_REAL(@ptrCast(@alignCast(displayModeProperties)));
                displayModeProperties = null;
                rc = vkGetPhysicalDeviceDisplayPlanePropertiesKHR.?(physicalDevice, &displayPlanePropertiesCount, null);
                if ((rc != VK_SUCCESS) or (displayPlanePropertiesCount == @as(u32, 0))) {
                    sdl_pc = 55;
                    continue;
                } else {
                    sdl_pc = 56;
                    continue;
                }
            },
            55 => {
                _ = SDL_SetError_REAL("Error enumerating display planes");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            56 => {
                {
                    sdl_pc = 57;
                    continue;
                }
            },
            57 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "vulkandisplay: Number of display planes: %u", displayPlanePropertiesCount);
                displayPlaneProperties = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkDisplayPlanePropertiesKHR) *% @as(c_ulong, displayPlanePropertiesCount))));
                if (!(displayPlaneProperties != null)) {
                    sdl_pc = 58;
                    continue;
                } else {
                    sdl_pc = 59;
                    continue;
                }
            },
            58 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            59 => {
                {
                    sdl_pc = 60;
                    continue;
                }
            },
            60 => {
                rc = vkGetPhysicalDeviceDisplayPlanePropertiesKHR.?(physicalDevice, &displayPlanePropertiesCount, displayPlaneProperties);
                if ((rc != VK_SUCCESS) or (displayPlanePropertiesCount == @as(u32, 0))) {
                    sdl_pc = 61;
                    continue;
                } else {
                    sdl_pc = 62;
                    continue;
                }
            },
            61 => {
                _ = SDL_SetError_REAL("Error enumerating display plane properties");
                SDL_free_REAL(@ptrCast(@alignCast(displayPlaneProperties)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            62 => {
                {
                    sdl_pc = 63;
                    continue;
                }
            },
            63 => {
                i = 0;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            64 => {
                if (i < displayPlanePropertiesCount) {
                    sdl_pc = 65;
                    continue;
                } else {
                    sdl_pc = 67;
                    continue;
                }
            },
            65 => {
                planeSupportedDisplaysCount = 0;
                planeSupportedDisplays = null;
                if (@as(?*anyopaque, @ptrCast(@alignCast(displayPlaneProperties[i].currentDisplay))) == @as(?*anyopaque, null)) {
                    sdl_pc = 68;
                    continue;
                } else {
                    sdl_pc = 69;
                    continue;
                }
            },
            66 => {
                i +%= 1;
                {
                    sdl_pc = 64;
                    continue;
                }
            },
            67 => {
                if (planeIndex < @as(c_int, 0)) {
                    sdl_pc = 93;
                    continue;
                } else {
                    sdl_pc = 94;
                    continue;
                }
            },
            68 => {
                {
                    sdl_pc = 66;
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
                rc = vkGetDisplayPlaneSupportedDisplaysKHR.?(physicalDevice, i, &planeSupportedDisplaysCount, null);
                if ((rc != VK_SUCCESS) or (planeSupportedDisplaysCount == @as(u32, 0))) {
                    sdl_pc = 71;
                    continue;
                } else {
                    sdl_pc = 72;
                    continue;
                }
            },
            71 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            72 => {
                {
                    sdl_pc = 73;
                    continue;
                }
            },
            73 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "vulkandisplay: Number of supported displays for plane %u: %u", i, planeSupportedDisplaysCount);
                planeSupportedDisplays = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(VkDisplayKHR) *% @as(c_ulong, planeSupportedDisplaysCount))));
                if (!(planeSupportedDisplays != null)) {
                    sdl_pc = 74;
                    continue;
                } else {
                    sdl_pc = 75;
                    continue;
                }
            },
            74 => {
                SDL_free_REAL(@ptrCast(@alignCast(displayPlaneProperties)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            75 => {
                {
                    sdl_pc = 76;
                    continue;
                }
            },
            76 => {
                rc = vkGetDisplayPlaneSupportedDisplaysKHR.?(physicalDevice, i, &planeSupportedDisplaysCount, planeSupportedDisplays);
                if ((rc != VK_SUCCESS) or (planeSupportedDisplaysCount == @as(u32, 0))) {
                    sdl_pc = 77;
                    continue;
                } else {
                    sdl_pc = 78;
                    continue;
                }
            },
            77 => {
                _ = SDL_SetError_REAL("Error enumerating supported displays, or no supported displays");
                SDL_free_REAL(@ptrCast(@alignCast(planeSupportedDisplays)));
                SDL_free_REAL(@ptrCast(@alignCast(displayPlaneProperties)));
                {
                    sdl_pc = 1;
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
                j = 0;
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            80 => {
                if ((j < planeSupportedDisplaysCount) and (planeSupportedDisplays[j] != display)) {
                    sdl_pc = 81;
                    continue;
                } else {
                    sdl_pc = 83;
                    continue;
                }
            },
            81 => {
                {
                    sdl_pc = 82;
                    continue;
                }
            },
            82 => {
                j +%= 1;
                {
                    sdl_pc = 80;
                    continue;
                }
            },
            83 => {
                SDL_free_REAL(@ptrCast(@alignCast(planeSupportedDisplays)));
                planeSupportedDisplays = null;
                if (j == planeSupportedDisplaysCount) {
                    sdl_pc = 84;
                    continue;
                } else {
                    sdl_pc = 85;
                    continue;
                }
            },
            84 => {
                {
                    sdl_pc = 66;
                    continue;
                }
            },
            85 => {
                {
                    sdl_pc = 86;
                    continue;
                }
            },
            86 => {
                rc = vkGetDisplayPlaneCapabilitiesKHR.?(physicalDevice, createInfo.displayMode, i, &planeCaps);
                if (rc != VK_SUCCESS) {
                    sdl_pc = 87;
                    continue;
                } else {
                    sdl_pc = 88;
                    continue;
                }
            },
            87 => {
                _ = SDL_SetError_REAL("Error getting display plane capabilities");
                SDL_free_REAL(@ptrCast(@alignCast(displayPlaneProperties)));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            88 => {
                {
                    sdl_pc = 89;
                    continue;
                }
            },
            89 => {
                if ((((extent.width >= planeCaps.minDstExtent.width) and (extent.height >= planeCaps.minDstExtent.height)) and (extent.width <= planeCaps.maxDstExtent.width)) and (extent.height <= planeCaps.maxDstExtent.height)) {
                    sdl_pc = 90;
                    continue;
                } else {
                    sdl_pc = 91;
                    continue;
                }
            },
            90 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "vulkandisplay: Choosing plane %u, minimum extent %ux%u maximum extent %ux%u", i, planeCaps.minDstExtent.width, planeCaps.minDstExtent.height, planeCaps.maxDstExtent.width, planeCaps.maxDstExtent.height);
                planeIndex = @bitCast(@as(c_uint, @truncate(i)));
                {
                    sdl_pc = 67;
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
                    sdl_pc = 66;
                    continue;
                }
            },
            93 => {
                _ = SDL_SetError_REAL("No plane supports the selected resolution");
                SDL_free_REAL(@ptrCast(@alignCast(displayPlaneProperties)));
                {
                    sdl_pc = 1;
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
                createInfo.planeIndex = @bitCast(@as(c_int, planeIndex));
                createInfo.planeStackIndex = displayPlaneProperties[@bitCast(@as(isize, @intCast(planeIndex)))].currentStackIndex;
                SDL_free_REAL(@ptrCast(@alignCast(displayPlaneProperties)));
                displayPlaneProperties = null;
                createInfo.alphaMode = VK_DISPLAY_PLANE_ALPHA_OPAQUE_BIT_KHR;
                i = 0;
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            96 => {
                if (@as(c_ulong, i) < (@sizeOf(@TypeOf(alphaModes)) / @sizeOf(@TypeOf(alphaModes[@as(c_int, 0)])))) {
                    sdl_pc = 97;
                    continue;
                } else {
                    sdl_pc = 99;
                    continue;
                }
            },
            97 => {
                if ((planeCaps.supportedAlpha & alphaModes[i]) != 0) {
                    sdl_pc = 100;
                    continue;
                } else {
                    sdl_pc = 101;
                    continue;
                }
            },
            98 => {
                i +%= 1;
                {
                    sdl_pc = 96;
                    continue;
                }
            },
            99 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "vulkandisplay: Chose alpha mode 0x%x", createInfo.alphaMode);
                createInfo.imageExtent = extent;
                {
                    sdl_pc = 23;
                    continue;
                }
            },
            100 => {
                createInfo.alphaMode = alphaModes[i];
                {
                    sdl_pc = 99;
                    continue;
                }
            },
            101 => {
                {
                    sdl_pc = 102;
                    continue;
                }
            },
            102 => {
                {
                    sdl_pc = 98;
                    continue;
                }
            },
            103 => {
                _ = SDL_SetError_REAL("No usable displays found or requested display out of range");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            104 => {
                {
                    sdl_pc = 105;
                    continue;
                }
            },
            105 => {
                createInfo.sType = VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR;
                createInfo.transform = VK_SURFACE_TRANSFORM_IDENTITY_BIT_KHR;
                createInfo.globalAlpha = 1.0;
                rc = vkCreateDisplayPlaneSurfaceKHR.?(instance, &createInfo, allocator, surface);
                if (rc != VK_SUCCESS) {
                    sdl_pc = 106;
                    continue;
                } else {
                    sdl_pc = 107;
                    continue;
                }
            },
            106 => {
                _ = SDL_SetError_REAL("vkCreateDisplayPlaneSurfaceKHR failed: %s", SDL_Vulkan_GetResultString(rc));
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            107 => {
                {
                    sdl_pc = 108;
                    continue;
                }
            },
            108 => {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_VIDEO, "vulkandisplay: Created surface");
                return @"true" != 0;
            },
            else => unreachable,
        }
    }
}
pub export fn SDL_Vulkan_DestroySurface_Internal(vkGetInstanceProcAddr_: ?*anyopaque, instance: VkInstance, surface: VkSurfaceKHR, allocator: [*c]const struct_VkAllocationCallbacks) void {
    @setEvalBranchQuota(100000);
    var vkGetInstanceProcAddr: PFN_vkGetInstanceProcAddr = @ptrCast(@alignCast(vkGetInstanceProcAddr_));
    _ = &vkGetInstanceProcAddr;
    var vkDestroySurfaceKHR: PFN_vkDestroySurfaceKHR = @ptrCast(@alignCast(@constCast(vkGetInstanceProcAddr.?(instance, "vkDestroySurfaceKHR"))));
    _ = &vkDestroySurfaceKHR;
    if (vkDestroySurfaceKHR != null) {
        vkDestroySurfaceKHR.?(instance, surface, allocator);
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
