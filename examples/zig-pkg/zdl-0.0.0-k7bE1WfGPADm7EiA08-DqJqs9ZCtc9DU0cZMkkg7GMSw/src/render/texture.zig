//! Renderer textures: owned pixel storage with SDL_Texture's access modes,
//! color/alpha modulation, blend mode and scale mode.
//!
//! A texture owns its `surface.Surface` and therefore its allocator capture.
//! Its pixels are reached through borrowed `surface.View`s: `view` for reads and
//! ordinary drawing, `lock` for streaming writes and `update` for copying in a
//! caller-owned source raster. Render targets are textures with `Access.target`;
//! the renderer draws into them, and their pixels remain readable afterwards.
//!
//! There is no GPU upload, no texture registry and no implicit renderer binding.
//! A texture is a plain value that the caller places wherever it lives and
//! deinitializes once no renderer borrows it. Deviation from SDL: SDL's texture
//! lock returns a pitched pointer that is uploaded on unlock; here `lock` returns
//! a view into the storage itself, so writes are visible immediately and `unlock`
//! only releases the exclusive borrow flag.
// Ported from render/SDL_render.c (SDL_CreateTexture, SDL_LockTexture,
// SDL_UpdateTexture, SDL_SetTextureBlendMode, SDL_SetTextureColorMod/AlphaMod,
// SDL_SetTextureScaleMode) and the software backend's texture storage.
const std = @import("std");
const surface = @import("../video/surface.zig");
const pixels = @import("../video/pixels.zig");
const geometry = @import("../video/geometry.zig");

/// Texture operations report pixel/storage failures and access-mode misuse.
pub const Error = surface.Error || geometry.GeometryError || error{
    /// Lock/update of a texture whose access mode does not allow it.
    WrongAccess,
    /// `lock` was called while a previous lock is still outstanding.
    AlreadyLocked,
    /// `unlock` was called without a matching `lock`.
    NotLocked,
    /// A region is empty or extends outside the texture.
    InvalidRect,
    /// A format conversion or sub-view needs whole bytes per pixel at the origin.
    Unsupported,
};

/// SDL_TextureAccess. `static` textures are written with `update`; `streaming`
/// textures additionally support `lock`; `target` textures can be drawn into.
pub const Access = enum { static, streaming, target };
/// Sampling policy, identical to the raster module's scale modes.
pub const ScaleMode = surface.ScaleMode;
/// Blend equations; see `surface.Blend` for the predefined SDL-equivalent modes.
pub const Blend = surface.Blend;
/// Integer pixel rectangle (right and bottom edges excluded).
pub const Rect = geometry.Rect(i32);
/// Floating-point rectangle (boundaries included).
pub const FRect = geometry.Rect(f32);

