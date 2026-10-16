#!/usr/bin/env python3
"""Build and run small native consumers; record dependencies and source evidence.

This is a Linux ELF/link-boundary check, not a complete API/ABI/hardware audit.
The window consumer uses only offscreen. Never runs zdl-compile-check.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import subprocess
import shutil

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--zig', default='/home/addo/.zvm/master/zig')
    parser.add_argument('--optimize', default='ReleaseSmall', choices=['Debug', 'ReleaseSafe', 'ReleaseFast', 'ReleaseSmall'])
    parser.add_argument('--output', type=Path, default=ROOT / '.cache/foundation/report.json')
    args = parser.parse_args()
    if platform.system() != 'Linux':
        raise SystemExit('This audit currently requires Linux/ELF and readelf/strings.')
    environment = os.environ.copy()
    environment.update(ZIG_GLOBAL_CACHE_DIR=str(ROOT / '.cache/zig-master-global'), LC_ALL='C')
    mode = {"Debug": "debug", "ReleaseSafe": "safe", "ReleaseFast": "fast", "ReleaseSmall": "small"}[args.optimize]
    command = [args.zig, 'build', 'check-foundation', '-Doptimize=' + mode, '--summary', 'all']
    built = subprocess.run(command, cwd=ROOT, env=environment, capture_output=True, text=True)
    print(built.stdout + built.stderr, end='')
    if built.returncode:
        raise SystemExit(built.returncode)
    output = args.output.resolve()
    output.parent.mkdir(parents=True, exist_ok=True)
    frozen = output.parent / ("binaries-" + args.optimize)
    frozen.mkdir(exist_ok=True)
    consumers = []
    failures = []
    for name, arguments in [('geometry', ['641']), ('image', ['17']), ('audio', ['123']), ('scene', ['97']), ('state', ['97']), ('text', ['aé\r\nb']), ('registration', ['bound document']), ('semantics', ['97']), ('actions', ['97']), ('paint', ['97']), ('window', [])]:
        built_executable = ROOT / 'zig-out/bin/foundation' / mode / ('zdl-foundation-' + name)
        executable = frozen / ('zdl-foundation-' + name)
        shutil.copy2(built_executable, executable)
        dynamic = subprocess.check_output(['readelf', '-d', str(executable)], text=True, env=environment)
        strings = subprocess.check_output(['strings', str(executable)], text=True, env=environment)
        needed = re.findall(r'\(NEEDED\).*?\[(.*?)\]', dynamic)
        has_dynamic = 'Dynamic section at offset' in dynamic
        sonames = sorted(set(re.findall(r'\blib[\w+.-]+\.so(?:\.\d+)*\b', strings)))
        result = subprocess.run([str(executable), *arguments], cwd=ROOT, env=environment,
                                capture_output=True, text=True, timeout=30)
        row = {'profile': name, 'arguments': arguments, 'executable': str(executable), 'file_bytes': executable.stat().st_size,
               'sha256': hashlib.sha256(executable.read_bytes()).hexdigest(),
               'dynamic_section': has_dynamic, 'needed': needed, 'embedded_sonames': sonames,
               'returncode': result.returncode, 'output': result.stdout + result.stderr}
        consumers.append(row)
        if result.returncode:
            failures.append(name + ': consumer execution failed')
        if ('mode=' + mode + '\n') not in row['output']:
            failures.append(name + ': artifact optimization mode does not match requested mode')
        if name != 'window' and (has_dynamic or needed or sonames):
            failures.append(name + ': unexpected ELF dynamic section or library soname')
        print(f'{name}: bytes={row["file_bytes"]}, dynamic={has_dynamic}, needed={needed}, exit={result.returncode}')
    libraries = []
    declarations = []
    for path in sorted((ROOT / 'src').rglob('*.zig')):
        for line_number, line in enumerate(path.read_text().splitlines(), 1):
            match = re.search(r'std\.DynLib\.open\("([^\"]+)"', line)
            if match:
                libraries.append({'file': str(path.relative_to(ROOT)), 'line': line_number, 'literal': match.group(1)})
    for line_number, line in enumerate((ROOT / 'src/root.zig').read_text().splitlines(), 1):
        match = re.match(r'pub const (\w+)\s*=', line)
        if match:
            declarations.append({'name': match.group(1), 'line': line_number})
    references = []
    for path in sorted((ROOT / 'tools/checks').glob('*.zig')):
        for number, line in enumerate(path.read_text().splitlines(), 1):
            if re.search(r'_ = [A-Za-z_]\w*(?:\.\w+)*;', line):
                references.append({'file': str(path.relative_to(ROOT)), 'line': number, 'source': line.strip()})
    # The scans deliberately make no completeness/semantic-analysis claim.
    evidence_sources = sorted([ROOT / 'build.zig', *list((ROOT / 'src').rglob('*.zig')),
                               *list((ROOT / 'tools').rglob('*.zig')), *list((ROOT / 'tools').rglob('*.py'))])
    report = {'schema_version': 1, 'source_commit': subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ROOT, text=True).strip(),
              'working_tree_dirty': bool(subprocess.check_output(['git', 'status', '--porcelain'], cwd=ROOT, text=True).strip()),
              'compiler': subprocess.check_output([args.zig, 'version'], text=True).strip(),
              'optimize': args.optimize, 'machine': platform.uname()._asdict(), 'build_command': command,
              'source_hashes': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in evidence_sources},
              'consumers': consumers, 'root_declarations_syntactic': declarations,
              'literal_dynlib_calls_syntactic': libraries,
              'bare_reference_candidates_syntactic': references,
              'limitations': ['Source scans are candidates, not a complete dependency graph or proof of body coverage.',
                              'Embedded sonames are artifact strings, not proof that those libraries were loaded.',
                              'The platform consumer uses offscreen; real windowing/devices are not validated.'],
              'failures': failures}
    output.write_text(json.dumps(report, indent=2) + '\n')
    if failures:
        raise SystemExit('\n'.join(failures))
    print('Foundation dependency checks passed; report:', output)


if __name__ == '__main__':
    main()
