#!/usr/bin/env python3
"""Opt-in layout adapter evidence against the exact zlay pin used by examples.

Reads the existing local Zig package archive; no network fetch, global compiler
change or root dependency adoption. Requires the full development checkout.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import shutil
import subprocess
import tarfile
import time

ROOT = Path(__file__).resolve().parents[1]
PIN = 'd6112faa78b5750a3817b927b7d48bb562634304'
PACKAGE = 'zlay-0.1.0-TRqBosOgAwBpF1ZBaJs8oQu4kRrM5dAPdfPMOGdTRRGr'
PIN_FILE = ROOT / 'tools/spikes/layout/pin.json'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--zig', default='/home/addo/.zvm/master/zig')
    parser.add_argument('--output', type=Path, default=ROOT / '.cache/spikes/layout/report.json')
    args = parser.parse_args(); output = args.output.resolve(); output.parent.mkdir(parents=True, exist_ok=True)
    example_pin = (ROOT / 'examples/build.zig.zon').read_text()
    zlay = re.search(r'\.zlay\s*=\s*\.\{(.*?)\n\s*\}', example_pin, re.S)
    if zlay is None or PIN not in zlay.group(1) or PACKAGE not in zlay.group(1):
        raise SystemExit('Examples zlay pin changed; reevaluate the adapter against the new pin explicitly.')
    archive = ROOT / '.cache/zig-master-global/p' / (PACKAGE + '.tar.gz')
    if not archive.exists(): raise SystemExit('Pinned archive not cached; resolve the normal examples dependency first.')
    pinned = json.loads(PIN_FILE.read_text())
    if pinned['commit'] != PIN or pinned['package'] != PACKAGE: raise SystemExit('Unexpected source manifest pin')
    archive_sha = hashlib.sha256(archive.read_bytes()).hexdigest()
    extraction = ROOT / '.cache/spikes/layout/dependency'; extraction.mkdir(parents=True, exist_ok=True)
    dependency = extraction / PACKAGE
    manifest = {}
    with tarfile.open(archive) as source:
        for member in source.getmembers():
            parts = Path(member.name).parts
            if not parts or parts[0] != PACKAGE or '..' in parts or Path(member.name).is_absolute() or not (member.isdir() or member.isfile()):
                raise RuntimeError('Unexpected dependency archive member')
            if member.isfile(): manifest[member.name] = hashlib.sha256(source.extractfile(member).read()).hexdigest()
        if manifest != pinned['files']: raise RuntimeError('Cached package content differs from the checked-in source manifest')
        source.extractall(extraction, filter='data')
    for path, digest in manifest.items():
        if hashlib.sha256((extraction / path).read_bytes()).hexdigest() != digest: raise RuntimeError('Extracted source differs from archive')
    env = dict(os.environ, ZIG_GLOBAL_CACHE_DIR=str(ROOT / '.cache/zig-master-global'), G_DEBUG='fatal-warnings')
    commands, demos = [], []

    def run(name, command):
        started = time.monotonic()
        result = subprocess.run(command, cwd=ROOT, env=env, capture_output=True, text=True, timeout=300)
        text = result.stdout + result.stderr; (output.parent / (name + '.log')).write_text(text)
        commands.append({'name': name, 'command': command, 'returncode': result.returncode, 'seconds': time.monotonic() - started})
        print(name + ': ' + ('PASS' if result.returncode == 0 else 'FAIL'), flush=True)
        if result.returncode: raise RuntimeError(text)
        return text

    for mode in ('debug', 'safe'):
        options = ['-Doptimize=' + mode, '-Dlayout-zlay-source=' + str(dependency), '--summary', 'all']
        run('layout-build-' + mode, [args.zig, 'build', 'check-layout-spike', *options])
        run('layout-tests-' + mode, [args.zig, 'build', 'test-layout-spike', *options])
        executable = output.parent / ('layout-' + mode)
        shutil.copy2(ROOT / 'zig-out/bin/spikes' / mode / 'zdl-layout-spike', executable)
        dynamic = subprocess.check_output(['readelf', '-d', str(executable)], text=True)
        if 'Dynamic section at offset' in dynamic: raise RuntimeError('Pure layout consumer acquired dynamic dependencies')
        for width in ('320', '640.5'):
            data = json.loads(run('layout-demo-' + mode + '-' + width, [str(executable), width]).strip())
            if data['mode'] != mode or abs(data['width'] - (float(width) - 108)) > .001: raise RuntimeError('Unexpected adapter result/mode')
            demos.append({'state': data, 'executable_bytes': executable.stat().st_size,
                          'sha256': hashlib.sha256(executable.read_bytes()).hexdigest(), 'dynamic_section': False})
    benchmark = output.parent / 'layout-benchmark-fast'
    benchmark_command = [args.zig, 'build-exe', '-OReleaseFast', '--dep', 'zdl', '--dep', 'zlay',
                         '-Mroot=tools/spikes/layout_bench.zig', '-OReleaseFast', '-Mzdl=src/root.zig',
                         '-OReleaseFast', '-Mzlay=' + str(dependency / 'src/root.zig'), '-femit-bin=' + str(benchmark)]
    run('layout-benchmark-build', benchmark_command)
    benchmark_log = run('layout-benchmark', [str(benchmark)])
    sources = [ROOT / 'build.zig', ROOT / 'examples/build.zig.zon', Path(__file__).resolve(), PIN_FILE,
               *list((ROOT / 'tools/spikes/layout').glob('*.zig')), *list((ROOT / 'tools/spikes').glob('layout_*.zig')),
               *list((ROOT / 'tools/spikes/paragraph').glob('*.zig')), *list((ROOT / 'src').rglob('*.zig'))]
    report = {'compiler': subprocess.check_output([args.zig, 'version'], text=True).strip(), 'machine': platform.uname()._asdict(),
              'zlay_commit': PIN, 'zlay_package': PACKAGE, 'archive_sha256': archive_sha, 'archive_members': manifest,
              'commands': commands, 'demos': demos, 'benchmark': {'command': benchmark_command, 'log': benchmark_log, 'sha256': hashlib.sha256(benchmark.read_bytes()).hexdigest()},
              'source_hashes': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(set(sources))},
              'limits': ['Disposable adapter, not atomic production scene/layout/paint integration.',
                         'No builtin text wrapping: paragraph results supplied as opaque leaf metrics.',
                         'Integer padding/gaps; no baseline, flex-wrap/grid, clips/scroll/transform contract yet.',
                         'Grow/percentage under intrinsic parents rejected instead of guessing cycle behavior.',
                         'Full redeclaration; no O(changed nodes) claim or native graphical/AX validation.']}
    output.write_text(json.dumps(report, indent=2) + '\n'); print('Pinned layout experiment passed:', output)


if __name__ == '__main__': main()
