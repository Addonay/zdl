//! Text encoding conversion among ASCII, ISO-8859-1, UTF-8, UTF-16, UTF-32, UCS-2
//! and UCS-4, as SDL_iconv.c (its built-in fallback converter, used when no
//! system iconv exists). Altered native port: no iconv descriptors, no
//! `(size_t)-1` error codes, no malloc'd state. The converter is an explicit value
//! that the caller owns and drives with `convert`.
//!
//! Model:
//! - Every source sequence decodes to a code point, and every code point encodes
//!   to the target. The decoder and encoder are plain functions over slices.
//! - `Converter.convert` consumes whole characters only. It returns a `Progress`
//!   with the bytes consumed and written and a `Status` that says whether it
//!   stopped at a complete end, at an incomplete trailing sequence (the caller can
//!   supply more bytes and continue), or because the output is full. Progress is
//!   always reported, so no error discards bytes already converted.
//! - Encoding names follow SDL's table (case-insensitive): `UTF-8`, `UTF-16LE`,
//!   `WCHAR_T` (UCS-4 in host order), and so on. `UTF-16` and `UTF-32` without a
//!   suffix detect byte order from a byte-order mark when reading and write a
//!   BOM in host order when writing, as SDL does.
//!
//! Invalid input is replaced rather than rejected. Invalid UTF-8 sequences and
//! invalid UTF-16 surrogates decode to U+FFFD (SDL's UNKNOWN_UNICODE), and code
//! points that the target cannot represent become `?` for ASCII and Latin-1 or
//! U+FFFD for Unicode targets.
//!
//! Deliberate differences from SDL, verified against SDL_iconv.c:
//! - A detected byte-order mark is consumed. SDL decodes it as U+FEFF.
//! - Byte-order marks are interpreted per the Unicode standard: bytes `FF FE`
//!   mean little-endian and `FE FF` big-endian. SDL swaps these two cases.
//! - An unpaired high surrogate followed by a non-low-surrogate consumes two
//!   units, not four, so the following valid character is kept.
//! - Surrogate code points are replaced with U+FFFD when encoding to UTF-8, UTF-16
//!   and UTF-32; SDL writes them raw, producing ill-formed output.
//! - Reset (`Converter.reset`) restores the initial state. SDL's reset is a no-op.
const std = @import("std");
const builtin = @import("builtin");
const Environ = std.process.Environ;

/// Character encodings. `utf16` and `utf32` select byte order from a BOM when
/// reading and write a host-order BOM when writing. Others have fixed byte order.
pub const Encoding = enum {
    ascii,
    latin1,
    utf8,
    utf16,
    utf16be,
    utf16le,
    utf32,
    utf32be,
    utf32le,
    ucs2be,
    ucs2le,
    ucs4be,
    ucs4le,

    /// Host byte order used by SDL's `UCS-2-INTERNAL`, `UTF-16` output and similar.
    pub const native_utf16: Encoding = if (native_big) .utf16be else .utf16le;
    pub const native_utf32: Encoding = if (native_big) .utf32be else .utf32le;
    pub const native_ucs2: Encoding = if (native_big) .ucs2be else .ucs2le;
    pub const native_ucs4: Encoding = if (native_big) .ucs4be else .ucs4le;

    /// Whether the encoding uses a byte-order mark to pick its byte order on read.
    pub fn detects_byte_order(self: Encoding) bool {
        return self == .utf16 or self == .utf32;
    }
};

const native_big = builtin.target.cpu.arch.endian() == .big;

/// Looks up an SDL encoding name, case-insensitively. Returns null when the name
/// is unknown. Empty names are not handled here; `open_names` maps them to the
/// locale's encoding.
pub fn parse_name(name: []const u8) ?Encoding {
    const table = [_]struct { []const u8, Encoding }{
        .{ "ASCII", .ascii },
        .{ "US-ASCII", .ascii },
        .{ "8859-1", .latin1 },
        .{ "ISO-8859-1", .latin1 },
        .{ "WCHAR_T", Encoding.native_ucs4 },
        .{ "UTF8", .utf8 },
        .{ "UTF-8", .utf8 },
        .{ "UCS-4LE", .ucs4le },
        .{ "UCS-4BE", .ucs4be },
        .{ "UCS-4-INTERNAL", Encoding.native_ucs4 },
        .{ "UTF16", .utf16 },
        .{ "UTF-16", .utf16 },
        .{ "UTF16BE", .utf16be },
        .{ "UTF-16BE", .utf16be },
        .{ "UTF16LE", .utf16le },
        .{ "UTF-16LE", .utf16le },
        .{ "UTF32", .utf32 },
        .{ "UTF-32", .utf32 },
        .{ "UTF32BE", .utf32be },
        .{ "UTF-32BE", .utf32be },
        .{ "UTF32LE", .utf32le },
        .{ "UTF-32LE", .utf32le },
        .{ "UCS2", .ucs2be },
        .{ "UCS-2", .ucs2be },
        .{ "UCS-2LE", .ucs2le },
        .{ "UCS-2BE", .ucs2be },
        .{ "UCS-2-INTERNAL", Encoding.native_ucs2 },
    };
    for (table) |entry| {
        if (std.ascii.eqlIgnoreCase(entry[0], name)) return entry[1];
    }
    return null;
}

