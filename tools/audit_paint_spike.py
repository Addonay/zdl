#!/usr/bin/env python3
"""Opt-in runtime-loaded Cairo paint replay; native libraries, no display required."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import struct
import subprocess
import time
ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--zig', default='/home/addo/.zvm/master/zig')
    parser.add_argument('--output', type=Path, default=ROOT / '.cache/spikes/paint')
    args = parser.parse_args()
    if platform.system() != "Linux":
        raise SystemExit("Disposable Cairo replay currently targets Linux")
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    env = dict(os.environ, ZIG_GLOBAL_CACHE_DIR=str(ROOT / '.cache/zig-master-global'))
    commands, images = [], []
    def run(name, argv):
        start = time.monotonic()
        result = subprocess.run(argv, cwd=ROOT, env=env, capture_output=True, text=True, timeout=300)
        log = result.stdout + result.stderr
        (output / (name + '.log')).write_text(log)
        commands.append({'name': name, 'command': argv, 'returncode': result.returncode, 'seconds': time.monotonic() - start})
        print(name + ': ' + ('PASS' if result.returncode == 0 else 'FAIL'), flush=True)
        if result.returncode:
            raise RuntimeError(log)
        return log
    for mode, optimize in [('debug', 'Debug'), ('safe', 'ReleaseSafe')]:
        module = ['--dep', 'zdl', '-Mroot=' + str(ROOT / 'tools/spikes/paint/tests.zig'), '-Mzdl=' + str(ROOT / 'src/root.zig')]
        run('tests-' + mode, [args.zig, 'test', '-O' + optimize, '-lc', *module])
        executable = output / ('paint-' + mode)
        run('build-' + mode, [args.zig, 'build-exe', '-O' + optimize, '-lc', '--dep', 'zdl', '-Mroot=' + str(ROOT / 'tools/spikes/paint/main.zig'), '-Mzdl=' + str(ROOT / 'src/root.zig'), '-femit-bin=' + str(executable)])
        dynamic = subprocess.check_output(['readelf', '-d', str(executable)], text=True)
        needed = re.findall(r'\(NEEDED\).*?\[(.*?)\]', dynamic)
        if any('cairo' in name for name in needed):
            raise RuntimeError('Replay links Cairo directly')
        png = output / ('fixture-' + mode + '.png')
        data = json.loads(run('demo-' + mode, [str(executable), str(png)]).strip())
        raw = png.read_bytes()
        if data['mode'] != mode or raw[:8] != b'\x89PNG\r\n\x1a\n' or struct.unpack('>II', raw[16:24]) != (480, 260):
            raise RuntimeError('Unexpected mode or fixture dimensions')
        images.append(dict(data, png_sha256=hashlib.sha256(raw).hexdigest(), executable_sha256=hashlib.sha256(executable.read_bytes()).hexdigest(), needed=needed))
    if images[0]['png_sha256'] != images[1]['png_sha256']:
        raise RuntimeError('Debug/Safe raster outputs differ on this same provider')
    sources = [Path(__file__).resolve(), ROOT / 'src/root.zig', *sorted((ROOT / 'src/paint').glob('*.zig')), *sorted((ROOT / 'tools/spikes/paint').glob('*.zig'))]
    report = {'compiler': subprocess.check_output([args.zig, 'version'], text=True).strip(), 'machine': platform.uname()._asdict(), 'commands': commands, 'images': images,
              'source_hashes': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in sources},
              'limitations': ['Disposable prototype, not a public backend or GPU/CPU conformance certification.', 'Encoded sRGB only; linear/HDR rejected, native allocation failures not injected.', 'No text/filters/dashes/damage/retirement or live native window validation; varying-alpha gradients use bounded full-target raster sources.', 'Provider code remains resident until process exit; all owned objects are explicitly released.', 'Numeric fixture pixels are local Cairo evidence, not portable anti-aliasing goldens.']}
    (output / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    print('Paint replay audit passed:', output / 'report.json')


if __name__ == '__main__':
    main()
