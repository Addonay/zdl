#!/usr/bin/env python3
"""Prepare a workspace-local translator with SDL-required builtin support."""
import json
import os
from pathlib import Path
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[1]
zig = os.environ.get('ZDL_ZIG', 'zig')
installed = Path(subprocess.check_output([zig, 'env'], text=True).split('.lib_dir = "')[1].split('"')[0])
local = ROOT / '.cache/zig-lib'
local.mkdir(parents=True, exist_ok=True)
for entry in installed.iterdir():
    dest = local/entry.name
    if entry.name == 'compiler':
        shutil.copytree(entry, dest, dirs_exist_ok=True)
    elif not dest.exists():
        dest.symlink_to(entry, target_is_directory=entry.is_dir())

translator = local/'compiler/translate-c/Translator.zig'
s = translator.read_text()
s = s.replace('function.body != null and func_ty.kind != .variadic and t.func_bodies',
              'function.body != null and t.func_bodies')
s = s.replace('if (function.body != null and func_ty.kind == .variadic)', 'if (false)')
anchor = '    const builtin = builtins.map.get(builtin_name) orelse'
special = '''    if (std.mem.eql(u8, builtin_name, "__builtin_va_start")) {
        const args = try t.arena.alloc(ZigNode, 2);
        args[0] = try t.transExpr(scope, call.args[0], .used);
        args[1] = ZigTag.c_va_start.init();
        return ZigTag.call.create(t.arena, .{
            .lhs = try ZigTag.field_access.create(t.arena, .{
                .lhs = try ZigTag.identifier.create(t.arena, "__builtin"),
                .field_name = "va_start",
            }),
            .args = args,
        });
    }

    if (std.mem.eql(u8, builtin_name, "__builtin_va_arg")) {
        const args = try t.arena.alloc(ZigNode, 2);
        args[0] = try t.transExpr(scope, call.args[0], .used);
        args[1] = try t.transType(scope, call.qt, call.builtin_tok);
        return t.maybeSuppressResult(used, try ZigTag.call.create(t.arena, .{
            .lhs = try ZigTag.field_access.create(t.arena, .{
                .lhs = try ZigTag.identifier.create(t.arena, "__builtin"),
                .field_name = "va_arg",
            }),
            .args = args,
        }));
    }

'''
assert anchor in s
s = s.replace(anchor, special+anchor)
s = s.replace('const Translator = @This();', 'const Translator = @This();\ncontrol_flow: ?*ControlFlow = null,')
s = s.replace('t.transCompoundStmtInline(body_stmt, &block_scope) catch',
    '(if (ControlFlow.needed(t.tree, function.body.?)) ControlFlow.translate(t, &block_scope, body_stmt, func_ty.params) else t.transCompoundStmtInline(body_stmt, &block_scope)) catch')
s = s.replace('    const maybe_alias = scope.getAlias(name);',
    '    const maybe_alias = if (t.control_flow) |flow| flow.variables.get(decl_ref.decl) orelse scope.getAlias(name) else scope.getAlias(name);')
s += (ROOT/'tools/translator_control_flow.zig').read_text()
translator.write_text(s)

ast = local/'compiler/translate-c/ast.zig'
s = ast.read_text().replace('        return_void,', '        return_void,\n        c_va_start,')
s = s.replace('        .return_void,', '        .return_void,\n        .c_va_start,')
anchor = '        .void_type => return c.addNode('
assert anchor in s
s = s.replace(anchor, '        .c_va_start => return renderBuiltinCall(c, "@cVaStart", &.{}),\n'+anchor)
ast.write_text(s)

maps = {
    '__builtin_debugtrap':'debugtrap', '__builtin_va_copy':'va_copy',
    '__builtin_va_end':'va_end', '__builtin_memmove':'memmove',
    '__builtin_prefetch':'prefetch', '__sync_bool_compare_and_swap':'sync_cas',
    '__sync_fetch_and_add':'sync_fetch_add', '__sync_lock_test_and_set':'sync_exchange',
    '__sync_lock_release':'sync_release', '__atomic_exchange_n':'atomic_exchange',
    '__atomic_load_n':'atomic_load', '__atomic_thread_fence':'atomic_fence',
    '__builtin_ia32_pshuflw':'pshuflw', '__builtin_ia32_pshufd':'pshufd',
    '__builtin_ia32_shufps':'shufps', '__builtin_ia32_pshufhw':'pshufhw',
    '__builtin_ia32_pslldqi128_byteshift':'byte_shift_left',
    '__builtin_ia32_psrldqi128_byteshift':'byte_shift_right',
    '__builtin_ia32_vec_set_v8hi':'insert_i16',
}
mapping = local/'compiler/translate-c/builtins.zig'
s = mapping.read_text()
anchor = '    .{ "__builtin_abs",'
lines = ''.join(f'    .{{ "{c}", .{{ .name = "{z}" }} }},\n' for c,z in maps.items())
assert anchor in s
mapping.write_text(s.replace(anchor, lines+anchor))
toolchain = ROOT/'.cache/toolchain'
toolchain.mkdir(parents=True, exist_ok=True)
(toolchain/'build_options.zig').write_text('pub const enable_tracy = false;\npub const enable_tracy_allocation = false;\npub const enable_tracy_callstack = false;\npub const debug_allocations = false;\n')
(local/'compiler/zdl_translate.zig').write_text('pub const main = @import("translate-c/main.zig").main;\n')
subprocess.run([zig, 'build-exe', '-O', 'ReleaseFast', '--dep', 'aro', '--dep', 'build_options',
    '-Mroot='+str(local/'compiler/zdl_translate.zig'), '-O', 'ReleaseFast', '--dep', 'build_options',
    '-Maro='+str(local/'compiler/aro/aro.zig'), '-Mbuild_options='+str(toolchain/'build_options.zig'),
    '-femit-bin='+str(toolchain/'translate-c-opt')], check=True,
    env=dict(os.environ, ZIG_GLOBAL_CACHE_DIR=str(ROOT/'.cache/zig-global')))
(toolchain/'translate-c-opt').replace(toolchain/'translate-c')
print(toolchain/'translate-c')
