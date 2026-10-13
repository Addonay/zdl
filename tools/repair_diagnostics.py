#!/usr/bin/env python3
"""Repair C conversions identified by Zig's exact expression diagnostics."""
import collections
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
log = Path(sys.argv[1]).read_text()
lines = log.splitlines()
edits = collections.defaultdict(list)
for i,line in enumerate(lines):
    match = re.match(r'([^\n]+\.zig):(\d+):(\d+): error: (.+)',line)
    if not match or i+2>=len(lines): continue
    file,row,column,message = match.groups()
    if file.startswith('/home/addo/.zvm/') or file=='src/translation_builtins.zig': continue
    pointer = re.search(r'(~*)\^(~*)',lines[i+2])
    if not pointer: continue
    span = len(pointer[1])+len(pointer[2])+1
    path = ROOT/file
    if not path.is_file(): continue
    source_lines = path.read_text().splitlines(keepends=True)
    row,column=int(row)-1,int(column)-1-len(pointer[1])
    if row>=len(source_lines): continue
    expression = source_lines[row][column:column+span]
    # Only act on an intact compiler-highlighted expression.
    if not expression.strip() or expression.count('(')!=expression.count(')'): continue
    replacement = None
    expected = re.match(r"expected type '([^']+)', found '([^']+)'",message)
    if expected:
        to,from_ = expected.groups()
        if to == '[*c]T':
            for extra in lines[i+1:i+5]:
                concrete = re.search(r'note: T = [^. ]+\.([^ ]+)',extra)
                if concrete: to='[*c]'+concrete[1]; break
        to = re.sub(r'([.\w]+)\.([A-Za-z_]\w*)',r'\2',to)
        if re.fullmatch(r'(?:[iu]\d+|c_(?:u?int|u?short|u?long|u?longlong)|usize|isize)',to):
            replacement = f'__helpers.cast({to}, {expression})'
        elif to.startswith('[*c]') and from_!='bool':
            # Generic T placeholders cannot be referred to at this call site.
            if to!='[*c]T':
                replacement = f'__helpers.cast({to}, {expression})'
    elif '@ptrCast discards const qualifier' in message and expression.startswith('@ptrCast('):
        replacement = '@ptrCast(@constCast('+expression[len('@ptrCast('):-1]+'))'
    elif '@ptrCast discards const qualifier' in message and expression.startswith('@alignCast('):
        replacement = '@alignCast(@constCast('+expression[len('@alignCast('):-1]+'))'
    elif "cannot pass '[:0]u8' to variadic function" in message:
        replacement = f'({expression}).ptr'
    elif 'integer and float literals passed to variadic function' in message:
        replacement = f'@as({"usize" if expression.startswith("@sizeOf(") else "c_int"}, {expression})'
    elif 'type \'usize\' cannot represent integer value' in message:
        replacement = f'__helpers.cast(usize, @as(isize, {expression}))'
    elif "expected integer or vector, found 'bool'" in message:
        replacement = f'@intFromBool({expression})'
    elif "bit shifting operation expected integer type, found 'bool'" in message:
        replacement = f'@as(c_int, @intFromBool({expression}))'
    elif '@bitCast size mismatch' in message:
        to = re.search(r"destination type '([^']+)'",message)
        if to and expression.startswith('@bitCast('):
            replacement = f'__helpers.cast({to[1]}, {expression[len("@bitCast("):-1]})'
    elif 'expected pointer type, found \'[' in message:
        replacement = '&'+expression
    elif 'operator <= not allowed for type' in message:
        depth=0
        for k,char in enumerate(expression):
            if char=='(':depth+=1
            elif char==')':depth-=1
            elif depth==0 and expression[k:k+2]=='<=':
                replacement=f'(@intFromPtr({expression[:k].strip()}) <= @intFromPtr({expression[k+2:].strip()}))'
                break
    elif message.startswith('incompatible types:') and "'usize'" in message:
        depth=0
        for k,char in enumerate(expression):
            if char=='(':depth+=1
            elif char==')':depth-=1
            elif depth==0 and char=='+':
                replacement=f'(__builtin.as_c_pointer({expression[:k].strip()}) + {expression[k+1:].strip()})'
                break
    if replacement:
        edits[file].append((row,column,column+span,replacement))

count=0
for file,changes in edits.items():
    path=ROOT/file
    source=path.read_text().splitlines(keepends=True)
    used=set()
    for row,start,end,replacement in sorted(changes,reverse=True):
        if (row,start,end) in used:continue
        if any(r==row and not (end<=a or start>=b) for r,a,b in used):continue
        used.add((row,start,end))
        source[row]=source[row][:start]+replacement+source[row][end:]
        count+=1
    text=''.join(source)
    if '__helpers.cast(' in text and not re.search(r'(?:pub )?const __helpers\s*=',text):
        text='const __helpers = @import("std").zig.c_translation.helpers;\n'+text
    if '__builtin.as_c_pointer(' in text and not re.search(r'(?:pub )?const __builtin\s*=',text):
        text='const __builtin = @import("translation_builtins");\n'+text
    path.write_text(text)
print(f'Applied {count} C conversion corrections across {len(edits)} files.')
