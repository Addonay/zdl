//! UTF-8 helpers for the clipboard example. Standard library only, so the
//! truncation rule is testable without a display.
const std = @import("std");

/// The longest prefix of `text` that holds at most `max_codepoints` complete
/// UTF-8 characters. The debug font draws one cell per character, so the limit
/// counts characters. The prefix stops before an incomplete or invalid sequence,
/// which the debug font would reject.
pub fn codepoint_prefix(text: []const u8, max_codepoints: usize) []const u8 {
    var end: usize = 0;
    var count: usize = 0;
    while (end < text.len and count < max_codepoints) {
        const length: usize = std.unicode.utf8ByteSequenceLength(text[end]) catch break;
        if (length > text.len - end) break;
        _ = std.unicode.utf8Decode(text[end..][0..length]) catch break;
        end += length;
        count += 1;
    }
    return text[0..end];
}

test "codepoint prefix never splits a character" {
    const testing = std.testing;
    // 75 ASCII characters, then a euro sign: 76 characters but 78 bytes.
    const ascii: [75]u8 = @splat('x');
    const line: []const u8 = ascii ++ "€";
    try testing.expectEqualStrings(line, codepoint_prefix(line, 76));
    try testing.expectEqualStrings(ascii[0..], codepoint_prefix(line, 75));
    try testing.expectEqualStrings("ab", codepoint_prefix("ab€", 2));
    // An incomplete or invalid sequence ends the prefix.
    try testing.expectEqualStrings("a", codepoint_prefix("a\xe2\x82", 10));
    try testing.expectEqualStrings("a", codepoint_prefix("a\xff", 10));
    try testing.expectEqualStrings("", codepoint_prefix("abc", 0));
}
