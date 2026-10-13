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
pub extern fn memcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_memcmp_REAL(s1: ?*const anyopaque, s2: ?*const anyopaque, len: usize) c_int;
pub extern fn SDL_snprintf_REAL(text: [*c]u8, maxlen: usize, fmt: [*c]const u8, ...) c_int;
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
pub extern fn SDL_GL_GetProcAddress_REAL(proc: [*c]const u8) SDL_FunctionPointer;
pub extern fn SDL_GL_ExtensionSupported_REAL(extension: [*c]const u8) bool;
pub const SDL_LOG_CATEGORY_RENDER: c_int = 6;
pub extern fn SDL_LogDebug_REAL(category: c_int, fmt: [*c]const u8, ...) void;
pub const SHADER_NONE: c_int = 0;
pub const SHADER_PALETTE_LINEAR: c_int = 3;
pub const SHADER_PALETTE_PIXELART: c_int = 4;
pub const SHADER_RGB_PIXELART: c_int = 6;
pub const SHADER_RGBA_PIXELART: c_int = 8;
pub const SHADER_YUV: c_int = 9;
pub const NUM_SHADERS: c_int = 14;
pub const GL_Shader = c_int;
pub const struct_GL_ShaderContext = extern struct {
    glGetError: ?*const fn () callconv(.c) GLenum = null,
    glAttachObjectARB: PFNGLATTACHOBJECTARBPROC = null,
    glCompileShaderARB: PFNGLCOMPILESHADERARBPROC = null,
    glCreateProgramObjectARB: PFNGLCREATEPROGRAMOBJECTARBPROC = null,
    glCreateShaderObjectARB: PFNGLCREATESHADEROBJECTARBPROC = null,
    glDeleteObjectARB: PFNGLDELETEOBJECTARBPROC = null,
    glGetInfoLogARB: PFNGLGETINFOLOGARBPROC = null,
    glGetObjectParameterivARB: PFNGLGETOBJECTPARAMETERIVARBPROC = null,
    glGetUniformLocationARB: PFNGLGETUNIFORMLOCATIONARBPROC = null,
    glLinkProgramARB: PFNGLLINKPROGRAMARBPROC = null,
    glShaderSourceARB: PFNGLSHADERSOURCEARBPROC = null,
    glUniform1iARB: PFNGLUNIFORM1IARBPROC = null,
    glUniform1fARB: PFNGLUNIFORM1FARBPROC = null,
    glUniform3fARB: PFNGLUNIFORM3FARBPROC = null,
    glUniform4fARB: PFNGLUNIFORM4FARBPROC = null,
    glUseProgramObjectARB: PFNGLUSEPROGRAMOBJECTARBPROC = null,
    GL_ARB_texture_rectangle_supported: bool = false,
    shaders: [14]GL_ShaderData = @import("std").mem.zeroes([14]GL_ShaderData),
    shader_params: [14][*c]f32 = @import("std").mem.zeroes([14][*c]f32),
};
pub const GL_ShaderContext = struct_GL_ShaderContext;
pub export fn GL_CreateShaderContext() [*c]GL_ShaderContext {
    @setEvalBranchQuota(100000);
    var ctx: [*c]GL_ShaderContext = undefined;
    _ = &ctx;
    var shaders_supported: bool = undefined;
    _ = &shaders_supported;
    var i: c_int = undefined;
    _ = &i;
    ctx = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(@TypeOf(ctx.*)))));
    if (!(ctx != null)) {
        return null;
    }
    if (!SDL_GL_ExtensionSupported_REAL("GL_ARB_texture_non_power_of_two") and (SDL_GL_ExtensionSupported_REAL("GL_ARB_texture_rectangle") or SDL_GL_ExtensionSupported_REAL("GL_EXT_texture_rectangle"))) {
        ctx.*.GL_ARB_texture_rectangle_supported = @"true" != 0;
    }
    shaders_supported = @"false" != 0;
    if (((SDL_GL_ExtensionSupported_REAL("GL_ARB_shader_objects") and SDL_GL_ExtensionSupported_REAL("GL_ARB_shading_language_100")) and SDL_GL_ExtensionSupported_REAL("GL_ARB_vertex_shader")) and SDL_GL_ExtensionSupported_REAL("GL_ARB_fragment_shader")) {
        ctx.*.glGetError = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetError"))));
        ctx.*.glAttachObjectARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glAttachObjectARB"))));
        ctx.*.glCompileShaderARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glCompileShaderARB"))));
        ctx.*.glCreateProgramObjectARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glCreateProgramObjectARB"))));
        ctx.*.glCreateShaderObjectARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glCreateShaderObjectARB"))));
        ctx.*.glDeleteObjectARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glDeleteObjectARB"))));
        ctx.*.glGetInfoLogARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetInfoLogARB"))));
        ctx.*.glGetObjectParameterivARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetObjectParameterivARB"))));
        ctx.*.glGetUniformLocationARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glGetUniformLocationARB"))));
        ctx.*.glLinkProgramARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glLinkProgramARB"))));
        ctx.*.glShaderSourceARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glShaderSourceARB"))));
        ctx.*.glUniform1iARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glUniform1iARB"))));
        ctx.*.glUniform1fARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glUniform1fARB"))));
        ctx.*.glUniform3fARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glUniform3fARB"))));
        ctx.*.glUniform4fARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glUniform4fARB"))));
        ctx.*.glUseProgramObjectARB = @ptrCast(@alignCast(@constCast(SDL_GL_GetProcAddress_REAL("glUseProgramObjectARB"))));
        if (((((((((((((((ctx.*.glGetError != null) and (ctx.*.glAttachObjectARB != null)) and (ctx.*.glCompileShaderARB != null)) and (ctx.*.glCreateProgramObjectARB != null)) and (ctx.*.glCreateShaderObjectARB != null)) and (ctx.*.glDeleteObjectARB != null)) and (ctx.*.glGetInfoLogARB != null)) and (ctx.*.glGetObjectParameterivARB != null)) and (ctx.*.glGetUniformLocationARB != null)) and (ctx.*.glLinkProgramARB != null)) and (ctx.*.glShaderSourceARB != null)) and (ctx.*.glUniform1iARB != null)) and (ctx.*.glUniform1fARB != null)) and (ctx.*.glUniform3fARB != null)) and (ctx.*.glUseProgramObjectARB != null)) {
            shaders_supported = @"true" != 0;
        }
    }
    if (!shaders_supported) {
        SDL_free_REAL(@ptrCast(@alignCast(ctx)));
        return null;
    }
    {
        i = 0;
        while (i < NUM_SHADERS) : (i += 1) {
            if (!CompileShaderProgram(ctx, i, &ctx.*.shaders[@bitCast(@as(isize, @intCast(i)))])) {
                DestroyShaderProgram(ctx, &ctx.*.shaders[@bitCast(@as(isize, @intCast(i)))]);
            }
        }
    }
    return ctx;
}
pub export fn GL_SupportsShader(ctx: [*c]GL_ShaderContext, shader: GL_Shader) bool {
    @setEvalBranchQuota(100000);
    return (ctx != null) and (ctx.*.shaders[@bitCast(@as(isize, @intCast(shader)))].program != 0);
}
pub export fn GL_SelectShader(ctx: [*c]GL_ShaderContext, arg_shader: GL_Shader, shader_params: [*c]const f32) void {
    @setEvalBranchQuota(100000);
    var shader = arg_shader;
    _ = &shader;
    const static_local___func__ = struct {
        const __func__: [15:0]u8 = "GL_SelectShader".*;
    };
    _ = &static_local___func__;
    var location: GLint = undefined;
    _ = &location;
    var program: GLhandleARB = ctx.*.shaders[@bitCast(@as(isize, @intCast(shader)))].program;
    _ = &program;
    ctx.*.glUseProgramObjectARB.?(program);
    var shader_params_len: c_int = 0;
    _ = &shader_params_len;
    if ((((shader == SHADER_PALETTE_LINEAR) or (shader == SHADER_PALETTE_PIXELART)) or (shader == SHADER_RGB_PIXELART)) or (shader == SHADER_RGBA_PIXELART)) {
        shader_params_len = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 4) *% @sizeOf(f32))));
    } else if (shader >= SHADER_YUV) {
        shader_params_len = @bitCast(@as(c_uint, @truncate(@as(c_ulong, 16) *% @sizeOf(f32))));
    }
    while (true) {
        while (!(!(shader_params != null) or (shader_params_len > @as(c_int, 0)))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "!shader_params || shader_params_len > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_shaders_gl.c", 713);
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
    if ((shader_params != null) and (!(ctx.*.shader_params[@bitCast(@as(isize, @intCast(shader)))] != null) or (SDL_memcmp_REAL(@ptrCast(@alignCast(shader_params)), @ptrCast(@alignCast(ctx.*.shader_params[@bitCast(@as(isize, @intCast(shader)))])), @bitCast(@as(c_long, shader_params_len))) != @as(c_int, 0)))) {
        if ((((shader == SHADER_PALETTE_LINEAR) or (shader == SHADER_PALETTE_PIXELART)) or (shader == SHADER_RGB_PIXELART)) or (shader == SHADER_RGBA_PIXELART)) {
            location = ctx.*.glGetUniformLocationARB.?(program, "texel_size");
            if (location >= @as(c_int, 0)) {
                ctx.*.glUniform4fARB.?(location, shader_params[@as(c_int, 0)], shader_params[@as(c_int, 1)], shader_params[@as(c_int, 2)], shader_params[@as(c_int, 3)]);
            }
        }
        if (shader >= SHADER_YUV) {
            location = ctx.*.glGetUniformLocationARB.?(program, "Yoffset");
            if (location >= @as(c_int, 0)) {
                ctx.*.glUniform3fARB.?(location, shader_params[@as(c_int, 0)], shader_params[@as(c_int, 1)], shader_params[@as(c_int, 2)]);
            }
            location = ctx.*.glGetUniformLocationARB.?(program, "Rcoeff");
            if (location >= @as(c_int, 0)) {
                ctx.*.glUniform3fARB.?(location, shader_params[@as(c_int, 4)], shader_params[@as(c_int, 5)], shader_params[@as(c_int, 6)]);
            }
            location = ctx.*.glGetUniformLocationARB.?(program, "Gcoeff");
            if (location >= @as(c_int, 0)) {
                ctx.*.glUniform3fARB.?(location, shader_params[@as(c_int, 8)], shader_params[@as(c_int, 9)], shader_params[@as(c_int, 10)]);
            }
            location = ctx.*.glGetUniformLocationARB.?(program, "Bcoeff");
            if (location >= @as(c_int, 0)) {
                ctx.*.glUniform3fARB.?(location, shader_params[@as(c_int, 12)], shader_params[@as(c_int, 13)], shader_params[@as(c_int, 14)]);
            }
        }
        if (!(ctx.*.shader_params[@bitCast(@as(isize, @intCast(shader)))] != null)) {
            ctx.*.shader_params[@bitCast(@as(isize, @intCast(shader)))] = @ptrCast(@alignCast(SDL_malloc_REAL(@bitCast(@as(c_long, shader_params_len)))));
        }
        if (ctx.*.shader_params[@bitCast(@as(isize, @intCast(shader)))] != null) {
            _ = memcpy(@ptrCast(@alignCast(ctx.*.shader_params[@bitCast(@as(isize, @intCast(shader)))])), @ptrCast(@alignCast(shader_params)), @bitCast(@as(c_long, shader_params_len)));
        }
    }
}
pub export fn GL_DestroyShaderContext(ctx: [*c]GL_ShaderContext) void {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    {
        i = 0;
        while (i < NUM_SHADERS) : (i += 1) {
            DestroyShaderProgram(ctx, &ctx.*.shaders[@bitCast(@as(isize, @intCast(i)))]);
            SDL_free_REAL(@ptrCast(@alignCast(ctx.*.shader_params[@bitCast(@as(isize, @intCast(i)))])));
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(ctx)));
}

