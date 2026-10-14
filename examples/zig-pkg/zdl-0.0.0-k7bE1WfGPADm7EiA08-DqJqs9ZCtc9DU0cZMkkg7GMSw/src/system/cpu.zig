//! CPU topology, SIMD capabilities, cache line size, RAM and page size, as
//! SDL_cpuinfo.c. Altered native port: there is no global feature cache, no
//! lazily initialized state and no SDL_HINT_CPU_FEATURE_MASK global. Callers
//! query on demand and apply a mask string explicitly with `apply_feature_mask`.
//!
//! Feature detection uses std's own native-CPU detection
//! (`std.zig.system.linux.detectNativeCpuAndFeatures`), which performs the
//! x86 `cpuid` instruction and ARM/RISC-V/LoongArch feature probes itself, so
//! this module contains no inline assembly. When detection is unavailable the
//! compile-time target CPU model (`builtin.target.cpu`) is used instead.
//!
//! Numeric conventions: logical CPU counts and cache lines are `usize`; system
//! RAM is reported in bytes as `u64` (SDL reports whole mebibytes as `int`).
//! Alignment values are byte counts. Unknown values are `null`, not sentinels.
const std = @import("std");
const builtin = @import("builtin");
const linux = std.os.linux;

/// SIMD instruction-set extensions, using SDL's naming. Each variant maps to a
/// single architecture's feature; families that do not apply are never set.
pub const Feature = enum {
    /// PowerPC AltiVec / VMX (16-byte vectors).
    altivec,
    /// x86 MMX (8-byte vectors).
    mmx,
    /// x86 SSE (16-byte vectors).
    sse,
    /// x86 SSE2.
    sse2,
    /// x86 SSE3.
    sse3,
    /// x86 SSE4.1.
    sse41,
    /// x86 SSE4.2.
    sse42,
    /// x86 AVX (32-byte vectors).
    avx,
    /// x86 AVX2.
    avx2,
    /// x86 AVX-512 Foundation (64-byte vectors).
    avx512f,
    /// ARMv6 SIMD extensions (16-byte alignment).
    arm_simd,
    /// ARM NEON / AArch64 Advanced SIMD.
    neon,
    /// LoongArch LSX (128-bit vectors).
    lsx,
    /// LoongArch LASX (256-bit vectors).
    lasx,
    /// AArch64 SVE2.
    sve2,
};

/// A set of detected or masked SIMD features.
pub const Features = std.EnumSet(Feature);

/// Snapshot of host CPU properties. Every field is independent: a failed query
/// of one (for example the RAM size) does not affect the others.
pub const Info = struct {
    /// Logical processors visible to the process (at least 1).
    logical_cpus: usize,
    /// Cache line size in bytes from sysfs, or `default_cache_line_size` when the
    /// kernel does not expose it.
    cache_line_size: usize,
    /// Detected SIMD features after applying no mask.
    features: Features,
    /// Minimum alignment that makes every enabled SIMD width safe, in bytes.
    simd_alignment: usize,
    /// Total usable physical memory in bytes, or null when sysinfo fails.
    system_ram: ?u64,
    /// Virtual memory page size in bytes.
    page_size: usize,
};

/// SDL_CACHELINE_SIZE: used when no cache topology is reported.
pub const default_cache_line_size: usize = 128;

/// Gathers every property. The `io` value is used only for sysfs reads and CPU
/// feature detection; it is not retained.
pub fn query(io: std.Io) Info {
    const features = detect_features(io);
    return .{
        .logical_cpus = logical_cpu_count() catch 1,
        .cache_line_size = cache_line_size(io),
        .features = features,
        .simd_alignment = simd_alignment(features),
        .system_ram = system_ram() catch null,
        .page_size = page_size(),
    };
}

/// Number of logical processors available to this process, at least 1.
pub fn logical_cpu_count() std.Thread.CpuCountError!usize {
    return std.Thread.getCpuCount();
}

/// Runtime page size. The minimum page size known at compile time is
/// `std.heap.page_size_min`; the actual size may be larger.
pub fn page_size() usize {
    return std.heap.pageSize();
}

/// Total physical RAM in bytes from the sysinfo(2) syscall. Linux reports
/// `totalram` in units of `mem_unit` bytes, so the product is the byte count.
/// Failures are `error.SysinfoFailed` with the syscall errno discarded.
pub fn system_ram() error{SysinfoFailed}!u64 {
    var info: linux.Sysinfo = undefined;
    if (linux.errno(linux.sysinfo(&info)) != .SUCCESS) return error.SysinfoFailed;
    return @as(u64, info.totalram) * @as(u64, info.mem_unit);
}

/// Cache line size in bytes, read from the first-level data cache entry in
/// sysfs. Returns `default_cache_line_size` when the file is missing or invalid.
/// Sysfs `coherency_line_size` is the same value SDL obtains from sysconf and
/// cpuid on Linux, so no cpuid leaf decoding is needed here.
pub fn cache_line_size(io: std.Io) usize {
    const path = "/sys/devices/system/cpu/cpu0/cache/index0/coherency_line_size";
    var buffer: [32]u8 = undefined;
    const text = std.Io.Dir.cwd().readFile(io, path, &buffer) catch return default_cache_line_size;
    const value = std.fmt.parseUnsigned(usize, std.mem.trim(u8, text, " \t\r\n"), 10) catch return default_cache_line_size;
    return if (value == 0) default_cache_line_size else value;
}

