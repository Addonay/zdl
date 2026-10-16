#!/usr/bin/env python3
"""Compile-only public retained-state API fixtures, including expected failures.

Never executes generated programs or the backend compile consumer.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
PREFIX = '''const std = @import("std");
const ui = @import("zdl").ui;
const Model = ui.with_states(.{ .counter = ui.state.Value(u64), .flag = ui.state.Value(bool) });
pub fn main() !void {
    var scene = try Model.Scene.init(std.heap.page_allocator, .{});
    defer scene.deinit();
    var update = try scene.begin_update();
    defer update.abort();
    const draft = try update.node(.{ .integer = 1 }, .control, .{});
'''
SUFFIX = '''    var snapshot = try update.commit();
    defer snapshot.deinit();
    _ = try snapshot.state("counter", try snapshot.id_for(draft));
}
'''


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--zig', default='/home/addo/.zvm/master/zig')
    parser.add_argument('--output', type=Path, default=ROOT / '.cache/state-types/report.json')
    args = parser.parse_args()
    output = args.output.resolve()
    output.parent.mkdir(parents=True, exist_ok=True)
    cases = [
        ('valid', PREFIX + '    try update.set_state("counter", draft, &@as(u64, 42));\n    try update.set_state("flag", draft, &true);\n' + SUFFIX, None),
        ('wrong-value', PREFIX + '    var wrong: i64 = -1;\n    std.mem.doNotOptimizeAway(&wrong);\n    try update.set_state("counter", draft, &wrong);\n' + SUFFIX, '*const u64'),
        ('unknown-channel', PREFIX + '    try update.set_state("unknown", draft, &@as(u64, 42));\n' + SUFFIX, 'unknown'),
        ('borrowed-pointer', '''const ui = @import("zdl").ui;
comptime { _ = ui.state.Value(struct { borrowed: []u8 }); }
pub fn main() void {}
''', 'requires pointer-free value data'),
        ('invalid-schema', '''const ui = @import("zdl").ui;
comptime { _ = ui.with_states(.{ .bad = @as(u32, 3) }); }
pub fn main() void {}
''', 'each state channel must name an ownership-policy type'),
    ]
    results = []
    environment = dict(os.environ, ZIG_GLOBAL_CACHE_DIR=str(ROOT / '.cache/zig-master-global'))
    with tempfile.TemporaryDirectory(prefix='zdl-state-types-') as directory:
        for name, source, expected in cases:
            path = Path(directory) / (name + '.zig')
            path.write_text(source)
            command = [args.zig, 'build-exe', '-fno-emit-bin', '--dep', 'zdl', '-Mroot=' + str(path), '-Mzdl=src/root.zig']
            result = subprocess.run(command, cwd=ROOT, env=environment, capture_output=True, text=True, timeout=120)
            log = result.stdout + result.stderr
            (output.parent / (name + '.log')).write_text(log)
            passed = result.returncode == 0 if expected is None else result.returncode != 0 and expected in log
            results.append({'name': name, 'passed': passed, 'returncode': result.returncode,
                            'expected_diagnostic': expected, 'source': source,
                            'source_sha256': hashlib.sha256(source.encode()).hexdigest(), 'command': command})
            print(name + ': ' + ('PASS' if passed else 'FAIL'), flush=True)
    sources = [ROOT / 'src/root.zig', *list((ROOT / 'src/ui').glob('*.zig')), Path(__file__).resolve()]
    report = {'compiler': subprocess.check_output([args.zig, 'version'], text=True).strip(), 'cases': results,
              'source_hashes': {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in sources}}
    output.write_text(json.dumps(report, indent=2) + '\n')
    if not all(r['passed'] for r in results):
        raise SystemExit('A retained-state type boundary fixture failed; inspect logs beside ' + str(output))
    print('All retained-state compile boundaries passed:', output)


if __name__ == '__main__':
    main()
