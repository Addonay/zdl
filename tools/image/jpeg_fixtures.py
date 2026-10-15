#!/usr/bin/env python3
"""Generate deterministic, non-photographic JPEG test/benchmark fixtures (Pillow)."""
from pathlib import Path
from PIL import Image
import random

out = Path(__file__).resolve().parents[2] / 'src/image/testdata'
out.mkdir(parents=True, exist_ok=True)
w, h = 769, 513  # Odd dimensions exercise MCU padding and SIMD tails.
pixels = bytes(v for y in range(h) for x in range(w) for v in (
    (x * 255 // w + y // 7) % 256,
    (y * 255 // h + x // 11) % 256,
    ((x // 32 ^ y // 32) * 43) % 256,
))
im = Image.frombytes('RGB', (w, h), pixels)
im.save(out / 'jpeg-baseline.jpg', quality=90, subsampling=2)
im.save(out / 'jpeg-progressive.jpg', quality=90, subsampling=2, progressive=True)
im.convert('L').save(out / 'jpeg-grey.jpg', quality=85)
rng = random.Random(918273)
Image.frombytes('RGB', (w, h), rng.randbytes(w*h*3)).save(out / 'jpeg-noise.jpg', quality=95, subsampling=0)