/// Detects features of the host. Uses std's native detection, falling back to the
/// compile-time target CPU when detection is unavailable on this platform.
pub fn detect_features(io: std.Io) Features {
    const cpu = std.zig.system.linux.detectNativeCpuAndFeatures(io) orelse builtin.target.cpu;
    return features_from_cpu(cpu);
}

/// Maps a `std.Target.Cpu` model to SIMD features for its architecture family.
/// Only features the family defines are considered.
pub fn features_from_cpu(cpu: std.Target.Cpu) Features {
    var set: Features = .empty;
    switch (cpu.arch.family()) {
        .x86 => {
            if (cpu.has(.x86, .mmx)) set.insert(.mmx);
            if (cpu.has(.x86, .sse)) set.insert(.sse);
            if (cpu.has(.x86, .sse2)) set.insert(.sse2);
            if (cpu.has(.x86, .sse3)) set.insert(.sse3);
            if (cpu.has(.x86, .sse4_1)) set.insert(.sse41);
            if (cpu.has(.x86, .sse4_2)) set.insert(.sse42);
            if (cpu.has(.x86, .avx)) set.insert(.avx);
            if (cpu.has(.x86, .avx2)) set.insert(.avx2);
            if (cpu.has(.x86, .avx512f)) set.insert(.avx512f);
        },
        .aarch64 => {
            if (cpu.has(.aarch64, .neon)) set.insert(.neon);
            if (cpu.has(.aarch64, .sve2)) set.insert(.sve2);
        },
        .arm => {
            if (cpu.has(.arm, .neon)) set.insert(.neon);
            if (cpu.has(.arm, .v6)) set.insert(.arm_simd);
        },
        .powerpc => {
            if (cpu.has(.powerpc, .altivec)) set.insert(.altivec);
        },
        .loongarch => {
            if (cpu.has(.loongarch, .lsx)) set.insert(.lsx);
            if (cpu.has(.loongarch, .lasx)) set.insert(.lasx);
        },
        else => {},
    }
    return set;
}

/// Byte alignment required for the widest enabled SIMD width. The base value is
/// the pointer size, as in SDL, so an empty set returns `@sizeOf(usize)`.
pub fn simd_alignment(features: Features) usize {
    var alignment: usize = @sizeOf(usize);
    inline for (.{
        .{ Feature.mmx, 8 },
        .{ Feature.altivec, 16 },
        .{ Feature.sse, 16 },
        .{ Feature.sse2, 16 },
        .{ Feature.sse3, 16 },
        .{ Feature.sse41, 16 },
        .{ Feature.sse42, 16 },
        .{ Feature.avx, 32 },
        .{ Feature.avx2, 32 },
        .{ Feature.avx512f, 64 },
        .{ Feature.arm_simd, 16 },
        .{ Feature.neon, 16 },
        .{ Feature.lsx, 16 },
        .{ Feature.lasx, 32 },
        .{ Feature.sve2, 16 },
    }) |entry| {
        if (features.contains(entry[0])) alignment = @max(alignment, entry[1]);
    }
    return alignment;
}

/// Applies an SDL_HINT_CPU_FEATURE_MASK-style specification to a feature set and
/// returns the result. The specification is comma-separated; each item is an
/// optional `+` or `-` followed by a feature name (`sse2`, `avx512f`, ...,
/// `arm-simd`, `neon`) or `all`. `-name` removes the feature, `+name` or a bare
/// name leaves it as it is (SDL's mask starts with every feature enabled, so an
/// add is a no-op), and `all` re-enables everything. Unknown names are ignored.
///
/// The mask is a pure function of its inputs: nothing is cached or stored.
pub fn apply_feature_mask(features: Features, spec: []const u8) Features {
    // SDL starts from all bits set; a removal clears a bit and `all` sets every bit.
    var mask: Features = .full;
    var items = std.mem.splitScalar(u8, spec, ',');
    while (items.next()) |raw| {
        var item = std.mem.trim(u8, raw, " \t");
        var add = true;
        if (item.len > 0 and (item[0] == '+' or item[0] == '-')) {
            add = item[0] == '+';
            item = item[1..];
        }
        if (std.ascii.eqlIgnoreCase(item, "all")) {
            mask = if (add) .full else .empty;
            continue;
        }
        const feature = feature_from_name(item) orelse continue;
        if (add) mask.insert(feature) else mask.remove(feature);
    }
    var result = features;
    result.setIntersection(mask);
    return result;
}

fn feature_from_name(name: []const u8) ?Feature {
    const names = [_]struct { []const u8, Feature }{
        .{ "altivec", .altivec },
        .{ "mmx", .mmx },
        .{ "sse", .sse },
        .{ "sse2", .sse2 },
        .{ "sse3", .sse3 },
        .{ "sse41", .sse41 },
        .{ "sse42", .sse42 },
        .{ "avx", .avx },
        .{ "avx2", .avx2 },
        .{ "avx512f", .avx512f },
        .{ "arm-simd", .arm_simd },
        .{ "neon", .neon },
        .{ "lsx", .lsx },
        .{ "lasx", .lasx },
        .{ "sve2", .sve2 },
    };
    for (names) |entry| {
        if (std.ascii.eqlIgnoreCase(entry[0], name)) return entry[1];
    }
    return null;
}
