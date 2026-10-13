# Idiomatic Zig conventions for the SDL3 port

`src/` is a port of SDL3 from C. It started as `zig translate-c` output and is
being converted to native Zig. This file is the target the conversion is
judged against.

## The target

A `std`-only Zig library with a tree-shakable API. Not a C library that
happens to be written in Zig.

- No `std.zig.c_translation` — neither `.builtins` nor `.helpers`.
- No `extern fn` declarations. Cross-file calls are ordinary `@import`s.
- No `export fn` and no `_REAL` suffix. There is no C ABI.
- No `src/dynapi/`. The jump table forced every symbol to be exported, which
  is precisely what prevents dead-code elimination.
- No `include/SDL3/`. That was the translate-c rendering of the C headers;
  the public API is `src/zdl.zig`.
- `extern struct` only where a C struct is genuinely being mirrored for an
  OS API. Not as a default.
- `c_int`, `c_uint`, `[*c]T`, `?*anyopaque` → `i32`, `u32`, `*T`,
  `[]const u8`, and real types.
- `SDL_malloc`/`SDL_free` → an allocator threaded through the call.

`libc`, `libm`, `dl` and `pthread` stay linked. SDL is POSIX underneath and
replacing libc is a different project. What goes is the *translation* layer,
not the C library.

## Shape of the public API

`src/zdl.zig` is the root. It re-exports modules as namespaces:

```zig
pub const atomic = @import("atomic/SDL_atomic.zig");
pub const spinlock = @import("atomic/SDL_spinlock.zig");
```

Callers import what they use and the linker drops the rest. A module that
nothing references must not appear in the final binary.

## Shape of a converted file

Exported Zig API, `std` types, error unions where failure is possible:

```zig
pub const SpinLock = struct {
    locked: std.atomic.Value(bool) = .init(false),

    pub fn tryAcquire(self: *SpinLock) bool { ... }
    pub fn acquire(self: *SpinLock) void { ... }
    pub fn release(self: *SpinLock) void { ... }
};
```

Name types for what they are, not for the C struct they came from.
`SDL_SpinLock` was `c_int`; `SpinLock` is a struct with methods.

## Rules

**Types.** `i32`, `u32`, `usize`, `?*T`, `[]const u8`. Translate C widths at
the point where an OS ABI actually requires them, not throughout.

**Strings.** `[:0]const u8` for NUL-terminated, `[]const u8` for slices.

**Errors.** `error{...}!T` internally.

**Control flow.** `if (ptr == null)`, not `if (!(ptr != null))`.
`while (cond)`, not `while (!(cond))`.

**Dead scaffolding.** Delete `var x = ...; _ = &x;` when `x` is never
mutated or addressed. Delete `pub const SDL_Foo = SDL_Foo_REAL;` aliases that
nothing reads. `@setEvalBranchQuota` is translate-c scaffolding that assumed
comptime evaluation; it is always noise here.

**Naming.** `snake_case` functions and locals, `PascalCase` types,
`SCREAMING_SNAKE_CASE` constants. File names keep the `SDL_*.zig` mapping to
upstream so the port stays traceable; the API inside does not.

**Doc comments.** `//!` for a file, `///` for anything non-obvious. A comment
that explains a workaround says what breaks if it is removed.

## Adding tests

Every converted subsystem gets unit tests, reachable from `src/zdl.zig`, run
by `zig build test`. Prefer deterministic assertions — a spinlock test that
sleeps and hopes is a flaky test.

## Verifying

```sh
zig build           # must stay green
zig build test      # unit tests
zig build -Dshared=true
```

## Migration state

`build.zig` lists converted subsystems in its `converted` array; everything
else is still coming off the C translation via `sources.zig`. Move a file
between the two lists as it is converted, never both, never neither.