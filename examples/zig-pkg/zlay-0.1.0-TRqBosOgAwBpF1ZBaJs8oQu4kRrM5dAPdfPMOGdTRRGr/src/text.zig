//! Text measurement and wrapping.
//!
//! Measuring text is usually the most expensive thing a UI layout does, so
//! (like Clay) zlay splits every string into words, measures each word once
//! with your `MeasureTextFn` and caches the result across frames. Wrapping
//! then only adds up cached word widths.
//!
//! The cache is a hash map keyed by (text contents, font id, font size,
//! letter spacing). Entries not used for a few frames are evicted lazily
//! when their bucket is visited.

const types = @import("types.zig");
const config = @import("config.zig");
const internal = @import("internal.zig");
const hash = @import("hash.zig");
const Context = @import("Context.zig");

const Dimensions = types.Dimensions;
const MeasuredWord = internal.MeasuredWord;
const MeasureTextCacheItem = internal.MeasureTextCacheItem;
const no_index = internal.no_index;

/// Store a measured word, reusing a freed slot if possible, and link it after
/// `previous`. Returns the stored word (the new tail of the list).
fn addMeasuredWord(ctx: *Context, word: MeasuredWord, previous: *MeasuredWord) ?*MeasuredWord {
    if (ctx.measured_words_free_list.len > 0) {
        const index = ctx.measured_words_free_list.pop();
        previous.next = @intCast(index);
        return ctx.measured_words.set(index, word);
    }
    const index = ctx.measured_words.len;
    const stored = ctx.measured_words.append(word) orelse return null;
    previous.next = @intCast(index);
    return stored;
}

fn measure(ctx: *Context, function: Context.MeasureTextFn, text: []const u8, text_config: *const config.TextConfig) Dimensions {
    return function(text, text_config, ctx.measure_text_user_data);
}

/// Look up (or compute and insert) the measurements of `text` (Clay's
/// `Clay__MeasureTextCached`). Returns null if measurement isn't possible
/// (no measure function, or the cache is full); callers then treat the text
/// as zero sized.
pub fn measureTextCached(ctx: *Context, text: []const u8, text_config: *const config.TextConfig) ?*MeasureTextCacheItem {
    const measure_fn = ctx.measure_text orelse {
        if (!ctx.warnings.text_measurement_function_not_set) {
            ctx.warnings.text_measurement_function_not_set = true;
            ctx.reportError(.text_measurement_function_not_provided, "zlay's text measurement function is null. " ++
                "You may have forgotten to call setMeasureTextFunction (or set Options.measure_text).");
        }
        return null;
    };

    const id = hash.hashTextWithConfig(text, text_config.font_id, text_config.font_size, text_config.letter_spacing);
    const bucket = id % ctx.measure_cache_buckets.len;

    // Walk the bucket: return a hit, evicting stale entries along the way.
    var previous_index: u32 = 0;
    var index = ctx.measure_cache_buckets.get(bucket).*;
    while (index != 0) {
        const entry = ctx.measure_cache_items.getRaw(index);
        if (entry.id == id) {
            entry.generation = ctx.generation;
            return entry;
        }
        if (ctx.generation -% entry.generation > 2) {
            // Not used for a few frames: free its words and the entry.
            var word_index = entry.measured_words_start_index;
            while (word_index != no_index) {
                const word = ctx.measured_words.getRaw(@intCast(word_index));
                _ = ctx.measured_words_free_list.append(@intCast(word_index));
                word_index = word.next;
            }
            const next = entry.next_index;
            entry.* = .{};
            _ = ctx.measure_cache_free_list.append(index);
            if (previous_index == 0) {
                ctx.measure_cache_buckets.get(bucket).* = next;
            } else {
                ctx.measure_cache_items.getRaw(previous_index).next_index = next;
            }
            index = next;
        } else {
            previous_index = index;
            index = entry.next_index;
        }
    }

    // Miss: allocate an entry.
    const new_item: MeasureTextCacheItem = .{ .id = id, .generation = ctx.generation };
    var new_index: u32 = undefined;
    var measured: *MeasureTextCacheItem = undefined;
    if (ctx.measure_cache_free_list.len > 0) {
        new_index = ctx.measure_cache_free_list.pop();
        measured = ctx.measure_cache_items.set(new_index, new_item);
    } else {
        if (ctx.measure_cache_items.len == ctx.measure_cache_items.capacity -| 1) {
            if (!ctx.warnings.max_text_measure_cache_exceeded) {
                ctx.warnings.max_text_measure_cache_exceeded = true;
                ctx.reportError(.elements_capacity_exceeded, "zlay ran out of capacity while measuring text elements. " ++
                    "Try a higher max_element_count.");
            }
            return null;
        }
        new_index = ctx.measure_cache_items.len;
        measured = ctx.measure_cache_items.append(new_item) orelse return null;
    }

    // Split into words on ' ' and '\n' and measure each. A space is folded
    // into the word before it (its width included), a newline becomes an
    // empty word with length 0.
    const space_width = measure(ctx, measure_fn, " ", text_config).width;
    var start: u32 = 0;
    var line_width: f32 = 0;
    var measured_width: f32 = 0;
    var measured_height: f32 = 0;
    var head: MeasuredWord = .{};
    var previous: *MeasuredWord = &head;
    var end: u32 = 0;
    const length: u32 = @intCast(text.len);
    while (end < length) : (end += 1) {
        if (ctx.measured_words.len == ctx.measured_words.capacity -| 1) {
            if (!ctx.warnings.max_text_measure_cache_exceeded) {
                ctx.warnings.max_text_measure_cache_exceeded = true;
                ctx.reportError(.text_measurement_capacity_exceeded, "zlay ran out of space in its internal text measurement cache. " ++
                    "Try a higher max_measure_text_cache_word_count (default 16384, 1 unit = 1 measured word).");
            }
            return null;
        }
        const current = text[end];
        if (current != ' ' and current != '\n') continue;

        const word_length = end - start;
        var dimensions: Dimensions = .{};
        if (word_length > 0) dimensions = measure(ctx, measure_fn, text[start..end], text_config);
        measured.min_width = @max(dimensions.width, measured.min_width);
        measured_height = @max(measured_height, dimensions.height);

        if (current == ' ') {
            dimensions.width += space_width;
            previous = addMeasuredWord(ctx, .{ .start_offset = start, .length = word_length + 1, .width = dimensions.width }, previous) orelse previous;
            line_width += dimensions.width;
        } else {
            if (word_length > 0) {
                previous = addMeasuredWord(ctx, .{ .start_offset = start, .length = word_length, .width = dimensions.width }, previous) orelse previous;
            }
            previous = addMeasuredWord(ctx, .{ .start_offset = end + 1, .length = 0, .width = 0 }, previous) orelse previous;
            line_width += dimensions.width;
            measured_width = @max(line_width, measured_width);
            measured.contains_newlines = true;
            line_width = 0;
        }
        start = end + 1;
    }
    if (end > start) {
        const dimensions = measure(ctx, measure_fn, text[start..end], text_config);
        _ = addMeasuredWord(ctx, .{ .start_offset = start, .length = end - start, .width = dimensions.width }, previous);
        line_width += dimensions.width;
        measured_height = @max(measured_height, dimensions.height);
        measured.min_width = @max(dimensions.width, measured.min_width);
    }
    measured_width = @max(line_width, measured_width) - @as(f32, @floatFromInt(text_config.letter_spacing));

    measured.measured_words_start_index = head.next;
    measured.unwrapped_dimensions = .{ .width = measured_width, .height = measured_height };

    // Link into the bucket.
    if (previous_index != 0) {
        ctx.measure_cache_items.getRaw(previous_index).next_index = new_index;
    } else {
        ctx.measure_cache_buckets.get(bucket).* = new_index;
    }
    return measured;
}

