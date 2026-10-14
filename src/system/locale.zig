//! Preferred user locales from the POSIX environment, as SDL_GetPreferredLocales.
//! Altered native port of SDL_locale.c and src/locale/unix/SDL_syslocale.c.
//!
//! The environment is passed explicitly as a `std.process.Environ.Map`; nothing
//! reads process-global state. The optional `hint` argument replaces SDL's
//! SDL_HINT_PREFERRED_LOCALES global hint: when present it is parsed as the
//! comma-separated list and the environment is not consulted, as in SDL.
//!
//! Environment rules (SDL-compatible): `LANG` is the primary locale and
//! `LANGUAGE` supplies colon-separated fallbacks after it. Encoding suffixes
//! (`.UTF-8`) and modifiers (`@euro`) are removed, and the "C" locale is
//! dropped. `LC_ALL`, `LC_MESSAGES` and `LC_CTYPE` are deliberately not consulted
//! for the preferred list, matching SDL; they are used by iconv's locale lookup.
const std = @import("std");

/// One preferred language, optionally with a country region, such as `en_US`.
/// Slices borrow from the `Locales` value that produced them.
pub const Locale = struct {
    /// Language subtag, for example `en`. Never empty.
    language: []const u8,
    /// Region subtag after `_`, for example `US`. Null when absent.
    country: ?[]const u8 = null,
};

/// Owned list of preferred locales in priority order. One allocation holds the
/// normalized text, and every `Locale` slice points into it.
pub const Locales = struct {
    /// Preferred locales, highest priority first. Empty when nothing is set.
    items: []Locale = &.{},
    /// Backing text for every item. Owned by this value.
    text: []u8 = &.{},

    /// Frees the item array and text. The value must not be used afterwards.
    pub fn deinit(self: *Locales, allocator: std.mem.Allocator) void {
        allocator.free(self.items);
        allocator.free(self.text);
        self.* = undefined;
    }
};

/// Allocation failure is the only error: an unset environment is an empty list.
pub const Error = std.mem.Allocator.Error;

/// Builds the preferred locale list. With a `hint`, the hint is parsed as a
/// comma-separated list of locale names exactly as SDL parses its hint (no
/// encoding/modifier normalization). Without a hint, the environment provides
/// `LANG` followed by `LANGUAGE`, normalized like SDL.
///
/// Returns an owned `Locales`; free it with `deinit` using the same allocator.
/// Empty entries (`a,,b`) and whitespace-only entries are skipped, a deliberate
/// difference from SDL, whose parser yields malformed entries for them.
pub fn preferred(
    allocator: std.mem.Allocator,
    env: *const std.process.Environ.Map,
    hint: ?[]const u8,
) Error!Locales {
    if (hint) |csv| return parse_csv(allocator, csv);

    // Build the colon-separated environment value the way SDL does: LANG first,
    // then LANGUAGE appended with a separating colon when LANG was set.
    var raw: std.ArrayList(u8) = .empty;
    defer raw.deinit(allocator);
    if (env.get("LANG")) |lang| try raw.appendSlice(allocator, lang);
    if (env.get("LANGUAGE")) |language| {
        if (raw.items.len > 0) try raw.append(allocator, ':');
        try raw.appendSlice(allocator, language);
    }
    if (raw.items.len == 0) return .{};

    // Normalize each colon-separated entry, joining the survivors with commas.
    var normalized: std.ArrayList(u8) = .empty;
    defer normalized.deinit(allocator);
    var entries = std.mem.splitScalar(u8, raw.items, ':');
    while (entries.next()) |entry| {
        const locale = normalize_entry(entry);
        if (locale.len == 0) continue;
        if (normalized.items.len > 0) try normalized.append(allocator, ',');
        try normalized.appendSlice(allocator, locale);
    }
    return parse_csv(allocator, normalized.items);
}

