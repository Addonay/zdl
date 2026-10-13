#!/usr/bin/env python3
"""Apply explicit, repeatable corrections to the translated Zig source."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
for base in ('src','include'):
    for path in (ROOT/base).rglob('*.zig'):
        if path.name in ('main.zig','root.zig','translation_builtins.zig','linux_intrinsics.zig','simd.zig'): continue
        original = path.read_text()
        source = original.replace('@bitCast(@intFromBool(', '@intCast(@intFromBool(')
        # C string literals decay to thin pointers, including in conditional
        # expressions and varargs. Zig must not infer a slice from two literals.
        source = re.sub(r'@constCast\(("(?:\\.|[^"\\])*")\)',lambda m: m[0] if source[max(0,m.start()-20):m.start()].endswith('@as([*c]u8, ') else '@as([*c]u8, '+m[0]+')',source)
        def vector(match):
            prefix,count,element,alignment = match.groups()
            return f'{prefix}[{count}]{element}'+(alignment or f' align(@alignOf(@Vector({count}, {element})))')
        source = re.sub(r'(?m)^(\s+[A-Za-z_]\w*:\s+)@Vector\((\d+), ([^)]+)\)(\s+align\([^)]*\))?',vector,source)
        aliases = dict((name,(count,element)) for name,count,element in re.findall(r'(?:pub )?const (\w+) = @Vector\((\d+), ([^)]+)\);', source))
        def vector_alias(match):
            prefix,alias,alignment = match.groups()
            if alias not in aliases: return match[0]
            count,element = aliases[alias]
            alignment = alignment or (' align(1)' if alias.endswith('_u') else f' align(@alignOf({alias}))')
            return f'{prefix}[{count}]{element}{alignment}'
        source = re.sub(r'(?m)^(\s+[A-Za-z_]\w*:\s+)([A-Za-z_]\w*)(\s+align\([^)]*\))?(?=\s*[=,])',vector_alias,source)
        # Header/source merging can introduce a tag alias after an inline C
        # function was translated. Keep its local identifier distinct in Zig.
        globals_ = set(re.findall(r'(?m)^(?:pub )?(?:(?:extern|export|inline) )*(?:const|var|fn)\s+([A-Za-z_]\w*)',source))
        declarations = list(re.finditer(r'(?m)^(?:pub )?(?:(?:extern|export|inline) )*(?:const|var|fn)\s+',source))
        for i,decl in reversed(list(enumerate(declarations))):
            end = declarations[i+1].start() if i+1<len(declarations) else len(source)
            chunk = source[decl.start():end]
            if not re.match(r'(?:pub )?(?:(?:export|inline) )*fn ',chunk) or '{\n' not in chunk: continue
            split = chunk.index('{\n')+2
            body = chunk[split:]
            if not body.startswith('    @setEvalBranchQuota('):
                body = '    @setEvalBranchQuota(100000);\n'+body
            local_names = set(re.findall(r'(?m)^\s+(?:var|const)\s+([A-Za-z_]\w*)',body)) & globals_
            for name in local_names:
                body = re.sub(r'(?<![.A-Za-z_0-9])'+re.escape(name)+r'\b',name+'_local',body)
            source=source[:decl.start()]+chunk[:split]+body+source[end:]
        source = re.sub(r'pub const SDL_CPUPauseInstruction = @compileError\([^\n]*\);',
                        'pub inline fn SDL_CPUPauseInstruction() void { @import("std").atomic.spinLoopHint(); }',source)
        source = source.replace('pub const enum_libdecor_wm_capabilities = opaque {};','pub const enum_libdecor_wm_capabilities = c_uint;')
        source = re.sub(r'@constCast\((wide_string_\d+)\)',r'@constCast(&\1)',source)
        # The bundled helper returns zero for constant_p. Avoid evaluating its
        # unused C argument while translating static type assertions.
        while '__builtin.constant_p(' in source:
            start=source.index('__builtin.constant_p(')
            cursor=start+len('__builtin.constant_p(')
            depth=1
            while depth:
                depth += (source[cursor]=='(')-(source[cursor]==')')
                cursor+=1
            source=source[:start]+'@as(c_int, 0)'+source[cursor:]
        # Clang's *_u SIMD types deliberately permit unaligned memory accesses.
        source = re.sub(r'\[\*c\](const )?(__m(?:128|256|512)[a-z]*_u)\b',r'[*c]align(1) \1\2',source)
        if path.name == 'SDL_hashtable.zig':
            source = source.replace('    probe_len: Uint32 = 0,\n    live: Uint32 = 0,',
                '    flags: packed struct(u32) { probe_len: u31 = 0, live: u1 = 0 } = .{},')
            source = re.sub(r'(?<!flags)\.(probe_len|live)\b',r'.flags.\1',source)
            source = re.sub(r'(?m)^(\s*[^\n;]+\.flags\.(?:probe_len|live)) = ([^\n;]+);',lambda m:m[0] if m[2].startswith('@truncate(@as(u32,') else f'{m[1]} = @truncate(@as(u32, {m[2]}));',source)
        if source != original: path.write_text(source)
