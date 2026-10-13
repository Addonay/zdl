#!/usr/bin/env python3
"""Restore the SPA inline bodies that use a C compiler-barrier macro."""
from pathlib import Path
import re

ROOT=Path(__file__).resolve().parents[1]
for relative in ('src/audio/pipewire/SDL_pipewire.zig','src/camera/pipewire/SDL_camera_pipewire.zig'):
    path=ROOT/relative
    source=path.read_text()
    if 'fn strncpy(' not in source:
        source='extern fn strncpy(destination: [*c]u8, text: [*c]const u8, length: usize) [*c]u8;\n'+source
    if not re.search(r'const EPIPE\s*=',source):
        source='const EPIPE: c_int = 32;\n'+source
    bodies={}
    for name,kind in (('long','i64'),('float','f32'),('double','f64'),('fd','i64')):
        bodies['spa_pod_body_get_'+name]=f'''
    if (spa_pod_is_{name}(arg_pod) == 0) return -EINVAL;
    asm volatile ("" ::: .{{ .memory = true }});
    _ = memcpy(@ptrCast(arg_value), arg_body, @sizeOf({kind}));
    asm volatile ("" ::: .{{ .memory = true }});
    return 0;
'''
    bodies['spa_pod_body_copy_string']='''
    var string: [*c]const u8 = undefined;
    if (spa_pod_body_get_string(arg_pod, arg_body, &string) < 0 or arg_maxlen < 1) return -EINVAL;
    if (arg_pod.*.size > arg_maxlen) { arg_dest[0] = 0; return -ENOSPC; }
    asm volatile ("" ::: .{ .memory = true });
    _ = strncpy(arg_dest, string, arg_maxlen - 1);
    asm volatile ("" ::: .{ .memory = true });
    arg_dest[arg_maxlen - 1] = 0;
    return 0;
'''
    bodies['spa_pod_parser_read_header']='''
    const long_offset: u64 = @as(u64, arg_offset) + arg_header_size;
    if (long_offset <= arg_size and (arg_offset & 7) == 0) {
        asm volatile ("" ::: .{ .memory = true });
        _ = memcpy(arg_header, @ptrFromInt(@intFromPtr(arg_parser.*.data) + arg_offset), arg_header_size);
        asm volatile ("" ::: .{ .memory = true });
        const pod: *align(1) const struct_spa_pod = @ptrFromInt(@intFromPtr(arg_header) + arg_pod_offset);
        const rounded_size = (@as(u64, pod.*.size) + 7) & ~@as(u64, 7);
        if (long_offset + rounded_size <= arg_size) {
            arg_body.* = @ptrFromInt(@intFromPtr(arg_parser.*.data) + long_offset);
            return 0;
        }
    }
    return -EPIPE;
'''
    for name,body in bodies.items():
        source=re.sub(r'pub extern fn '+name+r'\([^\n]*\) callconv\(\.c\) c_int;',lambda m:m[0].replace('pub extern fn','pub fn').removesuffix(';')+' {'+body+'}\n',source)
    path.write_text(source)
