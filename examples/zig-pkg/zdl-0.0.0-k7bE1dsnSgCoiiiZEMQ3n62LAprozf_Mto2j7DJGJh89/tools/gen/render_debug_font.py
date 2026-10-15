#!/usr/bin/env python3
"""Extract SDL's public-domain 8x8 debug font bytes into Zig source."""

import pathlib
import re
import sys


def main() -> None:
    if len(sys.argv) != 2:
        raise SystemExit(f"usage: {pathlib.Path(sys.argv[0]).name} SDL_render_debug_font.h")
    source = pathlib.Path(sys.argv[1]).read_text(encoding="utf-8")
    source = re.sub(r"/\*.*?\*/|//[^\n]*", "", source, flags=re.S)
    match = re.search(r"SDL_RenderDebugTextFontData\[\]\s*=\s*\{(.*?)\};", source, re.S)
    if not match:
        raise SystemExit("font byte array was not found")
    values = [int(value, 16) for value in re.findall(r"0x([0-9a-fA-F]+)", match.group(1))]
    if len(values) != 190 * 8:
        raise SystemExit(f"expected 1520 font bytes, got {len(values)}")

    output = pathlib.Path("src/render/debug_font_data.zig")
    rows = [", ".join(f"0x{value:02x}" for value in values[i : i + 16]) for i in range(0, len(values), 16)]
    output.write_text(
        "//! SDL_RenderDebugText's public-domain 8x8 IBM VGA font, generated from\n"
        "//! SDL_render_debug_font.h. Each row is packed least-significant bit first.\n"
        "pub const glyphs = [_]u8{\n    " + ",\n    ".join(rows) + ",\n};\n",
        encoding="utf-8",
    )
    print(f"wrote {len(values)} bytes to {output}")


if __name__ == "__main__":
    main()