pub const SDL_MAX_SMALL_ALLOC_STACKSIZE = @as(c_int, 128);
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const GLenum = c_uint;
pub const GLint = c_int;
pub const GLsizei = c_int;
pub const GLfloat = f32;
pub extern fn glGetError() GLenum;
pub const GLhandleARB = c_uint;
pub const GLcharARB = u8;
pub const PFNGLDELETEOBJECTARBPROC = ?*const fn (obj: GLhandleARB) callconv(.c) void;
pub const PFNGLCREATESHADEROBJECTARBPROC = ?*const fn (shaderType: GLenum) callconv(.c) GLhandleARB;
pub const PFNGLSHADERSOURCEARBPROC = ?*const fn (shaderObj: GLhandleARB, count: GLsizei, string: [*c][*c]const GLcharARB, length: [*c]const GLint) callconv(.c) void;
pub const PFNGLCOMPILESHADERARBPROC = ?*const fn (shaderObj: GLhandleARB) callconv(.c) void;
pub const PFNGLCREATEPROGRAMOBJECTARBPROC = ?*const fn () callconv(.c) GLhandleARB;
pub const PFNGLATTACHOBJECTARBPROC = ?*const fn (containerObj: GLhandleARB, obj: GLhandleARB) callconv(.c) void;
pub const PFNGLLINKPROGRAMARBPROC = ?*const fn (programObj: GLhandleARB) callconv(.c) void;
pub const PFNGLUSEPROGRAMOBJECTARBPROC = ?*const fn (programObj: GLhandleARB) callconv(.c) void;
pub const PFNGLUNIFORM1FARBPROC = ?*const fn (location: GLint, v0: GLfloat) callconv(.c) void;
pub const PFNGLUNIFORM3FARBPROC = ?*const fn (location: GLint, v0: GLfloat, v1: GLfloat, v2: GLfloat) callconv(.c) void;
pub const PFNGLUNIFORM4FARBPROC = ?*const fn (location: GLint, v0: GLfloat, v1: GLfloat, v2: GLfloat, v3: GLfloat) callconv(.c) void;
pub const PFNGLUNIFORM1IARBPROC = ?*const fn (location: GLint, v0: GLint) callconv(.c) void;
pub const PFNGLGETOBJECTPARAMETERIVARBPROC = ?*const fn (obj: GLhandleARB, pname: GLenum, params: [*c]GLint) callconv(.c) void;
pub const PFNGLGETINFOLOGARBPROC = ?*const fn (obj: GLhandleARB, maxLength: GLsizei, length: [*c]GLsizei, infoLog: [*c]GLcharARB) callconv(.c) void;
pub const PFNGLGETUNIFORMLOCATIONARBPROC = ?*const fn (programObj: GLhandleARB, name: [*c]const GLcharARB) callconv(.c) GLint;
pub const GL_ShaderData = extern struct {
    program: GLhandleARB = 0,
    vert_shader: GLhandleARB = 0,
    frag_shader: GLhandleARB = 0,
};
const struct_unnamed_14 = extern struct {
    vertex_shader: [*c]const u8 = null,
    fragment_shader: [*c]const u8 = null,
    fragment_version: [*c]const u8 = null,
};
pub var shader_source: [14]struct_unnamed_14 = [14]struct_unnamed_14{
    struct_unnamed_14{
        .vertex_shader = null,
        .fragment_shader = null,
        .fragment_version = null,
    },
    struct_unnamed_14{
        .vertex_shader = "varying vec4 v_color;\n\nvoid main()\n{\n    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;\n    v_color = gl_Color;\n}",
        .fragment_shader = "varying vec4 v_color;\n\nvoid main()\n{\n    gl_FragColor = v_color;\n}",
        .fragment_version = null,
    },
    struct_unnamed_14{
        .vertex_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\n\nvoid main()\n{\n    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;\n    v_color = gl_Color;\n    v_texCoord = vec2(gl_MultiTexCoord0);\n}",
        .fragment_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\nuniform sampler2D tex0;\nuniform sampler2D tex1;\nuniform vec4 texel_size; // texel size (xy: texel size, zw: texture dimensions)\n\nvec4 SamplePaletteNearest(vec2 uv)\n{\n    float index = texture2D(tex0, uv).r * 255.0;\n    return texture2D(tex1, vec2((index + 0.5) / 256.0, 0.5));\n}\n\nvec4 SamplePaletteLinear(vec2 uv)\n{\n    // scale & offset uvs to integer values at texel centers\n    vec2 uv_texels = uv * texel_size.zw + 0.5;\n\n    // get uvs for the center of the 4 surrounding texels by flooring\n    vec4 uv_min_max = vec4((floor(uv_texels) - 0.5) * texel_size.xy, (floor(uv_texels) + 0.5) * texel_size.xy);\n\n    // blend factor\n    vec2 uv_frac = fract(uv_texels);\n\n    // sample all 4 texels\n    vec4 texelA = SamplePaletteNearest(uv_min_max.xy);\n    vec4 texelB = SamplePaletteNearest(uv_min_max.xw);\n    vec4 texelC = SamplePaletteNearest(uv_min_max.zy);\n    vec4 texelD = SamplePaletteNearest(uv_min_max.zw);\n\n    // bilinear interpolation\n    return mix(mix(texelA, texelB, uv_frac.y), mix(texelC, texelD, uv_frac.y), uv_frac.x);\n}\n\n\nvoid main()\n{\n    gl_FragColor = SamplePaletteNearest(v_texCoord) * v_color;\n}",
        .fragment_version = null,
    },
    struct_unnamed_14{
        .vertex_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\n\nvoid main()\n{\n    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;\n    v_color = gl_Color;\n    v_texCoord = vec2(gl_MultiTexCoord0);\n}",
        .fragment_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\nuniform sampler2D tex0;\nuniform sampler2D tex1;\nuniform vec4 texel_size; // texel size (xy: texel size, zw: texture dimensions)\n\nvec4 SamplePaletteNearest(vec2 uv)\n{\n    float index = texture2D(tex0, uv).r * 255.0;\n    return texture2D(tex1, vec2((index + 0.5) / 256.0, 0.5));\n}\n\nvec4 SamplePaletteLinear(vec2 uv)\n{\n    // scale & offset uvs to integer values at texel centers\n    vec2 uv_texels = uv * texel_size.zw + 0.5;\n\n    // get uvs for the center of the 4 surrounding texels by flooring\n    vec4 uv_min_max = vec4((floor(uv_texels) - 0.5) * texel_size.xy, (floor(uv_texels) + 0.5) * texel_size.xy);\n\n    // blend factor\n    vec2 uv_frac = fract(uv_texels);\n\n    // sample all 4 texels\n    vec4 texelA = SamplePaletteNearest(uv_min_max.xy);\n    vec4 texelB = SamplePaletteNearest(uv_min_max.xw);\n    vec4 texelC = SamplePaletteNearest(uv_min_max.zy);\n    vec4 texelD = SamplePaletteNearest(uv_min_max.zw);\n\n    // bilinear interpolation\n    return mix(mix(texelA, texelB, uv_frac.y), mix(texelC, texelD, uv_frac.y), uv_frac.x);\n}\n\n\nvoid main()\n{\n    gl_FragColor = SamplePaletteLinear(v_texCoord) * v_color;\n}",
        .fragment_version = null,
    },
    struct_unnamed_14{
        .vertex_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\n\nvoid main()\n{\n    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;\n    v_color = gl_Color;\n    v_texCoord = vec2(gl_MultiTexCoord0);\n}",
        .fragment_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\nuniform sampler2D tex0;\nuniform sampler2D tex1;\nuniform vec4 texel_size; // texel size (xy: texel size, zw: texture dimensions)\n\nvec4 SamplePaletteNearest(vec2 uv)\n{\n    float index = texture2D(tex0, uv).r * 255.0;\n    return texture2D(tex1, vec2((index + 0.5) / 256.0, 0.5));\n}\n\nvec4 SamplePaletteLinear(vec2 uv)\n{\n    // scale & offset uvs to integer values at texel centers\n    vec2 uv_texels = uv * texel_size.zw + 0.5;\n\n    // get uvs for the center of the 4 surrounding texels by flooring\n    vec4 uv_min_max = vec4((floor(uv_texels) - 0.5) * texel_size.xy, (floor(uv_texels) + 0.5) * texel_size.xy);\n\n    // blend factor\n    vec2 uv_frac = fract(uv_texels);\n\n    // sample all 4 texels\n    vec4 texelA = SamplePaletteNearest(uv_min_max.xy);\n    vec4 texelB = SamplePaletteNearest(uv_min_max.xw);\n    vec4 texelC = SamplePaletteNearest(uv_min_max.zy);\n    vec4 texelD = SamplePaletteNearest(uv_min_max.zw);\n\n    // bilinear interpolation\n    return mix(mix(texelA, texelB, uv_frac.y), mix(texelC, texelD, uv_frac.y), uv_frac.x);\n}\n\nvec2 GetPixelArtUV(vec2 uv)\n{\n    vec2 boxSize = clamp(fwidth(uv) * texel_size.zw, 1e-5, 1.0);\n    vec2 tx = uv * texel_size.zw - 0.5 * boxSize;\n    vec2 txOffset = smoothstep(vec2(1.0) - boxSize, vec2(1.0), fract(tx));\n    return (floor(tx) + 0.5 + txOffset) * texel_size.xy;\n}\n\nvec4 GetPixelArtSample(vec2 uv)\n{\n    return textureGrad(tex0, GetPixelArtUV(uv), dFdx(v_texCoord), dFdy(v_texCoord));\n}\n\n\nvoid main()\n{\n    gl_FragColor = SamplePaletteLinear(GetPixelArtUV(v_texCoord)) * v_color;\n}",
        .fragment_version = "#version 130\n",
    },
    struct_unnamed_14{
        .vertex_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\n\nvoid main()\n{\n    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;\n    v_color = gl_Color;\n    v_texCoord = vec2(gl_MultiTexCoord0);\n}",
        .fragment_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\nuniform sampler2D tex0;\n\n\nvoid main()\n{\n    gl_FragColor = texture2D(tex0, v_texCoord);\n    gl_FragColor.a = 1.0;\n    gl_FragColor *= v_color;\n}",
        .fragment_version = null,
    },
    struct_unnamed_14{
        .vertex_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\n\nvoid main()\n{\n    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;\n    v_color = gl_Color;\n    v_texCoord = vec2(gl_MultiTexCoord0);\n}",
        .fragment_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\nuniform sampler2D tex0;\nuniform vec4 texel_size; // texel size (xy: texel size, zw: texture dimensions)\n\nvec2 GetPixelArtUV(vec2 uv)\n{\n    vec2 boxSize = clamp(fwidth(uv) * texel_size.zw, 1e-5, 1.0);\n    vec2 tx = uv * texel_size.zw - 0.5 * boxSize;\n    vec2 txOffset = smoothstep(vec2(1.0) - boxSize, vec2(1.0), fract(tx));\n    return (floor(tx) + 0.5 + txOffset) * texel_size.xy;\n}\n\nvec4 GetPixelArtSample(vec2 uv)\n{\n    return textureGrad(tex0, GetPixelArtUV(uv), dFdx(v_texCoord), dFdy(v_texCoord));\n}\n\n\nvoid main()\n{\n    gl_FragColor = GetPixelArtSample(v_texCoord);\n    gl_FragColor.a = 1.0;\n    gl_FragColor *= v_color;\n}",
        .fragment_version = "#version 130\n",
    },
    struct_unnamed_14{
        .vertex_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\n\nvoid main()\n{\n    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;\n    v_color = gl_Color;\n    v_texCoord = vec2(gl_MultiTexCoord0);\n}",
        .fragment_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\nuniform sampler2D tex0;\n\n\nvoid main()\n{\n    gl_FragColor = texture2D(tex0, v_texCoord) * v_color;\n}",
        .fragment_version = null,
    },
    struct_unnamed_14{
        .vertex_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\n\nvoid main()\n{\n    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;\n    v_color = gl_Color;\n    v_texCoord = vec2(gl_MultiTexCoord0);\n}",
        .fragment_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\nuniform sampler2D tex0;\nuniform vec4 texel_size; // texel size (xy: texel size, zw: texture dimensions)\n\nvec2 GetPixelArtUV(vec2 uv)\n{\n    vec2 boxSize = clamp(fwidth(uv) * texel_size.zw, 1e-5, 1.0);\n    vec2 tx = uv * texel_size.zw - 0.5 * boxSize;\n    vec2 txOffset = smoothstep(vec2(1.0) - boxSize, vec2(1.0), fract(tx));\n    return (floor(tx) + 0.5 + txOffset) * texel_size.xy;\n}\n\nvec4 GetPixelArtSample(vec2 uv)\n{\n    return textureGrad(tex0, GetPixelArtUV(uv), dFdx(v_texCoord), dFdy(v_texCoord));\n}\n\n\nvoid main()\n{\n    gl_FragColor = GetPixelArtSample(v_texCoord);\n    gl_FragColor *= v_color;\n}",
        .fragment_version = "#version 130\n",
    },
    struct_unnamed_14{
        .vertex_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\n\nvoid main()\n{\n    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;\n    v_color = gl_Color;\n    v_texCoord = vec2(gl_MultiTexCoord0);\n}",
        .fragment_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\nuniform sampler2D tex0; // Y \nuniform sampler2D tex1; // U \nuniform sampler2D tex2; // V \nuniform vec3 Yoffset;\nuniform vec3 Rcoeff;\nuniform vec3 Gcoeff;\nuniform vec3 Bcoeff;\n\n\nvoid main()\n{\n    vec2 tcoord;\n    vec3 yuv, rgb;\n\n    // Get the Y value \n    tcoord = v_texCoord;\n    yuv.x = texture2D(tex0, tcoord).r;\n\n    // Get the U and V values \n    tcoord *= UVCoordScale;\n    yuv.y = texture2D(tex1, tcoord).r;\n    yuv.z = texture2D(tex2, tcoord).r;\n\n    // Do the color transform \n    yuv += Yoffset;\n    rgb.r = dot(yuv, Rcoeff);\n    rgb.g = dot(yuv, Gcoeff);\n    rgb.b = dot(yuv, Bcoeff);\n\n    // That was easy. :) \n    gl_FragColor = vec4(rgb, 1.0) * v_color;\n}",
        .fragment_version = null,
    },
    struct_unnamed_14{
        .vertex_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\n\nvoid main()\n{\n    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;\n    v_color = gl_Color;\n    v_texCoord = vec2(gl_MultiTexCoord0);\n}",
        .fragment_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\nuniform sampler2D tex0; // Y \nuniform sampler2D tex1; // U/V \nuniform vec3 Yoffset;\nuniform vec3 Rcoeff;\nuniform vec3 Gcoeff;\nuniform vec3 Bcoeff;\n\n\nvoid main()\n{\n    vec2 tcoord;\n    vec3 yuv, rgb;\n\n    // Get the Y value \n    tcoord = v_texCoord;\n    yuv.x = texture2D(tex0, tcoord).r;\n\n    // Get the U and V values \n    tcoord *= UVCoordScale;\n    yuv.yz = texture2D(tex1, tcoord).ra;\n\n    // Do the color transform \n    yuv += Yoffset;\n    rgb.r = dot(yuv, Rcoeff);\n    rgb.g = dot(yuv, Gcoeff);\n    rgb.b = dot(yuv, Bcoeff);\n\n    // That was easy. :) \n    gl_FragColor = vec4(rgb, 1.0) * v_color;\n}",
        .fragment_version = null,
    },
    struct_unnamed_14{
        .vertex_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\n\nvoid main()\n{\n    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;\n    v_color = gl_Color;\n    v_texCoord = vec2(gl_MultiTexCoord0);\n}",
        .fragment_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\nuniform sampler2D tex0; // Y \nuniform sampler2D tex1; // U/V \nuniform vec3 Yoffset;\nuniform vec3 Rcoeff;\nuniform vec3 Gcoeff;\nuniform vec3 Bcoeff;\n\n\nvoid main()\n{\n    vec2 tcoord;\n    vec3 yuv, rgb;\n\n    // Get the Y value \n    tcoord = v_texCoord;\n    yuv.x = texture2D(tex0, tcoord).r;\n\n    // Get the U and V values \n    tcoord *= UVCoordScale;\n    yuv.yz = texture2D(tex1, tcoord).rg;\n\n    // Do the color transform \n    yuv += Yoffset;\n    rgb.r = dot(yuv, Rcoeff);\n    rgb.g = dot(yuv, Gcoeff);\n    rgb.b = dot(yuv, Bcoeff);\n\n    // That was easy. :) \n    gl_FragColor = vec4(rgb, 1.0) * v_color;\n}",
        .fragment_version = null,
    },
    struct_unnamed_14{
        .vertex_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\n\nvoid main()\n{\n    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;\n    v_color = gl_Color;\n    v_texCoord = vec2(gl_MultiTexCoord0);\n}",
        .fragment_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\nuniform sampler2D tex0; // Y \nuniform sampler2D tex1; // U/V \nuniform vec3 Yoffset;\nuniform vec3 Rcoeff;\nuniform vec3 Gcoeff;\nuniform vec3 Bcoeff;\n\n\nvoid main()\n{\n    vec2 tcoord;\n    vec3 yuv, rgb;\n\n    // Get the Y value \n    tcoord = v_texCoord;\n    yuv.x = texture2D(tex0, tcoord).r;\n\n    // Get the U and V values \n    tcoord *= UVCoordScale;\n    yuv.yz = texture2D(tex1, tcoord).ar;\n\n    // Do the color transform \n    yuv += Yoffset;\n    rgb.r = dot(yuv, Rcoeff);\n    rgb.g = dot(yuv, Gcoeff);\n    rgb.b = dot(yuv, Bcoeff);\n\n    // That was easy. :) \n    gl_FragColor = vec4(rgb, 1.0) * v_color;\n}",
        .fragment_version = null,
    },
    struct_unnamed_14{
        .vertex_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\n\nvoid main()\n{\n    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;\n    v_color = gl_Color;\n    v_texCoord = vec2(gl_MultiTexCoord0);\n}",
        .fragment_shader = "varying vec4 v_color;\nvarying vec2 v_texCoord;\nuniform sampler2D tex0; // Y \nuniform sampler2D tex1; // U/V \nuniform vec3 Yoffset;\nuniform vec3 Rcoeff;\nuniform vec3 Gcoeff;\nuniform vec3 Bcoeff;\n\n\nvoid main()\n{\n    vec2 tcoord;\n    vec3 yuv, rgb;\n\n    // Get the Y value \n    tcoord = v_texCoord;\n    yuv.x = texture2D(tex0, tcoord).r;\n\n    // Get the U and V values \n    tcoord *= UVCoordScale;\n    yuv.yz = texture2D(tex1, tcoord).gr;\n\n    // Do the color transform \n    yuv += Yoffset;\n    rgb.r = dot(yuv, Rcoeff);\n    rgb.g = dot(yuv, Gcoeff);\n    rgb.b = dot(yuv, Bcoeff);\n\n    // That was easy. :) \n    gl_FragColor = vec4(rgb, 1.0) * v_color;\n}",
        .fragment_version = null,
    },
};
pub fn CompileShader(ctx: [*c]GL_ShaderContext, shader: GLhandleARB, version: [*c]const u8, defines: [*c]const u8, source: [*c]const u8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var status: GLint = undefined;
    _ = &status;
    var sources: [3][*c]const u8 = undefined;
    _ = &sources;
    sources[@as(c_int, 0)] = version;
    sources[@as(c_int, 1)] = defines;
    sources[@as(c_int, 2)] = source;
    ctx.*.glShaderSourceARB.?(shader, @bitCast(@as(c_uint, @truncate(@sizeOf(@TypeOf(sources)) / @sizeOf(@TypeOf(sources[@as(c_int, 0)]))))), @ptrCast(@alignCast(&sources)), null);
    ctx.*.glCompileShaderARB.?(shader);
    ctx.*.glGetObjectParameterivARB.?(shader, GL_OBJECT_COMPILE_STATUS_ARB, &status);
    if (status == @as(c_int, 0)) {
        var isstack: bool = undefined;
        _ = &isstack;
        var length: GLint = undefined;
        _ = &length;
        var info: [*c]u8 = undefined;
        _ = &info;
        ctx.*.glGetObjectParameterivARB.?(shader, GL_OBJECT_INFO_LOG_LENGTH_ARB, &length);
        info = blk: {
            (&isstack).* = (@sizeOf(u8) *% @as(c_ulong, @bitCast(@as(c_long, length + @as(c_int, 1))))) < @as(c_ulong, SDL_MAX_SMALL_ALLOC_STACKSIZE);
            break :blk if ((&isstack).*) @as([*c]u8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% @as(c_ulong, @bitCast(@as(c_long, length + @as(c_int, 1)))))))) else @as([*c]u8, @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(u8) *% @as(c_ulong, @bitCast(@as(c_long, length + @as(c_int, 1))))))));
        };
        if (info != null) {
            ctx.*.glGetInfoLogARB.?(shader, length, null, info);
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_RENDER, "Failed to compile shader:");
            if (version != null) {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_RENDER, "%s", version);
            }
            if (defines != null) {
                SDL_LogDebug_REAL(SDL_LOG_CATEGORY_RENDER, "%s", defines);
            }
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_RENDER, "%s", source);
            SDL_LogDebug_REAL(SDL_LOG_CATEGORY_RENDER, "%s", info);
            if (isstack) {
                SDL_free_REAL(@ptrCast(@alignCast(info)));
            } else {
                SDL_free_REAL(@ptrCast(@alignCast(info)));
            }
        }
        return @"false" != 0;
    } else {
        return @"true" != 0;
    }
}
pub fn CompileShaderProgram(ctx: [*c]GL_ShaderContext, index_1: c_int, data: [*c]GL_ShaderData) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const num_tmus_bound: c_int = 4;
    _ = &num_tmus_bound;
    var vert_defines: [*c]const u8 = "";
    _ = &vert_defines;
    var frag_defines: [*c]const u8 = "";
    _ = &frag_defines;
    var frag_version: [*c]const u8 = "";
    _ = &frag_version;
    var i: c_int = undefined;
    _ = &i;
    var location: GLint = undefined;
    _ = &location;
    if (index_1 == SHADER_NONE) {
        return @"true" != 0;
    }
    _ = ctx.*.glGetError.?();
    if (ctx.*.GL_ARB_texture_rectangle_supported) {
        frag_defines = "#define sampler2D sampler2DRect\n#define texture2D texture2DRect\n#define UVCoordScale 0.5\n";
    } else {
        frag_defines = "#define UVCoordScale 1.0\n";
    }
    if (shader_source[@bitCast(@as(isize, @intCast(index_1)))].fragment_version != null) {
        frag_version = shader_source[@bitCast(@as(isize, @intCast(index_1)))].fragment_version;
    }
    data.*.program = ctx.*.glCreateProgramObjectARB.?();
    data.*.vert_shader = ctx.*.glCreateShaderObjectARB.?(GL_VERTEX_SHADER_ARB);
    if (!CompileShader(ctx, data.*.vert_shader, "", vert_defines, shader_source[@bitCast(@as(isize, @intCast(index_1)))].vertex_shader)) {
        return @"false" != 0;
    }
    data.*.frag_shader = ctx.*.glCreateShaderObjectARB.?(GL_FRAGMENT_SHADER_ARB);
    if (!CompileShader(ctx, data.*.frag_shader, frag_version, frag_defines, shader_source[@bitCast(@as(isize, @intCast(index_1)))].fragment_shader)) {
        return @"false" != 0;
    }
    ctx.*.glAttachObjectARB.?(data.*.program, data.*.vert_shader);
    ctx.*.glAttachObjectARB.?(data.*.program, data.*.frag_shader);
    ctx.*.glLinkProgramARB.?(data.*.program);
    ctx.*.glUseProgramObjectARB.?(data.*.program);
    {
        i = 0;
        while (i < num_tmus_bound) : (i += 1) {
            var tex_name: [10]u8 = undefined;
            _ = &tex_name;
            _ = SDL_snprintf_REAL(@ptrCast(@alignCast(&tex_name)), @sizeOf(@TypeOf(tex_name)) / @sizeOf(@TypeOf(tex_name[@as(c_int, 0)])), "tex%d", i);
            location = ctx.*.glGetUniformLocationARB.?(data.*.program, @ptrCast(@alignCast(&tex_name)));
            if (location >= @as(c_int, 0)) {
                ctx.*.glUniform1iARB.?(location, i);
            }
        }
    }
    ctx.*.glUseProgramObjectARB.?(0);
    return ctx.*.glGetError.?() == @as(GLenum, GL_NO_ERROR);
}
pub fn DestroyShaderProgram(ctx: [*c]GL_ShaderContext, data: [*c]GL_ShaderData) callconv(.c) void {
    @setEvalBranchQuota(100000);
    if (data.*.vert_shader != 0) {
        ctx.*.glDeleteObjectARB.?(data.*.vert_shader);
        data.*.vert_shader = 0;
    }
    if (data.*.frag_shader != 0) {
        ctx.*.glDeleteObjectARB.?(data.*.frag_shader);
        data.*.frag_shader = 0;
    }
    if (data.*.program != 0) {
        ctx.*.glDeleteObjectARB.?(data.*.program);
        data.*.program = 0;
    }
}
pub const GL_NO_ERROR = @as(c_int, 0);
pub const GL_FRAGMENT_SHADER_ARB = __helpers.promoteIntLiteral(c_int, 0x8B30, .hex);
pub const GL_OBJECT_COMPILE_STATUS_ARB = __helpers.promoteIntLiteral(c_int, 0x8B81, .hex);
pub const GL_OBJECT_INFO_LOG_LENGTH_ARB = __helpers.promoteIntLiteral(c_int, 0x8B84, .hex);
pub const GL_VERTEX_SHADER_ARB = __helpers.promoteIntLiteral(c_int, 0x8B31, .hex);
