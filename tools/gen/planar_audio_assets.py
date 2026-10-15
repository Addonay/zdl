#!/usr/bin/env python3
"""Extract the two public-domain planar audio examples into raw U8 assets."""

import pathlib
import re
import sys


def main() -> None:
    if len(sys.argv) not in (2, 3):
        raise SystemExit(f"usage: {pathlib.Path(sys.argv[0]).name} planar-data.c [output-dir]")
    source = pathlib.Path(sys.argv[1]).read_text(encoding="utf-8")
    output_dir = pathlib.Path(sys.argv[2]) if len(sys.argv) == 3 else pathlib.Path("examples/assets")
    output_dir.mkdir(parents=True, exist_ok=True)
    for name, expected in (("left", 1870), ("right", 1777)):
        match = re.search(rf"static\s+const\s+Uint8\s+{name}\[{expected}\]\s*=\s*\{{(.*?)\}}\s*;", source, re.S)
        if not match:
            raise SystemExit(f"{name} sample array was not found")
        values = bytes(int(value, 16) for value in re.findall(r"0x([0-9a-fA-F]+)", match.group(1)))
        if len(values) != expected:
            raise SystemExit(f"expected {expected} {name} bytes, got {len(values)}")
        path = output_dir / f"planar-{name}.u8"
        path.write_bytes(values)
        print(f"wrote {len(values)} bytes to {path}")


if __name__ == "__main__":
    main()