/// Encoding implied by the locale environment, as SDL's `getlocale`: the first of
/// `LC_ALL`, `LC_CTYPE`, `LC_MESSAGES`, `LANG` that is set. An unset, empty or "C"
/// value means ASCII. The codeset after `.` (before any `@`) names the encoding.
/// Returns null when the codeset is not a known name.
pub fn locale_encoding(env: *const Environ.Map) ?Encoding {
    const value = env.get("LC_ALL") orelse env.get("LC_CTYPE") orelse
        env.get("LC_MESSAGES") orelse env.get("LANG") orelse "";
    if (value.len == 0 or std.mem.eql(u8, value, "C")) return .ascii;
    var codeset = value;
    if (std.mem.indexOfScalar(u8, codeset, '.')) |dot| codeset = codeset[dot + 1 ..];
    if (std.mem.indexOfScalar(u8, codeset, '@')) |at| codeset = codeset[0..at];
    return parse_name(codeset);
}

/// Outcome of one `Converter.convert` call.
pub const Status = enum {
    /// All input was consumed.
    complete,
    /// The input ends inside a multi-unit sequence. Supply more input to continue.
    incomplete_input,
    /// The output buffer cannot hold the next character. Retry with more space.
    output_full,
};

/// Progress report of one `convert` call. Bytes past `consumed` were not read.
pub const Progress = struct {
    /// Input bytes fully converted (including any byte-order mark).
    consumed: usize,
    /// Output bytes written.
    written: usize,
    /// Code points converted in this call.
    characters: usize,
    status: Status,
};

/// Incremental converter between two encodings. It holds the byte-order state that
/// must survive between calls: whether a BOM was already read or written. Methods
/// take the input as a slice; there is no shared or global state.
pub const Converter = struct {
    from: Encoding,
    to: Encoding,
    /// Source encoding in effect. For `utf16`/`utf32` it is provisional until the
    /// byte-order mark is read.
    source: Encoding,
    source_pending: bool,
    /// Target encoding in effect. For `utf16`/`utf32` it is the host order.
    target: Encoding,
    /// Whether a host-order BOM is still to be written before the first character.
    bom_pending: bool,

    /// Creates a converter between two concrete encodings.
    pub fn init(from: Encoding, to: Encoding) Converter {
        var self: Converter = .{
            .from = from,
            .to = to,
            .source = undefined,
            .source_pending = undefined,
            .target = undefined,
            .bom_pending = undefined,
        };
        self.reset();
        return self;
    }

    /// Creates a converter from encoding names. An empty name stands for the locale
    /// encoding taken from `env`. Unknown names fail with `error.UnknownEncoding`.
    pub fn open_names(from_name: []const u8, to_name: []const u8, env: *const Environ.Map) error{UnknownEncoding}!Converter {
        const from = if (from_name.len == 0) locale_encoding(env) orelse return error.UnknownEncoding else parse_name(from_name) orelse return error.UnknownEncoding;
        const to = if (to_name.len == 0) locale_encoding(env) orelse return error.UnknownEncoding else parse_name(to_name) orelse return error.UnknownEncoding;
        return init(from, to);
    }

    /// Restores the initial state: the next input is re-examined for a BOM and the
    /// next output begins with a BOM when the target requires one.
    pub fn reset(self: *Converter) void {
        self.source = if (self.from == .utf16) Encoding.native_utf16 else if (self.from == .utf32) Encoding.native_utf32 else self.from;
        self.source_pending = self.from.detects_byte_order();
        self.target = if (self.to == .utf16) Encoding.native_utf16 else if (self.to == .utf32) Encoding.native_utf32 else self.to;
        self.bom_pending = self.to.detects_byte_order();
    }

    /// Converts as much of `input` as fits in `output`, stopping at a character
    /// boundary. The result says how much was consumed and written and whether the
    /// call ended at the end of the input. Byte-order detection needs a full first
    /// unit: an input too short for it reports `incomplete_input` with nothing
    /// consumed, so the caller can append bytes and try again.
    pub fn convert(self: *Converter, input: []const u8, output: []u8) Progress {
        var progress: Progress = .{ .consumed = 0, .written = 0, .characters = 0, .status = .complete };

        if (self.bom_pending) {
            const bom_len: usize = if (self.target == .utf16be or self.target == .utf16le) 2 else 4;
            if (output.len < bom_len) {
                progress.status = .output_full;
                return progress;
            }
            encode_bom(self.target, output[0..bom_len]);
            progress.written = bom_len;
            self.bom_pending = false;
        }

        if (input.len == 0) return progress;

        if (self.source_pending) {
            const unit: usize = if (self.from == .utf16) 2 else 4;
            if (input.len < unit) {
                progress.status = .incomplete_input;
                return progress;
            }
            self.source = detect_byte_order(self.from, input[0..unit]);
            self.source_pending = false;
            if (self.source != self.from and detected_bom(self.from, input[0..unit])) {
                progress.consumed = unit;
            }
        }

        var position: usize = progress.consumed;
        while (position < input.len) {
            const decoded = decode(self.source, input[position..]) catch {
                progress.status = .incomplete_input;
                break;
            };
            const code = sanitize(self.target, decoded.code);
            const needed = encoded_len(self.target, code);
            if (output.len - progress.written < needed) {
                progress.status = .output_full;
                break;
            }
            encode(self.target, code, output[progress.written..][0..needed]);
            position += decoded.len;
            progress.written += needed;
            progress.characters += 1;
        }
        progress.consumed = position;
        return progress;
    }
};

