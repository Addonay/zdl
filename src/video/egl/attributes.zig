//! OpenGL and OpenGL ES attribute model: the options struct that replaces
//! SDL_GL_SetAttribute/SDL_GL_GetAttribute (SDL_video.c). The defaults match
//! SDL_GL_ResetAttributes for a desktop OpenGL build (8/8/8/8 colour, 16-bit
//! depth, double buffered, GL 2.1, flush release behaviour).
//!
//! Nothing here calls the driver. `config_list` and `context_list` turn an
//! `Attributes` value into EGL attribute lists (name/value pairs terminated by
//! EGL_NONE) whose names and values are the EGL 1.4 and KHR_create_context
//! constants below. Those constants are plain integers, not C declarations.
//!
//! Deliberate differences from SDL's EGL path:
//! - Accumulation buffers, stereo, retained backing and accelerated-visual
//!   requests are not modelled: EGL has no equivalent and SDL's EGL path
//!   ignores them too.
//! - Context share is an explicit argument of `Context.create`, not a flag.

/// EGL attribute names and values used by the list builders (EGL 1.4 headers).
pub const egl = struct {
    pub const red_size: i32 = 0x3024;
    pub const green_size: i32 = 0x3023;
    pub const blue_size: i32 = 0x3022;
    pub const alpha_size: i32 = 0x3021;
    pub const buffer_size: i32 = 0x3020;
    pub const depth_size: i32 = 0x3025;
    pub const stencil_size: i32 = 0x3026;
    pub const sample_buffers: i32 = 0x3032;
    pub const samples: i32 = 0x3031;
    pub const config_caveat: i32 = 0x3027;
    pub const surface_type: i32 = 0x3033;
    pub const native_visual_id: i32 = 0x302E;
    pub const width: i32 = 0x3057;
    pub const height: i32 = 0x3056;
    pub const renderable_type: i32 = 0x3040;
    pub const window_bit: i32 = 0x0004;
    pub const pbuffer_bit: i32 = 0x0001;
    pub const opengl_bit: i32 = 0x0008;
    pub const opengl_es_bit: i32 = 0x0001;
    pub const opengl_es2_bit: i32 = 0x0004;
    pub const opengl_es3_bit: i32 = 0x0040;
    pub const dont_care: i32 = -1;
    pub const none: i32 = 0x3038;
    pub const color_component_type_ext: i32 = 0x3339;
    pub const color_component_type_float_ext: i32 = 0x333B;
    pub const gl_colorspace: i32 = 0x309D;
    pub const gl_colorspace_srgb: i32 = 0x3089;
    pub const gl_colorspace_linear: i32 = 0x308A;
    pub const context_client_version: i32 = 0x3098;
    pub const context_major_version: i32 = 0x3098;
    pub const context_minor_version: i32 = 0x30FB;
    pub const context_profile_mask: i32 = 0x30FD;
    pub const context_flags: i32 = 0x30FC;
    pub const context_no_error: i32 = 0x31B3;
    pub const context_release_behavior: i32 = 0x2097;
    pub const context_release_behavior_none: i32 = 0;
    pub const context_release_behavior_flush: i32 = 0x2098;
    pub const context_reset_notification_strategy: i32 = 0x31BD;
    pub const no_reset_notification: i32 = 0x31BE;
    pub const lose_context_on_reset: i32 = 0x31BF;
};

/// Which context API the caller wants. `default` is desktop OpenGL with the
/// implementation choosing the profile; `es` selects EGL_OPENGL_ES_API.
pub const Profile = enum {
    default,
    core,
    compatibility,
    es,
};

/// Context flags. The bit positions match SDL_GL_CONTEXT_*_FLAG and, for the
/// first three, the EGL_CONTEXT_OPENGL_*_BIT_KHR values, so they pass through
/// unchanged as EGL_CONTEXT_FLAGS_KHR (as SDL does).
pub const ContextFlags = packed struct(u32) {
    debug: bool = false,
    forward_compatible: bool = false,
    robust_access: bool = false,
    reset_isolation: bool = false,
    _: u28 = 0,

    /// The EGL_CONTEXT_FLAGS_KHR value.
    pub fn bits(self: ContextFlags) i32 {
        return @bitCast(@as(u32, @bitCast(self)));
    }
};

