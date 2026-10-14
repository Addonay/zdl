//! Window claiming: one swapchain per presentation surface, recreated when the
//! window size changes.
//!
//! Port of SDL_ClaimWindowForGPUDevice, SDL_ReleaseWindowFromGPUDevice,
//! SDL_GetGPUSwapchainTextureFormat and SDL_AcquireGPUSwapchainTexture. The
//! caller creates the `VkSurfaceKHR` with `src/video/vulkan_surface` (the
//! surface is a `u64` handle) and passes a `SizeSource` instead of a window
//! object, so the GPU layer never depends on the windowing code. The source is
//! asked for the drawable size on every acquire. A source either carries a typed
//! context (`SizeSource.bound`) or is a plain function (`WindowSizeFn`, kept for
//! callers without state; `claim_window` is the compatibility entry point).
//!
//! Deliberate difference: SDL stores swapchains in window properties; here the
//! device keeps a list of claims keyed by surface handle. Claims are released
//! with `unclaim_window` or when the device is destroyed.

const std = @import("std");
const types = @import("../types.zig");
const device_mod = @import("device.zig");

const Device = device_mod.Device;
const Swapchain = device_mod.Swapchain;
const SwapchainOptions = device_mod.SwapchainOptions;
const Texture = device_mod.Texture;
const CommandBuffer = device_mod.CommandBuffer;
const Error = device_mod.Error;

/// A window's drawable size in pixels.
pub const WindowSize = struct {
    width: u32,
    height: u32,
};

/// Returns the window's current drawable size. Called on every acquire.
/// Context-free; prefer `SizeSource.bound` when the size depends on a window object.
pub const WindowSizeFn = *const fn () WindowSize;

/// Where a claim reads the window's drawable size from.
pub const SizeSource = union(enum) {
    /// A context-free function (the original interface).
    function: WindowSizeFn,
    /// A typed context and a function that reads it, erased by `bound`.
    context: Bound,

    pub const Bound = struct {
        pointer: *anyopaque,
        get: *const fn (*anyopaque) WindowSize,
    };

    /// Builds a source from a pointer to caller state and a function taking that
    /// exact pointer type. The pointee must outlive the claim and stay at its address.
    pub fn bound(comptime T: type, pointer: *T, comptime getter: fn (*T) WindowSize) SizeSource {
        const Thunk = struct {
            fn get(erased: *anyopaque) WindowSize {
                const typed: *T = @ptrCast(@alignCast(erased));
                return getter(typed);
            }
        };
        return .{ .context = .{ .pointer = pointer, .get = Thunk.get } };
    }

    /// The window's drawable size now.
    pub fn read(self: SizeSource) WindowSize {
        return switch (self) {
            .function => |f| f(),
            .context => |c| c.get(c.pointer),
        };
    }
};

/// A window claimed by a device. The swapchain lives on the heap so its address
/// stays stable while command buffers refer to it.
pub const Claim = struct {
    surface: u64,
    swapchain: *Swapchain,
    size: SizeSource,
    options: SwapchainOptions,
    /// Size the swapchain was last created for, used to skip redundant recreation.
    requested: WindowSize,
};

/// Claims `surface` for the device and creates its swapchain at the size the
/// window reports now. Fails with `WindowAlreadyClaimed` when the surface is
/// claimed, and with `ZeroExtent` when the window has no drawable area yet.
pub fn claim_window_with(dev: *Device, surface: u64, options: SwapchainOptions, size: SizeSource) Error!void {
    if (find(dev, surface) != null) return error.WindowAlreadyClaimed;
    const requested = size.read();
    if (requested.width == 0 or requested.height == 0) return error.ZeroExtent;
    var opts = options;
    opts.width = requested.width;
    opts.height = requested.height;

    const swapchain = try dev.allocator.create(Swapchain);
    errdefer dev.allocator.destroy(swapchain);
    swapchain.* = try Swapchain.create(dev, surface, opts);
    errdefer swapchain.deinit();

    try dev.claims.append(dev.allocator, .{
        .surface = surface,
        .swapchain = swapchain,
        .size = size,
        .options = options,
        .requested = requested,
    });
}

/// Compatibility wrapper over `claim_window_with` for a context-free size function.
pub fn claim_window(dev: *Device, surface: u64, options: SwapchainOptions, size: WindowSizeFn) Error!void {
    return claim_window_with(dev, surface, options, .{ .function = size });
}

/// Releases a claimed window: waits for the GPU and destroys its swapchain. The
/// surface stays owned by the caller. Does nothing for unclaimed surfaces.
pub fn unclaim_window(dev: *Device, surface: u64) void {
    for (dev.claims.items, 0..) |claim, i| {
        if (claim.surface != surface) continue;
        claim.swapchain.deinit();
        dev.allocator.destroy(claim.swapchain);
        _ = dev.claims.swapRemove(i);
        return;
    }
}

/// Format of the swapchain textures `surface` renders into.
pub fn get_swapchain_texture_format(dev: *Device, surface: u64) Error!types.TextureFormat {
    const claim = find(dev, surface) orelse return error.WindowNotClaimed;
    return claim.swapchain.format;
}

/// Acquires the next swapchain texture of a claimed window for `cb`. Recreates
/// the swapchain first when the window's size changed, and once more if the
/// acquire reports the swapchain out of date. Returns null while the window has
/// no drawable area (minimized), as `CommandBuffer.acquire_swapchain_texture`.
pub fn acquire_window_texture(cb: *CommandBuffer, surface: u64) Error!?*Texture {
    const claim = find(cb.device, surface) orelse return error.WindowNotClaimed;
    const size = claim.size.read();
    // An existing swapchain still reports its old nonzero extent after the
    // window is minimized. Do not acquire from it while the drawable is empty.
    if (size.width == 0 or size.height == 0) return null;
    if (size.width != claim.requested.width or size.height != claim.requested.height) {
        recreate(claim, size) catch |err| switch (err) {
            // The surface can become minimized between the size callback and
            // the capability query, just as in SDL's TRY_AGAIN path.
            error.ZeroExtent => return null,
            else => return err,
        };
    }
    return cb.acquire_swapchain_texture(claim.swapchain) catch |err| switch (err) {
        error.SwapchainOutOfDate => {
            const next_size = claim.size.read();
            if (next_size.width == 0 or next_size.height == 0) return null;
            recreate(claim, next_size) catch |recreate_error| switch (recreate_error) {
                error.ZeroExtent => return null,
                else => return recreate_error,
            };
            return cb.acquire_swapchain_texture(claim.swapchain);
        },
        else => return err,
    };
}

fn recreate(claim: *Claim, size: WindowSize) Error!void {
    var opts = claim.options;
    opts.width = size.width;
    opts.height = size.height;
    try claim.swapchain.recreate(opts);
    claim.requested = size;
}

fn find(dev: *Device, surface: u64) ?*Claim {
    for (dev.claims.items) |*claim| {
        if (claim.surface == surface) return claim;
    }
    return null;
}