/// Strips `.encoding` and `@modifier` suffixes, then returns the empty string for
/// the neutral "C" locale, which SDL also treats as unhelpful.
fn normalize_entry(entry: []const u8) []const u8 {
    var locale = entry;
    if (std.mem.indexOfScalar(u8, locale, '.')) |dot| locale = locale[0..dot];
    if (std.mem.indexOfScalar(u8, locale, '@')) |at| locale = locale[0..at];
    if (std.mem.eql(u8, locale, "C")) return "";
    return locale;
}

/// Parses a comma-separated list such as `en_US,fr` into owned locales.
/// Leading and inner whitespace around names is ignored; a name ends at `_`
/// (country start), `,`, or whitespace. Text after the country up to the next
/// comma or whitespace is kept as the country, as SDL does.
pub fn parse_csv(allocator: std.mem.Allocator, csv: []const u8) Error!Locales {
    const trimmed = std.mem.trimStart(u8, csv, " \t\r\n\x0b\x0c");
    if (trimmed.len == 0) return .{};

    const text = try allocator.dupe(u8, trimmed);
    errdefer allocator.free(text);

    var items: std.ArrayList(Locale) = .empty;
    errdefer items.deinit(allocator);

    var names = std.mem.splitScalar(u8, text, ',');
    while (names.next()) |name_raw| {
        const name = std.mem.trim(u8, name_raw, " \t\r\n\x0b\x0c");
        if (name.len == 0) continue;
        const language_end = std.mem.indexOfAny(u8, name, "_ \t\r\n\x0b\x0c") orelse name.len;
        var locale: Locale = .{ .language = name[0..language_end] };
        if (language_end < name.len and name[language_end] == '_') {
            const country = name[language_end + 1 ..];
            const country_end = std.mem.indexOfAny(u8, country, " \t\r\n\x0b\x0c") orelse country.len;
            if (country_end > 0) locale.country = country[0..country_end];
        }
        try items.append(allocator, locale);
    }

    const owned_items = try items.toOwnedSlice(allocator);
    return .{ .items = owned_items, .text = text };
}

const testing = std.testing;

fn expect_locale(locale: Locale, language: []const u8, country: ?[]const u8) !void {
    try testing.expectEqualStrings(language, locale.language);
    if (country) |expected| {
        try testing.expectEqualStrings(expected, locale.country.?);
    } else {
        try testing.expect(locale.country == null);
    }
}

test "LANG and LANGUAGE are normalized and ordered" {
    var env = std.process.Environ.Map.init(testing.allocator);
    defer env.deinit();
    try env.put("LANG", "en_US.UTF-8");
    try env.put("LANGUAGE", "fr_CA:de@euro:C:es");
    var locales = try preferred(testing.allocator, &env, null);
    defer locales.deinit(testing.allocator);
    try testing.expectEqual(@as(usize, 4), locales.items.len);
    try expect_locale(locales.items[0], "en", "US");
    try expect_locale(locales.items[1], "fr", "CA");
    try expect_locale(locales.items[2], "de", null);
    try expect_locale(locales.items[3], "es", null);
}

test "C locale and empty environment give an empty list" {
    var env = std.process.Environ.Map.init(testing.allocator);
    defer env.deinit();
    var none = try preferred(testing.allocator, &env, null);
    defer none.deinit(testing.allocator);
    try testing.expectEqual(@as(usize, 0), none.items.len);
    try env.put("LANG", "C");
    var neutral = try preferred(testing.allocator, &env, null);
    defer neutral.deinit(testing.allocator);
    try testing.expectEqual(@as(usize, 0), neutral.items.len);
}

test "hint replaces the environment and skips empty entries" {
    var env = std.process.Environ.Map.init(testing.allocator);
    defer env.deinit();
    try env.put("LANG", "ja_JP");
    var locales = try preferred(testing.allocator, &env, "  pt_BR, ,it ,");
    defer locales.deinit(testing.allocator);
    try testing.expectEqual(@as(usize, 2), locales.items.len);
    try expect_locale(locales.items[0], "pt", "BR");
    try expect_locale(locales.items[1], "it", null);
}
