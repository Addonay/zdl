#!/usr/bin/env python3
"""Opt-in offscreen Pango/document editor integration, not native-input proof."""
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
    parser.add_argument('--output', type=Path, default=ROOT / '.cache/spikes/editor/report.json')
    args = parser.parse_args()
    output = args.output.resolve(); output.parent.mkdir(parents=True, exist_ok=True)
    env = dict(os.environ, ZIG_GLOBAL_CACHE_DIR=str(ROOT / '.cache/zig-master-global'), G_DEBUG='fatal-warnings')
    commands, snapshots = [], []

    def run(name, command):
        start = time.monotonic()
        result = subprocess.run(command, cwd=ROOT, env=env, capture_output=True, text=True, timeout=300)
        (output.parent / (name + '.log')).write_text(result.stdout + result.stderr)
        commands.append({'name': name, 'command': command, 'returncode': result.returncode, 'seconds': time.monotonic() - start})
        print(name + ': ' + ('PASS' if result.returncode == 0 else 'FAIL'), flush=True)
        if result.returncode: raise RuntimeError(result.stdout + result.stderr)

    for mode in ('debug', 'safe'):
        run('editor-build-' + mode, [args.zig, 'build', 'check-editor-spike', '-Doptimize=' + mode, '--summary', 'all'])
        run('editor-tests-' + mode, [args.zig, 'build', 'test-editor-spike', '-Doptimize=' + mode, '--summary', 'all'])
        executable = output.parent / ('editor-' + mode)
        shutil.copy2(ROOT / 'zig-out/bin/spikes' / mode / 'zdl-editor-spike', executable)
        state = output.parent / ('state-' + mode + '.json'); png = output.parent / ('editor-' + mode + '.png')
        run('editor-script-' + mode, [str(executable), '--script', '--snapshot', str(png), '--state', str(state)])
        data = json.loads(state.read_text())
        if data['text'] != 'Hello · עברית · العربية · cafe\u0301' or data['revision'] != 12 or data['pending'] or data['missing_glyphs'] != 0 or data['mode'] != mode:
            raise RuntimeError('Unexpected document/editor script result: ' + repr(data))
        raw = png.read_bytes()
        if raw[:8] != b'\x89PNG\r\n\x1a\n' or struct.unpack('>II', raw[16:24]) != (720, 400): raise RuntimeError('Invalid editor PNG')
        dynamic = subprocess.check_output(['readelf', '-d', str(executable)], text=True)
        needed = re.findall(r'\(NEEDED\).*?\[(.*?)\]', dynamic)
        if any('pango' in name or 'cairo' in name for name in needed): raise RuntimeError('Provider unexpectedly linked directly')
        snapshots.append({'mode': mode, 'state': data, 'png': str(png), 'png_sha256': hashlib.sha256(raw).hexdigest(),
                          'executable_sha256': hashlib.sha256(executable.read_bytes()).hexdigest(), 'needed': needed})
    sources = [ROOT / 'build.zig', Path(__file__).resolve(), *list((ROOT / 'tools/spikes').rglob('*.zig')), *list((ROOT / 'src').rglob('*.zig'))]
    report = {'compiler': subprocess.check_output([args.zig, 'version'], text=True).strip(), 'machine': platform.uname()._asdict(),
              'commands': commands, 'snapshots': snapshots,
              'source_hashes': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(sources)},
              'native_input': 'Not certified by offscreen script; use test_editor_x11.py in an isolated Xvfb-capable environment.',
              'limits': ['Disposable controller, not public widgets/retained GUI integration.',
                         'Single paragraph, no scrolling/clipboard/word navigation/full native IME/AX conformance.',
                         'Pango logical-attribute bit decoder is restricted to little-endian Linux guint32 GCC-compatible ABI.',
                         'Backspace/delete use whole provider graphemes; language-specific backspace tailoring remains open.',
                         'Native provider mappings remain process-resident as in the paragraph experiment.']}
    output.write_text(json.dumps(report, indent=2) + '\n'); print('Offscreen editor integration passed:', output)


if __name__ == '__main__': main()
