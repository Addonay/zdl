#!/usr/bin/env python3
"""Validate native builds, tests and every declared example run target.

Runs are finite and offscreen. Audio uses a process-local ALSA null PCM; no
physical playback, native window-manager interactions or controller behavior is
claimed. The compile-only consumer is built but never executed.
"""
import argparse
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--zig', default='/home/addo/.zvm/master/zig')
    parser.add_argument('--output', type=Path, default=ROOT / '.cache' / 'validation')
    parser.add_argument('--runs-only', action='store_true', help='Reuse build artifacts; still invoke every zig build run-* target')
    args = parser.parse_args()
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    env = os.environ.copy()
    env['ZIG_GLOBAL_CACHE_DIR'] = str(ROOT / '.cache' / 'zig-master-global')
    # Explicitly opt into a virtual device for this process tree only.
    config = output / 'alsa-null.conf'
    config.write_text('pcm.!default { type null hint { show on description "zdl validation null PCM" } }\n')
    run_env = env.copy()
    run_env['ALSA_CONFIG_PATH'] = str(config)
    results = []

    def run(name, command, cwd, environment=env, timeout=600, audio=False):
        start = time.monotonic()
        try:
            process = subprocess.run(command, cwd=cwd, env=environment,
                                     stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                     text=True, timeout=timeout)
            status, log = process.returncode, process.stdout
        except subprocess.TimeoutExpired as error:
            status = 124
            log = (error.stdout or b'')
            if isinstance(log, bytes):
                log = log.decode(errors='replace')
            log += '\nValidation timeout: this target did not finish.\n'
        if audio and 'audio device unavailable' in log:
            status = status or 1
            log += '\nValidation failure: the null-device route was skipped.\n'
        (output / (name + '.log')).write_text(log)
        row = {'name': name, 'command': command, 'cwd': str(cwd),
               'returncode': status, 'seconds': round(time.monotonic() - start, 3)}
        results.append(row)
        (output / 'results.json').write_text(json.dumps(results, indent=2) + '\n')
        print(f'{name}: {"PASS" if status == 0 else "FAIL"} ({row["seconds"]}s)', flush=True)
        if status:
            print(log, flush=True)
        return status == 0

    if not args.runs_only:
        checks = [
            ('library-debug-build', ROOT, ['build']),
            ('library-debug-check', ROOT, ['build', 'check']),
            ('library-safe-build', ROOT, ['build', '--release=safe']),
            ('library-debug-tests', ROOT, ['build', 'test']),
            ('library-safe-tests', ROOT, ['build', 'test', '--release=safe']),
            ('examples-debug-build', ROOT / 'examples', ['build', '--fork=..']),
            ('examples-fast-build', ROOT / 'examples', ['build', '--fork=..', '-Doptimize=ReleaseFast']),
            ('apps-fast-build', ROOT / 'examples', ['build', 'build-apps', '--fork=..', '-Doptimize=ReleaseFast']),
            ('apps-debug-tests', ROOT / 'examples', ['build', 'test-apps', '--fork=..']),
            ('apps-safe-tests', ROOT / 'examples', ['build', 'test-apps', '--fork=..', '-Doptimize=ReleaseSafe']),
        ]
        for name, cwd, suffix in checks:
            if not run(name, [args.zig, *suffix, '--summary', 'all'], cwd):
                return 1

    build = (ROOT / 'examples' / 'build.zig').read_text()
    examples = re.findall(r'\.\{ \.name = "([^"]+)", \.path = "([^"]+)" \}', build)
    targets = [(f'run-{name}', path) for name, path in examples]
    targets += [(name, None) for name in re.findall(r'b\.step\("(run-[^"]+)"', build)]
    if len({name for name, _ in targets}) != len(targets) or not targets:
        raise RuntimeError('Run-target discovery was empty or ambiguous')
    (output / 'run-targets.json').write_text(json.dumps([name for name, _ in targets], indent=2) + '\n')
    failed = 0
    for target, path in targets:
        artifact = output / target
        artifact.mkdir(exist_ok=True)
        if target in ('run-apps-dashboard', 'run-apps-player'):
            tail = ['--snapshot', str(artifact / 'snapshot.png')]
        elif target == 'run-chrome-01-custom-titlebar':
            tail = ['--frames', '2']
        else:
            tail = ['--frames', '2', '--save-dir', str(artifact)]
        passed = run(target, [args.zig, 'build', target, '--fork=..', '-Doptimize=ReleaseFast',
                              '--summary', 'all', '--', *tail], ROOT / 'examples',
                     run_env, timeout=180, audio=path is not None and path.startswith('audio/'))
        failed += not passed
    print(f'{len(targets) - failed}/{len(targets)} declared run targets passed.', flush=True)
    return int(failed != 0)


if __name__ == '__main__':
    sys.exit(main())