/// Errors from `convert_alloc`. Input that ends inside a sequence is rejected here,
/// since no more input is coming.
pub const ConvertError = std.mem.Allocator.Error || error{IncompleteInput};

/// Converts a whole buffer and returns the owned output. Free it with `gpa.free`.
/// The output is not NUL-terminated; add a terminator when a C-style string is
/// needed. Empty input yields an empty result, except that Unicode targets still
/// get their BOM, as with `Converter.convert`.
pub fn convert_alloc(gpa: std.mem.Allocator, from: Encoding, to: Encoding, input: []const u8) ConvertError![]u8 {
    var converter = Converter.init(from, to);
    var result: std.ArrayList(u8) = .empty;
    errdefer result.deinit(gpa);

    var scratch: [256]u8 = undefined;
    var rest = input;
    while (true) {
        const progress = converter.convert(rest, &scratch);
        try result.appendSlice(gpa, scratch[0..progress.written]);
        rest = rest[progress.consumed..];
        switch (progress.status) {
            .complete => break,
            .output_full => continue,
            .incomplete_input => return error.IncompleteInput,
        }
    }
    return result.toOwnedSlice(gpa);
}

/// Decoded character and the number of input bytes it occupied.
const Decoded = struct {
    code: u32,
    len: usize,
};

/// Replacement character for invalid input (SDL's UNKNOWN_UNICODE).
const replacement: u32 = 0xFFFD;

/// Decodes one character from the front of `bytes`. Returns `error.Incomplete`
/// when `bytes` ends inside a sequence that could still become valid.
fn decode(encoding: Encoding, bytes: []const u8) error{Incomplete}!Decoded {
    return switch (encoding) {
        .ascii => .{ .code = bytes[0] & 0x7f, .len = 1 },
        .latin1 => .{ .code = bytes[0], .len = 1 },
        .utf8 => decode_utf8(bytes),
        .utf16, .utf16le => decode_utf16(bytes, false),
        .utf16be => decode_utf16(bytes, true),
        .utf32, .utf32le => decode_utf32(bytes, false, true),
        .utf32be => decode_utf32(bytes, true, true),
        .ucs2le => decode_unit(bytes, false),
        .ucs2be => decode_unit(bytes, true),
        .ucs4le => decode_ucs4(bytes, false),
        .ucs4be => decode_ucs4(bytes, true),
    };
}

