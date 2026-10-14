#!/usr/bin/env python3
"""Extracts SDL's embedded automation test images (test/testautomation_images.c)
into raw pixel files under src/testdata/images. Usage:
  tools/gen/test_images.py <SDL>/test/testautomation_images.c src/testdata/images
Output files are tightly packed rows named <image>.<bytes_per_pixel> (RGB or RGBA
byte order); dimensions live in src/testdata/images.zig."""
import re
import sys
from pathlib import Path

ESCAPES = {'n': 10, 't': 9, 'r': 13, 'a': 7, 'b': 8, 'f': 12, 'v': 11, '\\': 92, '"': 34, "'": 39, '?': 63}


def unescape(body: str) -> bytes:
    out = bytearray()
    i = 0
    while i < len(body):
        c = body[i]
        if c != '\\':
            out.append(ord(c))
            i += 1
            continue
        i += 1
        c = body[i]
        if c in '01234567':
            j = i
            while j < len(body) and j < i + 3 and body[j] in '01234567':
                j += 1
            out.append(int(body[i:j], 8) & 0xFF)
            i = j
        elif c == 'x':
            j = i + 1
            while j < len(body) and body[j] in '0123456789abcdefABCDEF':
                j += 1
            out.append(int(body[i + 1:j], 16) & 0xFF)
            i = j
        else:
            out.append(ESCAPES[c])
            i += 1
    return bytes(out)


def main() -> None:
    source = Path(sys.argv[1]).read_text()
    dest = Path(sys.argv[2])
    dest.mkdir(parents=True, exist_ok=True)
    source = source.replace('\\\n', '')  # line continuation inside a literal
    pattern = re.compile(r'static const SDLTest_SurfaceImage_t SDLTest_image(\w+) = \{\s*(\d+),\s*(\d+),\s*(\d+),(.*?)\n\};', re.S)
    for name, w, h, bpp, body in pattern.findall(source):
        data = b''.join(unescape(m) for m in re.findall(r'"((?:[^"\\]|\\.)*)"', body))
        w, h, bpp = int(w), int(h), int(bpp)
        expected = w * h * bpp
        assert len(data) == expected, (name, len(data), expected)
        (dest / f'{name}.{bpp}').write_bytes(data)
        print(name, w, h, bpp, len(data))


main()
