//! HID report descriptor walker that extracts Usage Page and Usage pairs from
//! top-level collections. Altered native port of get_hid_item_size,
//! get_hid_report_bytes, hid_iterate_over_collection and get_next_hid_usage in
//! SDL's hidapi/linux/hid.c. The walker is pure: it reads a byte slice and
//! returns pairs, so it can run on any descriptor without a device.
//!
//! Descriptor items are one tag byte followed by 0, 1, 2 or 4 data bytes for
//! short items, or a length byte for the long-item tag 0xFE. Data is little
//! endian, as the HID specification requires.

const std = @import("std");

/// A Usage Page and Usage pair selected from a top-level collection.
pub const Usage = struct {
    page: u16,
    usage: u16,
};

/// The descriptor ended inside an item or a collection had no matching end.
pub const Error = error{MalformedDescriptor};

/// Tag classes with the low two size bits masked off.
const tag_usage_page: u8 = 0x04;
const tag_usage: u8 = 0x08;
const tag_collection: u8 = 0xa0;
const tag_end_collection: u8 = 0xc0;
const tag_long_item: u8 = 0xfe;

/// One item header with the byte counts needed to skip it.
const Item = struct {
    tag: u8,
    data_len: usize,
    /// Header bytes, including the tag (and the length byte for long items).
    key_size: usize,
};

/// Reads the header of the item at `pos`.
///
/// Deliberate difference: SDL's malformed long item at the very end of the
/// descriptor falls through into the short-item path and yields a bogus item.
/// This walker reports it as malformed instead.
fn item_at(descriptor: []const u8, pos: usize) Error!Item {
    const tag = descriptor[pos];
    if (tag == tag_long_item) {
        if (pos + 1 >= descriptor.len) return error.MalformedDescriptor;
        return .{ .tag = tag, .data_len = descriptor[pos + 1], .key_size = 3 };
    }
    const data_len: usize = switch (tag & 0x3) {
        0 => 0,
        1 => 1,
        2 => 2,
        else => 4,
    };
    return .{ .tag = tag, .data_len = data_len, .key_size = 1 };
}

/// Reads `count` little-endian data bytes of the item at `cur`. Out-of-range
/// reads return 0, as SDL's get_hid_report_bytes does.
fn read_value(descriptor: []const u8, count: usize, cur: usize) u32 {
    if (count == 0) return 0;
    if (cur + count >= descriptor.len) return 0;
    var value: u32 = 0;
    for (0..count) |index| {
        value |= @as(u32, descriptor[cur + 1 + index]) << @intCast(8 * index);
    }
    return value;
}

/// Walks a descriptor and yields Usage Page/Usage pairs.
///
/// A pair is reported when a Collection item is reached while both a Usage and a
/// Usage Page are in scope. A descriptor with no top-level collection still yields
/// its first pair, which matches Microsoft's rules for top-level collections.
pub const Iterator = struct {
    descriptor: []const u8,
    /// Next byte offset to inspect. Public so callers can resume after a pair.
    pos: usize = 0,
    page: u16 = 0,
    page_found: bool = false,

    /// Returns the next pair, `null` at the end of the descriptor, or
    /// `error.MalformedDescriptor` for a broken item or unmatched collection.
    /// After an error the iterator should not be used further.
    pub fn next(self: *Iterator) Error!?Usage {
        const descriptor = self.descriptor;
        const initial = self.pos == 0;
        var usage_found = false;
        var usage: u16 = 0;

        while (self.pos < descriptor.len) {
            var item = try item_at(descriptor, self.pos);
            switch (item.tag & 0xfc) {
                tag_usage_page => {
                    self.page = @truncate(read_value(descriptor, item.data_len, self.pos));
                    self.page_found = true;
                },
                tag_usage => {
                    if (item.data_len == 4) {
                        // A four-byte Usage carries its Usage Page in the upper half.
                        self.page = @truncate(read_value(descriptor, 2, self.pos + 2));
                        self.page_found = true;
                        usage = @truncate(read_value(descriptor, 2, self.pos));
                    } else {
                        usage = @truncate(read_value(descriptor, item.data_len, self.pos));
                    }
                    usage_found = true;
                },
                tag_collection => {
                    // Skip nested collections. On success `self.pos` and `item`
                    // refer to the matching End Collection item, as in SDL.
                    item = try self.skip_collection(item);
                    if (usage_found and self.page_found) {
                        return Usage{ .page = self.page, .usage = usage };
                    }
                },
                else => {},
            }
            self.pos += item.data_len + item.key_size;
        }

        if (initial and usage_found and self.page_found) {
            return Usage{ .page = self.page, .usage = usage };
        }
        return null;
    }

    /// Advances from the Collection item at `self.pos` to its End Collection
    /// item, counting nested collections. Returns the End Collection item and
    /// leaves `self.pos` at it, so the caller can skip past it.
    fn skip_collection(self: *Iterator, start: Item) Error!Item {
        const descriptor = self.descriptor;
        var level: i32 = 0;
        var item = start;
        while (self.pos < descriptor.len) {
            item = try item_at(descriptor, self.pos);
            switch (item.tag & 0xfc) {
                tag_collection => level += 1,
                tag_end_collection => level -= 1,
                else => {},
            }
            // A closing item before the opening one means the descriptor is broken.
            if (level < 0) return error.MalformedDescriptor;
            if (level == 0) return item;
            self.pos += item.data_len + item.key_size;
        }
        return error.MalformedDescriptor;
    }
};
