#!/usr/bin/env python3
"""Generate SDL's Linux configuration and required protocol declarations."""
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]
SDL = ROOT/'.ref/SDL'
CONFIG = ROOT/'.cache/sdl-linux-full'
if not (CONFIG/'compile_commands.json').exists():
    subprocess.run(['cmake','-S',str(SDL),'-B',str(CONFIG),'-DCMAKE_EXPORT_COMPILE_COMMANDS=ON',
        '-DSDL_TESTS=OFF','-DSDL_TEST_LIBRARY=OFF','-DSDL_EXAMPLES=OFF',
        '-DSDL_SHARED=OFF','-DSDL_STATIC=ON'],check=True)
entries = json.loads((CONFIG/'compile_commands.json').read_text())
for entry in entries:
    path = Path(entry['file'])
    if path.parent.name != 'wayland-generated-protocols': continue
    name = path.name.removesuffix('-protocol.c')
    xml = SDL/'wayland-protocols'/f'{name}.xml'
    path.parent.mkdir(parents=True,exist_ok=True)
    subprocess.run(['wayland-scanner','client-header',str(xml),str(path.with_name(f'{name}-client-protocol.h'))],check=True)
    subprocess.run(['wayland-scanner','private-code',str(xml),str(path)],check=True)

# DBusError reserves one unsigned word using five private bitfields. Retain
# exactly that C layout, without asking translate-c to handle inaccessible bits.
source = Path('/usr/include/dbus-1.0/dbus/dbus-errors.h')
if source.exists():
    header = source.read_text()
    header = re.sub(r'  unsigned int dummy1 : 1;.*?  unsigned int dummy5 : 1;[^\n]*',
                    '  unsigned int reserved_bits;',header,flags=re.S)
    header = header.replace('#define DBUS_ERROR_INIT { NULL, NULL, TRUE, 0, 0, 0, 0, NULL }',
                            '#define DBUS_ERROR_INIT { NULL, NULL, 1, NULL }')
    destination = ROOT/'.cache/c-compat/dbus/dbus-errors.h'
    destination.parent.mkdir(parents=True,exist_ok=True)
    destination.write_text(header)
print(f'Prepared Linux configuration and {sum(Path(e["file"]).parent.name == "wayland-generated-protocols" for e in entries)} Wayland protocols.')
