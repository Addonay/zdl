# Native Zig design

This project ports SDL behavior into a Zig library. C-shaped translated code is
an input to the conversion, not the target architecture.

## Source and build

`src/root.zig` is the public root. Files describe domain responsibilities, not
upstream translation units. Keep a small number of cohesive modules; introduce
folders and nested folders to group related responsibilities. Large cohesive
files are welcome; there is no arbitrary maximum line count. API names describe
operations and types without library prefixes. The `zdl` import supplies context.

The build registers the source module. It does not compile exported C objects,
link a legacy SDL archive, retain temporary ABI bridges, or force every namespace
into consumers. Unreferenced declarations remain lazy. Do not recreate SDL's
jump table, automatic subsystem initialization or global ID registries by default.

## Standard-library reuse

Use std directly wherever it already expresses the required behavior. A renamed
wrapper around a std function does not count as a port. Atomic values, ordinary
locks, allocators, hash maps, lists, sorting, searching, math, ASCII/Unicode,
formatting, hashing, RNGs, clocks, OS I/O and dynamic loading belong to std.

Keep a specialized implementation only when domain semantics justify it. For
example, a pixel rectangle and a floating-coordinate rectangle differ at their
edges; signed Gregorian arithmetic supports dates beyond std.time.epoch's
unsigned year/epoch range; owned heterogeneous properties add ownership that a
plain string hash map does not provide. Document those distinctions in `///`.

## Types, ownership and errors

Use ordinary structs and real pointer types, slices, enums, optionals and error
unions. Fixed-width integers express a domain or serialization width, not a C
spelling. Established C libraries may back a module when they do the job well
(see AGENTS.md); their `extern`/`callconv(.c)` declarations and C-layout records
stay private to one binding file, preferably loaded at runtime with
`std.DynLib`. Modules without such a backend stay pure Zig and libc-free.
There are no temporary C interfaces between native zdl modules.

Pass `std.mem.Allocator` to owned objects. Document what an object owns, what it
borrows, how long borrowed results survive, and when deinitialization is needed.
Fallible operations return errors; there is no thread-local last-error state.
An explicitly owned Diagnostic can accompany an error when human context helps.
Native strings use slices. Keep a sentinel only when an OS interface requires it.

Objects own their resources directly. Properties may borrow concrete resource
types; lifetime and synchronization belong to the resource's owner. Do not hide
resource ownership in void pointers, cleanup callbacks or process-global IDs.

## Documentation and naming

Use descriptive file names, snake_case functions, PascalCase types and named
enum variants. Put `//!` module descriptions at the top and `///` documentation
on public types, methods and meaningful fields. Explain algorithms, ownership,
boundary conventions, error behavior and necessary platform constraints.
Comments should explain why code exists, rather than paraphrase each statement.

## Conversion workflow

1. Read the related files in `.ref/translation_v1/src` and upstream `.ref/SDL`.
2. Identify std replacements before choosing native types and module boundaries.
3. Bring over one coherent piece, preserving required domain behavior and
   correcting confirmed translation defects against upstream source.
4. Compile the native module and consumers that instantiate its generic APIs.
5. Update `docs/porting.md` with what was implemented, replaced, changed or remains.
6. Repeat. Keep unported source in the uncompressed reference tree for browsing.

Do not equate a smaller source tree or a green build with SDL functionality
being complete. No runtime validation has been performed during this conversion.
Do not add or run new tests yet unless requested; existing tests compile in the
normal build and their execution remains an explicit separate step.
