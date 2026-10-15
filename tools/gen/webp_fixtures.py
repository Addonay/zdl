#!/usr/bin/env python3
"""Generate WebP regression fixtures in src/image/testdata/.

Sources are rendered by ImageMagick (`magick`, raw RGBA). Files are encoded by
the system libwebp (libwebp.so.7, runtime library only) through its advanced
API so that encoder features ImageMagick does not expose (token partitions)
can be selected. References (`.rgba`) are libwebp `WebPDecodeRGBA` output:
fancy upsampling and straight alpha. The animation is assembled by magick.

Usage: python3 -I tools/gen/webp_fixtures.py
"""
import ctypes as C
import os
import subprocess

OUT = "src/image/testdata"
lib = C.CDLL("libwebp.so.7")
ENCODER_ABI = 0x0210  # major 2: compatible with libwebp 1.x

# WebPConfig is all int/float fields; index them by name (libwebp encode.h order).
CONFIG_FIELDS = ["lossless", "quality", "method", "image_hint", "target_size", "target_PSNR",
                 "segments", "sns_strength", "filter_strength", "filter_sharpness", "filter_type",
                 "autofilter", "alpha_compression", "alpha_filtering", "alpha_quality", "pass",
                 "show_compressed", "preprocessing", "partitions", "partition_limit",
                 "emulate_jpeg_size", "thread_level", "low_memory", "near_lossless", "exact",
                 "use_delta_palette", "use_sharp_yuv", "qmin", "qmax"]
FLOATS = {"quality", "target_PSNR"}


class Config(C.Structure):
    _fields_ = [(n, C.c_float if n in FLOATS else C.c_int) for n in CONFIG_FIELDS] + [("pad", C.c_uint32 * 8)]


class Picture(C.Structure):
    _fields_ = [("use_argb", C.c_int), ("colorspace", C.c_int), ("width", C.c_int), ("height", C.c_int),
                ("y", C.c_void_p), ("u", C.c_void_p), ("v", C.c_void_p), ("y_stride", C.c_int), ("uv_stride", C.c_int),
                ("a", C.c_void_p), ("a_stride", C.c_int), ("pad1", C.c_uint32 * 2),
                ("argb", C.c_void_p), ("argb_stride", C.c_int), ("pad2", C.c_uint32 * 3),
                ("writer", C.c_void_p), ("custom_ptr", C.c_void_p), ("extra_info_type", C.c_int),
                ("extra_info", C.c_void_p), ("stats", C.c_void_p), ("error_code", C.c_int),
                ("progress_hook", C.c_void_p), ("user_data", C.c_void_p), ("pad3", C.c_uint32 * 3),
                ("pad4", C.c_void_p), ("pad5", C.c_void_p), ("pad6", C.c_uint32 * 8),
                ("memory_", C.c_void_p), ("memory_argb_", C.c_void_p), ("pad7", C.c_void_p * 2)]


class MemoryWriter(C.Structure):
    _fields_ = [("mem", C.POINTER(C.c_uint8)), ("size", C.c_size_t), ("max_size", C.c_size_t), ("pad", C.c_uint32)]


def source(width, height, args):
    return subprocess.run(["magick", "-size", f"{width}x{height}", *args, "-depth", "8", "rgba:-"],
                          check=True, capture_output=True).stdout


def encode(rgba, width, height, **settings):
    config = Config()
    if not lib.WebPConfigInitInternal(C.byref(config), 0, C.c_float(75.0), ENCODER_ABI):
        raise SystemExit("WebPConfigInit failed")
    for key, value in settings.items():
        setattr(config, key, value)
    if not lib.WebPValidateConfig(C.byref(config)):
        raise SystemExit(f"invalid config {settings}")
    picture = Picture()
    if not lib.WebPPictureInitInternal(C.byref(picture), ENCODER_ABI):
        raise SystemExit("WebPPictureInit failed")
    picture.use_argb = 1 if config.lossless else 0
    picture.width, picture.height = width, height
    if not lib.WebPPictureImportRGBA(C.byref(picture), rgba, width * 4):
        raise SystemExit("import failed")
    writer = MemoryWriter()
    lib.WebPMemoryWriterInit(C.byref(writer))
    picture.writer = C.cast(lib.WebPMemoryWrite, C.c_void_p).value
    picture.custom_ptr = C.cast(C.byref(writer), C.c_void_p).value
    if not lib.WebPEncode(C.byref(config), C.byref(picture)):
        raise SystemExit(f"encode failed: {picture.error_code}")
    data = C.string_at(writer.mem, writer.size)
    lib.WebPMemoryWriterClear(C.byref(writer))
    lib.WebPPictureFree(C.byref(picture))
    return data