/// UTF-8 per RFC 3629. A lead byte fixes the sequence length. Continuation bytes
/// that do not match stop the sequence early, and the consumed prefix becomes one
/// replacement, so a bad byte is never silently dropped. Overlong forms, surrogates,
/// noncharacters FFFE/FFFF and values above U+10FFFF are replaced.
fn decode_utf8(bytes: []const u8) error{Incomplete}!Decoded {
    const lead = bytes[0];
    if (lead < 0x80) return .{ .code = lead, .len = 1 };
    const width: usize = switch (lead) {
        0xC2...0xDF => 2,
        0xE0...0xEF => 3,
        0xF0...0xF4 => 4,
        else => return .{ .code = replacement, .len = 1 },
    };
    var code: u32 = switch (width) {
        2 => lead & 0x1F,
        3 => lead & 0x0F,
        else => lead & 0x07,
    };
    var index: usize = 1;
    while (index < width) : (index += 1) {
        if (index >= bytes.len) return error.Incomplete;
        const byte = bytes[index];
        if (byte & 0xC0 != 0x80) return .{ .code = replacement, .len = index };
        code = (code << 6) | (byte & 0x3F);
    }
    const minimum: u32 = switch (width) {
        2 => 0x80,
        3 => 0x800,
        else => 0x10000,
    };
    if (code < minimum or (code >= 0xD800 and code <= 0xDFFF) or
        code == 0xFFFE or code == 0xFFFF or code > 0x10FFFF)
    {
        return .{ .code = replacement, .len = width };
    }
    return .{ .code = code, .len = width };
}

/// UTF-16 with surrogate pairs. A lone low surrogate or a high surrogate without a
/// following low surrogate is replaced; only the unit that was consumed is skipped.
fn decode_utf16(bytes: []const u8, big: bool) error{Incomplete}!Decoded {
    if (bytes.len < 2) return error.Incomplete;
    const first = read_u16(bytes, big);
    if (first < 0xD800 or first > 0xDFFF) return .{ .code = first, .len = 2 };
    if (first >= 0xDC00) return .{ .code = replacement, .len = 2 };
    if (bytes.len < 4) return error.Incomplete;
    const second = read_u16(bytes[2..], big);
    if (second < 0xDC00 or second > 0xDFFF) return .{ .code = replacement, .len = 2 };
    const code = (((@as(u32, first) & 0x3FF) << 10) | (@as(u32, second) & 0x3FF)) + 0x10000;
    return .{ .code = code, .len = 4 };
}

/// One 16-bit UCS-2 unit taken as a code point. Surrogate values pass through
/// unchanged, as SDL does for UCS-2.
fn decode_unit(bytes: []const u8, big: bool) error{Incomplete}!Decoded {
    if (bytes.len < 2) return error.Incomplete;
    return .{ .code = read_u16(bytes, big), .len = 2 };
}

/// 32-bit Unicode sequences. Values beyond U+10FFFF or in the surrogate range are
/// replaced when `validate` is set (UTF-32); UCS-4 keeps the raw value.
fn decode_utf32(bytes: []const u8, big: bool, validate: bool) error{Incomplete}!Decoded {
    if (bytes.len < 4) return error.Incomplete;
    const code = read_u32(bytes, big);
    if (validate and (code > 0x10FFFF or (code >= 0xD800 and code <= 0xDFFF))) {
        return .{ .code = replacement, .len = 4 };
    }
    return .{ .code = code, .len = 4 };
}

fn decode_ucs4(bytes: []const u8, big: bool) error{Incomplete}!Decoded {
    return decode_utf32(bytes, big, false);
}

/// Reads the byte-order mark of a provisional UTF-16/UTF-32 source. The mark is
/// U+FEFF, so its bytes are `FF FE` in little-endian and `FE FF` in big-endian.
/// With no mark, the host order applies and nothing is consumed.
fn detect_byte_order(from: Encoding, head: []const u8) Encoding {
    if (from == .utf16) {
        if (head[0] == 0xFF and head[1] == 0xFE) return .utf16le;
        if (head[0] == 0xFE and head[1] == 0xFF) return .utf16be;
        return Encoding.native_utf16;
    }
    if (head[0] == 0xFF and head[1] == 0xFE and head[2] == 0 and head[3] == 0) return .utf32le;
    if (head[0] == 0 and head[1] == 0 and head[2] == 0xFE and head[3] == 0xFF) return .utf32be;
    return Encoding.native_utf32;
}

/// Whether `head` starts with a byte-order mark for the provisional encoding.
fn detected_bom(from: Encoding, head: []const u8) bool {
    if (from == .utf16) return (head[0] == 0xFF and head[1] == 0xFE) or (head[0] == 0xFE and head[1] == 0xFF);
    return (head[0] == 0xFF and head[1] == 0xFE and head[2] == 0 and head[3] == 0) or
        (head[0] == 0 and head[1] == 0 and head[2] == 0xFE and head[3] == 0xFF);
}

