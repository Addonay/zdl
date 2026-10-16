#!/usr/bin/env python3
"""Native editor input QA on a private authenticated Xvfb display only.

Never attaches to the host display. Exit 2 records an unavailable private display;
that is not a passing native input result. Build check-editor-spike first.
"""
import argparse
import json
import os
from pathlib import Path
import secrets
import subprocess
import tempfile
import time

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', type=Path, default=ROOT / 'zig-out/bin/spikes/debug/zdl-editor-spike')
    parser.add_argument('--output', type=Path, default=ROOT / '.cache/spikes/editor/native-qa')
    args = parser.parse_args(); out = args.output.resolve(); out.mkdir(parents=True, exist_ok=True)
    report = {'status': 'environment-unavailable'}; app = server = None
    logs = []
    try:
        display_number = next(n for n in range(180, 250) if not Path(f'/tmp/.X11-unix/X{n}').exists() and not Path(f'/tmp/.X{n}-lock').exists())
        display = ':' + str(display_number)
        with tempfile.TemporaryDirectory(prefix='zdl-editor-native-') as directory:
            authority = Path(directory) / 'authority'; authority.touch()
            subprocess.run(['xauth', '-f', str(authority), 'add', display, '.', secrets.token_hex(16)], check=True, capture_output=True)
            env = dict(os.environ, DISPLAY=display, XAUTHORITY=str(authority), XMODIFIERS='@im=none', LC_ALL='C.UTF-8', G_DEBUG='fatal-warnings')
            server_log = open(out / 'xserver.log', 'w'); logs.append(server_log)
            server = subprocess.Popen(['Xvfb', display, '-screen', '0', '1024x768x24', '-nolisten', 'tcp', '-auth', str(authority)], stdout=server_log, stderr=subprocess.STDOUT)
            ready = False
            for _ in range(50):
                if server.poll() is not None: break
                if subprocess.run(['xdpyinfo'], env=env, capture_output=True).returncode == 0: ready = True; break
                time.sleep(.1)
            if not ready: raise RuntimeError('Private Xvfb unavailable; inspect xserver.log (native input not run)')
            report['status'] = 'failed'
            app_log = open(out / 'editor.log', 'w'); logs.append(app_log)
            state = out / 'state.json'; image = out / 'editor.png'
            app = subprocess.Popen([str(args.binary.resolve()), '--x11', '--state', str(state), '--snapshot', str(image)], env=env, stdout=app_log, stderr=subprocess.STDOUT)

            def x(*arguments):
                return subprocess.check_output(['xdotool', *arguments], env=env, text=True, timeout=10).strip()

            def wait_state(predicate):
                for _ in range(100):
                    if app.poll() is not None: raise RuntimeError('Editor exited; inspect editor.log')
                    try:
                        value = json.loads(state.read_text())
                        if predicate(value): return value
                    except (FileNotFoundError, json.JSONDecodeError): pass
                    time.sleep(.05)
                raise RuntimeError('Editor state did not reach expected value')

            initial = wait_state(lambda s: s['text'].startswith('Edit'))
            window = x('search', '--name', '^ZDL paragraph editor$').splitlines()[0]
            x('windowfocus', '--sync', window)
            x('key', '--clearmodifiers', 'ctrl+a'); x('type', '--clearmodifiers', '--delay', '25', 'Native edit')
            typed = wait_state(lambda s: s['text'] == 'Native edit')
            x('key', 'Left', 'BackSpace'); deleted = wait_state(lambda s: s['text'] == 'Native edt')
            x('key', '--clearmodifiers', 'ctrl+z'); undone = wait_state(lambda s: s['text'] == 'Native edit')
            x('key', '--clearmodifiers', 'ctrl+y'); redone = wait_state(lambda s: s['text'] == 'Native edt')
            x('key', '--clearmodifiers', 'ctrl+a'); selected = wait_state(lambda s: s['anchor'] == 0 and s['active'] == len(s['text']))
            x('mousemove', '--window', window, '40', '95'); x('mousedown', '1'); x('mousemove', '--window', window, '100', '95'); x('mouseup', '1')
            dragged = wait_state(lambda s: s['revision'] > selected['revision'] and s['anchor'] != s['active'])
            x('key', 'Escape'); app.wait(timeout=10)
            if app.returncode: raise RuntimeError('Native editor failed on close')
            report.update(status='passed', initial=initial, typed=typed, deleted=deleted, undone=undone, redone=redone, selected=selected, dragged=dragged)
    except Exception as error: report['reason'] = str(error)
    finally:
        for process in (app, server):
            if process is not None and process.poll() is None:
                process.terminate()
                try: process.wait(timeout=10)
                except subprocess.TimeoutExpired: process.kill(); process.wait(timeout=10)
        for log in logs: log.close()
        (out / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    print(report['status'], report.get('reason', ''))
    raise SystemExit(0 if report['status'] == 'passed' else 2 if report['status'] == 'environment-unavailable' else 1)


if __name__ == '__main__': main()