def reference(data):
    w, h = C.c_int(), C.c_int()
    lib.WebPDecodeRGBA.restype = C.POINTER(C.c_uint8)
    out = lib.WebPDecodeRGBA(data, len(data), C.byref(w), C.byref(h))
    if not out:
        raise SystemExit("reference decode failed")
    pixels = C.string_at(out, w.value * h.value * 4)
    lib.WebPFree(out)
    return pixels


PLASMA = ["-seed", "{seed}", "plasma:fractal"]
ALPHA_RAMP = ["-alpha", "set", "-channel", "A", "-fx", "{fx}", "+channel"]

# name: (width, height, magick source args, encoder settings)
CASES = {
    # VP8L predictor/color/subtract-green transforms, color cache, meta prefix codes.
    "webp-lossless": (93, 71, ["-seed", "3", "plasma:fractal", "-posterize", "6", "(", "+clone", "-roll", "+31+0", ")", "-compose", "difference", "-composite", *ALPHA_RAMP], dict(lossless=1, method=6, quality=100.0), "(i+j)/(w+h)"),
    # VP8L meta prefix codes (entropy image selecting several groups).
    "webp-lossless-meta": (72, 56, ["-seed", "3", "plasma:fractal", *ALPHA_RAMP], dict(lossless=1, method=6, quality=100.0), "(i+j)/(w+h)"),
    # VP8L palette with 2-bit index bundling (four colors, odd width).
    "webp-palette": (23, 7, ["+antialias", "xc:#204080", "-fill", "#e03010", "-draw", "rectangle 2,1 9,5",
                             "-fill", "#10c060", "-draw", "line 0,6 22,0", "-fill", "white", "-draw", "point 21,3"],
                     dict(lossless=1, method=4, exact=1), None),
    # VP8 defaults with odd dimensions (partial macroblocks, final odd row).
    "webp-lossy": (61, 37, ["-seed", "5", "plasma:fractal", "-blur", "0x0.7"], dict(method=4), None),
    # VP8 segments, four token partitions, simple loop filter, strong sharpness,
    # and flat areas so macroblock skip flags are coded.
    "webp-lossy-simple": (80, 72, ["-seed", "9", "plasma:fractal", "-fill", "gray50", "-draw", "rectangle 0,0 47,31"],
                          dict(segments=4, partitions=2, filter_type=0, filter_strength=70, filter_sharpness=5,
                               sns_strength=100, quality=60.0), None),
    # VP8 normal filter at high strength with eight partitions.
    "webp-lossy-strong": (50, 50, ["-seed", "13", "plasma:fractal"],
                          dict(partitions=3, filter_strength=100, filter_type=1, quality=20.0, method=2), None),
    # VP8 + ALPH: lossless alpha with gradient filtering, even height.
    "webp-lossy-alpha": (34, 18, ["-seed", "11", "plasma:fractal", *ALPHA_RAMP],
                         dict(alpha_compression=1, alpha_filtering=2, alpha_quality=100), "abs(sin(i/5))"),
    # VP8 + ALPH stored uncompressed.
    "webp-lossy-alpha-raw": (17, 9, ["-seed", "2", "plasma:fractal", *ALPHA_RAMP],
                             dict(alpha_compression=0), "j/h"),
}


def main():
    os.makedirs(OUT, exist_ok=True)
    for name, (w, h, args, settings, fx) in CASES.items():
        args = [a.replace("{fx}", fx) if fx else a for a in args]
        data = encode(source(w, h, args), w, h, **settings)
        with open(os.path.join(OUT, name + ".webp"), "wb") as f:
            f.write(data)
        with open(os.path.join(OUT, name + ".rgba"), "wb") as f:
            f.write(reference(data))
    # Two-frame animation; the second frame is offset and must not be returned.
    anim = os.path.join(OUT, "webp-animated.webp")
    subprocess.run(["magick", "-dispose", "background", "-delay", "10",
                    "-size", "20x12", "xc:#30a0f0", "(", "-size", "6x4", "xc:#ff2000", "-repage", "+8+4", ")",
                    "-define", "webp:lossless=true", anim], check=True)
    subprocess.run(["magick", anim + "[0]", "-depth", "8", "rgba:" + os.path.join(OUT, "webp-animated.rgba")], check=True)


main()
