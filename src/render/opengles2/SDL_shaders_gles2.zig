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
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn SDL_GetHint_REAL(name: [*c]const u8) [*c]const u8;
pub const GLES2_SHADER_FRAGMENT_INCLUDE_BEST_TEXCOORD_PRECISION: c_int = 1;
pub const GLES2_SHADER_FRAGMENT_INCLUDE_MEDIUM_TEXCOORD_PRECISION: c_int = 2;
pub const GLES2_SHADER_FRAGMENT_INCLUDE_HIGH_TEXCOORD_PRECISION: c_int = 3;
pub const GLES2_SHADER_FRAGMENT_INCLUDE_UNDEF_PRECISION: c_int = 4;
pub const GLES2_ShaderIncludeType = c_uint;
pub const GLES2_SHADER_VERTEX_DEFAULT: c_int = 0;
pub const GLES2_SHADER_FRAGMENT_SOLID: c_int = 1;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_NEAREST: c_int = 2;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_LINEAR: c_int = 3;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_PIXELART: c_int = 4;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_NEAREST_COLORSWAP: c_int = 5;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_LINEAR_COLORSWAP: c_int = 6;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_PIXELART_COLORSWAP: c_int = 7;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_RGB: c_int = 8;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_RGB_PIXELART: c_int = 9;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_BGR: c_int = 10;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_BGR_PIXELART: c_int = 11;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_ARGB: c_int = 12;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_ARGB_PIXELART: c_int = 13;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_ABGR: c_int = 14;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_ABGR_PIXELART: c_int = 15;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_YUV: c_int = 16;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_NV12_RA: c_int = 17;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_NV12_RG: c_int = 18;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_NV21_RA: c_int = 19;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_NV21_RG: c_int = 20;
pub const GLES2_SHADER_FRAGMENT_TEXTURE_EXTERNAL_OES: c_int = 21;
pub const GLES2_ShaderType = c_uint;
pub export fn GLES2_GetShaderPrologue(arg_type: GLES2_ShaderType) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@"type") {
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_EXTERNAL_OES) => {
                        sdl_pc = 2;
                        continue;
                    },
                    else => {
                        sdl_pc = 3;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureExternalOES_Prologue));
            },
            3 => {
                return "";
            },
            else => unreachable,
        }
    }
}
pub export fn GLES2_GetShaderInclude(arg_type: GLES2_ShaderIncludeType) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@"type") {
                    @as(GLES2_ShaderIncludeType, GLES2_SHADER_FRAGMENT_INCLUDE_UNDEF_PRECISION) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(GLES2_ShaderIncludeType, GLES2_SHADER_FRAGMENT_INCLUDE_BEST_TEXCOORD_PRECISION) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(GLES2_ShaderIncludeType, GLES2_SHADER_FRAGMENT_INCLUDE_MEDIUM_TEXCOORD_PRECISION) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(GLES2_ShaderIncludeType, GLES2_SHADER_FRAGMENT_INCLUDE_HIGH_TEXCOORD_PRECISION) => {
                        sdl_pc = 5;
                        continue;
                    },
                    else => {
                        sdl_pc = 6;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_Include_Undef_Precision));
            },
            3 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_Include_Best_Texture_Precision));
            },
            4 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_Include_Medium_Texture_Precision));
            },
            5 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_Include_High_Texture_Precision));
            },
            6 => {
                return "";
            },
            else => unreachable,
        }
    }
}
pub export fn GLES2_GetShader(arg_type: GLES2_ShaderType) [*c]const u8 {
    @setEvalBranchQuota(100000);
    var @"type" = arg_type;
    _ = &@"type";
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (@"type") {
                    @as(GLES2_ShaderType, GLES2_SHADER_VERTEX_DEFAULT) => {
                        sdl_pc = 2;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_SOLID) => {
                        sdl_pc = 3;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_NEAREST) => {
                        sdl_pc = 4;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_LINEAR) => {
                        sdl_pc = 5;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_PIXELART) => {
                        sdl_pc = 6;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_NEAREST_COLORSWAP) => {
                        sdl_pc = 7;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_LINEAR_COLORSWAP) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_PALETTE_PIXELART_COLORSWAP) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_RGB) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_RGB_PIXELART) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_BGR) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_BGR_PIXELART) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_ARGB) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_ARGB_PIXELART) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_ABGR) => {
                        sdl_pc = 16;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_ABGR_PIXELART) => {
                        sdl_pc = 17;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_YUV) => {
                        sdl_pc = 18;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_NV12_RA) => {
                        sdl_pc = 19;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_NV12_RG) => {
                        sdl_pc = 20;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_NV21_RA) => {
                        sdl_pc = 21;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_NV21_RG) => {
                        sdl_pc = 22;
                        continue;
                    },
                    @as(GLES2_ShaderType, GLES2_SHADER_FRAGMENT_TEXTURE_EXTERNAL_OES) => {
                        sdl_pc = 23;
                        continue;
                    },
                    else => {
                        sdl_pc = 24;
                        continue;
                    },
                }
            },
            1 => {
                return undefined;
            },
            2 => {
                return @ptrCast(@alignCast(&GLES2_Vertex_Default));
            },
            3 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_Solid));
            },
            4 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TexturePalette_Nearest));
            },
            5 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TexturePalette_Linear));
            },
            6 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TexturePalette_PixelArt));
            },
            7 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TexturePalette_Nearest_Colorswap));
            },
            8 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TexturePalette_Linear_Colorswap));
            },
            9 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TexturePalette_PixelArt_Colorswap));
            },
            10 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureRGB));
            },
            11 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureRGB_PixelArt));
            },
            12 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureBGR));
            },
            13 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureBGR_PixelArt));
            },
            14 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureARGB));
            },
            15 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureARGB_PixelArt));
            },
            16 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureABGR));
            },
            17 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureABGR_PixelArt));
            },
            18 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureYUV));
            },
            19 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureNV12_RA));
            },
            20 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureNV12_RG));
            },
            21 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureNV21_RA));
            },
            22 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureNV21_RG));
            },
            23 => {
                return @ptrCast(@alignCast(&GLES2_Fragment_TextureExternalOES));
            },
            24 => {
                return null;
            },
            else => unreachable,
        }
    }
}

