#!/usr/bin/env python3
"""Merge C/header translations and retain the declarations each module needs."""
import json
from pathlib import Path
import re
import shutil
import sys

ROOT = Path(__file__).resolve().parents[1]
REPORT = ROOT/'translation-report'
manifest = json.loads((REPORT/'manifest.json').read_text())
declaration = re.compile(r'(?m)^(?:pub )?(?:(?:export|extern|inline|threadlocal) )*(?:const|var|fn)\s+(@"[^"\n]+"|[A-Za-z_]\w*)')
tokens = re.compile(r'@"[^"\n]+"|[A-Za-z_]\w*')

def references(text):
    # String values and comments are not declaration references.
    text = re.sub(r'(@"(?:\\.|[^"\\])*")|"(?:\\.|[^"\\])*"|//[^\n]*', lambda m: m[1] or '', text)
    return set(tokens.findall(text))

def declarations(text):
    matches = list(declaration.finditer(text))
    prefix = text[:matches[0].start()] if matches else text
    return prefix, {m[1]:text[m.start():matches[i+1].start() if i+1<len(matches) else len(text)] for i,m in enumerate(matches)}

groups = {}
for record in manifest['translations']:
    if not record['output']: continue
    source = Path(record['source'])
    destination = source.with_suffix('.zig')
    groups.setdefault(str(destination), []).append(record)

active = []
total_before = total_after = 0
for destination, records in groups.items():
    if '--updated-only' in sys.argv and not any(r['output'].endswith(('.c.zig','.h.zig')) for r in records): continue
    # Prefer function bodies from a C file over prototypes in its header.
    records.sort(key=lambda r: r['source'].endswith('.c'))
    combined = {}
    roots = set()
    prefix = ''
    for record in records:
        old = ROOT/record['output']
        raw = ROOT/record.get('raw_output', str(Path('.cache/raw-translations')/record['output']))
        raw.parent.mkdir(parents=True, exist_ok=True)
        if old.exists() and not record.get('raw_output'): shutil.move(old, raw)
        text = raw.read_text()
        total_before += len(text.encode())
        notice, nodes = declarations(text)
        if notice: prefix = notice
        combined.update(nodes)
        if record['source'].endswith('.h'):
            if record['source'].startswith('include/SDL3/'):
                roots.update(n for n in nodes if n.startswith(('SDL', 'Uint', 'Sint')))
            else:
                # Internal headers expose their declarations to future ports.
                roots.update(n for n in nodes if n.startswith(('SDL', 'Uint', 'Sint')))
        else:
            own = Path(record.get('input_file', str(ROOT/'.ref/SDL'/record['source']))).read_text(errors='replace')
            function_names = set(re.findall(r'(?m)^[^\n;{}]*\b(\w+)\s*\([^;{}]*\)\s*\n\{', own))
            roots.update(n for n in nodes if n in function_names or n.removesuffix('_REAL') in function_names)
            roots.update(d['symbol'] for d in record['demoted_sdl_functions'])
            for name,node in nodes.items():
                if re.match(r'pub export (?:fn|var|const) ',node) or re.match(r'(?:pub )?(?:threadlocal )?var ',node):
                    roots.add(name)
        record['raw_output'] = str(raw.relative_to(ROOT))
        record['output'] = destination
        if record['active']: active.append(destination)
    keep = set()
    todo = list(roots)
    names = set(combined)
    while todo:
        name = todo.pop()
        if name in keep or name not in combined: continue
        keep.add(name)
        todo.extend((references(combined[name]) & names) - keep)
    result = prefix + ''.join(node for name,node in combined.items() if name in keep)
    out = ROOT/destination
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text(result)
    total_after += len(result.encode())

# Keep non-C implementation languages and resources exactly as upstream.
for source in manifest['non_c_files']:
    destination = ROOT/source
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(ROOT/'.ref/SDL'/source, destination)

(REPORT/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
active = sorted(set(r['output'] for r in manifest['translations'] if r['active']))
(ROOT/'sources.zig').write_text('pub const files = [_][]const u8{\n'+''.join('    '+json.dumps(p)+',\n' for p in active)+'};\n')
print(f'Merged {sum(len(r) for r in groups.values())} translations into {len(groups)} Zig files; '
      f'{total_before/1048576:.1f} MiB -> {total_after/1048576:.1f} MiB.')
