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
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub const Uint8 = u8;
pub const Uint16 = u16;
pub const Uint32 = u32;
pub extern fn SDL_malloc_REAL(size: usize) ?*anyopaque;
pub extern fn SDL_realloc_REAL(mem: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
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
pub const DescriptorInputField = extern struct {
    report_id: Uint8 = 0,
    usage: Uint32 = 0,
    bit_offset: c_int = 0,
    bit_size: c_int = 0,
};
pub const SDL_ReportDescriptor = extern struct {
    field_count: c_int = 0,
    fields: [*c]DescriptorInputField = null,
};
pub export fn SDL_ParseReportDescriptor(descriptor: [*c]const Uint8, descriptor_size: usize) [*c]SDL_ReportDescriptor {
    @setEvalBranchQuota(100000);
    var result: [*c]SDL_ReportDescriptor = null;
    _ = &result;
    var ctx: DescriptorContext = undefined;
    _ = &ctx;
    if (ParseDescriptor(&ctx, descriptor, descriptor_size)) {
        result = @ptrCast(@alignCast(SDL_malloc_REAL(@sizeOf(@TypeOf(result.*)))));
        if (result != null) {
            result.*.field_count = ctx.field_count;
            result.*.fields = ctx.fields;
            ctx.fields = null;
        }
    }
    CleanupContext(&ctx);
    return result;
}
pub export fn SDL_DescriptorHasUsage(descriptor: [*c]SDL_ReportDescriptor, usage_page: Uint16, usage: Uint16) bool {
    @setEvalBranchQuota(100000);
    if (!(descriptor != null)) {
        return @"false" != 0;
    }
    var full_usage: Uint32 = (@as(Uint32, usage_page) << @intCast(@as(Uint32, 16))) | @as(Uint32, @bitCast(@as(c_int, @as(c_int, usage))));
    _ = &full_usage;
    {
        var i: c_int = 0;
        _ = &i;
        while (i < descriptor.*.field_count) : (i += 1) {
            if (descriptor.*.fields[@bitCast(@as(isize, @intCast(i)))].usage == full_usage) {
                return @"true" != 0;
            }
        }
    }
    return @"false" != 0;
}
pub export fn SDL_DestroyDescriptor(descriptor: [*c]SDL_ReportDescriptor) void {
    @setEvalBranchQuota(100000);
    if (descriptor != null) {
        SDL_free_REAL(@ptrCast(@alignCast(descriptor.*.fields)));
        SDL_free_REAL(@ptrCast(@alignCast(descriptor)));
    }
}
pub export fn SDL_ReadReportData(data: [*c]const Uint8, size: usize, bit_offset: c_int, bit_size: c_int, value: [*c]Uint32) bool {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [18:0]u8 = "SDL_ReadReportData".*;
    };
    _ = &static_local___func__;
    var offset: c_int = undefined;
    _ = &offset;
    var shift: c_int = undefined;
    _ = &shift;
    const static_local_sdl_assert_data = struct {
        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
            .always_ignore = @"false" != 0,
            .trigger_count = 0,
            .condition = "(bit_size % 8) == 0",
            .filename = null,
            .linenum = 0,
            .function = null,
            .next = null,
        };
    };
    _ = &static_local_sdl_assert_data;
    var sdl_assert_state: SDL_AssertState = undefined;
    _ = &sdl_assert_state;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                offset = @divTrunc(bit_offset, @as(c_int, 8));
                if (@as(usize, @bitCast(@as(c_long, offset))) >= size) {
                    sdl_pc = 1;
                    continue;
                } else {
                    sdl_pc = 2;
                    continue;
                }
            },
            1 => {
                value.* = 0;
                return SDL_SetError_REAL("Out of bounds reading report data");
            },
            2 => {
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            3 => {
                value.* = ReadValue(data + @as(usize, @bitCast(@as(isize, @intCast(offset)))), @bitCast(@as(c_long, @divTrunc(bit_size + @as(c_int, 7), @as(c_int, 8)))));
                shift = __helpers.signedRemainder(bit_offset, @as(c_int, 8));
                if (shift > @as(c_int, 0)) {
                    sdl_pc = 4;
                    continue;
                } else {
                    sdl_pc = 5;
                    continue;
                }
            },
            4 => {
                value.* >>= @intCast(@as(Uint32, @bitCast(@as(c_int, shift))));
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 6;
                    continue;
                }
            },
            6 => {
                switch (bit_size) {
                    @as(c_int, 1) => {
                        sdl_pc = 8;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 9;
                        continue;
                    },
                    @as(c_int, 10) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 15) => {
                        sdl_pc = 11;
                        continue;
                    },
                    else => {
                        sdl_pc = 12;
                        continue;
                    },
                }
            },
            7 => {
                return @"true" != 0;
            },
            8 => {
                value.* &= 1;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            9 => {
                value.* &= 15;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            10 => {
                value.* &= 1023;
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            11 => {
                value.* &= 32767;
                {
                    sdl_pc = 7;
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
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            14 => {
                if (@as(c_int, 0) != 0) {
                    sdl_pc = 13;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            15 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            16 => {
                if (!(__helpers.signedRemainder(bit_size, @as(c_int, 8)) == @as(c_int, 0))) {
                    sdl_pc = 17;
                    continue;
                } else {
                    sdl_pc = 18;
                    continue;
                }
            },
            17 => {
                sdl_assert_state = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_report_descriptor.c", 587);
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_RETRY)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            18 => {
                {
                    sdl_pc = 14;
                    continue;
                }
            },
            19 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            20 => {
                if (sdl_assert_state == @as(SDL_AssertState, SDL_ASSERTION_BREAK)) {
                    sdl_pc = 22;
                    continue;
                } else {
                    sdl_pc = 23;
                    continue;
                }
            },
            21 => {
                {
                    sdl_pc = 18;
                    continue;
                }
            },
            22 => {
                __builtin.debugtrap();
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            23 => {
                {
                    sdl_pc = 24;
                    continue;
                }
            },
            24 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const DescriptorItemTypeMain: c_int = 0;
pub const DescriptorItemTypeGlobal: c_int = 1;
pub const DescriptorItemTypeLocal: c_int = 2;
pub const DescriptorItemTypeReserved: c_int = 3;
pub const MainTagInput: c_int = 8;
pub const MainTagOutput: c_int = 9;
pub const MainTagFeature: c_int = 11;
pub const MainTagCollection: c_int = 10;
pub const MainTagEndCollection: c_int = 12;
pub const GlobalTagUsagePage: c_int = 0;
pub const GlobalTagLogicalMinimum: c_int = 1;
pub const GlobalTagLogicalMaximum: c_int = 2;
pub const GlobalTagPhysicalMinimum: c_int = 3;
pub const GlobalTagPhysicalMaximum: c_int = 4;
pub const GlobalTagUnitExponent: c_int = 5;
pub const GlobalTagUnit: c_int = 6;
pub const GlobalTagReportSize: c_int = 7;
pub const GlobalTagReportID: c_int = 8;
pub const GlobalTagReportCount: c_int = 9;
pub const GlobalTagPush: c_int = 10;
pub const GlobalTagPop: c_int = 11;
pub const LocalTagUsage: c_int = 0;
pub const LocalTagUsageMinimum: c_int = 1;
pub const LocalTagUsageMaximum: c_int = 2;
pub const LocalTagDesignatorIndex: c_int = 3;
pub const LocalTagDesignatorMinimum: c_int = 4;
pub const LocalTagDesignatorMaximum: c_int = 5;
pub const LocalTagStringIndex: c_int = 7;
pub const LocalTagStringMinimum: c_int = 8;
pub const LocalTagStringMaximum: c_int = 9;
pub const LocalTagDelimiter: c_int = 10;
pub const DescriptorGlobalState = extern struct {
    usage_page: Uint32 = 0,
    report_size: Uint32 = 0,
    report_count: Uint32 = 0,
    report_id: Uint32 = 0,
};
pub const DescriptorLocalState = extern struct {
    usage_minimum: Uint32 = 0,
    usage_maximum: Uint32 = 0,
    usage_maxcount: c_int = 0,
    usage_count: c_int = 0,
    usages: [*c]Uint32 = null,
};
pub const DescriptorContext = extern struct {
    collection_depth: c_int = 0,
    global: DescriptorGlobalState = @import("std").mem.zeroes(DescriptorGlobalState),
    local: DescriptorLocalState = @import("std").mem.zeroes(DescriptorLocalState),
    field_maxcount: c_int = 0,
    field_count: c_int = 0,
    field_offset: c_int = 0,
    fields: [*c]DescriptorInputField = null,
};
pub fn DebugDescriptor(_: [*c]DescriptorContext, _: [*c]const u8, ...) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn DebugMainTag(_: [*c]DescriptorContext, _: [*c]const u8, _: Uint32) callconv(.c) void {
    @setEvalBranchQuota(100000);
}
pub fn ReadValue(arg_data: [*c]const Uint8, arg_size: usize) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var data = arg_data;
    _ = &data;
    var size = arg_size;
    _ = &size;
    var value: Uint32 = 0;
    _ = &value;
    var shift: c_int = 0;
    _ = &shift;
    while ((blk: {
        const ref = &size;
        const tmp = ref.*;
        ref.* -%= 1;
        break :blk tmp;
    }) != 0) {
        value |= @as(Uint32, (blk: {
            const ref = &data;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).*) << @intCast(@as(Uint32, @bitCast(@as(c_int, shift))));
        shift += 8;
    }
    return value;
}
pub fn ResetLocalState(ctx: [*c]DescriptorContext) callconv(.c) void {
    @setEvalBranchQuota(100000);
    ctx.*.local.usage_minimum = 0;
    ctx.*.local.usage_maximum = 0;
    ctx.*.local.usage_count = 0;
}
pub fn AddUsage(ctx: [*c]DescriptorContext, arg_usage: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var usage = arg_usage;
    _ = &usage;
    if (ctx.*.local.usage_count == ctx.*.local.usage_maxcount) {
        var usage_maxcount: c_int = ctx.*.local.usage_maxcount + @as(c_int, 4);
        _ = &usage_maxcount;
        var usages: [*c]Uint32 = undefined;
        usages = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(ctx.*.local.usages)), @as(c_ulong, @bitCast(@as(c_long, usage_maxcount))) *% @sizeOf(@TypeOf(usages.*)))));
        _ = &usages;
        if (!(usages != null)) {
            return @"false" != 0;
        }
        ctx.*.local.usages = usages;
        ctx.*.local.usage_maxcount = usage_maxcount;
    }
    if (usage <= @as(Uint32, 65535)) {
        usage |= ctx.*.global.usage_page << @intCast(@as(Uint32, 16));
    }
    ctx.*.local.usages[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &ctx.*.local.usage_count;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ] = usage;
    return @"true" != 0;
}
pub fn AddInputField(ctx: [*c]DescriptorContext, usage: Uint32, bit_size: c_int) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    if (ctx.*.field_count == ctx.*.field_maxcount) {
        var field_maxcount: c_int = ctx.*.field_maxcount + @as(c_int, 4);
        _ = &field_maxcount;
        var fields: [*c]DescriptorInputField = undefined;
        fields = @ptrCast(@alignCast(SDL_realloc_REAL(@ptrCast(@alignCast(ctx.*.fields)), @as(c_ulong, @bitCast(@as(c_long, field_maxcount))) *% @sizeOf(@TypeOf(fields.*)))));
        _ = &fields;
        if (!(fields != null)) {
            return @"false" != 0;
        }
        ctx.*.fields = fields;
        ctx.*.field_maxcount = field_maxcount;
    }
    var field: [*c]DescriptorInputField = &ctx.*.fields[
        @bitCast(@as(isize, @intCast(blk: {
            const ref = &ctx.*.field_count;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        })))
    ];
    _ = &field;
    field.*.report_id = @truncate(ctx.*.global.report_id);
    field.*.usage = usage;
    field.*.bit_offset = ctx.*.field_offset;
    field.*.bit_size = bit_size;
    DebugDescriptor(ctx, "Adding report %d field 0x%.8x size %d bits at bit offset %d", field.*.report_id, field.*.usage, field.*.bit_size, field.*.bit_offset);
    return @"true" != 0;
}
pub fn AddInputFields(ctx: [*c]DescriptorContext) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var usage: Uint32 = 0;
    _ = &usage;
    if ((ctx.*.global.report_count == @as(Uint32, 0)) or (ctx.*.global.report_size == @as(Uint32, 0))) {
        return @"true" != 0;
    }
    if (((ctx.*.local.usage_count == @as(c_int, 0)) and (ctx.*.local.usage_minimum > @as(Uint32, 0))) and (ctx.*.local.usage_maximum >= ctx.*.local.usage_minimum)) {
        {
            usage = ctx.*.local.usage_minimum;
            while (usage <= ctx.*.local.usage_maximum) : (usage +%= 1) {
                if (!AddUsage(ctx, usage)) {
                    return @"false" != 0;
                }
            }
        }
    }
    var usage_index: c_int = 0;
    _ = &usage_index;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < ctx.*.global.report_count) : (i +%= 1) {
            if (usage_index < ctx.*.local.usage_count) {
                usage = ctx.*.local.usages[@bitCast(@as(isize, @intCast(usage_index)))];
                if (usage_index < (ctx.*.local.usage_count - @as(c_int, 1))) {
                    usage_index += 1;
                }
            }
            var size: c_int = @bitCast(@as(c_uint, @truncate(ctx.*.global.report_size)));
            _ = &size;
            if (usage > @as(Uint32, 0)) {
                if (!AddInputField(ctx, usage, size)) {
                    return @"false" != 0;
                }
            }
            ctx.*.field_offset += size;
        }
    }
    return @"true" != 0;
}
pub fn ParseMainItem(ctx: [*c]DescriptorContext, tag: c_int, size: usize, data: [*c]const Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var flags: Uint32 = undefined;
    _ = &flags;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (tag) {
                    MainTagInput => {
                        sdl_pc = 2;
                        continue;
                    },
                    MainTagOutput => {
                        sdl_pc = 6;
                        continue;
                    },
                    MainTagFeature => {
                        sdl_pc = 7;
                        continue;
                    },
                    MainTagCollection => {
                        sdl_pc = 8;
                        continue;
                    },
                    MainTagEndCollection => {
                        sdl_pc = 18;
                        continue;
                    },
                    else => {
                        sdl_pc = 22;
                        continue;
                    },
                }
            },
            1 => {
                ResetLocalState(ctx);
                return @"true" != 0;
            },
            2 => {
                flags = ReadValue(data, size);
                DebugMainTag(ctx, "MainTagInput", flags);
                if (!AddInputFields(ctx)) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                return @"false" != 0;
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                flags = ReadValue(data, size);
                DebugMainTag(ctx, "MainTagOutput", flags);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                flags = ReadValue(data, size);
                DebugMainTag(ctx, "MainTagFeature", flags);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                DebugDescriptor(ctx, "MainTagCollection");
                switch (@as(c_int, data.*)) {
                    @as(c_int, 0) => {
                        sdl_pc = 10;
                        continue;
                    },
                    @as(c_int, 1) => {
                        sdl_pc = 11;
                        continue;
                    },
                    @as(c_int, 2) => {
                        sdl_pc = 12;
                        continue;
                    },
                    @as(c_int, 3) => {
                        sdl_pc = 13;
                        continue;
                    },
                    @as(c_int, 4) => {
                        sdl_pc = 14;
                        continue;
                    },
                    @as(c_int, 5) => {
                        sdl_pc = 15;
                        continue;
                    },
                    @as(c_int, 6) => {
                        sdl_pc = 16;
                        continue;
                    },
                    else => {
                        sdl_pc = 17;
                        continue;
                    },
                }
            },
            9 => {
                ctx.*.collection_depth += 1;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                DebugDescriptor(ctx, "Physical");
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            11 => {
                DebugDescriptor(ctx, "Application");
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            12 => {
                DebugDescriptor(ctx, "Logical");
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            13 => {
                DebugDescriptor(ctx, "Report");
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            14 => {
                DebugDescriptor(ctx, "Named Array");
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            15 => {
                DebugDescriptor(ctx, "Usage Switch");
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            16 => {
                DebugDescriptor(ctx, "Usage Modifier");
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            17 => {
                {
                    sdl_pc = 9;
                    continue;
                }
            },
            18 => {
                if (ctx.*.collection_depth > @as(c_int, 0)) {
                    sdl_pc = 19;
                    continue;
                } else {
                    sdl_pc = 20;
                    continue;
                }
            },
            19 => {
                ctx.*.collection_depth -= 1;
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 21;
                    continue;
                }
            },
            21 => {
                DebugDescriptor(ctx, "MainTagEndCollection");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            22 => {
                DebugDescriptor(ctx, "Unknown main tag: %d", tag);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn ParseGlobalItem(ctx: [*c]DescriptorContext, tag: c_int, size: usize, data: [*c]const Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var value: Uint32 = undefined;
    _ = &value;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (tag) {
                    GlobalTagUsagePage => {
                        sdl_pc = 2;
                        continue;
                    },
                    GlobalTagLogicalMinimum => {
                        sdl_pc = 3;
                        continue;
                    },
                    GlobalTagLogicalMaximum => {
                        sdl_pc = 4;
                        continue;
                    },
                    GlobalTagPhysicalMinimum => {
                        sdl_pc = 5;
                        continue;
                    },
                    GlobalTagPhysicalMaximum => {
                        sdl_pc = 6;
                        continue;
                    },
                    GlobalTagUnitExponent => {
                        sdl_pc = 7;
                        continue;
                    },
                    GlobalTagUnit => {
                        sdl_pc = 8;
                        continue;
                    },
                    GlobalTagReportSize => {
                        sdl_pc = 9;
                        continue;
                    },
                    GlobalTagReportID => {
                        sdl_pc = 10;
                        continue;
                    },
                    GlobalTagReportCount => {
                        sdl_pc = 11;
                        continue;
                    },
                    GlobalTagPush => {
                        sdl_pc = 12;
                        continue;
                    },
                    GlobalTagPop => {
                        sdl_pc = 13;
                        continue;
                    },
                    else => {
                        sdl_pc = 14;
                        continue;
                    },
                }
            },
            1 => {
                return @"true" != 0;
            },
            2 => {
                ctx.*.global.usage_page = ReadValue(data, size);
                DebugDescriptor(ctx, "GlobalTagUsagePage: 0x%.4x", ctx.*.global.usage_page);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            3 => {
                value = ReadValue(data, size);
                DebugDescriptor(ctx, "GlobalTagLogicalMinimum: %u", value);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                value = ReadValue(data, size);
                DebugDescriptor(ctx, "GlobalTagLogicalMaximum: %u", value);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            5 => {
                value = ReadValue(data, size);
                DebugDescriptor(ctx, "GlobalTagPhysicalMinimum: %u", value);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                value = ReadValue(data, size);
                DebugDescriptor(ctx, "GlobalTagPhysicalMaximum: %u", value);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                DebugDescriptor(ctx, "GlobalTagUnitExponent");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                DebugDescriptor(ctx, "GlobalTagUnit");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                ctx.*.global.report_size = ReadValue(data, size);
                DebugDescriptor(ctx, "GlobalTagReportSize: %u", ctx.*.global.report_size);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                ctx.*.global.report_id = ReadValue(data, size);
                ctx.*.field_offset = 0;
                DebugDescriptor(ctx, "GlobalTagReportID: %u", ctx.*.global.report_id);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                ctx.*.global.report_count = ReadValue(data, size);
                DebugDescriptor(ctx, "GlobalTagReportCount: %u", ctx.*.global.report_count);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                DebugDescriptor(ctx, "GlobalTagPush");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            13 => {
                DebugDescriptor(ctx, "GlobalTagPop");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            14 => {
                DebugDescriptor(ctx, "Unknown global tag");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn ParseLocalItem(ctx: [*c]DescriptorContext, tag: c_int, size: usize, data: [*c]const Uint8) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var value: Uint32 = undefined;
    _ = &value;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                switch (tag) {
                    LocalTagUsage => {
                        sdl_pc = 2;
                        continue;
                    },
                    LocalTagUsageMinimum => {
                        sdl_pc = 6;
                        continue;
                    },
                    LocalTagUsageMaximum => {
                        sdl_pc = 7;
                        continue;
                    },
                    LocalTagDesignatorIndex => {
                        sdl_pc = 8;
                        continue;
                    },
                    LocalTagDesignatorMinimum => {
                        sdl_pc = 9;
                        continue;
                    },
                    LocalTagDesignatorMaximum => {
                        sdl_pc = 10;
                        continue;
                    },
                    LocalTagStringIndex => {
                        sdl_pc = 11;
                        continue;
                    },
                    LocalTagStringMinimum => {
                        sdl_pc = 12;
                        continue;
                    },
                    LocalTagStringMaximum => {
                        sdl_pc = 13;
                        continue;
                    },
                    LocalTagDelimiter => {
                        sdl_pc = 14;
                        continue;
                    },
                    else => {
                        sdl_pc = 15;
                        continue;
                    },
                }
            },
            1 => {
                return @"true" != 0;
            },
            2 => {
                value = ReadValue(data, size);
                DebugDescriptor(ctx, "LocalTagUsage: 0x%.4x", value);
                if (!AddUsage(ctx, value)) {
                    sdl_pc = 3;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            3 => {
                return @"false" != 0;
            },
            4 => {
                {
                    sdl_pc = 5;
                    continue;
                }
            },
            5 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            6 => {
                ctx.*.local.usage_minimum = ReadValue(data, size);
                DebugDescriptor(ctx, "LocalTagUsageMinimum: 0x%.4x", ctx.*.local.usage_minimum);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            7 => {
                ctx.*.local.usage_maximum = ReadValue(data, size);
                DebugDescriptor(ctx, "LocalTagUsageMaximum: 0x%.4x", ctx.*.local.usage_maximum);
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            8 => {
                DebugDescriptor(ctx, "LocalTagDesignatorIndex");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            9 => {
                DebugDescriptor(ctx, "LocalTagDesignatorMinimum");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            10 => {
                DebugDescriptor(ctx, "LocalTagDesignatorMaximum");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            11 => {
                DebugDescriptor(ctx, "LocalTagStringIndex");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            12 => {
                DebugDescriptor(ctx, "LocalTagStringMinimum");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            13 => {
                DebugDescriptor(ctx, "LocalTagStringMaximum");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            14 => {
                DebugDescriptor(ctx, "LocalTagDelimiter");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            15 => {
                DebugDescriptor(ctx, "Unknown local tag");
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            else => unreachable,
        }
    }
}
pub fn ParseDescriptor(ctx: [*c]DescriptorContext, descriptor: [*c]const Uint8, descriptor_size: usize) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    var here: [*c]const Uint8 = undefined;
    _ = &here;
    const static_local_sizes = struct {
        const sizes: [4]c_int = [4]c_int{
            0,
            1,
            2,
            4,
        };
    };
    _ = &static_local_sizes;
    var data: Uint8 = undefined;
    _ = &data;
    var size: usize = undefined;
    _ = &size;
    var @"type": c_int = undefined;
    _ = &@"type";
    var tag: c_int = undefined;
    _ = &tag;
    var sdl_pc: usize = 0;
    while (true) {
        switch (sdl_pc) {
            0 => {
                _ = memset(@ptrCast(@alignCast(ctx)), 0, @sizeOf(@TypeOf(ctx.*)));
                here = descriptor;
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            1 => {
                if (here < (descriptor + descriptor_size)) {
                    sdl_pc = 2;
                    continue;
                } else {
                    sdl_pc = 4;
                    continue;
                }
            },
            2 => {
                data = (blk: {
                    const ref = &here;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).*;
                size = @bitCast(@as(c_long, static_local_sizes.sizes[@bitCast(@as(isize, @intCast(@as(c_int, data) & @as(c_int, 3))))]));
                @"type" = (@as(c_int, data) >> @intCast(@as(c_int, 2))) & @as(c_int, 3);
                tag = @as(c_int, data) >> @intCast(@as(c_int, 4));
                if ((here + size) > (descriptor + descriptor_size)) {
                    sdl_pc = 5;
                    continue;
                } else {
                    sdl_pc = 6;
                    continue;
                }
            },
            3 => {
                {
                    sdl_pc = 1;
                    continue;
                }
            },
            4 => {
                return @"true" != 0;
            },
            5 => {
                return SDL_SetError_REAL("Invalid descriptor");
            },
            6 => {
                {
                    sdl_pc = 7;
                    continue;
                }
            },
            7 => {
                switch (@"type") {
                    DescriptorItemTypeMain => {
                        sdl_pc = 9;
                        continue;
                    },
                    DescriptorItemTypeGlobal => {
                        sdl_pc = 13;
                        continue;
                    },
                    DescriptorItemTypeLocal => {
                        sdl_pc = 17;
                        continue;
                    },
                    DescriptorItemTypeReserved => {
                        sdl_pc = 21;
                        continue;
                    },
                    else => {
                        sdl_pc = 8;
                        continue;
                    },
                }
            },
            8 => {
                here += size;
                {
                    sdl_pc = 3;
                    continue;
                }
            },
            9 => {
                if (!ParseMainItem(ctx, tag, size, here)) {
                    sdl_pc = 10;
                    continue;
                } else {
                    sdl_pc = 11;
                    continue;
                }
            },
            10 => {
                return @"false" != 0;
            },
            11 => {
                {
                    sdl_pc = 12;
                    continue;
                }
            },
            12 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            13 => {
                if (!ParseGlobalItem(ctx, tag, size, here)) {
                    sdl_pc = 14;
                    continue;
                } else {
                    sdl_pc = 15;
                    continue;
                }
            },
            14 => {
                return @"false" != 0;
            },
            15 => {
                {
                    sdl_pc = 16;
                    continue;
                }
            },
            16 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            17 => {
                if (!ParseLocalItem(ctx, tag, size, here)) {
                    sdl_pc = 18;
                    continue;
                } else {
                    sdl_pc = 19;
                    continue;
                }
            },
            18 => {
                return @"false" != 0;
            },
            19 => {
                {
                    sdl_pc = 20;
                    continue;
                }
            },
            20 => {
                {
                    sdl_pc = 8;
                    continue;
                }
            },
            21 => {
                return SDL_SetError_REAL("That operation is not supported");
            },
            else => unreachable,
        }
    }
}
pub fn CleanupContext(ctx: [*c]DescriptorContext) callconv(.c) void {
    @setEvalBranchQuota(100000);
    SDL_free_REAL(@ptrCast(@alignCast(ctx.*.local.usages)));
    SDL_free_REAL(@ptrCast(@alignCast(ctx.*.fields)));
}
