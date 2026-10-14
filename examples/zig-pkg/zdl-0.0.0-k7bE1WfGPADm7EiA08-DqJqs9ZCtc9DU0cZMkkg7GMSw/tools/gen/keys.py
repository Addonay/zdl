#!/usr/bin/env python3
"""Generate zdl Scancode/Keycode enums and scancode names from SDL headers.

usage: keys.py SDL_ROOT > out.zig
"""
import re, sys

root = sys.argv[1]
KEYWORDS = set("""addrspace align allowzero and anyframe anytype asm break callconv catch
comptime const continue defer else enum errdefer error export extern fn for if inline
noalias nosuspend noinline opaque or orelse packed pub resume return linksection struct
suspend switch test threadlocal try union unreachable var volatile while""".split())


def ident(name):
    n = name.lower()
    if n[0].isdigit() or n in KEYWORDS or n in ('true', 'false', 'null', 'undefined', 'type'):
        return f'@"{n}"'
    return n


scan_h = open(f'{root}/include/SDL3/SDL_scancode.h').read()
scancodes = []
for m in re.finditer(r'^\s*SDL_SCANCODE_(\w+)\s*=\s*(\d+)', scan_h, re.M):
    name, value = m.group(1), int(m.group(2))
    if name in ('RESERVED', 'COUNT'):
        continue
    scancodes.append((name, value))

key_h = open(f'{root}/include/SDL3/SDL_keycode.h').read()
keycodes = []
for m in re.finditer(r'^#define SDLK_(\w+)\s+0x([0-9a-fA-F]+)u', key_h, re.M):
    keycodes.append((m.group(1), int(m.group(2), 16)))

keymap_c = open(f'{root}/src/events/SDL_keymap.c').read()
table = keymap_c[keymap_c.index('SDL_scancode_names[SDL_SCANCODE_COUNT]'):]
table = table[:table.index('};')]
names = {}
for m in re.finditer(r'/\*\s*(\d+)\s*\*/\s*(NULL|"((?:[^"\\]|\\.)*)")', table):
    if m.group(2) != 'NULL':
        names[int(m.group(1))] = m.group(3)

out = []
out.append('// Generated from upstream SDL_scancode.h, SDL_keycode.h and SDL_keymap.c by a')
out.append('// one-off script; regenerate rather than edit entries by hand.')
out.append('')
out.append('/// USB HID usage-page-7 key positions, independent of the active layout.')
out.append('/// Values 400-499 are allocated dynamically by Keymap for keys without a')
out.append('/// standard position; any value below 512 is representable.')
out.append('pub const Scancode = enum(u9) {')
for name, value in scancodes:
    out.append(f'    {ident(name)} = {value},')
out.append('    _,')
out.append('')
out.append('    pub const first_reserved: Scancode = @enumFromInt(400);')
out.append('    pub const reserved_count = 100;')
out.append('')
out.append('    /// Default English name, or empty when SDL defines none. Backends may')
out.append('    /// present a few keys differently; see their name functions.')
out.append('    pub fn name(self: Scancode) []const u8 {')
out.append('        const index = @intFromEnum(self);')
out.append('        return if (index < scancode_names.len) scancode_names[index] else "";')
out.append('    }')
out.append('')
out.append('    /// Case-insensitive inverse of name. Empty and unknown names are null.')
out.append('    pub fn from_name(text: []const u8) ?Scancode {')
out.append('        if (text.len == 0) return null;')
out.append('        for (scancode_names, 0..) |candidate, index| {')
out.append('            if (candidate.len != 0 and std.ascii.eqlIgnoreCase(candidate, text)) return @enumFromInt(index);')
out.append('        }')
out.append('        return null;')
out.append('    }')
out.append('};')
out.append('')
out.append('const scancode_names = [_][]const u8{')
for i in range(max(names) + 1):
    text = names.get(i, '')
    out.append(f'    "{text}", // {i}')
out.append('};')
out.append('')
out.append('/// Layout-dependent key meaning. Printable keys are their unshifted Unicode')
out.append('/// codepoint; other keys are their scancode with `scancode_mask`, or one of')
out.append('/// the extended keys with `extended_mask`. Unlisted codepoints are valid.')
out.append('pub const Keycode = enum(u32) {')
for name, value in keycodes:
    out.append(f'    {ident(name)} = 0x{value:08X},')
out.append('    _,')
out.append('')
out.append('    pub const extended_mask: u32 = 1 << 29;')
out.append('    pub const scancode_mask: u32 = 1 << 30;')
out.append('')
out.append('    // Remaining Keycode methods are declared in keyboard.zig.')
print('\n'.join(out))
print(len(scancodes), len(keycodes), len(names), file=sys.stderr)