/// Requested behaviour when the context is released. Only applied when the
/// display advertises EGL_KHR_context_flush_control; otherwise the EGL default
/// (flush) applies, which is also SDL's default.
pub const ReleaseBehavior = enum { none, flush };

/// Requested reset notification. Only applied when the display advertises
/// EGL_EXT_create_context_robustness.
pub const ResetNotification = enum { none, lose_context };

/// OpenGL / OpenGL ES context and framebuffer requirements. Pass to
/// `Display.choose_config` and `Context.create`. Field defaults are SDL's.
pub const Attributes = struct {
    red_size: u8 = 8,
    green_size: u8 = 8,
    blue_size: u8 = 8,
    alpha_size: u8 = 8,
    /// Total colour buffer size in bits; 0 leaves it unconstrained.
    buffer_size: u8 = 0,
    depth_size: u8 = 16,
    stencil_size: u8 = 0,
    double_buffer: bool = true,
    /// Requests EGL_SAMPLE_BUFFERS / EGL_SAMPLES when non-zero.
    multisample_buffers: u8 = 0,
    multisample_samples: u8 = 0,
    /// Requests EGL_COLOR_COMPONENT_TYPE_FLOAT_EXT (EGL_EXT_pixel_format_float).
    float_buffers: bool = false,
    /// Requested sRGB framebuffer. Applied to the window surface through
    /// EGL_GL_COLORSPACE when EGL_KHR_gl_colorspace is present; false selects
    /// linear, as SDL's default does.
    framebuffer_srgb: bool = false,
    profile: Profile = .default,
    major_version: u8 = 2,
    minor_version: u8 = 1,
    flags: ContextFlags = .{},
    /// Requests EGL_CONTEXT_OPENGL_NO_ERROR_KHR (EGL_KHR_create_context_no_error).
    no_error: bool = false,
    release_behavior: ReleaseBehavior = .flush,
    reset_notification: ResetNotification = .none,

    /// Checks the combinations that cannot produce a context.
    pub fn validate(self: Attributes) error{InvalidAttributes}!void {
        if (self.major_version == 0) return error.InvalidAttributes;
    }

    /// The desktop-OpenGL-or-ES API this request binds.
    pub fn api(self: Attributes) Api {
        return if (self.profile == .es) .es else .gl;
    }
};

/// Client API selected for config and context attribute lists.
pub const Api = enum { gl, es };

/// Driver capabilities that decide which context attributes are representable.
pub const ContextSupport = struct {
    /// EGL_KHR_create_context: major/minor version, profile mask and flags.
    create_context: bool = false,
    /// EGL_KHR_create_context_no_error.
    no_error: bool = false,
    /// EGL_KHR_context_flush_control.
    flush_control: bool = false,
    /// EGL_EXT_create_context_robustness.
    robustness: bool = false,
};

/// A fixed-capacity EGL attribute list: name/value pairs followed by EGL_NONE.
/// The backing array lives in the caller's stack frame; `slice` borrows it.
pub fn AttributeList(comptime capacity: usize) type {
    return struct {
        const Self = @This();

        items: [2 * capacity + 1]i32 = undefined,
        len: usize = 0,

        pub fn append(self: *Self, name: i32, value: i32) error{AttributeListFull}!void {
            if (self.len + 3 > self.items.len) return error.AttributeListFull;
            self.items[self.len] = name;
            self.items[self.len + 1] = value;
            self.len += 2;
        }

        /// The pairs with EGL_NONE appended; suitable for an `[*]const i32` argument.
        pub fn terminated(self: *Self) []const i32 {
            self.items[self.len] = egl.none;
            return self.items[0 .. self.len + 1];
        }

        /// The pairs without the terminator, for inspection.
        pub fn pairs(self: *const Self) []const i32 {
            return self.items[0..self.len];
        }
    };
}

/// Capacity of the config and context lists. Both fit in one stack frame.
pub const max_list_pairs = 24;
pub const ConfigList = AttributeList(max_list_pairs);
pub const ContextList = AttributeList(max_list_pairs);

/// Builds the eglChooseConfig request for `attributes`, following the request
/// SDL_EGL_PrivateChooseConfig makes. `renderable` is the EGL_RENDERABLE_TYPE
/// bit (see `renderable_type`). `caveat_none` requests EGL_CONFIG_CAVEAT ==
/// EGL_NONE, which SDL tries first to avoid slow and non-conformant configs.
pub fn config_list(attributes: Attributes, renderable: i32, caveat_none: bool) ConfigList {
    return config_list_for_surface(attributes, renderable, caveat_none, egl.window_bit);
}

