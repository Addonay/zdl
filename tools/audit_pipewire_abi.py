#!/usr/bin/env python3
"""Optional Linux native-header ABI check; requires PipeWire development headers.

Translates the installed C headers solely as independent validation input. The
translation is never imported by zdl. Does not load PipeWire or contact a daemon.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import shlex
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--zig', default='/home/addo/.zvm/master/zig')
    parser.add_argument('--output', type=Path, default=ROOT / '.cache/foundation/pipewire-abi.json')
    args = parser.parse_args()
    if platform.system() != 'Linux':
        raise SystemExit('This check currently targets native Linux headers.')
    env = dict(os.environ, ZIG_GLOBAL_CACHE_DIR=str(ROOT / '.cache/zig-master-global'))
    version = subprocess.check_output(['pkg-config', '--modversion', 'libpipewire-0.3'], text=True).strip()
    all_flags = shlex.split(subprocess.check_output(['pkg-config', '--cflags', 'libpipewire-0.3'], text=True))
    # Include paths and preprocessor definitions affect the declarations being
    # checked. Optimizer/aliasing flags are not Zig driver options or ABI inputs.
    flags = [f for f in all_flags if f.startswith(('-I', '-D', '-U'))]
    output = args.output.resolve()
    output.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='zdl-pipewire-abi-') as directory:
        header = Path(directory) / 'headers.h'
        header.write_text('#include <pipewire/pipewire.h>\n#include <pipewire/extensions/metadata.h>\n')
        translation = subprocess.run([args.zig, 'translate-c', '-lc', *flags, str(header)],
                                     cwd=ROOT, env=env, capture_output=True, text=True)
        translated = Path(directory) / 'headers.zig'
        translated.write_text(translation.stdout)
        command = [args.zig, 'build-obj', '-lc', '-fno-emit-bin', '--dep', 'pipewire_headers',
                   '-Mroot=src/pipewire_abi_check.zig', '-Mpipewire_headers=' + str(translated)]
        result = subprocess.run(command, cwd=ROOT, env=env, capture_output=True, text=True) if translation.returncode == 0 else translation
        report = {
            'schema_version': 1, 'compiler': subprocess.check_output([args.zig, 'version'], text=True).strip(),
            'header_package_version': version, 'pkg_config_cflags': all_flags,
            'declaration_flags': flags, 'machine': platform.uname()._asdict(),
            'binding_sha256': hashlib.sha256((ROOT / 'src/audio/pipewire/binding.zig').read_bytes()).hexdigest(),
            'check_sha256': hashlib.sha256((ROOT / 'src/pipewire_abi_check.zig').read_bytes()).hexdigest(),
            'translated_headers_sha256': hashlib.sha256(translated.read_bytes()).hexdigest(),
            'translation_returncode': translation.returncode, 'returncode': result.returncode,
            'diagnostics': translation.stderr + (result.stdout + result.stderr if result is not translation else ''),
            'limitations': [
                'Native installed header layout/constant checks only; not every supported runtime version.',
                'Prefix records permit newer appended fields; only accessed prefix offsets are certified.',
                'Does not certify function signatures, callback races, device behavior or server compatibility.',
            ],
        }
        output.write_text(json.dumps(report, indent=2) + '\n')
        if result.returncode:
            print(report['diagnostics'])
            raise SystemExit(result.returncode)
    print('PipeWire native-header layout/constants check passed:', version, output)


if __name__ == '__main__':
    main()
