#!/usr/bin/env python3
"""Generate zdl's sorted case-folding table from SDL_casefolding.h."""
import re, sys

src = open(sys.argv[1]).read()
entries = {}
for m in re.finditer(r'\{\s*(0x[0-9A-Fa-f]+(?:\s*,\s*0x[0-9A-Fa-f]+){1,3})\s*\}', src):
    vals = [int(v, 16) for v in m.group(1).split(',')]
    frm, to = vals[0], vals[1:]
    if frm in entries and entries[frm] != to:
        raise SystemExit(f'conflicting mapping for {frm:#x}')
    entries[frm] = to

single = sorted((k, v[0]) for k, v in entries.items() if len(v) == 1)
multi = sorted((k, v) for k, v in entries.items() if len(v) > 1)
out = []
out.append('// Generated from upstream SDL_casefolding.h (Unicode CaseFolding.txt C+F')
out.append('// mappings) by a one-off script; regenerate rather than edit entries by hand.')
out.append(f'// {len(single)} single-codepoint and {len(multi)} multi-codepoint foldings.')
out.append('')
out.append('pub const single = [_]Single{')
for k, v in single:
    out.append(f'    .{{ .from = 0x{k:04X}, .to = 0x{v:04X} }},')
out.append('};')
out.append('')
out.append('pub const multiple = [_]Multiple{')
for k, v in multi:
    to = ', '.join(f'0x{x:04X}' for x in v)
    out.append(f'    .{{ .from = 0x{k:04X}, .to = &.{{ {to} }} }},')
out.append('};')
print('\n'.join(out))
print(f'{len(single)} {len(multi)}', file=sys.stderr)
