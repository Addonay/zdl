#!/usr/bin/env python3
"""Mechanical SDL translation; preserve generated APIs and report failures."""
import concurrent.futures
import json
import os
from pathlib import Path
import re
import shlex
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
SDL = ROOT / '.ref/SDL'
CONFIG = ROOT / ('.cache/sdl-linux-full' if '--linux' in sys.argv else '.cache/sdl-config')
REPORT = ROOT / 'translation-report'
REPORT.mkdir(exist_ok=True)
env = dict(os.environ, ZIG_GLOBAL_CACHE_DIR=str(ROOT / '.cache/zig-global'),
           ZIG_LOCAL_CACHE_DIR=str(ROOT / '.cache/zig-local'))
entries = json.loads((CONFIG / 'compile_commands.json').read_text())

def flags(entry):
    args = shlex.split(entry['command'])[1:]
    result = []
    i = 0
    while i < len(args):
        arg = args[i]
        if arg in ('-I', '-D', '-isystem', '-idirafter'):
            result.extend(['-I' if arg == '-idirafter' else arg, args[i+1]]); i += 2; continue
        if arg.startswith('-idirafter'):
            result.append('-I' + arg[len('-idirafter'):])
        elif arg.startswith(('-I', '-D', '-m')):
            result.append(arg)
        i += 1
    return result

by_file = {str(Path(e['file']).resolve()): e for e in entries}
default = flags(by_file[str(SDL / 'src/SDL_list.c')])

def relative_source(path):
    if path.is_relative_to(SDL): return path.relative_to(SDL)
    return Path('src/video/wayland/generated')/path.name

def translate(path):
    relative = relative_source(path)
    # Distinguish foo.c from foo.h, both of which occur in SDL.
    dest = ROOT / relative.parent / (relative.name + '.zig')
    log = REPORT / relative.parent / (relative.name + '.log')
    log.parent.mkdir(parents=True, exist_ok=True)
    dest.parent.mkdir(parents=True, exist_ok=True)
    active = str(path) in by_file
    opts = flags(by_file[str(path)]) if active else default
    # SDL's internal headers are included after SDL_internal.h in C units.
    preinclude = None
    if path.suffix == '.h' and relative.parts[0] == 'src':
        preinclude = SDL / 'src/SDL_internal.h'
    if relative.as_posix() == 'include/SDL3/SDL_opengl_glext.h':
        preinclude = SDL / 'include/SDL3/SDL_opengl.h'
    if relative.as_posix() == 'include/SDL3/SDL_close_code.h':
        preinclude = SDL / 'include/SDL3/SDL_begin_code.h'
    if relative.as_posix() == 'include/SDL3/SDL_main_impl.h':
        preinclude = SDL / 'include/SDL3/SDL_main.h'
    if path.name in ('SDL_opengles2_gl2.h', 'SDL_opengles2_gl2ext.h'):
        preinclude = SDL/'include/SDL3/SDL_opengles2.h'
    if path.name == 'SDL_test_log.h':
        preinclude = SDL/'include/SDL3/SDL_log.h'
    translation_input = path
    if '--linux' in sys.argv and path.name in ('SDL_hashtable.c', 'SDL_blit_slow.c', 'SDL_cpuinfo.c', 'SDL_alsa_audio.c'):
        translation_input = ROOT/'.cache/c-compat'/relative
        translation_input.parent.mkdir(parents=True, exist_ok=True)
        source = path.read_text()
        if path.name == 'SDL_hashtable.c':
            source = source.replace('Uint32 probe_len : 31;', 'Uint32 probe_len;').replace('Uint32 live : 1;', 'Uint32 live;')
        elif path.name == 'SDL_blit_slow.c':
            source = re.sub(r'    struct\s*\{\s*Uint(?:16|32) Mantissa[^}]+\} x;', '', source)
        elif path.name == 'SDL_cpuinfo.c':
            source = re.sub(r'(static int CPU_haveCPUID\(void\))\s*\{.*?^\}', r'\1\n{ return 1; }', source, flags=re.M|re.S)
            source = source.replace('static int CPU_CPUIDFeatures[4];',
                'extern void ZDL_CPUID(int, int *, int *, int *, int *);\nextern int ZDL_XGetBV(unsigned int);\n#undef cpuid\n#define cpuid(func,a,b,c,d) ZDL_CPUID((func), &(a), &(b), &(c), &(d))\nstatic int CPU_CPUIDFeatures[4];')
            source = re.sub(r'__asm__\("\.byte 0x0f, 0x01, 0xd0"\s*: "=a"\(a\)\s*: "c"\(0\)\s*: "%edx"\);', 'a = ZDL_XGetBV(0);', source)
        elif path.name == 'SDL_alsa_audio.c':
            source = source.replace('snd_pcm_hw_params_alloca(&(cfg_ctx.hwparams));\n    snd_pcm_sw_params_alloca(&(cfg_ctx.swparams));',
                'cfg_ctx.hwparams = (snd_pcm_hw_params_t *)SDL_malloc(ALSA_snd_pcm_hw_params_sizeof());\n    cfg_ctx.swparams = (snd_pcm_sw_params_t *)SDL_malloc(ALSA_snd_pcm_sw_params_sizeof());\n    if (!cfg_ctx.hwparams || !cfg_ctx.swparams) { SDL_OutOfMemory(); goto err_close_pcm; }')
            begin = source.index('static bool ALSA_OpenDevice(')
            end = source.index('static void ALSA_ThreadInit(', begin)
            function = source[begin:end]
            function = re.sub(r'\breturn (true|false);', r'SDL_free(cfg_ctx.hwparams); SDL_free(cfg_ctx.swparams); return \1;', function)
            source = source[:begin]+function+source[end:]
        translation_input.write_text(f'#line 1 "{path}"\n'+source)
        opts = [*opts, '-I'+str(path.parent)]
    if preinclude:
        translation_input = ROOT / '.cache/translation-input' / relative.parent / (relative.name + '.c')
        translation_input.parent.mkdir(parents=True, exist_ok=True)
        translation_input.write_text(f'#include "{preinclude}"\n#include "{path}"\n')
    if '--linux' in sys.argv and path.name in ('SDL_spinlock.c', 'SDL_timer.c'):
        translation_input = ROOT/'.cache/translation-input'/relative
        translation_input.parent.mkdir(parents=True,exist_ok=True)
        translation_input.write_text(f'#include "{SDL / "src/SDL_internal.h"}"\nextern void ZDL_Pause(void);\n#undef SDL_CPUPauseInstruction\n#define SDL_CPUPauseInstruction() ZDL_Pause()\n#include "{path}"\n')
    custom = '--linux' in sys.argv
    if custom:
        command = [str(ROOT/'.cache/toolchain/translate-c'), '--zig-lib='+str(ROOT/'.cache/zig-lib'), '-lc', '--',
                   '-resource-dir', str(ROOT/'.cache/zig-lib/compiler/aro'), '-DSDL_DISABLE_ALLOCA', '-I'+str(ROOT/'.cache/c-compat'), *opts, str(translation_input)]
    else:
        command = ['zig', 'translate-c', '-lc', *opts, str(translation_input)]
    with dest.open('w') as out, log.open('w') as err:
        try:
            proc = subprocess.run(command, stdout=out, stderr=err, env=env,
                                  cwd=ROOT, timeout=90)
            code = proc.returncode
        except subprocess.TimeoutExpired:
            err.write('\nTranslation timed out after 90 seconds.\n')
            code = 124
    if code:
        dest.unlink()
    demoted = []
    if not code:
        generated = dest.read_text()
        if custom:
            generated = generated.replace('@import("std").zig.c_translation.builtins', '@import("translation_builtins")')
        # Prepend after the child exits: Zig's stdout uses positional writes.
        source = path.read_text(errors='replace')
        notice = '// Mechanically generated by zig translate-c.\n'
        if source.startswith('/*'):
            end = source.find('*/')
            if end >= 0:
                notice = ''.join('// ' + line + '\n' for line in source[:end+2].splitlines()) + notice
        dest.write_text(notice + generated)
        for match in re.finditer(r'// ([^\n]*): warning: ([^\n]*demoted to extern)\n(?:pub )?extern fn ([^ (]+)', generated):
            if str(SDL / 'src') in match.group(1):
                demoted.append({'location': match.group(1), 'reason': match.group(2), 'symbol': match.group(3)})
    return {'source': str(relative), 'input_file': str(path), 'output': str(dest.relative_to(ROOT)) if not code else None,
            'active': active, 'exit_code': code,
            'diagnostics': str(log.relative_to(ROOT)), 'command': command,
            'demoted_sdl_functions': demoted}

