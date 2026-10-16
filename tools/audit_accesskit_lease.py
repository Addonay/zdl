#!/usr/bin/env python3
"""Opt-in pinned AccessKit C handler-lifetime experiment. No network/downloads."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import shutil
import subprocess
import time
ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, required=True)
    parser.add_argument('--unix-source', type=Path, required=True)
    parser.add_argument('--cargo', default='/home/addo/.cargo/bin/cargo')
    parser.add_argument('--zig', default='/home/addo/.zvm/master/zig')
    parser.add_argument('--output', type=Path, default=ROOT / '.cache/spikes/accesskit-lease')
    args = parser.parse_args()
    source, output = args.source.resolve(), args.output.resolve()
    pin = json.loads((ROOT / 'tools/spikes/accesskit/provider.json').read_text())
    for name, expected in pin['source_hashes'].items():
        if hashlib.sha256((source / name).read_bytes()).hexdigest() != expected:
            raise SystemExit('Pinned AccessKit source mismatch: ' + name)
    output.mkdir(parents=True, exist_ok=True)
    copied = output / 'provider'
    copied.mkdir(exist_ok=True)
    for name in pin['source_hashes']:
        destination = copied / name
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source / name, destination)
    dependency = output / 'unix-dependency'
    for name, expected in pin['unix_dependency']['source_hashes'].items():
        original = args.unix_source.resolve() / name
        if hashlib.sha256(original.read_bytes()).hexdigest() != expected:
            raise SystemExit('Pinned Unix dependency mismatch: ' + name)
        destination = dependency / name
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(original, destination)
    context = dependency / 'src/context.rs'
    content = context.read_text()
    anchor = '            thread::spawn(|| {\n'
    if content.count(anchor) != 1:
        raise SystemExit('Unexpected event-loop source shape')
    content = content.replace(anchor, anchor + '                #[cfg(not(feature = "tokio"))]\n                let _pending = PendingMessages(rx.clone());\n')
    content += '\n' + (ROOT / 'tools/spikes/accesskit/pending.rs').read_text()
    context.write_text(content)
    with (copied / 'Cargo.toml').open('a') as f:
        f.write('\n[patch.crates-io]\naccesskit_unix = { path = "../unix-dependency" }\n\n[dependencies.accesskit_consumer]\nversion = "=0.39.0"\n')
    extension = ROOT / 'tools/spikes/accesskit/lease.rs'
    shutil.copy2(extension, copied / 'src/zdl_lease.rs')
    with (copied / 'src/lib.rs').open('a') as f:
        f.write('\n#[cfg(target_os = "linux")]\nmod zdl_lease;\n')
    env = dict(os.environ, CARGO_TARGET_DIR=str(output / 'target'),
               DBUS_SESSION_BUS_ADDRESS='unix:path=' + str(output / 'absent-session-bus'))
    commands = []
    def run(name, argv):
        start = time.monotonic()
        result = subprocess.run(argv, cwd=copied, env=env, capture_output=True, text=True)
        (output / (name + '.log')).write_text(result.stdout + result.stderr)
        commands.append({'name': name, 'argv': argv, 'returncode': result.returncode, 'seconds': time.monotonic() - start})
        print(name + ': ' + ('PASS' if result.returncode == 0 else 'FAIL'), flush=True)
        if result.returncode:
            print(result.stdout + result.stderr)
            raise SystemExit(result.returncode)
        return result.stdout + result.stderr
    run('derive-local-lock', [args.cargo, 'update', '--offline', '-p', 'accesskit_unix'])
    run('native-tests', [args.cargo, 'test', '--offline', '--locked', '--lib', 'zdl_lease_', '--', '--nocapture'])
    run('shared-build', [args.cargo, 'build', '--offline', '--locked', '--release', '--lib'])
    binary = output / 'target/release/libaccesskit.so'
    symbols = subprocess.check_output(['nm', '-D', '--defined-only', str(binary)], text=True)
    for symbol in ('zdl_accesskit_unix_adapter_new_leased', 'zdl_accesskit_lease_abi_version'):
        if symbol not in symbols:
            raise RuntimeError('Missing extension symbol: ' + symbol)
    probes = []
    env['ZIG_GLOBAL_CACHE_DIR'] = str(ROOT / '.cache/zig-master-global')
    for mode, flag in (('debug', 'Debug'), ('safe', 'ReleaseSafe')):
        run('ingress-tests-' + mode, [args.zig, 'test', '-O' + flag, '--dep', 'zdl',
            '-Mroot=' + str(ROOT / 'tools/spikes/accesskit/ingress_tests.zig'),
            '-Mzdl=' + str(ROOT / 'src/root.zig'), '--test-filter', 'native ingress'])
        executable = output / ('probe-' + mode)
        run('zig-build-' + mode, [args.zig, 'build-exe', '-O' + flag, '-lc', '--dep', 'zdl',
            '-Mroot=' + str(ROOT / 'tools/spikes/accesskit/main.zig'), '-Mzdl=' + str(ROOT / 'src/root.zig'), '-femit-bin=' + str(executable)])
        result = json.loads(run('zig-native-' + mode, [str(executable), str(binary)]).strip())
        if result['mode'] != mode or result['native_adapter_cycles'] != 64 or not result['release_acknowledged'] or result.get('native_action_requests') != 10 or not result.get('owned_text') or not result.get('closed_actions_rejected') or result.get('native_tree_nodes') != 9 or not result.get('protected_text_hidden') or result.get('publisher_swaps') != 12 or not result.get('activation_close_race'):
            raise RuntimeError('Unexpected native probe result')
        dynamic = subprocess.check_output(['readelf', '-d', str(executable)], text=True)
        if 'libaccesskit' in dynamic:
            raise RuntimeError('Probe directly links AccessKit')
        probes.append(dict(result, executable_sha256=hashlib.sha256(executable.read_bytes()).hexdigest()))
    report = {'schema_version': 1, 'probes': probes, 'provider_pin': pin, 'machine': platform.uname()._asdict(),
              'cargo': subprocess.check_output([args.cargo, '--version'], text=True).strip(),
              'commands': commands, 'binary': str(binary), 'binary_sha256': hashlib.sha256(binary.read_bytes()).hexdigest(),
              'derived_lock_sha256': hashlib.sha256((copied / 'Cargo.lock').read_bytes()).hexdigest(),
              'source_hashes': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in (Path(__file__).resolve(), extension, ROOT / 'tools/spikes/accesskit/provider.json', ROOT / 'tools/spikes/accesskit/main.zig', ROOT / 'tools/spikes/accesskit/binding.zig', ROOT / 'tools/spikes/accesskit/pending.rs', ROOT / 'tools/spikes/accesskit/ingress.zig', ROOT / 'tools/spikes/accesskit/ingress_tests.zig', ROOT / 'tools/spikes/accesskit/router.zig')},
              'limitations': ['Disposable provider extension, not a public ZDL API or installed artifact.',
                              'Native adapter cycles use an explicitly absent private bus path, not the host session.',
                              'No active bus/AT-SPI client/screen-reader, text-selection mapping or native window certification; action inputs are synthetic Rust-thread fixtures.',
                              'Provider mappings remain resident for process lifetime because native background threads persist.',
                              'Rust provider OOM/abort is not a recoverable Zig allocation error.']}
    (output / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    print('AccessKit lifetime experiment passed:', output / 'report.json')


if __name__ == '__main__':
    main()
