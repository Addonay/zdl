#!/usr/bin/env python3
"""Share SDL public types and preserve the GL/EGL/XR/Vulkan header surfaces."""
import json
from pathlib import Path
import re

ROOT=Path(__file__).resolve().parents[1]
HEADER=ROOT/'include/SDL3'
pattern=re.compile(r'(?m)^(?:pub )?(?:(?:extern|export|inline|threadlocal) )*(?:const|var|fn)\s+(@"[^"\n]+"|[A-Za-z_]\w*)')

def split(text):
    matches=list(pattern.finditer(text))
    return text[:matches[0].start()] if matches else text, {m[1]:text[m.start():matches[i+1].start() if i+1<len(matches) else len(text)] for i,m in enumerate(matches)}

def references(text):
    text=re.sub(r'(@"(?:\\.|[^"\\])*")|"(?:\\.|[^"\\])*"|//[^\n]*',lambda m:m[1] or '',text)
    return set(re.findall(r'@"[^"\n]+"|[A-Za-z_]\w*',text))

manifest=json.loads((ROOT/'translation-report/manifest.json').read_text())
restored=0
for record in manifest['translations']:
    if not record['output'] or not record['source'].startswith('include/SDL3/'):continue
    name=Path(record['source']).name
    if not any(key in name for key in ('opengl','egl','vulkan','openxr')):continue
    raw=ROOT/record['raw_output']
    prefix,nodes=split(raw.read_text())
    todo=[n for n in nodes if n.startswith(('SDL','Uint','Sint','GL','gl','EGL','egl','PFN','Xr','XR_','Vk','VK_','khronos_','KHR'))]
    keep=set(); names=set(nodes)
    while todo:
        n=todo.pop()
        if n in keep:continue
        keep.add(n)
        todo.extend((references(nodes[n]) & names)-keep)
    (ROOT/record['output']).write_text(prefix+''.join(text for name,text in nodes.items() if name in keep))
    restored+=1

_,common=split((HEADER/'SDL.zig').read_text())
aliases=0
for path in HEADER.glob('*.zig'):
    if path.name=='SDL.zig':continue
    prefix,nodes=split(path.read_text())
    changed=False
    for name in nodes:
        if name in common and (name.startswith(('SDL','struct_SDL','union_SDL','Uint','Sint','enum_SDL'))):
            nodes[name]=f'pub const {name} = SDL_API.{name};\n'
            aliases+=1;changed=True
    if changed:
        prefix+='const SDL_API = @import("SDL.zig");\n'
        path.write_text(prefix+''.join(nodes.values()))
print(f'Restored {restored} graphics header surfaces; {aliases} SDL declarations now share the main API module.')
