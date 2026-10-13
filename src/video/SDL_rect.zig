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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Sint64 = i64;
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
pub const struct_SDL_Point = extern struct {
    x: c_int = 0,
    y: c_int = 0,
};
pub const SDL_Point = struct_SDL_Point;
pub const struct_SDL_FPoint = extern struct {
    x: f32 = 0,
    y: f32 = 0,
};
pub const SDL_FPoint = struct_SDL_FPoint;
pub const struct_SDL_Rect = extern struct {
    x: c_int = 0,
    y: c_int = 0,
    w: c_int = 0,
    h: c_int = 0,
};
pub const SDL_Rect = struct_SDL_Rect;
pub const struct_SDL_FRect = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    w: f32 = 0,
    h: f32 = 0,
};
pub const SDL_FRect = struct_SDL_FRect;
pub inline fn SDL_RectEmpty(r: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    return (if ((!(r != null) or (r.*.w <= @as(c_int, 0))) or (r.*.h <= @as(c_int, 0))) @"true" else @"false") != 0;
}
pub inline fn SDL_RectEmptyFloat(r: [*c]const SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    return (if ((!(r != null) or (r.*.w < @as(f32, 0.0))) or (r.*.h < @as(f32, 0.0))) @"true" else @"false") != 0;
}
pub export fn SDL_GetSpanEnclosingRect(width: c_int, height: c_int, numrects: c_int, rects: [*c]const SDL_Rect, span: [*c]SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var i: c_int = undefined;
    _ = &i;
    var span_y1: c_int = undefined;
    _ = &span_y1;
    var span_y2: c_int = undefined;
    _ = &span_y2;
    var rect_y1: c_int = undefined;
    _ = &rect_y1;
    var rect_y2: c_int = undefined;
    _ = &rect_y2;
    if (width < @as(c_int, 1)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("width"))));
        return @"false" != 0;
    }
    if (height < @as(c_int, 1)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("height"))));
        return @"false" != 0;
    }
    if (!(rects != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("rects"))));
        return @"false" != 0;
    }
    if (!(span != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("span"))));
        return @"false" != 0;
    }
    if (numrects < @as(c_int, 1)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("numrects"))));
        return @"false" != 0;
    }
    span_y1 = height;
    span_y2 = 0;
    {
        i = 0;
        while (i < numrects) : (i += 1) {
            rect_y1 = rects[@bitCast(@as(isize, @intCast(i)))].y;
            rect_y2 = rect_y1 + rects[@bitCast(@as(isize, @intCast(i)))].h;
            if (rect_y1 < @as(c_int, 0)) {
                span_y1 = 0;
            } else if (rect_y1 < span_y1) {
                span_y1 = rect_y1;
            }
            if (rect_y2 > height) {
                span_y2 = height;
            } else if (rect_y2 > span_y2) {
                span_y2 = rect_y2;
            }
        }
    }
    if (span_y2 > span_y1) {
        span.*.x = 0;
        span.*.y = span_y1;
        span.*.w = width;
        span.*.h = span_y2 - span_y1;
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub fn SDL_RectCanOverflow(rect: [*c]const SDL_Rect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((((((rect.*.x <= @divTrunc(~@as(c_int, 2147483647), @as(c_int, 2))) or (rect.*.x >= @divTrunc(@as(c_int, 2147483647), @as(c_int, 2)))) or (rect.*.y <= @divTrunc(~@as(c_int, 2147483647), @as(c_int, 2)))) or (rect.*.y >= @divTrunc(@as(c_int, 2147483647), @as(c_int, 2)))) or (rect.*.w >= @divTrunc(@as(c_int, 2147483647), @as(c_int, 2)))) or (rect.*.h >= @divTrunc(@as(c_int, 2147483647), @as(c_int, 2)))) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_HasRectIntersection_REAL(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var Amin: c_int = undefined;
    _ = &Amin;
    var Amax: c_int = undefined;
    _ = &Amax;
    var Bmin: c_int = undefined;
    _ = &Bmin;
    var Bmax: c_int = undefined;
    _ = &Bmax;
    if (!(A != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("A"))));
        return @"false" != 0;
    }
    if (!(B != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("B"))));
        return @"false" != 0;
    }
    if (SDL_RectCanOverflow(A) or SDL_RectCanOverflow(B)) {
        _ = SDL_SetError_REAL("Potential rect math overflow");
        return @"false" != 0;
    }
    Amin = A.*.x;
    Amax = Amin + A.*.w;
    Bmin = B.*.x;
    Bmax = Bmin + B.*.w;
    if (Bmin > Amin) {
        Amin = Bmin;
    }
    if (Bmax < Amax) {
        Amax = Bmax;
    }
    if ((Amax - @as(c_int, 1)) < Amin) {
        return @"false" != 0;
    }
    Amin = A.*.y;
    Amax = Amin + A.*.h;
    Bmin = B.*.y;
    Bmax = Bmin + B.*.h;
    if (Bmin > Amin) {
        Amin = Bmin;
    }
    if (Bmax < Amax) {
        Amax = Bmax;
    }
    if ((Amax - @as(c_int, 1)) < Amin) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_GetRectIntersection_REAL(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var Amin: c_int = undefined;
    _ = &Amin;
    var Amax: c_int = undefined;
    _ = &Amax;
    var Bmin: c_int = undefined;
    _ = &Bmin;
    var Bmax: c_int = undefined;
    _ = &Bmax;
    if (!(A != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("A"))));
        return @"false" != 0;
    }
    if (!(B != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("B"))));
        return @"false" != 0;
    }
    if (SDL_RectCanOverflow(A) or SDL_RectCanOverflow(B)) {
        _ = SDL_SetError_REAL("Potential rect math overflow");
        return @"false" != 0;
    }
    if (!(result != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("result"))));
        return @"false" != 0;
    }
    Amin = A.*.x;
    Amax = Amin + A.*.w;
    Bmin = B.*.x;
    Bmax = Bmin + B.*.w;
    if (Bmin > Amin) {
        Amin = Bmin;
    }
    result.*.x = Amin;
    if (Bmax < Amax) {
        Amax = Bmax;
    }
    result.*.w = Amax - Amin;
    Amin = A.*.y;
    Amax = Amin + A.*.h;
    Bmin = B.*.y;
    Bmax = Bmin + B.*.h;
    if (Bmin > Amin) {
        Amin = Bmin;
    }
    result.*.y = Amin;
    if (Bmax < Amax) {
        Amax = Bmax;
    }
    result.*.h = Amax - Amin;
    return !SDL_RectEmpty(result);
}
pub export fn SDL_GetRectUnion_REAL(A: [*c]const SDL_Rect, B: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var Amin: c_int = undefined;
    _ = &Amin;
    var Amax: c_int = undefined;
    _ = &Amax;
    var Bmin: c_int = undefined;
    _ = &Bmin;
    var Bmax: c_int = undefined;
    _ = &Bmax;
    if (!(A != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("A"))));
    }
    if (!(B != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("B"))));
    }
    if (SDL_RectCanOverflow(A) or SDL_RectCanOverflow(B)) {
        return SDL_SetError_REAL("Potential rect math overflow");
    }
    if (!(result != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("result"))));
    }
    if (SDL_RectEmpty(A)) {
        if (SDL_RectEmpty(B)) {
            _ = memset(@ptrCast(@alignCast(result)), 0, @sizeOf(@TypeOf(result.*)));
        } else {
            result.* = B.*;
        }
        return @"true" != 0;
    } else if (SDL_RectEmpty(B)) {
        result.* = A.*;
        return @"true" != 0;
    }
    Amin = A.*.x;
    Amax = Amin + A.*.w;
    Bmin = B.*.x;
    Bmax = Bmin + B.*.w;
    if (Bmin < Amin) {
        Amin = Bmin;
    }
    result.*.x = Amin;
    if (Bmax > Amax) {
        Amax = Bmax;
    }
    result.*.w = Amax - Amin;
    Amin = A.*.y;
    Amax = Amin + A.*.h;
    Bmin = B.*.y;
    Bmax = Bmin + B.*.h;
    if (Bmin < Amin) {
        Amin = Bmin;
    }
    result.*.y = Amin;
    if (Bmax > Amax) {
        Amax = Bmax;
    }
    result.*.h = Amax - Amin;
    return @"true" != 0;
}
pub export fn SDL_GetRectEnclosingPoints_REAL(points: [*c]const SDL_Point, count: c_int, clip: [*c]const SDL_Rect, result: [*c]SDL_Rect) bool {
    @setEvalBranchQuota(100000);
    var minx: c_int = 0;
    _ = &minx;
    var miny: c_int = 0;
    _ = &miny;
    var maxx: c_int = 0;
    _ = &maxx;
    var maxy: c_int = 0;
    _ = &maxy;
    var x: c_int = undefined;
    _ = &x;
    var y: c_int = undefined;
    _ = &y;
    var i: c_int = undefined;
    _ = &i;
    if (!(points != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("points"))));
        return @"false" != 0;
    }
    if (count < @as(c_int, 1)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("count"))));
        return @"false" != 0;
    }
    if (clip != null) {
        var added: bool = @"false" != 0;
        _ = &added;
        const clip_minx: c_int = clip.*.x;
        _ = &clip_minx;
        const clip_miny: c_int = clip.*.y;
        _ = &clip_miny;
        const clip_maxx: c_int = (clip.*.x + clip.*.w) - @as(c_int, 1);
        _ = &clip_maxx;
        const clip_maxy: c_int = (clip.*.y + clip.*.h) - @as(c_int, 1);
        _ = &clip_maxy;
        if (SDL_RectEmpty(clip)) {
            return @"false" != 0;
        }
        {
            i = 0;
            while (i < count) : (i += 1) {
                x = points[@bitCast(@as(isize, @intCast(i)))].x;
                y = points[@bitCast(@as(isize, @intCast(i)))].y;
                if ((((x < clip_minx) or (x > clip_maxx)) or (y < clip_miny)) or (y > clip_maxy)) {
                    continue;
                }
                if (!added) {
                    if (!(result != null)) {
                        return @"true" != 0;
                    }
                    minx = blk: {
                        const tmp = x;
                        maxx = tmp;
                        break :blk tmp;
                    };
                    miny = blk: {
                        const tmp = y;
                        maxy = tmp;
                        break :blk tmp;
                    };
                    added = @"true" != 0;
                    continue;
                }
                if (x < minx) {
                    minx = x;
                } else if (x > maxx) {
                    maxx = x;
                }
                if (y < miny) {
                    miny = y;
                } else if (y > maxy) {
                    maxy = y;
                }
            }
        }
        if (!added) {
            return @"false" != 0;
        }
    } else {
        if (!(result != null)) {
            return @"true" != 0;
        }
        minx = blk: {
            const tmp = points[@as(c_int, 0)].x;
            maxx = tmp;
            break :blk tmp;
        };
        miny = blk: {
            const tmp = points[@as(c_int, 0)].y;
            maxy = tmp;
            break :blk tmp;
        };
        {
            i = 1;
            while (i < count) : (i += 1) {
                x = points[@bitCast(@as(isize, @intCast(i)))].x;
                y = points[@bitCast(@as(isize, @intCast(i)))].y;
                if (x < minx) {
                    minx = x;
                } else if (x > maxx) {
                    maxx = x;
                }
                if (y < miny) {
                    miny = y;
                } else if (y > maxy) {
                    maxy = y;
                }
            }
        }
    }
    if (result != null) {
        result.*.x = minx;
        result.*.y = miny;
        result.*.w = (maxx - minx) + @as(c_int, 1);
        result.*.h = (maxy - miny) + @as(c_int, 1);
    }
    return @"true" != 0;
}
pub fn ComputeOutCode(rect: [*c]const SDL_Rect, x: c_int, y: c_int) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var code: c_int = 0;
    _ = &code;
    if (y < rect.*.y) {
        code |= CODE_TOP;
    } else if (y > ((rect.*.y + rect.*.h) - @as(c_int, 1))) {
        code |= CODE_BOTTOM;
    }
    if (x < rect.*.x) {
        code |= CODE_LEFT;
    } else if (x > ((rect.*.x + rect.*.w) - @as(c_int, 1))) {
        code |= CODE_RIGHT;
    }
    return code;
}
pub export fn SDL_GetRectAndLineIntersection_REAL(rect: [*c]const SDL_Rect, X1: [*c]c_int, Y1: [*c]c_int, X2: [*c]c_int, Y2: [*c]c_int) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [35:0]u8 = "SDL_GetRectAndLineIntersection_REAL".*;
    };
    _ = &static_local___func__;
    var x: c_int = 0;
    _ = &x;
    var y: c_int = 0;
    _ = &y;
    var x1: c_int = undefined;
    _ = &x1;
    var y1_1: c_int = undefined;
    _ = &y1_1;
    var x2: c_int = undefined;
    _ = &x2;
    var y2: c_int = undefined;
    _ = &y2;
    var rectx1: c_int = undefined;
    _ = &rectx1;
    var recty1: c_int = undefined;
    _ = &recty1;
    var rectx2: c_int = undefined;
    _ = &rectx2;
    var recty2: c_int = undefined;
    _ = &recty2;
    var outcode1: c_int = undefined;
    _ = &outcode1;
    var outcode2: c_int = undefined;
    _ = &outcode2;
    if (!(rect != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("rect"))));
        return @"false" != 0;
    }
    if (SDL_RectCanOverflow(rect)) {
        _ = SDL_SetError_REAL("Potential rect math overflow");
        return @"false" != 0;
    }
    if (!(X1 != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("X1"))));
        return @"false" != 0;
    }
    if (!(Y1 != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("Y1"))));
        return @"false" != 0;
    }
    if (!(X2 != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("X2"))));
        return @"false" != 0;
    }
    if (!(Y2 != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("Y2"))));
        return @"false" != 0;
    }
    if (SDL_RectEmpty(rect)) {
        return @"false" != 0;
    }
    x1 = X1.*;
    y1_1 = Y1.*;
    x2 = X2.*;
    y2 = Y2.*;
    rectx1 = rect.*.x;
    recty1 = rect.*.y;
    rectx2 = (rect.*.x + rect.*.w) - @as(c_int, 1);
    recty2 = (rect.*.y + rect.*.h) - @as(c_int, 1);
    if ((((((((x1 >= rectx1) and (x1 <= rectx2)) and (x2 >= rectx1)) and (x2 <= rectx2)) and (y1_1 >= recty1)) and (y1_1 <= recty2)) and (y2 >= recty1)) and (y2 <= recty2)) {
        return @"true" != 0;
    }
    if (((((x1 < rectx1) and (x2 < rectx1)) or ((x1 > rectx2) and (x2 > rectx2))) or ((y1_1 < recty1) and (y2 < recty1))) or ((y1_1 > recty2) and (y2 > recty2))) {
        return @"false" != 0;
    }
    if (y1_1 == y2) {
        if (x1 < rectx1) {
            X1.* = rectx1;
        } else if (x1 > rectx2) {
            X1.* = rectx2;
        }
        if (x2 < rectx1) {
            X2.* = rectx1;
        } else if (x2 > rectx2) {
            X2.* = rectx2;
        }
        return @"true" != 0;
    }
    if (x1 == x2) {
        if (y1_1 < recty1) {
            Y1.* = recty1;
        } else if (y1_1 > recty2) {
            Y1.* = recty2;
        }
        if (y2 < recty1) {
            Y2.* = recty1;
        } else if (y2 > recty2) {
            Y2.* = recty2;
        }
        return @"true" != 0;
    }
    outcode1 = ComputeOutCode(rect, x1, y1_1);
    outcode2 = ComputeOutCode(rect, x2, y2);
    while ((outcode1 != 0) or (outcode2 != 0)) {
        if ((outcode1 & outcode2) != 0) {
            return @"false" != 0;
        }
        if (outcode1 != 0) {
            if ((outcode1 & CODE_TOP) != 0) {
                y = recty1;
                x = @truncate(@as(Sint64, x1) + @divTrunc(@as(Sint64, x2 - x1) * @as(Sint64, y - y1_1), @as(Sint64, y2 - y1_1)));
            } else if ((outcode1 & CODE_BOTTOM) != 0) {
                y = recty2;
                x = @truncate(@as(Sint64, x1) + @divTrunc(@as(Sint64, x2 - x1) * @as(Sint64, y - y1_1), @as(Sint64, y2 - y1_1)));
            } else if ((outcode1 & CODE_LEFT) != 0) {
                x = rectx1;
                y = @truncate(@as(Sint64, y1_1) + @divTrunc(@as(Sint64, y2 - y1_1) * @as(Sint64, x - x1), @as(Sint64, x2 - x1)));
            } else if ((outcode1 & CODE_RIGHT) != 0) {
                x = rectx2;
                y = @truncate(@as(Sint64, y1_1) + @divTrunc(@as(Sint64, y2 - y1_1) * @as(Sint64, x - x1), @as(Sint64, x2 - x1)));
            }
            x1 = x;
            y1_1 = y;
            outcode1 = ComputeOutCode(rect, x, y);
        } else {
            if ((outcode2 & CODE_TOP) != 0) {
                while (true) {
                    while (!(y2 != y1_1)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "y2 != y1",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_rect_impl.h", 430);
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
                y = recty1;
                x = @truncate(@as(Sint64, x1) + @divTrunc(@as(Sint64, x2 - x1) * @as(Sint64, y - y1_1), @as(Sint64, y2 - y1_1)));
            } else if ((outcode2 & CODE_BOTTOM) != 0) {
                while (true) {
                    while (!(y2 != y1_1)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "y2 != y1",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_rect_impl.h", 434);
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
                y = recty2;
                x = @truncate(@as(Sint64, x1) + @divTrunc(@as(Sint64, x2 - x1) * @as(Sint64, y - y1_1), @as(Sint64, y2 - y1_1)));
            } else if ((outcode2 & CODE_LEFT) != 0) {
                while (true) {
                    while (!(x2 != x1)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "x2 != x1",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_rect_impl.h", 440);
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
                x = rectx1;
                y = @truncate(@as(Sint64, y1_1) + @divTrunc(@as(Sint64, y2 - y1_1) * @as(Sint64, x - x1), @as(Sint64, x2 - x1)));
            } else if ((outcode2 & CODE_RIGHT) != 0) {
                while (true) {
                    while (!(x2 != x1)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "x2 != x1",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_rect_impl.h", 446);
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
                x = rectx2;
                y = @truncate(@as(Sint64, y1_1) + @divTrunc(@as(Sint64, y2 - y1_1) * @as(Sint64, x - x1), @as(Sint64, x2 - x1)));
            }
            x2 = x;
            y2 = y;
            outcode2 = ComputeOutCode(rect, x, y);
        }
    }
    X1.* = x1;
    Y1.* = y1_1;
    X2.* = x2;
    Y2.* = y2;
    return @"true" != 0;
}
pub fn SDL_RectCanOverflowFloat(rect: [*c]const SDL_FRect) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if ((((((rect.*.x <= @as(f32, @floatFromInt(@divTrunc(~@as(c_int, 2147483647), @as(c_int, 2))))) or (rect.*.x >= @as(f32, @floatFromInt(@divTrunc(@as(c_int, 2147483647), @as(c_int, 2)))))) or (rect.*.y <= @as(f32, @floatFromInt(@divTrunc(~@as(c_int, 2147483647), @as(c_int, 2)))))) or (rect.*.y >= @as(f32, @floatFromInt(@divTrunc(@as(c_int, 2147483647), @as(c_int, 2)))))) or (rect.*.w >= @as(f32, @floatFromInt(@divTrunc(@as(c_int, 2147483647), @as(c_int, 2)))))) or (rect.*.h >= @as(f32, @floatFromInt(@divTrunc(@as(c_int, 2147483647), @as(c_int, 2)))))) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub export fn SDL_HasRectIntersectionFloat_REAL(A: [*c]const SDL_FRect, B: [*c]const SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    var Amin: f32 = undefined;
    _ = &Amin;
    var Amax: f32 = undefined;
    _ = &Amax;
    var Bmin: f32 = undefined;
    _ = &Bmin;
    var Bmax: f32 = undefined;
    _ = &Bmax;
    if (!(A != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("A"))));
        return @"false" != 0;
    }
    if (!(B != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("B"))));
        return @"false" != 0;
    }
    if (SDL_RectCanOverflowFloat(A) or SDL_RectCanOverflowFloat(B)) {
        _ = SDL_SetError_REAL("Potential rect math overflow");
        return @"false" != 0;
    }
    Amin = A.*.x;
    Amax = Amin + A.*.w;
    Bmin = B.*.x;
    Bmax = Bmin + B.*.w;
    if (Bmin > Amin) {
        Amin = Bmin;
    }
    if (Bmax < Amax) {
        Amax = Bmax;
    }
    if ((Amax - @as(f32, 0.0)) < Amin) {
        return @"false" != 0;
    }
    Amin = A.*.y;
    Amax = Amin + A.*.h;
    Bmin = B.*.y;
    Bmax = Bmin + B.*.h;
    if (Bmin > Amin) {
        Amin = Bmin;
    }
    if (Bmax < Amax) {
        Amax = Bmax;
    }
    if ((Amax - @as(f32, 0.0)) < Amin) {
        return @"false" != 0;
    }
    return @"true" != 0;
}
pub export fn SDL_GetRectIntersectionFloat_REAL(A: [*c]const SDL_FRect, B: [*c]const SDL_FRect, result: [*c]SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    var Amin: f32 = undefined;
    _ = &Amin;
    var Amax: f32 = undefined;
    _ = &Amax;
    var Bmin: f32 = undefined;
    _ = &Bmin;
    var Bmax: f32 = undefined;
    _ = &Bmax;
    if (!(A != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("A"))));
        return @"false" != 0;
    }
    if (!(B != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("B"))));
        return @"false" != 0;
    }
    if (SDL_RectCanOverflowFloat(A) or SDL_RectCanOverflowFloat(B)) {
        _ = SDL_SetError_REAL("Potential rect math overflow");
        return @"false" != 0;
    }
    if (!(result != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("result"))));
        return @"false" != 0;
    }
    Amin = A.*.x;
    Amax = Amin + A.*.w;
    Bmin = B.*.x;
    Bmax = Bmin + B.*.w;
    if (Bmin > Amin) {
        Amin = Bmin;
    }
    result.*.x = Amin;
    if (Bmax < Amax) {
        Amax = Bmax;
    }
    result.*.w = Amax - Amin;
    Amin = A.*.y;
    Amax = Amin + A.*.h;
    Bmin = B.*.y;
    Bmax = Bmin + B.*.h;
    if (Bmin > Amin) {
        Amin = Bmin;
    }
    result.*.y = Amin;
    if (Bmax < Amax) {
        Amax = Bmax;
    }
    result.*.h = Amax - Amin;
    return !SDL_RectEmptyFloat(result);
}
pub export fn SDL_GetRectUnionFloat_REAL(A: [*c]const SDL_FRect, B: [*c]const SDL_FRect, result: [*c]SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    var Amin: f32 = undefined;
    _ = &Amin;
    var Amax: f32 = undefined;
    _ = &Amax;
    var Bmin: f32 = undefined;
    _ = &Bmin;
    var Bmax: f32 = undefined;
    _ = &Bmax;
    if (!(A != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("A"))));
    }
    if (!(B != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("B"))));
    }
    if (SDL_RectCanOverflowFloat(A) or SDL_RectCanOverflowFloat(B)) {
        return SDL_SetError_REAL("Potential rect math overflow");
    }
    if (!(result != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("result"))));
    }
    if (SDL_RectEmptyFloat(A)) {
        if (SDL_RectEmptyFloat(B)) {
            _ = memset(@ptrCast(@alignCast(result)), 0, @sizeOf(@TypeOf(result.*)));
        } else {
            result.* = B.*;
        }
        return @"true" != 0;
    } else if (SDL_RectEmptyFloat(B)) {
        result.* = A.*;
        return @"true" != 0;
    }
    Amin = A.*.x;
    Amax = Amin + A.*.w;
    Bmin = B.*.x;
    Bmax = Bmin + B.*.w;
    if (Bmin < Amin) {
        Amin = Bmin;
    }
    result.*.x = Amin;
    if (Bmax > Amax) {
        Amax = Bmax;
    }
    result.*.w = Amax - Amin;
    Amin = A.*.y;
    Amax = Amin + A.*.h;
    Bmin = B.*.y;
    Bmax = Bmin + B.*.h;
    if (Bmin < Amin) {
        Amin = Bmin;
    }
    result.*.y = Amin;
    if (Bmax > Amax) {
        Amax = Bmax;
    }
    result.*.h = Amax - Amin;
    return @"true" != 0;
}
pub export fn SDL_GetRectEnclosingPointsFloat_REAL(points: [*c]const SDL_FPoint, count: c_int, clip: [*c]const SDL_FRect, result: [*c]SDL_FRect) bool {
    @setEvalBranchQuota(100000);
    var minx: f32 = @floatFromInt(@as(c_int, 0));
    _ = &minx;
    var miny: f32 = @floatFromInt(@as(c_int, 0));
    _ = &miny;
    var maxx: f32 = @floatFromInt(@as(c_int, 0));
    _ = &maxx;
    var maxy: f32 = @floatFromInt(@as(c_int, 0));
    _ = &maxy;
    var x: f32 = undefined;
    _ = &x;
    var y: f32 = undefined;
    _ = &y;
    var i: c_int = undefined;
    _ = &i;
    if (!(points != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("points"))));
        return @"false" != 0;
    }
    if (count < @as(c_int, 1)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("count"))));
        return @"false" != 0;
    }
    if (clip != null) {
        var added: bool = @"false" != 0;
        _ = &added;
        const clip_minx: f32 = clip.*.x;
        _ = &clip_minx;
        const clip_miny: f32 = clip.*.y;
        _ = &clip_miny;
        const clip_maxx: f32 = (clip.*.x + clip.*.w) - @as(f32, 0.0);
        _ = &clip_maxx;
        const clip_maxy: f32 = (clip.*.y + clip.*.h) - @as(f32, 0.0);
        _ = &clip_maxy;
        if (SDL_RectEmptyFloat(clip)) {
            return @"false" != 0;
        }
        {
            i = 0;
            while (i < count) : (i += 1) {
                x = points[@bitCast(@as(isize, @intCast(i)))].x;
                y = points[@bitCast(@as(isize, @intCast(i)))].y;
                if ((((x < clip_minx) or (x > clip_maxx)) or (y < clip_miny)) or (y > clip_maxy)) {
                    continue;
                }
                if (!added) {
                    if (!(result != null)) {
                        return @"true" != 0;
                    }
                    minx = blk: {
                        const tmp = x;
                        maxx = tmp;
                        break :blk tmp;
                    };
                    miny = blk: {
                        const tmp = y;
                        maxy = tmp;
                        break :blk tmp;
                    };
                    added = @"true" != 0;
                    continue;
                }
                if (x < minx) {
                    minx = x;
                } else if (x > maxx) {
                    maxx = x;
                }
                if (y < miny) {
                    miny = y;
                } else if (y > maxy) {
                    maxy = y;
                }
            }
        }
        if (!added) {
            return @"false" != 0;
        }
    } else {
        if (!(result != null)) {
            return @"true" != 0;
        }
        minx = blk: {
            const tmp = points[@as(c_int, 0)].x;
            maxx = tmp;
            break :blk tmp;
        };
        miny = blk: {
            const tmp = points[@as(c_int, 0)].y;
            maxy = tmp;
            break :blk tmp;
        };
        {
            i = 1;
            while (i < count) : (i += 1) {
                x = points[@bitCast(@as(isize, @intCast(i)))].x;
                y = points[@bitCast(@as(isize, @intCast(i)))].y;
                if (x < minx) {
                    minx = x;
                } else if (x > maxx) {
                    maxx = x;
                }
                if (y < miny) {
                    miny = y;
                } else if (y > maxy) {
                    maxy = y;
                }
            }
        }
    }
    if (result != null) {
        result.*.x = minx;
        result.*.y = miny;
        result.*.w = (maxx - minx) + @as(f32, 0.0);
        result.*.h = (maxy - miny) + @as(f32, 0.0);
    }
    return @"true" != 0;
}
pub fn ComputeOutCodeFloat(rect: [*c]const SDL_FRect, x: f32, y: f32) callconv(.c) c_int {
    @setEvalBranchQuota(100000);
    var code: c_int = 0;
    _ = &code;
    if (y < rect.*.y) {
        code |= CODE_TOP;
    } else if (y > ((rect.*.y + rect.*.h) - @as(f32, 0.0))) {
        code |= CODE_BOTTOM;
    }
    if (x < rect.*.x) {
        code |= CODE_LEFT;
    } else if (x > ((rect.*.x + rect.*.w) - @as(f32, 0.0))) {
        code |= CODE_RIGHT;
    }
    return code;
}
pub export fn SDL_GetRectAndLineIntersectionFloat_REAL(rect: [*c]const SDL_FRect, X1: [*c]f32, Y1: [*c]f32, X2: [*c]f32, Y2: [*c]f32) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [40:0]u8 = "SDL_GetRectAndLineIntersectionFloat_REAL".*;
    };
    _ = &static_local___func__;
    var x: f32 = @floatFromInt(@as(c_int, 0));
    _ = &x;
    var y: f32 = @floatFromInt(@as(c_int, 0));
    _ = &y;
    var x1: f32 = undefined;
    _ = &x1;
    var y1_1: f32 = undefined;
    _ = &y1_1;
    var x2: f32 = undefined;
    _ = &x2;
    var y2: f32 = undefined;
    _ = &y2;
    var rectx1: f32 = undefined;
    _ = &rectx1;
    var recty1: f32 = undefined;
    _ = &recty1;
    var rectx2: f32 = undefined;
    _ = &rectx2;
    var recty2: f32 = undefined;
    _ = &recty2;
    var outcode1: c_int = undefined;
    _ = &outcode1;
    var outcode2: c_int = undefined;
    _ = &outcode2;
    if (!(rect != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("rect"))));
        return @"false" != 0;
    }
    if (SDL_RectCanOverflowFloat(rect)) {
        _ = SDL_SetError_REAL("Potential rect math overflow");
        return @"false" != 0;
    }
    if (!(X1 != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("X1"))));
        return @"false" != 0;
    }
    if (!(Y1 != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("Y1"))));
        return @"false" != 0;
    }
    if (!(X2 != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("X2"))));
        return @"false" != 0;
    }
    if (!(Y2 != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("Y2"))));
        return @"false" != 0;
    }
    if (SDL_RectEmptyFloat(rect)) {
        return @"false" != 0;
    }
    x1 = X1.*;
    y1_1 = Y1.*;
    x2 = X2.*;
    y2 = Y2.*;
    rectx1 = rect.*.x;
    recty1 = rect.*.y;
    rectx2 = (rect.*.x + rect.*.w) - @as(f32, 0.0);
    recty2 = (rect.*.y + rect.*.h) - @as(f32, 0.0);
    if ((((((((x1 >= rectx1) and (x1 <= rectx2)) and (x2 >= rectx1)) and (x2 <= rectx2)) and (y1_1 >= recty1)) and (y1_1 <= recty2)) and (y2 >= recty1)) and (y2 <= recty2)) {
        return @"true" != 0;
    }
    if (((((x1 < rectx1) and (x2 < rectx1)) or ((x1 > rectx2) and (x2 > rectx2))) or ((y1_1 < recty1) and (y2 < recty1))) or ((y1_1 > recty2) and (y2 > recty2))) {
        return @"false" != 0;
    }
    if (y1_1 == y2) {
        if (x1 < rectx1) {
            X1.* = rectx1;
        } else if (x1 > rectx2) {
            X1.* = rectx2;
        }
        if (x2 < rectx1) {
            X2.* = rectx1;
        } else if (x2 > rectx2) {
            X2.* = rectx2;
        }
        return @"true" != 0;
    }
    if (x1 == x2) {
        if (y1_1 < recty1) {
            Y1.* = recty1;
        } else if (y1_1 > recty2) {
            Y1.* = recty2;
        }
        if (y2 < recty1) {
            Y2.* = recty1;
        } else if (y2 > recty2) {
            Y2.* = recty2;
        }
        return @"true" != 0;
    }
    outcode1 = ComputeOutCodeFloat(rect, x1, y1_1);
    outcode2 = ComputeOutCodeFloat(rect, x2, y2);
    while ((outcode1 != 0) or (outcode2 != 0)) {
        if ((outcode1 & outcode2) != 0) {
            return @"false" != 0;
        }
        if (outcode1 != 0) {
            if ((outcode1 & CODE_TOP) != 0) {
                y = recty1;
                x = @floatCast(@as(f64, @floatCast(x1)) + ((@as(f64, @floatCast(x2 - x1)) * @as(f64, @floatCast(y - y1_1))) / @as(f64, @floatCast(y2 - y1_1))));
            } else if ((outcode1 & CODE_BOTTOM) != 0) {
                y = recty2;
                x = @floatCast(@as(f64, @floatCast(x1)) + ((@as(f64, @floatCast(x2 - x1)) * @as(f64, @floatCast(y - y1_1))) / @as(f64, @floatCast(y2 - y1_1))));
            } else if ((outcode1 & CODE_LEFT) != 0) {
                x = rectx1;
                y = @floatCast(@as(f64, @floatCast(y1_1)) + ((@as(f64, @floatCast(y2 - y1_1)) * @as(f64, @floatCast(x - x1))) / @as(f64, @floatCast(x2 - x1))));
            } else if ((outcode1 & CODE_RIGHT) != 0) {
                x = rectx2;
                y = @floatCast(@as(f64, @floatCast(y1_1)) + ((@as(f64, @floatCast(y2 - y1_1)) * @as(f64, @floatCast(x - x1))) / @as(f64, @floatCast(x2 - x1))));
            }
            x1 = x;
            y1_1 = y;
            outcode1 = ComputeOutCodeFloat(rect, x, y);
        } else {
            if ((outcode2 & CODE_TOP) != 0) {
                while (true) {
                    while (!(y2 != y1_1)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "y2 != y1",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_rect_impl.h", 430);
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
                y = recty1;
                x = @floatCast(@as(f64, @floatCast(x1)) + ((@as(f64, @floatCast(x2 - x1)) * @as(f64, @floatCast(y - y1_1))) / @as(f64, @floatCast(y2 - y1_1))));
            } else if ((outcode2 & CODE_BOTTOM) != 0) {
                while (true) {
                    while (!(y2 != y1_1)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "y2 != y1",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_rect_impl.h", 434);
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
                y = recty2;
                x = @floatCast(@as(f64, @floatCast(x1)) + ((@as(f64, @floatCast(x2 - x1)) * @as(f64, @floatCast(y - y1_1))) / @as(f64, @floatCast(y2 - y1_1))));
            } else if ((outcode2 & CODE_LEFT) != 0) {
                while (true) {
                    while (!(x2 != x1)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "x2 != x1",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_rect_impl.h", 440);
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
                x = rectx1;
                y = @floatCast(@as(f64, @floatCast(y1_1)) + ((@as(f64, @floatCast(y2 - y1_1)) * @as(f64, @floatCast(x - x1))) / @as(f64, @floatCast(x2 - x1))));
            } else if ((outcode2 & CODE_RIGHT) != 0) {
                while (true) {
                    while (!(x2 != x1)) {
                        const static_local_sdl_assert_data = struct {
                            var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                                .always_ignore = @"false" != 0,
                                .trigger_count = 0,
                                .condition = "x2 != x1",
                                .filename = null,
                                .linenum = 0,
                                .function = null,
                                .next = null,
                            };
                        };
                        _ = &static_local_sdl_assert_data;
                        const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_rect_impl.h", 446);
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
                x = rectx2;
                y = @floatCast(@as(f64, @floatCast(y1_1)) + ((@as(f64, @floatCast(y2 - y1_1)) * @as(f64, @floatCast(x - x1))) / @as(f64, @floatCast(x2 - x1))));
            }
            x2 = x;
            y2 = y;
            outcode2 = ComputeOutCodeFloat(rect, x, y);
        }
    }
    X1.* = x1;
    Y1.* = y1_1;
    X2.* = x2;
    Y2.* = y2;
    return @"true" != 0;
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const CODE_BOTTOM = @as(c_int, 1);
pub const CODE_TOP = @as(c_int, 2);
pub const CODE_LEFT = @as(c_int, 4);
pub const CODE_RIGHT = @as(c_int, 8);
