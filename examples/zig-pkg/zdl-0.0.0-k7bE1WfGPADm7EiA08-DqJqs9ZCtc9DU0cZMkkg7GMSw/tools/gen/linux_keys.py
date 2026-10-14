#!/usr/bin/env python3
"""Generate zdl Linux/X keyboard translation tables from SDL sources.

usage: linux_keys.py SDL_ROOT > tables.zig   (prints range report on stderr)
"""
import re, sys

root = sys.argv[1]
ev = f'{root}/src/events'
KEYWORDS = {'return'}


def ident(name):
    n = name.lower()
    return f'@"{n}"' if n[0].isdigit() or n in KEYWORDS else n


def array_body(src, name):
    start = src.index(name)
    start = src.index('{', start) + 1
    end = src.index('};', start)
    return src[start:end]


def strip_comments(text):
    text = re.sub(r'/\*.*?\*/', '', text, flags=re.S)
    return re.sub(r'//[^\n]*', '', text)


def scancode_array(src, name):
    body = strip_comments(array_body(src, name))
    return re.findall(r'SDL_SCANCODE_(\w+)', body)


out = ['// Generated from upstream scancodes_*.h, SDL_keysym_to_scancode.c,',
       '// SDL_keysym_to_keycode.c and imKStoUCS.c by a one-off script.',
       '// Regenerate rather than edit entries by hand.', '']

linux_h = open(f'{ev}/scancodes_linux.h').read()
xf_h = open(f'{ev}/scancodes_xfree86.h').read()
darwin_h = open(f'{ev}/scancodes_darwin.h').read()
for zig_name, src, c_name in [
    ('linux_table', linux_h, 'linux_scancode_table[]'),
    ('xfree86_table', xf_h, 'xfree86_scancode_table[]'),
    ('xfree86_table2', xf_h, 'xfree86_scancode_table2[]'),
    ('xvnc_table', xf_h, 'xvnc_scancode_table[]'),
    ('darwin_table', darwin_h, 'darwin_scancode_table[]'),
]:
    codes = scancode_array(src, c_name)
    out.append(f'const {zig_name} = [_]Scancode{{')
    for i in range(0, len(codes), 6):
        out.append('    ' + ' '.join(f'.{ident(c)},' for c in codes[i:i + 6]))
    out.append('};')
    out.append('')
    print(zig_name, len(codes), file=sys.stderr)

k2s = open(f'{ev}/SDL_keysym_to_scancode.c').read()
pairs = re.findall(r'\{\s*(0[xX][0-9A-Fa-f]+),\s*SDL_SCANCODE_(\w+)\s*\}',
                   strip_comments(array_body(k2s, 'KeySymToSDLScancode[]')))
out.append('const keysym_scancodes = [_]KeysymScancode{')
for sym, code in pairs:
    out.append(f'    .{{ .keysym = {sym}, .scancode = .{ident(code)} }},')
out.append('};')
out.append('')
syms = re.findall(r'0[xX][0-9A-Fa-f]+', strip_comments(array_body(k2s, 'LinuxKeycodeKeysyms[]')))
out.append('/// Indexed by Linux evdev keycode.')
out.append('const evdev_keysyms = [_]u32{')
for i in range(0, len(syms), 8):
    out.append('    ' + ' '.join(f'{s},' for s in syms[i:i + 8]))
out.append('};')
out.append('')
ext = re.findall(r'\{\s*(0[xX][0-9A-Fa-f]+),\s*(0[xX][0-9A-Fa-f]+)\s*\}',
                 strip_comments(array_body(k2s, 'ExtendedLinuxKeycodeKeysyms[]')))
out.append('const extended_evdev_keysyms = [_]KeysymEvdev{')
for sym, code in ext:
    out.append(f'    .{{ .keysym = {sym}, .evdev = {code} }},')
out.append('};')
out.append('')
print('keysym tables', len(pairs), len(syms), len(ext), file=sys.stderr)

k2k = open(f'{ev}/SDL_keysym_to_keycode.c').read()
for zig_name, c_name in [('dead_keys_fe50', 'dead_key_symbols_fe50_fe6f[]'),
                         ('dead_keys_fe80', 'dead_key_symbols_fe80_fe93[]')]:
    vals = re.findall(r'0[xX][0-9A-Fa-f]+', strip_comments(array_body(k2k, c_name)))
    out.append(f'const {zig_name} = [_]u21{{')
    for i in range(0, len(vals), 8):
        out.append('    ' + ' '.join(f'{v},' for v in vals[i:i + 8]))
    out.append('};')
    out.append('')
    print(zig_name, len(vals), file=sys.stderr)
kk = re.findall(r'\{\s*(0[xX][0-9A-Fa-f]+),\s*SDLK_(\w+)\s*\}',
                strip_comments(array_body(k2k, 'keysym_to_keycode_table[]')))
out.append('const keysym_keycodes = [_]KeysymKeycode{')
for sym, key in kk:
    out.append(f'    .{{ .keysym = {sym}, .keycode = .{ident(key)} }},')
out.append('};')
out.append('')

ucs = open(f'{ev}/imKStoUCS.c').read()
tables = re.findall(r'keysym_to_unicode_([0-9a-f]+)_([0-9a-f]+)\[\]\s*=\s*\{(.*?)\};', ucs, re.S)
guards = dict()
for lo, hi, name_lo in re.findall(r'keysym > (0x[0-9a-f]+) && keysym < (0x[0-9a-f]+)\)\s*\n\s*return keysym_to_unicode_([0-9a-f]+)_', ucs):
    guards[name_lo] = (int(lo, 16) + 1, int(hi, 16) - 1)
out.append('/// Contiguous keysym ranges and their UCS values (0 = no character).')
out.append('const ucs_ranges = [_]UcsRange{')
for lo, hi, body in tables:
    vals = re.findall(r'0[xX][0-9a-fA-F]+', strip_comments(body))
    start = int(lo, 16)
    end = start + len(vals) - 1
    glo, ghi = guards[lo]
    note = '' if (glo, ghi) == (start, end) else f' // upstream guard {glo:#x}-{ghi:#x}'
    print(f'ucs {lo}: table {start:#x}-{end:#x} guard {glo:#x}-{ghi:#x}{" MISMATCH" if note else ""}', file=sys.stderr)
    out.append(f'    .{{ .first = 0x{start:x}, .values = &.{{{note}')
    for i in range(0, len(vals), 8):
        out.append('        ' + ' '.join(f'{v},' for v in vals[i:i + 8]))
    out.append('    } },')
out.append('};')
print(re.sub(r'0X([0-9A-Fa-f]+)', r'0x\1', '\n'.join(out)))