pub export fn GLES2_GetTexCoordPrecisionEnumFromHint() GLES2_ShaderIncludeType {
    @setEvalBranchQuota(100000);
    var texcoord_hint: [*c]const u8 = SDL_GetHint_REAL("SDL_RENDER_OPENGLES2_TEXCOORD_PRECISION");
    _ = &texcoord_hint;
    var value: GLES2_ShaderIncludeType = GLES2_SHADER_FRAGMENT_INCLUDE_BEST_TEXCOORD_PRECISION;
    _ = &value;
    if (texcoord_hint != null) {
        if (SDL_strcmp_REAL(texcoord_hint, "undefined") == @as(c_int, 0)) {
            return GLES2_SHADER_FRAGMENT_INCLUDE_UNDEF_PRECISION;
        }
        if (SDL_strcmp_REAL(texcoord_hint, "high") == @as(c_int, 0)) {
            return GLES2_SHADER_FRAGMENT_INCLUDE_HIGH_TEXCOORD_PRECISION;
        }
        if (SDL_strcmp_REAL(texcoord_hint, "medium") == @as(c_int, 0)) {
            return GLES2_SHADER_FRAGMENT_INCLUDE_MEDIUM_TEXCOORD_PRECISION;
        }
    }
    return value;
}
pub const GLES2_Fragment_Include_Best_Texture_Precision: [150:0]u8 = "#ifdef GL_FRAGMENT_PRECISION_HIGH\n#define SDL_TEXCOORD_PRECISION highp\n#else\n#define SDL_TEXCOORD_PRECISION mediump\n#endif\n\nprecision mediump float;\n\n".*;
pub const GLES2_Fragment_Include_Medium_Texture_Precision: [65:0]u8 = "#define SDL_TEXCOORD_PRECISION mediump\nprecision mediump float;\n\n".*;
pub const GLES2_Fragment_Include_High_Texture_Precision: [63:0]u8 = "#define SDL_TEXCOORD_PRECISION highp\nprecision mediump float;\n\n".*;
pub const GLES2_Fragment_Include_Undef_Precision: [75:0]u8 = "#define mediump\n#define highp\n#define lowp\n#define SDL_TEXCOORD_PRECISION\n\n".*;
pub const GLES2_Vertex_Default: [306:0]u8 = "uniform mat4 u_projection;\nattribute vec2 a_position;\nattribute vec4 a_color;\nattribute vec2 a_texCoord;\nvarying vec2 v_texCoord;\nvarying vec4 v_color;\n\nvoid main()\n{\n    v_texCoord = a_texCoord;\n    gl_Position = u_projection * vec4(a_position, 0.0, 1.0);\n    gl_PointSize = 1.0;\n    v_color = a_color;\n}\n".*;
pub const GLES2_Fragment_Solid: [75:0]u8 = "varying mediump vec4 v_color;\n\nvoid main()\n{\n    gl_FragColor = v_color;\n}\n".*;
pub const GLES2_Fragment_TexturePalette_Nearest: [1398:0]u8 = "uniform sampler2D u_texture;\nuniform sampler2D u_palette;\nuniform mediump vec4 u_texel_size;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\nmediump vec4 SamplePaletteNearest(SDL_TEXCOORD_PRECISION vec2 uv)\n{\n    mediump float index = texture2D(u_texture, uv).r * 255.0;\n    return texture2D(u_palette, vec2((index + 0.5) / 256.0, 0.5));\n}\n\nmediump vec4 SamplePaletteLinear(SDL_TEXCOORD_PRECISION vec2 uv)\n{\n    // scale & offset uvs to integer values at texel centers\n    SDL_TEXCOORD_PRECISION vec2 uv_texels = uv * u_texel_size.zw + 0.5;\n\n    // get uvs for the center of the 4 surrounding texels by flooring\n    SDL_TEXCOORD_PRECISION vec4 uv_min_max = vec4((floor(uv_texels) - 0.5) * u_texel_size.xy, (floor(uv_texels) + 0.5) * u_texel_size.xy);\n\n    // blend factor\n    SDL_TEXCOORD_PRECISION vec2 uv_frac = fract(uv_texels);\n\n    // sample all 4 texels\n    mediump vec4 texelA = SamplePaletteNearest(uv_min_max.xy);\n    mediump vec4 texelB = SamplePaletteNearest(uv_min_max.xw);\n    mediump vec4 texelC = SamplePaletteNearest(uv_min_max.zy);\n    mediump vec4 texelD = SamplePaletteNearest(uv_min_max.zw);\n\n    // bilinear interpolation\n    return mix(mix(texelA, texelB, uv_frac.y), mix(texelC, texelD, uv_frac.y), uv_frac.x);\n}\n\n\nvoid main()\n{\n    mediump vec4 color = SamplePaletteNearest(v_texCoord);\n    gl_FragColor = color;\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TexturePalette_Nearest_Colorswap: [1433:0]u8 = "uniform sampler2D u_texture;\nuniform sampler2D u_palette;\nuniform mediump vec4 u_texel_size;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\nmediump vec4 SamplePaletteNearest(SDL_TEXCOORD_PRECISION vec2 uv)\n{\n    mediump float index = texture2D(u_texture, uv).r * 255.0;\n    return texture2D(u_palette, vec2((index + 0.5) / 256.0, 0.5));\n}\n\nmediump vec4 SamplePaletteLinear(SDL_TEXCOORD_PRECISION vec2 uv)\n{\n    // scale & offset uvs to integer values at texel centers\n    SDL_TEXCOORD_PRECISION vec2 uv_texels = uv * u_texel_size.zw + 0.5;\n\n    // get uvs for the center of the 4 surrounding texels by flooring\n    SDL_TEXCOORD_PRECISION vec4 uv_min_max = vec4((floor(uv_texels) - 0.5) * u_texel_size.xy, (floor(uv_texels) + 0.5) * u_texel_size.xy);\n\n    // blend factor\n    SDL_TEXCOORD_PRECISION vec2 uv_frac = fract(uv_texels);\n\n    // sample all 4 texels\n    mediump vec4 texelA = SamplePaletteNearest(uv_min_max.xy);\n    mediump vec4 texelB = SamplePaletteNearest(uv_min_max.xw);\n    mediump vec4 texelC = SamplePaletteNearest(uv_min_max.zy);\n    mediump vec4 texelD = SamplePaletteNearest(uv_min_max.zw);\n\n    // bilinear interpolation\n    return mix(mix(texelA, texelB, uv_frac.y), mix(texelC, texelD, uv_frac.y), uv_frac.x);\n}\n\n\nvoid main()\n{\n    mediump vec4 color = SamplePaletteNearest(v_texCoord);\n    gl_FragColor = vec4(color.b, color.g, color.r, color.a);\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TexturePalette_Linear: [1397:0]u8 = "uniform sampler2D u_texture;\nuniform sampler2D u_palette;\nuniform mediump vec4 u_texel_size;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\nmediump vec4 SamplePaletteNearest(SDL_TEXCOORD_PRECISION vec2 uv)\n{\n    mediump float index = texture2D(u_texture, uv).r * 255.0;\n    return texture2D(u_palette, vec2((index + 0.5) / 256.0, 0.5));\n}\n\nmediump vec4 SamplePaletteLinear(SDL_TEXCOORD_PRECISION vec2 uv)\n{\n    // scale & offset uvs to integer values at texel centers\n    SDL_TEXCOORD_PRECISION vec2 uv_texels = uv * u_texel_size.zw + 0.5;\n\n    // get uvs for the center of the 4 surrounding texels by flooring\n    SDL_TEXCOORD_PRECISION vec4 uv_min_max = vec4((floor(uv_texels) - 0.5) * u_texel_size.xy, (floor(uv_texels) + 0.5) * u_texel_size.xy);\n\n    // blend factor\n    SDL_TEXCOORD_PRECISION vec2 uv_frac = fract(uv_texels);\n\n    // sample all 4 texels\n    mediump vec4 texelA = SamplePaletteNearest(uv_min_max.xy);\n    mediump vec4 texelB = SamplePaletteNearest(uv_min_max.xw);\n    mediump vec4 texelC = SamplePaletteNearest(uv_min_max.zy);\n    mediump vec4 texelD = SamplePaletteNearest(uv_min_max.zw);\n\n    // bilinear interpolation\n    return mix(mix(texelA, texelB, uv_frac.y), mix(texelC, texelD, uv_frac.y), uv_frac.x);\n}\n\n\nvoid main()\n{\n    mediump vec4 color = SamplePaletteLinear(v_texCoord);\n    gl_FragColor = color;\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TexturePalette_Linear_Colorswap: [1432:0]u8 = "uniform sampler2D u_texture;\nuniform sampler2D u_palette;\nuniform mediump vec4 u_texel_size;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\nmediump vec4 SamplePaletteNearest(SDL_TEXCOORD_PRECISION vec2 uv)\n{\n    mediump float index = texture2D(u_texture, uv).r * 255.0;\n    return texture2D(u_palette, vec2((index + 0.5) / 256.0, 0.5));\n}\n\nmediump vec4 SamplePaletteLinear(SDL_TEXCOORD_PRECISION vec2 uv)\n{\n    // scale & offset uvs to integer values at texel centers\n    SDL_TEXCOORD_PRECISION vec2 uv_texels = uv * u_texel_size.zw + 0.5;\n\n    // get uvs for the center of the 4 surrounding texels by flooring\n    SDL_TEXCOORD_PRECISION vec4 uv_min_max = vec4((floor(uv_texels) - 0.5) * u_texel_size.xy, (floor(uv_texels) + 0.5) * u_texel_size.xy);\n\n    // blend factor\n    SDL_TEXCOORD_PRECISION vec2 uv_frac = fract(uv_texels);\n\n    // sample all 4 texels\n    mediump vec4 texelA = SamplePaletteNearest(uv_min_max.xy);\n    mediump vec4 texelB = SamplePaletteNearest(uv_min_max.xw);\n    mediump vec4 texelC = SamplePaletteNearest(uv_min_max.zy);\n    mediump vec4 texelD = SamplePaletteNearest(uv_min_max.zw);\n\n    // bilinear interpolation\n    return mix(mix(texelA, texelB, uv_frac.y), mix(texelC, texelD, uv_frac.y), uv_frac.x);\n}\n\n\nvoid main()\n{\n    mediump vec4 color = SamplePaletteLinear(v_texCoord);\n    gl_FragColor = vec4(color.b, color.g, color.r, color.a);\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TexturePalette_PixelArt: [1480:0]u8 = "uniform sampler2D u_texture;\nuniform sampler2D u_palette;\nuniform mediump vec4 u_texel_size;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\nmediump vec4 SamplePaletteNearest(SDL_TEXCOORD_PRECISION vec2 uv)\n{\n    mediump float index = texture2D(u_texture, uv).r * 255.0;\n    return texture2D(u_palette, vec2((index + 0.5) / 256.0, 0.5));\n}\n\nmediump vec4 SamplePaletteLinear(SDL_TEXCOORD_PRECISION vec2 uv)\n{\n    // scale & offset uvs to integer values at texel centers\n    SDL_TEXCOORD_PRECISION vec2 uv_texels = uv * u_texel_size.zw + 0.5;\n\n    // get uvs for the center of the 4 surrounding texels by flooring\n    SDL_TEXCOORD_PRECISION vec4 uv_min_max = vec4((floor(uv_texels) - 0.5) * u_texel_size.xy, (floor(uv_texels) + 0.5) * u_texel_size.xy);\n\n    // blend factor\n    SDL_TEXCOORD_PRECISION vec2 uv_frac = fract(uv_texels);\n\n    // sample all 4 texels\n    mediump vec4 texelA = SamplePaletteNearest(uv_min_max.xy);\n    mediump vec4 texelB = SamplePaletteNearest(uv_min_max.xw);\n    mediump vec4 texelC = SamplePaletteNearest(uv_min_max.zy);\n    mediump vec4 texelD = SamplePaletteNearest(uv_min_max.zw);\n\n    // bilinear interpolation\n    return mix(mix(texelA, texelB, uv_frac.y), mix(texelC, texelD, uv_frac.y), uv_frac.x);\n}\n\nmediump vec4 GetPixelArtSample(vec2 uv)\n{\n    return texture2D(u_texture, uv);\n}\n\n\nvoid main()\n{\n    mediump vec4 color = SamplePaletteNearest(v_texCoord);\n    gl_FragColor = color;\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TexturePalette_PixelArt_Colorswap: [1515:0]u8 = "uniform sampler2D u_texture;\nuniform sampler2D u_palette;\nuniform mediump vec4 u_texel_size;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\nmediump vec4 SamplePaletteNearest(SDL_TEXCOORD_PRECISION vec2 uv)\n{\n    mediump float index = texture2D(u_texture, uv).r * 255.0;\n    return texture2D(u_palette, vec2((index + 0.5) / 256.0, 0.5));\n}\n\nmediump vec4 SamplePaletteLinear(SDL_TEXCOORD_PRECISION vec2 uv)\n{\n    // scale & offset uvs to integer values at texel centers\n    SDL_TEXCOORD_PRECISION vec2 uv_texels = uv * u_texel_size.zw + 0.5;\n\n    // get uvs for the center of the 4 surrounding texels by flooring\n    SDL_TEXCOORD_PRECISION vec4 uv_min_max = vec4((floor(uv_texels) - 0.5) * u_texel_size.xy, (floor(uv_texels) + 0.5) * u_texel_size.xy);\n\n    // blend factor\n    SDL_TEXCOORD_PRECISION vec2 uv_frac = fract(uv_texels);\n\n    // sample all 4 texels\n    mediump vec4 texelA = SamplePaletteNearest(uv_min_max.xy);\n    mediump vec4 texelB = SamplePaletteNearest(uv_min_max.xw);\n    mediump vec4 texelC = SamplePaletteNearest(uv_min_max.zy);\n    mediump vec4 texelD = SamplePaletteNearest(uv_min_max.zw);\n\n    // bilinear interpolation\n    return mix(mix(texelA, texelB, uv_frac.y), mix(texelC, texelD, uv_frac.y), uv_frac.x);\n}\n\nmediump vec4 GetPixelArtSample(vec2 uv)\n{\n    return texture2D(u_texture, uv);\n}\n\n\nvoid main()\n{\n    mediump vec4 color = SamplePaletteNearest(v_texCoord);\n    gl_FragColor = vec4(color.b, color.g, color.r, color.a);\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TextureRGB: [269:0]u8 = "uniform sampler2D u_texture;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\n\nvoid main()\n{\n    mediump vec4 color = texture2D(u_texture, v_texCoord);\n    gl_FragColor = vec4(color.b, color.g, color.r, 1.0);\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TextureRGB_PixelArt: [383:0]u8 = "uniform sampler2D u_texture;\nuniform mediump vec4 u_texel_size;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\nmediump vec4 GetPixelArtSample(vec2 uv)\n{\n    return texture2D(u_texture, uv);\n}\n\n\nvoid main()\n{\n    mediump vec4 color = GetPixelArtSample(v_texCoord);\n    gl_FragColor = vec4(color.b, color.g, color.r, 1.0);\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TextureBGR: [269:0]u8 = "uniform sampler2D u_texture;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\n\nvoid main()\n{\n    mediump vec4 color = texture2D(u_texture, v_texCoord);\n    gl_FragColor = vec4(color.r, color.g, color.b, 1.0);\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TextureBGR_PixelArt: [383:0]u8 = "uniform sampler2D u_texture;\nuniform mediump vec4 u_texel_size;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\nmediump vec4 GetPixelArtSample(vec2 uv)\n{\n    return texture2D(u_texture, uv);\n}\n\n\nvoid main()\n{\n    mediump vec4 color = GetPixelArtSample(v_texCoord);\n    gl_FragColor = vec4(color.r, color.g, color.b, 1.0);\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TextureARGB: [273:0]u8 = "uniform sampler2D u_texture;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\n\nvoid main()\n{\n    mediump vec4 color = texture2D(u_texture, v_texCoord);\n    gl_FragColor = vec4(color.b, color.g, color.r, color.a);\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TextureARGB_PixelArt: [387:0]u8 = "uniform sampler2D u_texture;\nuniform mediump vec4 u_texel_size;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\nmediump vec4 GetPixelArtSample(vec2 uv)\n{\n    return texture2D(u_texture, uv);\n}\n\n\nvoid main()\n{\n    mediump vec4 color = GetPixelArtSample(v_texCoord);\n    gl_FragColor = vec4(color.b, color.g, color.r, color.a);\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TextureABGR: [238:0]u8 = "uniform sampler2D u_texture;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\n\nvoid main()\n{\n    mediump vec4 color = texture2D(u_texture, v_texCoord);\n    gl_FragColor = color;\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TextureABGR_PixelArt: [352:0]u8 = "uniform sampler2D u_texture;\nuniform mediump vec4 u_texel_size;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\nmediump vec4 GetPixelArtSample(vec2 uv)\n{\n    return texture2D(u_texture, uv);\n}\n\n\nvoid main()\n{\n    mediump vec4 color = GetPixelArtSample(v_texCoord);\n    gl_FragColor = color;\n    gl_FragColor *= v_color;\n}\n".*;
pub const GLES2_Fragment_TextureYUV: [618:0]u8 = "uniform sampler2D u_texture;\nuniform sampler2D u_texture_u;\nuniform sampler2D u_texture_v;\nuniform vec3 u_offset;\nuniform mat3 u_matrix;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\n\nvoid main()\n{\n    mediump vec3 yuv;\n    lowp vec3 rgb;\n\n    // Get the YUV values \n    yuv.x = texture2D(u_texture,   v_texCoord).r;\n    yuv.y = texture2D(u_texture_u, v_texCoord).r;\n    yuv.z = texture2D(u_texture_v, v_texCoord).r;\n\n    // Do the color transform \n    yuv += u_offset;\n    rgb = yuv * u_matrix;\n\n    // That was easy. :) \n    gl_FragColor = vec4(rgb, 1);\n    gl_FragColor *= v_color;\n}".*;
pub const GLES2_Fragment_TextureNV12_RA: [570:0]u8 = "uniform sampler2D u_texture;\nuniform sampler2D u_texture_u;\nuniform sampler2D u_texture_v;\nuniform vec3 u_offset;\nuniform mat3 u_matrix;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\n\nvoid main()\n{\n    mediump vec3 yuv;\n    lowp vec3 rgb;\n\n    // Get the YUV values \n    yuv.x = texture2D(u_texture,   v_texCoord).r;\n    yuv.yz = texture2D(u_texture_u, v_texCoord).ra;\n\n    // Do the color transform \n    yuv += u_offset;\n    rgb = yuv * u_matrix;\n\n    // That was easy. :) \n    gl_FragColor = vec4(rgb, 1);\n    gl_FragColor *= v_color;\n}".*;
pub const GLES2_Fragment_TextureNV12_RG: [570:0]u8 = "uniform sampler2D u_texture;\nuniform sampler2D u_texture_u;\nuniform sampler2D u_texture_v;\nuniform vec3 u_offset;\nuniform mat3 u_matrix;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\n\nvoid main()\n{\n    mediump vec3 yuv;\n    lowp vec3 rgb;\n\n    // Get the YUV values \n    yuv.x = texture2D(u_texture,   v_texCoord).r;\n    yuv.yz = texture2D(u_texture_u, v_texCoord).rg;\n\n    // Do the color transform \n    yuv += u_offset;\n    rgb = yuv * u_matrix;\n\n    // That was easy. :) \n    gl_FragColor = vec4(rgb, 1);\n    gl_FragColor *= v_color;\n}".*;
pub const GLES2_Fragment_TextureNV21_RA: [570:0]u8 = "uniform sampler2D u_texture;\nuniform sampler2D u_texture_u;\nuniform sampler2D u_texture_v;\nuniform vec3 u_offset;\nuniform mat3 u_matrix;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\n\nvoid main()\n{\n    mediump vec3 yuv;\n    lowp vec3 rgb;\n\n    // Get the YUV values \n    yuv.x = texture2D(u_texture,   v_texCoord).r;\n    yuv.yz = texture2D(u_texture_u, v_texCoord).ar;\n\n    // Do the color transform \n    yuv += u_offset;\n    rgb = yuv * u_matrix;\n\n    // That was easy. :) \n    gl_FragColor = vec4(rgb, 1);\n    gl_FragColor *= v_color;\n}".*;
pub const GLES2_Fragment_TextureNV21_RG: [570:0]u8 = "uniform sampler2D u_texture;\nuniform sampler2D u_texture_u;\nuniform sampler2D u_texture_v;\nuniform vec3 u_offset;\nuniform mat3 u_matrix;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\n\nvoid main()\n{\n    mediump vec3 yuv;\n    lowp vec3 rgb;\n\n    // Get the YUV values \n    yuv.x = texture2D(u_texture,   v_texCoord).r;\n    yuv.yz = texture2D(u_texture_u, v_texCoord).gr;\n\n    // Do the color transform \n    yuv += u_offset;\n    rgb = yuv * u_matrix;\n\n    // That was easy. :) \n    gl_FragColor = vec4(rgb, 1);\n    gl_FragColor *= v_color;\n}".*;
pub const GLES2_Fragment_TextureExternalOES_Prologue: [48:0]u8 = "#extension GL_OES_EGL_image_external : require\n\n".*;
pub const GLES2_Fragment_TextureExternalOES: [215:0]u8 = "uniform samplerExternalOES u_texture;\nvarying mediump vec4 v_color;\nvarying SDL_TEXCOORD_PRECISION vec2 v_texCoord;\n\nvoid main()\n{\n    gl_FragColor = texture2D(u_texture, v_texCoord);\n    gl_FragColor *= v_color;\n}\n".*;
