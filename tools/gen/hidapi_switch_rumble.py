# Extracts the high- and low-amplitude rumble lookup tables (101 entries each,
# {threshold, encoded value}) from SDL_hidapi_switch.c and prints Zig arrays.
# Usage: python3 -I gen_switch_rumble.py <path to SDL_hidapi_switch.c>
import re
import sys

src = open(sys.argv[1], encoding="utf-8").read()


def table(name):
    start = src.index(f"Uint16 {name}[101][2] = {{")
    end = src.index("};", start)
    pairs = re.findall(r"\{\s*(\d+),\s*(0x[0-9a-fA-F]+)\s*\}", src[start:end])
    assert len(pairs) == 101, (name, len(pairs))
    return pairs


print("pub const high_amplitude = [_]struct { u16, u8 }{")
for threshold, code in table("hfa"):
    print(f"    .{{ {int(threshold)}, 0x{int(code, 16):02x} }},")
print("};")
print()
print("pub const low_amplitude = [_]struct { u16, u16 }{")
for threshold, code in table("lfa"):
    print(f"    .{{ {int(threshold)}, 0x{int(code, 16):04x} }},")
print("};")