/// Maps a code point to one the target can represent. ASCII and Latin-1 use `?`,
/// Unicode targets use U+FFFD for invalid scalars, and UCS-2 and UCS-4 keep
/// surrogates and reject only values beyond their width.
fn sanitize(target: Encoding, code: u32) u32 {
    return switch (target) {
        .ascii => if (code > 0x7f) '?' else code,
        .latin1 => if (code > 0xff) '?' else code,
        .utf8, .utf16, .utf16be, .utf16le, .utf32, .utf32be, .utf32le => blk: {
            if (code > 0x10FFFF or (code >= 0xD800 and code <= 0xDFFF)) break :blk replacement;
            break :blk code;
        },
        .ucs2be, .ucs2le => if (code > 0xFFFF) replacement else code,
        .ucs4be, .ucs4le => if (code > 0x7FFFFFFF) replacement else code,
    };
}

/// Byte count of `code` in `target` (after sanitizing).
fn encoded_len(target: Encoding, code: u32) usize {
    return switch (target) {
        .ascii, .latin1 => 1,
        .utf8 => if (code < 0x80) 1 else if (code < 0x800) 2 else if (code < 0x10000) 3 else 4,
        .utf16, .utf16be, .utf16le => if (code < 0x10000) 2 else 4,
        .ucs2be, .ucs2le => 2,
        .utf32, .utf32be, .utf32le, .ucs4be, .ucs4le => 4,
    };
}

/// Writes `code` into `out`, which must hold `encoded_len` bytes. Assumes
/// `sanitize` was applied.
fn encode(target: Encoding, code: u32, out: []u8) void {
    switch (target) {
        .ascii, .latin1 => out[0] = @truncate(code),
        .utf8 => switch (out.len) {
            1 => out[0] = @truncate(code),
            2 => {
                out[0] = @truncate(0xC0 | (code >> 6));
                out[1] = @truncate(0x80 | (code & 0x3F));
            },
            3 => {
                out[0] = @truncate(0xE0 | (code >> 12));
                out[1] = @truncate(0x80 | ((code >> 6) & 0x3F));
                out[2] = @truncate(0x80 | (code & 0x3F));
            },
            else => {
                out[0] = @truncate(0xF0 | (code >> 18));
                out[1] = @truncate(0x80 | ((code >> 12) & 0x3F));
                out[2] = @truncate(0x80 | ((code >> 6) & 0x3F));
                out[3] = @truncate(0x80 | (code & 0x3F));
            },
        },
        .utf16, .utf16be, .utf16le => {
            const big = target == .utf16be;
            if (code < 0x10000) {
                write_u16(out, @truncate(code), big);
            } else {
                const value = code - 0x10000;
                const high: u16 = @truncate(0xD800 | (value >> 10));
                const low: u16 = @truncate(0xDC00 | (value & 0x3FF));
                write_u16(out, high, big);
                write_u16(out[2..], low, big);
            }
        },
        .ucs2be => write_u16(out, @truncate(code), true),
        .ucs2le => write_u16(out, @truncate(code), false),
        .utf32, .utf32le => write_u32(out, code, false),
        .utf32be => write_u32(out, code, true),
        .ucs4le => write_u32(out, code, false),
        .ucs4be => write_u32(out, code, true),
    }
}

/// Writes the host-order byte-order mark for a target that needs one.
fn encode_bom(target: Encoding, out: []u8) void {
    if (out.len == 2) {
        write_u16(out, 0xFEFF, target == .utf16be);
    } else {
        write_u32(out, 0xFEFF, target == .utf32be);
    }
}

fn read_u16(bytes: []const u8, big: bool) u16 {
    return if (big) std.mem.readInt(u16, bytes[0..2], .big) else std.mem.readInt(u16, bytes[0..2], .little);
}

fn read_u32(bytes: []const u8, big: bool) u32 {
    return if (big) std.mem.readInt(u32, bytes[0..4], .big) else std.mem.readInt(u32, bytes[0..4], .little);
}

fn write_u16(out: []u8, value: u16, big: bool) void {
    if (big) std.mem.writeInt(u16, out[0..2], value, .big) else std.mem.writeInt(u16, out[0..2], value, .little);
}

fn write_u32(out: []u8, value: u32, big: bool) void {
    if (big) std.mem.writeInt(u32, out[0..4], value, .big) else std.mem.writeInt(u32, out[0..4], value, .little);
}