/// Pixel storage plus rendering state. Do not move a texture while a renderer
/// or a lock borrows its storage; the storage pointer itself is heap-allocated.
pub const Texture = struct {
    storage: surface.Surface,
    access: Access,
    /// Blend used when this texture is drawn. Defaults follow SDL: textures with
    /// alpha blend with `ALPHA`, others replace.
    blend: Blend,
    /// RGB modulation multiplied into sampled colors (alpha channel ignored).
    color_mod: pixels.Color = .{ .r = 255, .g = 255, .b = 255 },
    /// Alpha modulation multiplied into sampled alpha.
    alpha_mod: u8 = 255,
    /// Sampling used when source and destination sizes differ.
    scale_mode: ScaleMode = .linear,
    /// Set between `lock` and `unlock`; prevents overlapping writable borrows.
    locked: bool = false,

    /// Creates a zeroed texture. Palette storage is borrowed and must outlive
    /// the texture; it is required for indexed formats and ignored otherwise.
    pub fn init(allocator: std.mem.Allocator, pixel_width: u31, pixel_height: u31, format: pixels.Format, palette: ?[]const pixels.Color, access: Access) Error!Texture {
        const storage = try surface.Surface.init(allocator, pixel_width, pixel_height, format, palette);
        return .{ .storage = storage, .access = access, .blend = default_blend(format) };
    }

    /// Creates a texture holding an independent copy of `source`'s pixels.
    pub fn init_copy(allocator: std.mem.Allocator, source: surface.View, access: Access) Error!Texture {
        const storage = try surface.Surface.copy(allocator, source);
        return .{ .storage = storage, .access = access, .blend = default_blend(source.format) };
    }

    /// Releases storage. Borrowed views and locks become invalid.
    pub fn deinit(self: *Texture) void {
        self.storage.deinit();
        self.* = undefined;
    }

    /// Width in pixels.
    pub fn width(self: Texture) u31 {
        return self.storage.view.width;
    }

    /// Height in pixels.
    pub fn height(self: Texture) u31 {
        return self.storage.view.height;
    }

    /// Current storage format; it changes only through `convert`.
    pub fn pixel_format(self: Texture) pixels.Format {
        return self.storage.view.format;
    }

    /// Full-texture bounds in pixel coordinates.
    pub fn bounds(self: Texture) Rect {
        return self.storage.view.bounds();
    }

    /// Borrowed view of the complete storage. Valid until `deinit`/`convert`.
    pub fn view(self: *Texture) surface.View {
        return self.storage.view;
    }

    /// Sets the blend mode used when this texture is drawn.
    pub fn set_blend(self: *Texture, blend: Blend) void {
        self.blend = blend;
    }

    /// Sets RGB modulation. Modulation scales sampled colors as `c * mod / 255`.
    pub fn set_color_mod(self: *Texture, red: u8, green: u8, blue: u8) void {
        self.color_mod = .{ .r = red, .g = green, .b = blue };
    }

    /// Sets alpha modulation applied on top of the source alpha.
    pub fn set_alpha_mod(self: *Texture, alpha: u8) void {
        self.alpha_mod = alpha;
    }

    /// Sets the sampling policy for scaled draws.
    pub fn set_scale_mode(self: *Texture, mode: ScaleMode) void {
        self.scale_mode = mode;
    }

    /// Copies `source` into `region` (or the whole texture when null). The source
    /// is converted to this texture's format through the byte-color path and
    /// clipped to the destination; overlapping storage is handled by `View.blit`.
    /// Target textures reject updates: draw into them with a renderer instead.
    pub fn update(self: *Texture, region: ?Rect, source: surface.View) Error!void {
        if (self.access == .target) return error.WrongAccess;
        const destination = if (region) |requested| (try self.bounds().intersection(requested)) orelse return error.InvalidRect else self.bounds();
        if (destination.is_empty()) return error.InvalidRect;
        const allocator = self.storage.allocator;
        _ = try self.storage.view.blit(allocator, source, .{
            .destination = .{ .x = destination.x, .y = destination.y },
            .clip = destination,
        });
    }

    /// Acquires a writable view of a streaming texture's `region`. The returned
    /// view aliases the storage and is valid until `unlock`. Failure leaves the
    /// texture unlocked.
    pub fn lock(self: *Texture, region: Rect) Error!surface.View {
        if (self.access != .streaming) return error.WrongAccess;
        if (self.locked) return error.AlreadyLocked;
        const selected = (try self.bounds().intersection(region)) orelse return error.InvalidRect;
        if (selected.is_empty()) return error.InvalidRect;
        const sub = try self.sub_view(selected);
        self.locked = true;
        return sub;
    }

    /// Releases the exclusive lock obtained from `lock`. Storage is updated in
    /// place, so there is no upload step.
    pub fn unlock(self: *Texture) Error!void {
        if (!self.locked) return error.NotLocked;
        self.locked = false;
    }

    /// Replaces the storage with a converted copy in `format` and `palette`.
    /// Outstanding views of the old storage become invalid. Not allowed while a
    /// lock is held.
    pub fn convert(self: *Texture, format_next: pixels.Format, palette: ?[]const pixels.Color) Error!void {
        if (self.locked) return error.AlreadyLocked;
        var next = try surface.Surface.convert(self.storage.allocator, self.storage.view, format_next, palette);
        errdefer next.deinit();
        self.storage.deinit();
        self.storage = next;
        self.blend = default_blend(format_next);
    }

    /// Borrowed view of `region`, which must lie inside the texture. Sub-views
    /// need whole bytes per pixel at the region origin so the row arithmetic is
    /// byte-addressed; sub-byte formats return Unsupported.
    pub fn sub_view(self: *Texture, region: Rect) Error!surface.View {
        const full = self.storage.view;
        if (region.x < 0 or region.y < 0) return error.InvalidRect;
        if (region.width <= 0 or region.height <= 0) return error.InvalidRect;
        if (@as(i64, region.x) + region.width > full.width or @as(i64, region.y) + region.height > full.height) return error.InvalidRect;
        const bits = full.format.bits_per_pixel();
        if (bits % 8 != 0) {
            // Sub-byte formats only support whole-byte origins.
            if ((@as(usize, @intCast(region.x)) * bits) % 8 != 0) return error.Unsupported;
        }
        const x_bytes = (@as(usize, @intCast(region.x)) * bits) / 8;
        const offset = @as(usize, @intCast(region.y)) * full.stride + x_bytes;
        if (offset > full.data.len) return error.InvalidBuffer;
        return surface.View.init(full.data[offset..], @intCast(region.width), @intCast(region.height), full.stride, full.format, full.palette);
    }
};

fn default_blend(format: pixels.Format) Blend {
    return switch (format) {
        .rgba8, .bgra8, .argb8, .abgr8 => Blend.ALPHA,
        else => Blend.REPLACE,
    };
}