files = sorted(p for base in ('src', 'include') for p in (SDL/base).rglob('*') if p.is_file())
if '--linux' in sys.argv:
    files += sorted(CONFIG.glob('wayland-generated-protocols/*.[ch]'))
inputs = [p for p in files if p.suffix in ('.c', '.h')]
results = []
previous = None
if '--retry-failed' in sys.argv or '--linux' in sys.argv:
    previous = json.loads((REPORT/'manifest.json').read_text())
    chosen = {str(relative_source(Path(p))) for p in by_file} | {r['source'] for r in previous['translations'] if r['source'].startswith('include/SDL3/')} if '--linux' in sys.argv else {r['source'] for r in previous['translations'] if r['exit_code']}
    inputs = [p for p in inputs if str(relative_source(p)) in chosen]
    if '--demoted-only' in sys.argv:
        demoted = {r['source'] for r in previous['translations'] if r['active'] and (r['exit_code'] or r['demoted_sdl_functions'])}
        inputs = [p for p in inputs if str(relative_source(p)) in demoted]
    selected = [arg.removeprefix('--source=') for arg in sys.argv if arg.startswith('--source=')]
    if selected:
        inputs = [p for p in inputs if str(relative_source(p)) in selected]
with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:
    for result in pool.map(translate, inputs):
        results.append(result)
        if len(results) % 100 == 0:
            print(f'Translated/attempted {len(results)}/{len(inputs)}', flush=True)

if previous:
    updated = {r['source']: r for r in results}
    old_names = {r['source'] for r in previous['translations']}
    results = [updated.get(r['source'], r) for r in previous['translations']] + [r for r in results if r['source'] not in old_names]

manifest = {'upstream_commit': subprocess.check_output(['git', '-C', str(SDL), 'rev-parse', 'HEAD'], text=True).strip(),
            'zig_version': subprocess.check_output(['zig', 'version'], text=True).strip(),
            'configuration': str(CONFIG.relative_to(ROOT)/'CMakeCache.txt'),
            'translations': results,
            'non_c_files': [str(p.relative_to(SDL)) for p in files if p.is_relative_to(SDL) and p.suffix not in ('.c', '.h')]}
(REPORT/'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
active_sources = [r for r in results if r['active'] and r['source'].endswith('.c')]
(ROOT/'sources.zig').write_text('pub const files = [_][]const u8{\n' + ''.join(
    '    ' + json.dumps(str(Path(r['source']).parent / (Path(r['source']).name + '.zig'))) + ',\n'
    for r in active_sources) + '};\n')
print(f"Translation: {sum(r['exit_code'] == 0 for r in results)}/{len(results)} succeeded; "
      f"{len(active_sources)} active C sources; {len(manifest['non_c_files'])} non-C files.", flush=True)
