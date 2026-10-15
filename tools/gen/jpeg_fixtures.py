#!/usr/bin/env python3
"""Generate original baseline/progressive JPEG regression fixtures (Pillow)."""
from pathlib import Path
from PIL import Image

root = Path(__file__).resolve().parents[2]
image = Image.new('RGB', (48, 32))
for y in range(image.height):
    for x in range(image.width):
        image.putpixel((x, y), ((x * 5) % 256, (y * 8) % 256, ((x ^ y) * 7) % 256))
for progressive in (False, True):
    name = 'progressive' if progressive else 'baseline'
    image.save(root / 'src' / 'testdata' / 'jpeg' / f'{name}.jpg',
               quality=80, subsampling=2, progressive=progressive)