/// Break a text element into lines that fit its (now final) width, and set
/// its height accordingly.
pub fn wrapTextElement(ctx: *Context, element: *internal.LayoutElement) void {
    const text_element = element.text();
    const text = text_element.text;
    const text_config = &text_element.config;
    const lines = &ctx.wrapped_text_lines;
    text_element.wrapped_lines = .{ .ptr = lines.ptr + lines.len, .len = 0 };

    const line_height: f32 = if (text_config.line_height > 0) @floatFromInt(text_config.line_height) else text_element.preferred_dimensions.height;
    const cache_item = measureTextCached(ctx, text, text_config);
    const contains_newlines = if (cache_item) |item| item.contains_newlines else false;

    // Fast path: no newlines and it all fits on one line.
    if (cache_item == null or (!contains_newlines and text_element.preferred_dimensions.width <= element.dimensions.width)) {
        if (lines.append(.{ .dimensions = element.dimensions, .line = text }) != null) text_element.wrapped_lines.len += 1;
        return;
    }

    const measure_fn = ctx.measure_text.?;
    const space_width = measure(ctx, measure_fn, " ", text_config).width;
    const letter_spacing: f32 = @floatFromInt(text_config.letter_spacing);
    const max_width = element.dimensions.width;
    var line_width: f32 = 0;
    var line_length: u32 = 0;
    var line_start: u32 = 0;
    var word_index = cache_item.?.measured_words_start_index;

    while (word_index != no_index) {
        if (lines.isFull()) break;
        const word = ctx.measured_words.getRaw(@intCast(word_index));
        if (line_length == 0 and line_width + word.width > max_width) {
            // The only word on the line is too wide: emit it anyway.
            _ = lines.append(.{
                .dimensions = .{ .width = word.width, .height = line_height },
                .line = text[word.start_offset..][0..word.length],
            });
            text_element.wrapped_lines.len += 1;
            word_index = word.next;
            line_start = word.start_offset + word.length;
        } else if (word.length == 0 or line_width + word.width > max_width) {
            // Newline, or the word doesn't fit: finish the current line,
            // trimming a trailing space.
            // (Clay can underflow here after an oversized word; we only trim
            // non-empty lines.)
            const final_char_is_space = line_length > 0 and text[line_start + line_length - 1] == ' ';
            const trim: u32 = if (final_char_is_space) 1 else 0;
            _ = lines.append(.{
                .dimensions = .{ .width = line_width - (if (final_char_is_space) space_width else 0), .height = line_height },
                .line = text[line_start..][0 .. line_length - trim],
            });
            text_element.wrapped_lines.len += 1;
            if (line_length == 0 or word.length == 0) word_index = word.next;
            line_width = 0;
            line_length = 0;
            line_start = word.start_offset;
        } else {
            line_width += word.width + letter_spacing;
            line_length += word.length;
            word_index = word.next;
        }
    }
    if (line_length > 0 and !lines.isFull()) {
        _ = lines.append(.{
            .dimensions = .{ .width = line_width - letter_spacing, .height = line_height },
            .line = text[line_start..][0..line_length],
        });
        text_element.wrapped_lines.len += 1;
    }
    element.dimensions.height = line_height * @as(f32, @floatFromInt(text_element.wrapped_lines.len));
}
