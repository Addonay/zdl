# Optional provider fixtures

`alsa_symbols.zig` builds four ELF DSOs through the root build graph. One exports
all required ALSA names; three omit an early, middle or final required name.
They live only in the Zig cache and are never installed as system libraries.

Run the real private loader against them with explicit Zig master:

```sh
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build test-providers
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build test-providers --release=safe
```

The suite is also part of `zig build test`. It uses balanced Linux
`RTLD_NOLOAD` probes to check loader references after failed opens, while two
independent owners exist, and after final close. No audio server or hardware is
needed, and no system library search path is changed.

The exported addresses are deliberately placeholders and **must never be
called** as ALSA functions. These fixtures certify symbol-table publication and
loader cleanup only. They cannot establish the correctness of function
signatures, native layouts, device behavior or version-sensitive ABI guards.

The provider test step also runs a separate PipeWire libc-linked test root. Its
stubs have the declared native signatures and exercise real stream/connection
Zig setup and cleanup, including synchronous native destruction callbacks and
allocator failures. They contact no daemon and cannot prove real scheduling or
server/device compatibility. Their C callbacks remain inside the private
PipeWire binding.

An optional independent layout/constant audit against installed headers is:

```sh
python3 tools/audit_pipewire_abi.py
python3 tools/validate.py --pipewire-headers
```

This requires pkg-config and PipeWire/SPA development headers. Normal builds and
provider tests do not require them. The audit translation is temporary validation
input, never a product ABI bridge or public binding.
