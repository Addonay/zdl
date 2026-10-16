#!/usr/bin/env python3
"""Opt-in Linux Pango/Cairo paragraph experiment; requires runtime providers/fonts.

No development headers or display server are needed. Successful provider opens
retain native mappings until process exit for static GObject type safety.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import shutil
import struct
import subprocess
import time

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--zig', default='/home/addo/.zvm/master/zig')
    parser.add_argument('--output', type=Path, default=ROOT / '.cache/spikes/paragraph/report.json')
    args = parser.parse_args()
    if platform.system() != 'Linux':
        raise SystemExit('This disposable experiment targets Linux.')
    output = args.output.resolve()
    output.parent.mkdir(parents=True, exist_ok=True)
    env = dict(os.environ, ZIG_GLOBAL_CACHE_DIR=str(ROOT / '.cache/zig-master-global'), G_DEBUG='fatal-warnings')
    commands, demos = [], []

    def run(name, argv):
        start = time.monotonic()
        process = subprocess.run(argv, cwd=ROOT, env=env, capture_output=True, text=True, timeout=300)
        log = process.stdout + process.stderr
        (output.parent / (name + '.log')).write_text(log)
        commands.append({'name': name, 'argv': argv, 'returncode': process.returncode, 'seconds': time.monotonic() - start})
        print(name + ': ' + ('PASS' if process.returncode == 0 else 'FAIL'), flush=True)
        if process.returncode:
            raise RuntimeError(log)
        return log

    for mode in ('debug', 'safe'):
        run('build-' + mode, [args.zig, 'build', 'check-paragraph-spike', '-Doptimize=' + mode, '--summary', 'all'])
        run('tests-' + mode, [args.zig, 'build', 'test-paragraph-spike', '-Doptimize=' + mode, '--summary', 'all'])
        executable = output.parent / ('paragraph-' + mode)
        shutil.copy2(ROOT / 'zig-out/bin/spikes' / mode / 'zdl-paragraph-spike', executable)
        dynamic = subprocess.check_output(['readelf', '-d', str(executable)], text=True)
        needed = re.findall(r'\(NEEDED\).*?\[(.*?)\]', dynamic)
        if any('pango' in name or 'cairo' in name or 'gobject' in name for name in needed):
            raise RuntimeError('Prototype unexpectedly links providers directly')
        for width in (540, 180):
            name = f'demo-{mode}-{width}'
            png = output.parent / (name + '.png')
            data = json.loads(run(name, [str(executable), str(png), str(width)]).strip())
            if data['mode'] != mode or data['missing_glyphs'] != 0 or not data['resident_provider']:
                raise RuntimeError('Unexpected mode, missing glyphs or residency policy')
            raw = png.read_bytes()
            if raw[:8] != b'\x89PNG\r\n\x1a\n' or struct.unpack('>II', raw[16:24]) != (data['width'], data['height']):
                raise RuntimeError('PNG dimensions disagree with raster result')
            demos.append({'name': name, 'requested_width': width, **data, 'png': str(png),
                          'png_sha256': hashlib.sha256(raw).hexdigest(), 'needed': needed,
                          'executable_sha256': hashlib.sha256(executable.read_bytes()).hexdigest(),
                          'executable_bytes': executable.stat().st_size})
    for mode in ('debug', 'safe'):
        wide, narrow = [d for d in demos if d['mode'] == mode]
        if narrow['lines'] <= wide['lines'] or narrow['height'] <= wide['height']:
            raise RuntimeError('Narrow layout failed to produce extra wrapping')
    sources = [ROOT / 'build.zig', Path(__file__).resolve(), *list((ROOT / 'tools/spikes/paragraph').glob('*.zig'))]
    fonts = None
    if shutil.which('fc-match'):
        fonts = subprocess.check_output(['fc-match', '-f', '%{family}|%{style}|%{file}\n', 'Liberation Sans'], text=True)
    report = {'schema_version': 1, 'compiler': subprocess.check_output([args.zig, 'version'], text=True).strip(),
              'machine': platform.uname()._asdict(), 'commands': commands, 'demos': demos,
              'requested_font_match': fonts,
              'source_hashes': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in sources},
              'limitations': ['Opt-in disposable experiment, not a public text/GUI API.',
                              'Provider mappings and native globals/caches intentionally remain resident until process exit.',
                              'No historical runtime-version ABI, native allocation-failure or actual font-per-run identity certification.',
                              'No editable document/IME/accessibility/GPU export or general paint-protocol conformance yet.',
                              'Font-sensitive pixels are local evidence, not portable golden images.']}
    output.write_text(json.dumps(report, indent=2) + '\n')
    print('Paragraph experiment passed:', output)


if __name__ == '__main__':
    main()
