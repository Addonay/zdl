//! Hash functions used for element ids and the text measurement cache.
//!
//! Element ids use Bob Jenkins' "one-at-a-time" hash, exactly like Clay, so
//! ids are cheap to compute and stable across runs. The result is always
//! offset by +1 so that 0 can mean "no id".

const types = @import("types.zig");
const ElementId = types.ElementId;

/// One mixing round of the one-at-a-time hash.
inline fn mix(hash: u32, value: u32) u32 {
    var h = hash +% value;
    h +%= h << 10;
    h ^= h >> 6;
    return h;
}

/// Final avalanche step of the one-at-a-time hash.
inline fn finish(hash: u32) u32 {
    var h = hash;
    h +%= h << 3;
    h ^= h >> 11;
    h +%= h << 15;
    return h;
}

/// Hash a number with a seed. Used for auto generated ids (seed = parent id,
/// offset = index among siblings) and for ids of derived render commands.
pub fn hashNumber(offset: u32, seed: u32) ElementId {
    const h = finish(mix(seed, offset +% 48));
    return .{ .id = h +% 1, .offset = offset, .base_id = seed };
}

/// Hash a string label with a seed.
pub fn hashString(key: []const u8, seed: u32) ElementId {
    var h = seed;
    for (key) |c| h = mix(h, c);
    const result = finish(h) +% 1;
    return .{ .id = result, .offset = 0, .base_id = result, .string_id = key };
}

/// Hash a string label, then mix in a numeric offset. `base_id` holds the
/// hash of the label alone so related ids (e.g. list items) can be grouped.
pub fn hashStringWithOffset(key: []const u8, offset: u32, seed: u32) ElementId {
    var base = seed;
    for (key) |c| base = mix(base, c);
    const h = finish(mix(base, offset));
    return .{ .id = h +% 1, .offset = offset, .base_id = finish(base) +% 1, .string_id = key };
}

/// Fast non-cryptographic 64-bit hash over arbitrary bytes. Processes 8 bytes
/// at a time with a multiply/xor-shift mixer (in the spirit of wyhash / the
/// SIMD ARX mixer Clay uses), then folds in the tail.
pub fn hashBytes(data: []const u8) u64 {
    const k0: u64 = 0x9e3779b97f4a7c15;
    const k1: u64 = 0xbf58476d1ce4e5b9;
    var h: u64 = 0x6a09e667f3bcc908 ^ (@as(u64, data.len) *% k0);
    var i: usize = 0;
    while (i + 8 <= data.len) : (i += 8) {
        const word: u64 = @as(*align(1) const u64, @ptrCast(data[i..].ptr)).*;
        h = (h ^ (word *% k1)) *% k0;
        h ^= h >> 29;
    }
    var tail: u64 = 0;
    var shift: u6 = 0;
    while (i < data.len) : (i += 1) {
        tail |= @as(u64, data[i]) << shift;
        shift +%= 8;
    }
    h = (h ^ (tail *% k1)) *% k0;
    h ^= h >> 32;
    return h;
}

/// Key for the text measurement cache: text contents plus every text setting
/// that affects measured size. Clay hashes the pointer for static strings;
/// zlay always hashes contents (a `[]const u8` carries no lifetime info) which
/// is always correct and still fast.
pub fn hashTextWithConfig(text: []const u8, font_id: u16, font_size: u16, letter_spacing: u16) u32 {
    const content = hashBytes(text);
    var h: u32 = @truncate(content ^ (content >> 32));
    h = mix(h, font_id);
    h = mix(h, font_size);
    h = mix(h, letter_spacing);
    return finish(h) +% 1;
}
