#!/usr/bin/env python3
"""Generates src/core/hint_names.zig from SDL_hints.h.

Usage (repo root): python3 -I tools/gen/hint_names.py /path/to/.ref/SDL > src/core/hint_names.zig
Each `#define SDL_HINT_FOO "SDL_FOO"` becomes `pub const foo = "SDL_FOO";`,
preceded by the doc comment line SDL gives it (first sentence of the block).
"""
import re
import sys

root = sys.argv[1]
text = open(root + "/include/SDL3/SDL_hints.h", encoding="utf-8").read()
out = [
    "//! Names of SDL's documented configuration hints (generated from SDL_hints.h",
    "//! by tools/gen/hint_names.py; do not edit by hand). Pass these to `Hints`.",
    "//! The environment-variable name of a hint equals its string value.",
    "",
]
pat = re.compile(r'/\*\*\s*\n((?:.|\n)*?)\*/\s*\n#define SDL_HINT_([A-Z0-9_]+)\s+"([^"]+)"')
for m in pat.finditer(text):
    doc, name, value = m.groups()
    lines = [l.strip().lstrip("*").strip() for l in doc.split("\n")]
    para = []
    for l in lines:
        if not l:
            if para:
                break
            continue
        para.append(l)
    summary = " ".join(para)
    dot = summary.find(". ")
    if dot >= 0:
        summary = summary[: dot + 1]
    summary = summary.replace("\\", "")
    if summary and not summary.startswith("#"):
        out.append("/// " + summary)
    out.append('pub const %s = "%s";' % (name.lower(), value))
print("\n".join(out))
