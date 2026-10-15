# Image benchmark programs

These measure complete in-memory codec calls, including allocation and cleanup.
The corpus is synthetic. Run repeated trials on an idle machine before drawing
performance conclusions; these programs do not compare against system codecs.
No C library or image development package is needed to compile or run them.

From the repository root:

```sh
mkdir -p .cache/image-bench
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build-exe \
  -OReleaseFast --dep zdl --dep fixtures -Mroot=tools/image/jpeg_bench.zig \
  -Mzdl=src/root.zig -Mfixtures=src/image/testdata/jpeg_fixtures.zig \
  -femit-bin=.cache/image-bench/jpeg
ZIG_GLOBAL_CACHE_DIR="$PWD/.cache/zig-master-global" /home/addo/.zvm/master/zig build-exe \
  -OReleaseFast --dep zdl -Mroot=tools/image/bench_png.zig \
  -Mzdl=src/root.zig -femit-bin=.cache/image-bench/png
.cache/image-bench/jpeg
.cache/image-bench/png
```

JPEG embeds baseline/progressive 4:2:0, noisy 4:4:4 and greyscale fixtures,
warms up each case, hashes pixels outside the timed interval, then performs
40 RGBA decodes. The hashes are checked independently in the library tests.
PNG generates a 1024x1024 RGBA pattern and reports encoded size, mean decode
nanoseconds and mean encode nanoseconds with default filter/compression settings.

`jpeg_fixtures.py` requires Pillow to regenerate the JPEG corpus.
`make_fixtures.py` is the incoming fixture-generation draft for additional
formats; its AVIF files are test inputs, not evidence of an AVIF decoder.
The WebP fixture/table generators live in `tools/gen/`.
