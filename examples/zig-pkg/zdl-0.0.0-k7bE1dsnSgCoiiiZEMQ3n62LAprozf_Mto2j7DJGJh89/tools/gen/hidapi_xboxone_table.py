# Extracts SDL's initial_old_xboxone_controllers VID/PID list from SDL_joystick.c
# and prints it as a Zig array of {vendor, product} pairs.
# Usage: python3 -I gen_old_xboxone.py <path to SDL_joystick.c>
import re
import sys

src = open(sys.argv[1], encoding="utf-8").read()
start = src.index("static Uint32 initial_old_xboxone_controllers[] = {")
end = src.index("};", start)
pairs = re.findall(r"MAKE_VIDPID\((0x[0-9a-fA-F]+),\s*(0x[0-9a-fA-F]+)\)", src[start:end])
print("pub const old_xboxone_controllers = [_]struct { u16, u16 }{")
for vendor, product in pairs:
    print(f"    .{{ 0x{int(vendor, 16):04x}, 0x{int(product, 16):04x} }},")
print("};")