/// Builds an `eglChooseConfig` request for a window or pbuffer surface.
pub fn config_list_for_surface(attributes: Attributes, renderable: i32, caveat_none: bool, surface_bit: i32) ConfigList {
    var list: ConfigList = .{};
    // Capacity is fixed and far above the maximum pair count, so these cannot fail.
    list.append(egl.red_size, attributes.red_size) catch unreachable;
    list.append(egl.green_size, attributes.green_size) catch unreachable;
    list.append(egl.blue_size, attributes.blue_size) catch unreachable;
    if (caveat_none) list.append(egl.config_caveat, egl.none) catch unreachable;
    if (attributes.alpha_size != 0) list.append(egl.alpha_size, attributes.alpha_size) catch unreachable;
    if (attributes.buffer_size != 0) list.append(egl.buffer_size, attributes.buffer_size) catch unreachable;
    if (attributes.depth_size != 0) list.append(egl.depth_size, attributes.depth_size) catch unreachable;
    if (attributes.stencil_size != 0) list.append(egl.stencil_size, attributes.stencil_size) catch unreachable;
    if (attributes.multisample_buffers != 0) list.append(egl.sample_buffers, attributes.multisample_buffers) catch unreachable;
    if (attributes.multisample_samples != 0) list.append(egl.samples, attributes.multisample_samples) catch unreachable;
    if (attributes.float_buffers) list.append(egl.color_component_type_ext, egl.color_component_type_float_ext) catch unreachable;
    list.append(egl.surface_type, surface_bit) catch unreachable;
    list.append(egl.renderable_type, renderable) catch unreachable;
    return list;
}

/// The EGL_RENDERABLE_TYPE bit for `attributes`, given the driver support.
/// GLES 3 needs EGL_KHR_create_context to be advertised; without it GLES 2 is
/// requested, matching SDL_EGL_PrivateChooseConfig.
pub fn renderable_type(attributes: Attributes, es3_supported: bool) i32 {
    if (attributes.profile != .es) return egl.opengl_bit;
    if (attributes.major_version >= 3 and es3_supported) return egl.opengl_es3_bit;
    if (attributes.major_version >= 2) return egl.opengl_es2_bit;
    return egl.opengl_es_bit;
}

/// Builds the eglCreateContext attribute list, following SDL_EGL_CreateContext.
/// Old-style GLES contexts (major < 3, no flags, no desktop profile) are
/// requested with EGL_CONTEXT_CLIENT_VERSION, which needs no KHR extension.
/// Every other request needs EGL_KHR_create_context; without it the call fails
/// with `error.ContextAttributesUnsupported`, as SDL does.
pub fn context_list(attributes: Attributes, support: ContextSupport) error{ ContextAttributesUnsupported, AttributeListFull }!ContextList {
    var list: ContextList = .{};
    const es = attributes.profile == .es;
    const flags = attributes.flags.bits();
    const legacy_path = (attributes.major_version < 3 or (attributes.minor_version == 0 and es)) and
        flags == 0 and (attributes.profile == .default or es);
    if (legacy_path) {
        if (es) try list.append(egl.context_client_version, @max(attributes.major_version, 1));
    } else {
        if (!support.create_context) return error.ContextAttributesUnsupported;
        try list.append(egl.context_major_version, attributes.major_version);
        try list.append(egl.context_minor_version, attributes.minor_version);
        switch (attributes.profile) {
            .core => try list.append(egl.context_profile_mask, 0x1),
            .compatibility => try list.append(egl.context_profile_mask, 0x2),
            .default, .es => {},
        }
        if (flags != 0) try list.append(egl.context_flags, flags);
    }
    if (attributes.no_error and support.no_error) try list.append(egl.context_no_error, 1);
    if (attributes.release_behavior == .none and support.flush_control) {
        try list.append(egl.context_release_behavior, egl.context_release_behavior_none);
    }
    if (attributes.reset_notification == .lose_context and support.robustness) {
        try list.append(egl.context_reset_notification_strategy, egl.lose_context_on_reset);
    }
    return list;
}
