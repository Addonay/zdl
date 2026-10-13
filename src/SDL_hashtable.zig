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
pub const Uint32 = u32;
pub const Uint64 = u64;
pub const struct_SDL_HashTable = extern struct {
    lock: ?*SDL_RWLock = null,
    table: [*c]SDL_HashItem = null,
    hash: SDL_HashCallback = null,
    keymatch: SDL_HashKeyMatchCallback = null,
    destroy: SDL_HashDestroyCallback = null,
    userdata: ?*anyopaque = null,
    hash_mask: Uint32 = 0,
    max_probe_len: Uint32 = 0,
    num_occupied_slots: Uint32 = 0,
};
pub const SDL_HashTable = struct_SDL_HashTable;
pub const SDL_HashCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque) callconv(.c) Uint32;
pub const SDL_HashKeyMatchCallback = ?*const fn (userdata: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) callconv(.c) bool;
pub const SDL_HashDestroyCallback = ?*const fn (userdata: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) void;
pub const SDL_HashTableIterateCallback = ?*const fn (userdata: ?*anyopaque, table: [*c]const SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque) callconv(.c) bool;
pub export fn SDL_CreateHashTable(estimated_capacity: c_int, threadsafe: bool, hash: SDL_HashCallback, keymatch: SDL_HashKeyMatchCallback, destroy: SDL_HashDestroyCallback, userdata: ?*anyopaque) [*c]SDL_HashTable {
    @setEvalBranchQuota(100000);
    const num_buckets: Uint32 = CalculateHashBucketsFromEstimate(estimated_capacity);
    _ = &num_buckets;
    var table: [*c]SDL_HashTable = @ptrCast(@alignCast(SDL_calloc_REAL(1, @sizeOf(SDL_HashTable))));
    _ = &table;
    if (!(table != null)) {
        return null;
    }
    if (threadsafe) {
        table.*.lock = SDL_CreateRWLock_REAL();
        if (!(table.*.lock != null)) {
            SDL_DestroyHashTable(table);
            return null;
        }
    }
    table.*.table = @ptrCast(@alignCast(SDL_calloc_REAL(num_buckets, @sizeOf(SDL_HashItem))));
    if (!(table.*.table != null)) {
        SDL_DestroyHashTable(table);
        return null;
    }
    table.*.hash_mask = num_buckets -% @as(Uint32, 1);
    table.*.userdata = userdata;
    table.*.hash = hash;
    table.*.keymatch = keymatch;
    table.*.destroy = destroy;
    return table;
}
pub export fn SDL_DestroyHashTable(table: [*c]SDL_HashTable) void {
    @setEvalBranchQuota(100000);
    if (table != null) {
        destroy_all(table);
        if (table.*.lock != null) {
            SDL_DestroyRWLock_REAL(table.*.lock);
        }
        SDL_free_REAL(@ptrCast(@alignCast(table.*.table)));
        SDL_free_REAL(@ptrCast(@alignCast(table)));
    }
}
pub export fn SDL_InsertIntoHashTable(table: [*c]SDL_HashTable, key: ?*const anyopaque, value: ?*const anyopaque, replace: bool) bool {
    @setEvalBranchQuota(100000);
    if (!(table != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("table"))));
    }
    var result: bool = @"false" != 0;
    _ = &result;
    SDL_LockRWLockForWriting_REAL(table.*.lock);
    const hash: Uint32 = calc_hash(table, key);
    _ = &hash;
    var item: [*c]SDL_HashItem = find_first_item(table, key, hash);
    _ = &item;
    var do_insert: bool = @"true" != 0;
    _ = &do_insert;
    if (item != null) {
        if (replace) {
            delete_item(table, item);
        } else {
            _ = SDL_SetError_REAL("key already exists and replace is disabled");
            do_insert = @"false" != 0;
        }
    }
    if (do_insert) {
        var new_item: SDL_HashItem = undefined;
        _ = &new_item;
        new_item.key = key;
        new_item.value = value;
        new_item.hash = hash;
        new_item.flags.live = @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, @"true"))))))))));
        new_item.flags.probe_len = @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, 0))))))))));
        table.*.num_occupied_slots +%= 1;
        if (!maybe_resize(table)) {
            table.*.num_occupied_slots -%= 1;
        } else {
            _ = insert_item(&new_item, table.*.table, table.*.hash_mask, &table.*.max_probe_len);
            result = @"true" != 0;
        }
    }
    SDL_UnlockRWLock_REAL(table.*.lock);
    return result;
}
pub export fn SDL_FindInHashTable(table: [*c]const SDL_HashTable, key: ?*const anyopaque, value: [*c]?*const anyopaque) bool {
    @setEvalBranchQuota(100000);
    if (!(table != null)) {
        if (value != null) {
            value.* = null;
        }
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("table"))));
    }
    SDL_LockRWLockForReading_REAL(table.*.lock);
    var result: bool = @"false" != 0;
    _ = &result;
    const hash: Uint32 = calc_hash(table, key);
    _ = &hash;
    var i: [*c]SDL_HashItem = find_first_item(table, key, hash);
    _ = &i;
    if (i != null) {
        if (value != null) {
            value.* = i.*.value;
        }
        result = @"true" != 0;
    }
    SDL_UnlockRWLock_REAL(table.*.lock);
    return result;
}
pub export fn SDL_RemoveFromHashTable(table: [*c]SDL_HashTable, key: ?*const anyopaque) bool {
    @setEvalBranchQuota(100000);
    if (!(table != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("table"))));
    }
    SDL_LockRWLockForWriting_REAL(table.*.lock);
    var result: bool = @"false" != 0;
    _ = &result;
    const hash: Uint32 = calc_hash(table, key);
    _ = &hash;
    var item: [*c]SDL_HashItem = find_first_item(table, key, hash);
    _ = &item;
    if (item != null) {
        delete_item(table, item);
        result = @"true" != 0;
    }
    SDL_UnlockRWLock_REAL(table.*.lock);
    return result;
}
pub export fn SDL_ClearHashTable(table: [*c]SDL_HashTable) void {
    @setEvalBranchQuota(100000);
    if (table != null) {
        SDL_LockRWLockForWriting_REAL(table.*.lock);
        {
            destroy_all(table);
            _ = memset(@ptrCast(@alignCast(table.*.table)), 0, @sizeOf(@TypeOf(table.*.table.*)) *% @as(c_ulong, table.*.hash_mask +% @as(Uint32, 1)));
            table.*.num_occupied_slots = 0;
        }
        SDL_UnlockRWLock_REAL(table.*.lock);
    }
}
pub export fn SDL_GetNumHashTableItems(table: [*c]SDL_HashTable) c_int {
    @setEvalBranchQuota(100000);
    if (!(table != null)) {
        _ = SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("table"))));
        return 0;
    }
    SDL_LockRWLockForReading_REAL(table.*.lock);
    const retval: c_int = @bitCast(@as(c_uint, @truncate(table.*.num_occupied_slots)));
    _ = &retval;
    SDL_UnlockRWLock_REAL(table.*.lock);
    return retval;
}
pub export fn SDL_HashTableEmpty(table: [*c]SDL_HashTable) bool {
    @setEvalBranchQuota(100000);
    return SDL_GetNumHashTableItems(table) <= @as(c_int, 0);
}
pub export fn SDL_IterateHashTable(table: [*c]const SDL_HashTable, callback: SDL_HashTableIterateCallback, userdata: ?*anyopaque) bool {
    @setEvalBranchQuota(100000);
    if (!(table != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("table"))));
    }
    if (!(callback != null)) {
        return SDL_SetError_REAL("Parameter '%s' is invalid", @as([*c]u8, @as([*c]u8, @constCast("callback"))));
    }
    SDL_LockRWLockForReading_REAL(table.*.lock);
    var end: [*c]SDL_HashItem = table.*.table + (table.*.hash_mask +% @as(Uint32, 1));
    _ = &end;
    var num_iterated: Uint32 = 0;
    _ = &num_iterated;
    {
        var item: [*c]SDL_HashItem = table.*.table;
        _ = &item;
        while (item < end) : (item += 1) {
            if (item.*.flags.live != 0) {
                if (!callback.?(userdata, table, item.*.key, item.*.value)) {
                    break;
                } else if ((blk: {
                    const ref = &num_iterated;
                    ref.* +%= 1;
                    break :blk ref.*;
                }) >= table.*.num_occupied_slots) {
                    break;
                }
            }
        }
    }
    SDL_UnlockRWLock_REAL(table.*.lock);
    return @"true" != 0;
}
pub export fn SDL_HashPointer(arg_unused: ?*anyopaque, arg_key: ?*const anyopaque) Uint32 {
    @setEvalBranchQuota(100000);
    var unused = arg_unused;
    _ = &unused;
    var key = arg_key;
    _ = &key;
    _ = &unused;
    return SDL_murmur3_32_REAL(@ptrCast(@alignCast(&key)), @sizeOf(@TypeOf(key)), 0);
}
pub export fn SDL_KeyMatchPointer(arg_unused: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) bool {
    @setEvalBranchQuota(100000);
    var unused = arg_unused;
    _ = &unused;
    _ = &unused;
    return a == b;
}
pub export fn SDL_HashString(arg_unused: ?*anyopaque, key: ?*const anyopaque) Uint32 {
    @setEvalBranchQuota(100000);
    var unused = arg_unused;
    _ = &unused;
    _ = &unused;
    var str: [*c]const u8 = @ptrCast(@alignCast(key));
    _ = &str;
    return hash_string_djbxor(str, SDL_strlen_REAL(str));
}
pub export fn SDL_KeyMatchString(arg_unused: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) bool {
    @setEvalBranchQuota(100000);
    var unused = arg_unused;
    _ = &unused;
    var a_string: [*c]const u8 = @ptrCast(@alignCast(a));
    _ = &a_string;
    var b_string: [*c]const u8 = @ptrCast(@alignCast(b));
    _ = &b_string;
    _ = &unused;
    if (a == b) {
        return @"true" != 0;
    } else if (!(a != null) or !(b != null)) {
        return @"false" != 0;
    } else if (@as(c_int, a_string[@as(c_int, 0)]) != @as(c_int, b_string[@as(c_int, 0)])) {
        return @"false" != 0;
    }
    return SDL_strcmp_REAL(a_string, b_string) == @as(c_int, 0);
}
comptime {
    if (!(@sizeOf(Uint32) <= @sizeOf(?*const anyopaque))) @compileError("static assertion failed \"sizeof(Uint32) <= sizeof(const void *)\"");
}
pub export fn SDL_HashID(arg_unused: ?*anyopaque, key: ?*const anyopaque) Uint32 {
    @setEvalBranchQuota(100000);
    var unused = arg_unused;
    _ = &unused;
    _ = &unused;
    return @truncate(@as(usize, @intCast(@intFromPtr(key))));
}
pub export fn SDL_KeyMatchID(arg_unused: ?*anyopaque, a: ?*const anyopaque, b: ?*const anyopaque) bool {
    @setEvalBranchQuota(100000);
    var unused = arg_unused;
    _ = &unused;
    _ = &unused;
    return a == b;
}
pub export fn SDL_DestroyHashKeyAndValue(arg_unused: ?*anyopaque, key: ?*const anyopaque, value: ?*const anyopaque) void {
    @setEvalBranchQuota(100000);
    var unused = arg_unused;
    _ = &unused;
    _ = &unused;
    SDL_free_REAL(@ptrCast(@alignCast(@constCast(key))));
    SDL_free_REAL(@ptrCast(@alignCast(@constCast(value))));
}
pub export fn SDL_DestroyHashKey(arg_unused: ?*anyopaque, key: ?*const anyopaque, arg_value: ?*const anyopaque) void {
    @setEvalBranchQuota(100000);
    var unused = arg_unused;
    _ = &unused;
    var value = arg_value;
    _ = &value;
    _ = &value;
    _ = &unused;
    SDL_free_REAL(@ptrCast(@alignCast(@constCast(key))));
}
pub export fn SDL_DestroyHashValue(arg_unused: ?*anyopaque, arg_key: ?*const anyopaque, value: ?*const anyopaque) void {
    @setEvalBranchQuota(100000);
    var unused = arg_unused;
    _ = &unused;
    var key = arg_key;
    _ = &key;
    _ = &key;
    _ = &unused;
    SDL_free_REAL(@ptrCast(@alignCast(@constCast(value))));
}

pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub extern fn SDL_calloc_REAL(nmemb: usize, size: usize) ?*anyopaque;
pub extern fn SDL_free_REAL(mem: ?*anyopaque) void;
pub extern fn SDL_murmur3_32_REAL(data: ?*const anyopaque, len: usize, seed: Uint32) Uint32;
pub extern fn SDL_strlen_REAL(str: [*c]const u8) usize;
pub extern fn SDL_strcmp_REAL(str1: [*c]const u8, str2: [*c]const u8) c_int;
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
pub const struct_SDL_RWLock = opaque {
};
pub const SDL_RWLock = struct_SDL_RWLock;
pub extern fn SDL_CreateRWLock_REAL() ?*SDL_RWLock;
pub extern fn SDL_LockRWLockForReading_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_LockRWLockForWriting_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_UnlockRWLock_REAL(rwlock: ?*SDL_RWLock) void;
pub extern fn SDL_DestroyRWLock_REAL(rwlock: ?*SDL_RWLock) void;
pub inline fn SDL_MostSignificantBitIndex32(x: Uint32) c_int {
    @setEvalBranchQuota(100000);
    if (x == @as(Uint32, 0)) {
        return -@as(c_int, 1);
    }
    return @as(c_int, 31) - __builtin.clz(x);
}
pub inline fn SDL_HasExactlyOneBitSet32(arg_x: Uint32) bool {
    @setEvalBranchQuota(100000);
    var x = arg_x;
    _ = &x;
    if ((x != 0) and (@as(Uint32, @bitCast(@as(c_int, @intFromBool(!((x & (x -% @as(Uint32, 1))) != 0))))) != 0)) {
        return @"true" != 0;
    }
    return @"false" != 0;
}
pub const struct_SDL_HashItem = extern struct {
    key: ?*const anyopaque = null,
    value: ?*const anyopaque = null,
    hash: Uint32 = 0,
    flags: packed struct(u32) { probe_len: u31 = 0, live: u1 = 0 } = .{},
};
pub const SDL_HashItem = struct_SDL_HashItem;
pub fn CalculateHashBucketsFromEstimate(arg_estimated_capacity: c_int) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var estimated_capacity = arg_estimated_capacity;
    _ = &estimated_capacity;
    if (estimated_capacity <= @as(c_int, 0)) {
        return 4;
    }
    const estimated32: Uint32 = @bitCast(@as(c_int, estimated_capacity));
    _ = &estimated32;
    var buckets: Uint32 = @as(Uint32, @bitCast(@as(c_int, @as(c_int, 1)))) << @intCast(@as(Uint32, @bitCast(@as(c_int, SDL_MostSignificantBitIndex32(estimated32)))));
    _ = &buckets;
    if (!SDL_HasExactlyOneBitSet32(estimated32)) {
        buckets <<= @intCast(@as(Uint32, 1));
    }
    return if (buckets < (@as(c_uint, 2147483648) / MAX_HASHITEM_SIZEOF)) buckets else @as(c_uint, 2147483648) / MAX_HASHITEM_SIZEOF;
}
pub fn calc_hash(table: [*c]const SDL_HashTable, key: ?*const anyopaque) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    const BitMixer: Uint32 = 2654435761;
    _ = &BitMixer;
    return table.*.hash.?(table.*.userdata, key) *% BitMixer;
}
pub fn get_probe_length(zero_idx: Uint32, actual_idx: Uint32, num_buckets: Uint32) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    if (actual_idx < zero_idx) {
        return (num_buckets -% zero_idx) +% actual_idx;
    }
    return actual_idx -% zero_idx;
}
pub fn find_item(ht: [*c]const SDL_HashTable, key: ?*const anyopaque, hash: Uint32, i: [*c]Uint32, probe_len: [*c]Uint32) callconv(.c) [*c]SDL_HashItem {
    @setEvalBranchQuota(100000);
    const static_local___func__ = struct {
        const __func__: [9:0]u8 = "find_item".*;
    };
    _ = &static_local___func__;
    var hash_mask: Uint32 = ht.*.hash_mask;
    _ = &hash_mask;
    var max_probe_len: Uint32 = ht.*.max_probe_len;
    _ = &max_probe_len;
    var table: [*c]SDL_HashItem = ht.*.table;
    _ = &table;
    while (true) {
        var item: [*c]SDL_HashItem = table + i.*;
        _ = &item;
        var item_hash: Uint32 = item.*.hash;
        _ = &item_hash;
        if (!(item.*.flags.live != 0)) {
            return null;
        }
        if ((item_hash == hash) and ht.*.keymatch.?(ht.*.userdata, item.*.key, key)) {
            return item;
        }
        var item_probe_len: Uint32 = item.*.flags.probe_len;
        _ = &item_probe_len;
        while (true) {
            while (!(item_probe_len == get_probe_length(item_hash & hash_mask, @bitCast(@as(c_int, @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(item) -% @intFromPtr(table))), @sizeOf(SDL_HashItem))))), hash_mask +% @as(Uint32, 1)))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "item_probe_len == get_probe_length(item_hash & hash_mask, (Uint32)(item - table), hash_mask + 1)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hashtable.c", 137);
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
        if (probe_len.* > item_probe_len) {
            return null;
        }
        if ((blk: {
            const ref = &probe_len.*;
            ref.* +%= 1;
            break :blk ref.*;
        }) > max_probe_len) {
            return null;
        }
        i.* = (i.* +% @as(Uint32, 1)) & hash_mask;
    }
    return undefined;
}
pub fn find_first_item(ht: [*c]const SDL_HashTable, key: ?*const anyopaque, hash: Uint32) callconv(.c) [*c]SDL_HashItem {
    @setEvalBranchQuota(100000);
    var i: Uint32 = hash & ht.*.hash_mask;
    _ = &i;
    var probe_len: Uint32 = 0;
    _ = &probe_len;
    return find_item(ht, key, hash, &i, &probe_len);
}
pub fn insert_item(item_to_insert: [*c]SDL_HashItem, table: [*c]SDL_HashItem, arg_hash_mask: Uint32, max_probe_len_ptr: [*c]Uint32) callconv(.c) [*c]SDL_HashItem {
    @setEvalBranchQuota(100000);
    var hash_mask = arg_hash_mask;
    _ = &hash_mask;
    const static_local___func__ = struct {
        const __func__: [11:0]u8 = "insert_item".*;
    };
    _ = &static_local___func__;
    const num_buckets: Uint32 = hash_mask +% @as(Uint32, 1);
    _ = &num_buckets;
    var idx: Uint32 = item_to_insert.*.hash & hash_mask;
    _ = &idx;
    var target: [*c]SDL_HashItem = null;
    _ = &target;
    var temp_item: SDL_HashItem = undefined;
    _ = &temp_item;
    while (true) {
        var candidate: [*c]SDL_HashItem = table + idx;
        _ = &candidate;
        if (!(candidate.*.flags.live != 0)) {
            candidate.* = item_to_insert.*;
            if (@as(?*anyopaque, @ptrCast(@alignCast(target))) == @as(?*anyopaque, null)) {
                target = candidate;
            }
            const probe_len: Uint32 = get_probe_length(candidate.*.hash & hash_mask, idx, num_buckets);
            _ = &probe_len;
            candidate.*.flags.probe_len = @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, probe_len))))))))));
            if (max_probe_len_ptr.* < probe_len) {
                max_probe_len_ptr.* = probe_len;
            }
            break;
        }
        const candidate_probe_len: Uint32 = candidate.*.flags.probe_len;
        _ = &candidate_probe_len;
        while (true) {
            while (!(candidate_probe_len == get_probe_length(candidate.*.hash & hash_mask, idx, num_buckets))) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "candidate_probe_len == get_probe_length(candidate->hash & hash_mask, idx, num_buckets)",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hashtable.c", 187);
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
        const new_probe_len: Uint32 = get_probe_length(item_to_insert.*.hash & hash_mask, idx, num_buckets);
        _ = &new_probe_len;
        if (candidate_probe_len < new_probe_len) {
            temp_item = candidate.*;
            candidate.* = item_to_insert.*;
            if (@as(?*anyopaque, @ptrCast(@alignCast(target))) == @as(?*anyopaque, null)) {
                target = candidate;
            }
            item_to_insert.* = temp_item;
            while (true) {
                while (!(new_probe_len == get_probe_length(candidate.*.hash & hash_mask, idx, num_buckets))) {
                    const static_local_sdl_assert_data = struct {
                        var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                            .always_ignore = @"false" != 0,
                            .trigger_count = 0,
                            .condition = "new_probe_len == get_probe_length(candidate->hash & hash_mask, idx, num_buckets)",
                            .filename = null,
                            .linenum = 0,
                            .function = null,
                            .next = null,
                        };
                    };
                    _ = &static_local_sdl_assert_data;
                    const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hashtable.c", 204);
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
            candidate.*.flags.probe_len = @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, new_probe_len))))))))));
            if (max_probe_len_ptr.* < new_probe_len) {
                max_probe_len_ptr.* = new_probe_len;
            }
        }
        idx = (idx +% @as(Uint32, 1)) & hash_mask;
    }
    return target;
}
pub fn delete_item(ht: [*c]SDL_HashTable, arg_item: [*c]SDL_HashItem) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var item = arg_item;
    _ = &item;
    const static_local___func__ = struct {
        const __func__: [11:0]u8 = "delete_item".*;
    };
    _ = &static_local___func__;
    const hash_mask: Uint32 = ht.*.hash_mask;
    _ = &hash_mask;
    var table: [*c]SDL_HashItem = ht.*.table;
    _ = &table;
    if (ht.*.destroy != null) {
        ht.*.destroy.?(ht.*.userdata, item.*.key, item.*.value);
    }
    while (true) {
        while (!(ht.*.num_occupied_slots > @as(Uint32, 0))) {
            const static_local_sdl_assert_data = struct {
                var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                    .always_ignore = @"false" != 0,
                    .trigger_count = 0,
                    .condition = "ht->num_occupied_slots > 0",
                    .filename = null,
                    .linenum = 0,
                    .function = null,
                    .next = null,
                };
            };
            _ = &static_local_sdl_assert_data;
            const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hashtable.c", 227);
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
    ht.*.num_occupied_slots -%= 1;
    var idx: Uint32 = @bitCast(@as(c_int, @truncate(@divExact(@as(c_long, @bitCast(@intFromPtr(item) -% @intFromPtr(ht.*.table))), @sizeOf(SDL_HashItem)))));
    _ = &idx;
    while (true) {
        idx = (idx +% @as(Uint32, 1)) & hash_mask;
        var next_item: [*c]SDL_HashItem = table + idx;
        _ = &next_item;
        if (next_item.*.flags.probe_len < @as(Uint32, 1)) {
            _ = memset(@ptrCast(@alignCast(item)), 0, @sizeOf(@TypeOf(item.*)));
            return;
        }
        item.* = next_item.*;
        item.*.flags.probe_len -%= 1;
        while (true) {
            while (!(item.*.flags.probe_len < ht.*.max_probe_len)) {
                const static_local_sdl_assert_data = struct {
                    var sdl_assert_data: struct_SDL_AssertData = struct_SDL_AssertData{
                        .always_ignore = @"false" != 0,
                        .trigger_count = 0,
                        .condition = "item->probe_len < ht->max_probe_len",
                        .filename = null,
                        .linenum = 0,
                        .function = null,
                        .next = null,
                    };
                };
                _ = &static_local_sdl_assert_data;
                const sdl_assert_state: SDL_AssertState = SDL_ReportAssertion_REAL(&static_local_sdl_assert_data.sdl_assert_data, @ptrCast(@alignCast(&static_local___func__.__func__)), "SDL_hashtable.c", 243);
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
        item = next_item;
    }
}
pub fn resize(ht: [*c]SDL_HashTable, new_size: Uint32) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const new_hash_mask: Uint32 = new_size -% @as(Uint32, 1);
    _ = &new_hash_mask;
    var new_table: [*c]SDL_HashItem = undefined;
    new_table = @ptrCast(@alignCast(SDL_calloc_REAL(new_size, @sizeOf(@TypeOf(new_table.*)))));
    _ = &new_table;
    if (!(new_table != null)) {
        return @"false" != 0;
    }
    var old_table: [*c]SDL_HashItem = ht.*.table;
    _ = &old_table;
    const old_size: Uint32 = ht.*.hash_mask +% @as(Uint32, 1);
    _ = &old_size;
    ht.*.max_probe_len = 0;
    ht.*.hash_mask = new_hash_mask;
    ht.*.table = new_table;
    {
        var i: Uint32 = 0;
        _ = &i;
        while (i < old_size) : (i +%= 1) {
            var item: [*c]SDL_HashItem = old_table + i;
            _ = &item;
            if (item.*.flags.live != 0) {
                _ = insert_item(item, new_table, new_hash_mask, &ht.*.max_probe_len);
            }
        }
    }
    SDL_free_REAL(@ptrCast(@alignCast(old_table)));
    return @"true" != 0;
}
pub fn maybe_resize(ht: [*c]SDL_HashTable) callconv(.c) bool {
    @setEvalBranchQuota(100000);
    const capacity: Uint32 = ht.*.hash_mask +% @as(Uint32, 1);
    _ = &capacity;
    if (capacity >= (@as(c_uint, 2147483648) / MAX_HASHITEM_SIZEOF)) {
        return @"false" != 0;
    }
    const max_load_factor: Uint32 = 217;
    _ = &max_load_factor;
    const resize_threshold: Uint32 = @truncate((@as(Uint64, max_load_factor) *% @as(Uint64, capacity)) >> @intCast(@as(Uint64, 8)));
    _ = &resize_threshold;
    if (ht.*.num_occupied_slots > resize_threshold) {
        return resize(ht, capacity *% @as(Uint32, 2));
    }
    return @"true" != 0;
}
pub fn destroy_all(table: [*c]SDL_HashTable) callconv(.c) void {
    @setEvalBranchQuota(100000);
    var destroy: SDL_HashDestroyCallback = table.*.destroy;
    _ = &destroy;
    if (destroy != null) {
        var userdata: ?*anyopaque = table.*.userdata;
        _ = &userdata;
        var end: [*c]SDL_HashItem = table.*.table + (table.*.hash_mask +% @as(Uint32, 1));
        _ = &end;
        {
            var i: [*c]SDL_HashItem = table.*.table;
            _ = &i;
            while (i < end) : (i += 1) {
                if (i.*.flags.live != 0) {
                    i.*.flags.live = @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, @truncate(@as(u32, @"false"))))))))));
                    destroy.?(userdata, i.*.key, i.*.value);
                }
            }
        }
    }
}
pub fn hash_string_djbxor(arg_str: [*c]const u8, arg_len: usize) callconv(.c) Uint32 {
    @setEvalBranchQuota(100000);
    var str = arg_str;
    _ = &str;
    var len = arg_len;
    _ = &len;
    var hash: Uint32 = 5381;
    _ = &hash;
    while ((blk: {
        const ref = &len;
        const tmp = ref.*;
        ref.* -%= 1;
        break :blk tmp;
    }) != 0) {
        hash = ((hash << @intCast(@as(Uint32, 5))) +% hash) ^ @as(Uint32, @bitCast(@as(c_int, @as(c_int, (blk: {
            const ref = &str;
            const tmp = ref.*;
            ref.* += 1;
            break :blk tmp;
        }).*))));
    }
    return hash;
}
pub const MAX_HASHITEM_SIZEOF = @as(c_uint, 32);
