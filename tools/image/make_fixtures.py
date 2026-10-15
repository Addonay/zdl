#!/usr/bin/env python3
"""Deterministic image codec test corpus with reference decodes.

Source images are generated procedurally so the corpus is reproducible from
this file alone. Encoded fixtures are produced with the reference tools
available on the host (ffmpeg's libaom/libjxl encoders, Pillow, ImageMagick)
and, for AVIF, with the small ISOBMFF writer below: ffmpeg can write color-only
AVIF but not alpha auxiliary items or image grids, and both are part of what the
decoder has to handle.

Every fixture that a reference decoder can decode exactly also gets a raw RGBA
dump, and a manifest records encoder parameters, reference decoder and the
comparison tolerance that applies. Lossless formats must match byte for byte;
lossy formats carry a per-channel tolerance and a minimum PSNR.

Usage:
    tools/image/make_fixtures.py [--out src/image/testdata] [--only avif,jxl]
"""

from __future__ import annotations

import argparse
import json
import os
import random
import struct
import subprocess
import sys
from pathlib import Path

try:
    from PIL import Image, ImageDraw
except ImportError:  # pragma: no cover - the corpus needs Pillow
    print("Pillow is required: python3 -m pip install --user Pillow", file=sys.stderr)
    raise

# ---------------------------------------------------------------------------
# Source images


def gradient(width: int, height: int, seed: int) -> Image.Image:
    """Smooth two-axis gradient: exercises upsampling and filter kernels."""
    img = Image.new("RGB", (width, height))
    px = img.load()
    r = random.Random(seed)
    ax, ay = r.uniform(0.2, 1.0), r.uniform(0.2, 1.0)
    for y in range(height):
        fy = y / max(1, height - 1)
        for x in range(width):
            fx = x / max(1, width - 1)
            px[x, y] = (
                int(255 * (0.15 + 0.7 * fx * ax)),
                int(255 * (0.15 + 0.7 * fy * ay)),
                int(255 * (0.15 + 0.7 * (1 - fx) * (1 - fy))),
            )
    return img


def checker(width: int, height: int, size: int = 8) -> Image.Image:
    img = Image.new("RGB", (width, height))
    draw = ImageDraw.Draw(img)
    for y in range(height):
        for x in range(width):
            on = ((x // size) + (y // size)) % 2 == 0
            draw.point((x, y), fill=(230, 40, 90) if on else (20, 60, 200))
    return img


def noise(width: int, height: int, seed: int) -> Image.Image:
    """High-frequency content: the worst case for residual and entropy coding."""
    r = random.Random(seed)
    img = Image.new("RGB", (width, height))
    px = img.load()
    for y in range(height):
        for x in range(width):
            px[x, y] = (r.randrange(256), r.randrange(256), r.randrange(256))
    return img


def shapes(width: int, height: int, seed: int) -> Image.Image:
    """Flat regions with hard edges and text: tests deblocking and ringing."""
    r = random.Random(seed)
    img = Image.new("RGB", (width, height), (250, 250, 245))
    draw = ImageDraw.Draw(img)
    palette = [
        (220, 30, 30), (30, 160, 60), (40, 60, 200), (240, 200, 20),
        (120, 40, 160), (20, 180, 190), (250, 130, 20), (30, 30, 30),
    ]
    for _ in range(14):
        color = r.choice(palette)
        kind = r.randrange(3)
        x0 = r.randrange(width)
        y0 = r.randrange(height)
        x1 = min(width - 1, x0 + r.randrange(4, max(5, width // 2)))
        y1 = min(height - 1, y0 + r.randrange(4, max(5, height // 2)))
        if kind == 0:
            draw.rectangle([x0, y0, x1, y1], fill=color)
        elif kind == 1:
            draw.ellipse([x0, y0, x1, y1], fill=color)
        else:
            draw.line([x0, y0, x1, y1], fill=color, width=r.randrange(1, 5))
    draw.text((4, 4), "zdl image corpus", fill=(0, 0, 0))
    return img


def alpha_ramp(width: int, height: int, seed: int) -> Image.Image:
    img = Image.new("RGBA", (width, height))
    px = img.load()
    r = random.Random(seed)
    base = gradient(width, height, seed + 1).convert("RGBA")
    for y in range(height):
        for x in range(width):
            r_, g_, b_, _ = base.getpixel((x, y))
            px[x, y] = (r_, g_, b_, int(255 * x / max(1, width - 1)))
    return img


def grey_ramp(width: int, height: int) -> Image.Image:
    img = Image.new("L", (width, height))
    px = img.load()
    for y in range(height):
        for x in range(width):
            px[x, y] = (x * 255 // max(1, width - 1) + y * 255 // max(1, height - 1)) // 2
    return img


def all_values(width: int, height: int) -> Image.Image:
    """Every 8-bit value appears in every channel: catches rounding errors."""
    img = Image.new("RGB", (width, height))
    px = img.load()
    for y in range(height):
        for x in range(width):
            px[x, y] = ((x * 7) % 256, (y * 5) % 256, ((x + y) * 3) % 256)
    return img


# ---------------------------------------------------------------------------
# Tools


def run(cmd: list[str], **kwargs) -> subprocess.CompletedProcess:
    return subprocess.run(cmd, check=True, capture_output=True, **kwargs)


def ffmpeg(args: list[str]) -> None:
    run(["ffmpeg", "-hide_banner", "-loglevel", "error", "-y", *args])


def decode_reference(src: Path, out_raw: Path) -> bool:
    """Raw RGBA decode with the reference decoder for a container."""
    try:
        ffmpeg(["-i", str(src), "-f", "rawvideo", "-pix_fmt", "rgba", str(out_raw)])
    except subprocess.CalledProcessError:
        return False
    return out_raw.exists() and out_raw.stat().st_size > 0


def decode_reference_pillow(src: Path, out_raw: Path) -> bool:
    try:
        with Image.open(src) as im:
            im.load()
            im.convert("RGBA").tobytes()
            out_raw.write_bytes(im.convert("RGBA").tobytes())
    except Exception:
        return False
    return True


# ---------------------------------------------------------------------------
# ISOBMFF / AVIF writer


def box(kind: bytes, payload: bytes) -> bytes:
    return struct.pack(">I", len(payload) + 8) + kind + payload


def fullbox(kind: bytes, version: int, flags: int, payload: bytes) -> bytes:
    return box(kind, struct.pack(">BBBB", version, flags >> 16, (flags >> 8) & 0xFF, flags & 0xFF) + payload)


def parse_obus(stream: bytes) -> list[tuple[int, bytes]]:
    """Split a low-overhead OBU stream into (type, payload) pairs."""
    out: list[tuple[int, bytes]] = []
    pos = 0
    while pos < len(stream):
        header = stream[pos]
        pos += 1
        if header & 0x80:
            raise ValueError("forbidden OBU bit set")
        obu_type = (header >> 3) & 0xF
        extension = bool(header & 0x04)
        has_size = bool(header & 0x02)
        if extension:
            pos += 1
        if not has_size:
            raise ValueError("OBU without a size field is not supported here")
        size = 0
        shift = 0
        while True:
            byte = stream[pos]
            pos += 1
            size |= (byte & 0x7F) << shift
            shift += 7
            if not byte & 0x80:
                break
        out.append((obu_type, stream[pos : pos + size]))
        pos += size
    return out


def av1c_record(seq_header: bytes, profile: int, level: int, high_bitdepth: bool,
                monochrome: bool, sub_x: int, sub_y: int, position: int = 0,
                twelve_bit: bool = False) -> bytes:
    """AV1CodecConfigurationRecord (AVIF-ISOBMFF section 2.3)."""
    record = bytearray()
    record.append(0x81)  # marker (1) | version (1)
    profile_level = (profile << 5) | (level & 0x1F)
    seq_tier = 0
    record.append(profile_level)
    record.append((seq_tier << 7) | (int(high_bitdepth) << 6) | (int(twelve_bit) << 5) |
                  (int(monochrome) << 4) | (sub_x << 3) | (sub_y << 2) | (position & 3))
    # reserved (3) | initial_presentation_delay_present (0) | delay (0)
    record.append(0x00)
    record += seq_header
    return bytes(record)


class AvifWriter:
    """Minimal AVIF still-image writer: one grid item plus optional tiles.

    Supports the cases ffmpeg's muxer cannot produce: an alpha auxiliary item,
    an image grid, an Exif item and explicit `colr` metadata. Used only to build
    test fixtures.
    """

    def __init__(self) -> None:
        self.items: list[dict] = []
        self.associations: list[dict] = []
        self.properties: list[bytes] = []
        self.references: list[tuple[str, int, list[int]]] = []
        self.major_brand = b"avif"
        self.compatible = [b"avif", b"mif1", b"miaf"]

    def _property(self, payload: bytes) -> int:
        self.properties.append(payload)
        return len(self.properties) - 1  # property indices are one based

    def ispe(self, width: int, height: int) -> int:
        return self._property(fullbox(b"ispe", 0, 0, struct.pack(">II", width, height)))

    def pixi(self, depth: int, channels: int) -> int:
        bits = bytes([depth] * channels)
        return self._property(fullbox(b"pixi", 0, 0, bytes([channels]) + bits))

    def av1c(self, record: bytes) -> int:
        return self._property(box(b"av1C", record))

    def colr(self, matrix: int, transfer: int, primaries: int, full_range: bool) -> int:
        payload = b"nclx" + struct.pack(">HHB", primaries, transfer, matrix) + bytes([1 if full_range else 0])
        return self._property(box(b"colr", payload))

    def auxc_alpha(self, alpha_ispe: int, bits: int) -> int:
        payload = struct.pack(">B", 0) + struct.pack(">H", alpha_ispe)
        payload += struct.pack(">BB", bits - 1, 0)  # bits_minus_one, premultiplied flag
        return self._property(fullbox(b"auxC", 1, 0, payload))

    def add_item(self, item_type: bytes, name: str, data: bytes, props: list[int],
                 extents: list[bytes] | None = None) -> int:
        item_id = len(self.items) + 1
        self.items.append({
            "id": item_id,
            "type": item_type,
            "name": name,
            "data": data,
            "extents": extents if extents is not None else [data],
            "props": props,
        })
        return item_id

    def link(self, kind: str, from_id: int, to_ids: list[int]) -> None:
        self.references.append((kind, from_id, to_ids))

    def build(self, primary: int, exif: bytes | None = None) -> bytes:
        if exif is not None:
            exif_props = [self._property(box(b"mime", b"application/exif"))]
            self.add_item(b"Exif", "exif", exif, exif_props)

        # iloc: version 0, four byte offsets and lengths, item data in mdat.
        # Extent offsets are absolute file offsets, and mdat starts after
        # ftyp and meta, whose sizes depend on iloc itself. Build once to learn
        # the size, then rebuild with the real offsets; both passes use the same
        # fixed-width fields, so the second pass is final.
        def iloc_box(mdat_payload_start: int) -> bytes:
            entries = bytearray()
            data = bytearray()
            for item in self.items:
                entries += struct.pack(">HH", item["id"], 0)  # item id, data reference
                entries += struct.pack(">I", 0)  # base offset
                entries += struct.pack(">H", len(item["extents"]))
                for extent in item["extents"]:
                    entries += struct.pack(">I", mdat_payload_start + len(data))
                    entries += struct.pack(">I", len(extent))
                    data += extent
            return fullbox(b"iloc", 0, 0, bytes([0x44, 0x00]) + struct.pack(">H", len(self.items)) + bytes(entries)), bytes(data)

        infes = b""
        for item in self.items:
            payload = struct.pack(">HH", item["id"], 0) + item["type"]
            payload += item["name"].encode("utf-8") + b"\x00"
            infes += fullbox(b"infe", 2, 0, payload)
        iinf = fullbox(b"iinf", 0, 0, struct.pack(">H", len(self.items)) + infes)

        ipma_payload = bytearray()
        ipma_payload += struct.pack(">I", len(self.items))
        for item in self.items:
            ipma_payload += struct.pack(">H", item["id"])
            ipma_payload += bytes([len(item["props"])])
            for prop in item["props"]:
                ipma_payload += bytes([0x81, prop + 1])  # essential, index is 1 based
        ipma = fullbox(b"ipma", 0, 0, bytes(ipma_payload))
        ipco = box(b"ipco", b"".join(self.properties))
        iprp = box(b"iprp", ipco + ipma)

        iref_payload = b""
        for kind, from_id, to_ids in self.references:
            body = struct.pack(">H", from_id) + struct.pack(">H", len(to_ids))
            body += b"".join(struct.pack(">H", t) for t in to_ids)
            iref_payload += fullbox(kind.encode("ascii"), 0, 0, body)
        iref = fullbox(b"iref", 0, 0, iref_payload) if iref_payload else b""

        hdlr = fullbox(b"hdlr", 0, 0, struct.pack(">I", 0) + b"pict" + b"\x00" * 12 + b"\x00")
        pitm = fullbox(b"pitm", 0, 0, struct.pack(">H", primary))

        brands = b"".join(self.compatible)
        ftyp = box(b"ftyp", self.major_brand + struct.pack(">I", 0) + brands)

        iloc, data = iloc_box(0)
        meta = fullbox(b"meta", 0, 0, hdlr + pitm + iloc + iinf + iref + iprp)
        mdat_payload_start = len(ftyp) + len(meta) + 8
        iloc, data = iloc_box(mdat_payload_start)
        meta = fullbox(b"meta", 0, 0, hdlr + pitm + iloc + iinf + iref + iprp)
        assert len(ftyp) + len(meta) + 8 == mdat_payload_start, "iloc size changed between passes"
        return ftyp + meta + box(b"mdat", data)


def avif_obus(png: Path, pix_fmt: str, crf: int, tmp: Path) -> tuple[list[tuple[int, bytes]], dict]:
    """Encode one still frame to AV1 OBUs with libaom."""
    raw = tmp.with_suffix(".obu")
    ffmpeg([
        "-i", str(png), "-pix_fmt", pix_fmt, "-c:v", "libaom-av1",
        "-crf", str(crf), "-b:v", "0", "-still-picture", "1", "-cpu-used", "6",
        "-an", "-f", "obu", str(raw),
    ])
    obus = parse_obus(raw.read_bytes())
    seq = [payload for kind, payload in obus if kind == 1]
    frames = [payload for kind, payload in obus if kind == 6 or kind == 7]
    if not seq or not frames:
        raise RuntimeError(f"unexpected OBU stream kinds: {[k for k, _ in obus]}")
    meta = {
        "pix_fmt": pix_fmt,
        "seq_header": seq[0],
        "profile": seq[0][0] >> 5,
        "level": seq[0][0] & 0x1F,
    }
    return frames, meta


def write_avif_color(path: Path, png: Path, pix_fmt: str, crf: int, tmp: Path,
                     colr: tuple[int, int, int, bool] | None = None,
                     exif: bytes | None = None, major: bytes = b"avif") -> dict:
    frames, meta = avif_obus(png, pix_fmt, crf, tmp)
    writer = AvifWriter()
    writer.major_brand = major
    width, height = Image.open(png).size
    monochrome = pix_fmt.startswith("gray")
    sub_x, sub_y = {"yuv420p": (1, 1), "yuv420p10le": (1, 1), "yuv444p": (0, 0),
                    "yuv444p10le": (0, 0), "yuv422p": (1, 0), "gray": (1, 1)}.get(pix_fmt, (1, 1))
    high = "10le" in pix_fmt
    props = [
        writer.ispe(width, height),
        writer.pixi(10 if high else 8, 1 if monochrome else 3),
        writer.av1c(av1c_record(meta["seq_header"], meta["profile"], meta["level"],
                                high, monochrome, sub_x, sub_y)),
    ]
    if colr:
        props.append(writer.colr(*colr))
    writer.add_item(b"av01", "Color", frames[0], props)
    path.write_bytes(writer.build(1, exif))
    return meta


def write_avif_alpha(path: Path, rgba_png: Path, pix_fmt: str, crf: int, tmp: Path) -> None:
    """Color item plus an alpha auxiliary item, as libavif writes them."""
    with Image.open(rgba_png) as im:
        width, height = im.size
        alpha = im.getchannel("A")

    color_frames, color_meta = avif_obus(rgba_png, pix_fmt, crf, tmp)
    alpha_source = tmp.parent / (path.stem + "-alpha.png")
    alpha.save(alpha_source)
    alpha_frames, alpha_meta = avif_obus(alpha_source, "gray", 0, tmp.with_name(path.stem + "-a.obu"))

    writer = AvifWriter()
    writer.compatible = [b"avif", b"mif1", b"miaf", b"MA1A"]
    color_ispe = writer.ispe(width, height)
    alpha_ispe = writer.ispe(width, height)
    writer.properties.insert(alpha_ispe, b"")  # keep index order explicit below
    writer.properties = [p for p in writer.properties if p]
    alpha_ispe = writer.ispe(width, height)

    color_props = [
        color_ispe,
        writer.pixi(8, 3),
        writer.av1c(av1c_record(color_meta["seq_header"], color_meta["profile"], color_meta["level"],
                                False, False, *({"yuv444p": (0, 0), "yuv420p": (1, 1)}[pix_fmt]))),
    ]
    color_id = writer.add_item(b"av01", "Color", color_frames[0], color_props)

    alpha_props = [
        alpha_ispe,
        writer.pixi(8, 1),
        writer.av1c(av1c_record(alpha_meta["seq_header"], alpha_meta["profile"], alpha_meta["level"],
                                False, True, 1, 1)),
        writer.auxc_alpha(alpha_ispe, 8),
    ]
    alpha_id = writer.add_item(b"av01", "Alpha", alpha_frames[0], alpha_props)
    writer.link("auxl", color_id, [alpha_id])
    path.write_bytes(writer.build(color_id))


def write_avif_grid(path: Path, tile_pngs: list[Path], columns: int, rows: int, crf: int,
                    tmp: Path) -> None:
    """Image grid: one item whose `dimg` references the encoded tiles."""
    tiles = []
    width = height = 0
    for tile in tile_pngs:
        frames, meta = avif_obus(tile, "yuv444p", crf, tmp)
        tiles.append((frames[0], meta, Image.open(tile).size))
    writer = AvifWriter()
    writer.compatible = [b"avif", b"mif1", b"miaf", b"MA1B"]
    grid_props = []
    tile_ids = []
    for payload, meta, (tw, th) in tiles:
        props = [
            writer.ispe(tw, th),
            writer.pixi(8, 3),
            writer.av1c(av1c_record(meta["seq_header"], meta["profile"], meta["level"], False, False, 0, 0)),
        ]
        tile_ids.append(writer.add_item(b"av01", f"tile{tile_ids and len(tile_ids) or ''}", payload, props))
        width += tw
        height += th
    grid_props = [
        writer.ispe(width, height),
        writer.pixi(8, 3),
    ]
    grid_id = writer.add_item(b"av01", "Color", b"", grid_props, extents=[])
    writer.link("dimg", grid_id, tile_ids)
    path.write_bytes(writer.build(grid_id))


# ---------------------------------------------------------------------------
# Corpus


class Corpus:
    def __init__(self, out: Path) -> None:
        self.out = out
        self.out.mkdir(parents=True, exist_ok=True)
        self.manifest: dict[str, list[dict]] = {}

    def record(self, group: str, entry: dict) -> None:
        self.manifest.setdefault(group, []).append(entry)

    def write_manifest(self) -> None:
        path = self.out / "manifest.json"
        path.write_text(json.dumps(self.manifest, indent=2, sort_keys=True) + "\n")


def build_sources(tmp: Path) -> dict[str, Path]:
    sources: dict[str, Path] = {}

    def save(name: str, img: Image.Image) -> None:
        path = tmp / name
        img.save(path)
        sources[name] = path

    save("grad-96x64.png", gradient(96, 64, 11))
    save("grad-512x384.png", gradient(512, 384, 12))
    save("checker-64x64.png", checker(64, 64))
    save("noise-64x64.png", noise(64, 64, 13))
    save("shapes-128x96.png", shapes(128, 96, 14))
    save("shapes-512x384.png", shapes(512, 384, 15))
    save("alpha-96x64.png", alpha_ramp(96, 64, 16))
    save("grey-96x64.png", grey_ramp(96, 64))
    save("allval-64x64.png", all_values(64, 64))
    save("odd-3x7.png", gradient(3, 7, 17))
    save("odd-17x13.png", gradient(17, 13, 18))
    save("odd-1x9.png", gradient(1, 9, 19))
    save("tiny-1x1.png", gradient(1, 1, 20))
    return sources


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", default="src/image/testdata")
    parser.add_argument("--only", default="")
    args = parser.parse_args()

    out = Path(args.out)
    tmp = Path("/tmp/opencode/zdl-fixtures")
    tmp.mkdir(parents=True, exist_ok=True)
    only = set(filter(None, args.only.split(",")))
    want = lambda name: (not only) or name in only  # noqa: E731

    corpus = Corpus(out)
    sources = build_sources(tmp)

    # ---- AVIF -------------------------------------------------------------
    if want("avif"):
        avif_cases = [
            ("avif-420-96x64", "grad-96x64.png", "yuv420p", 30, None),
            ("avif-444-96x64", "grad-96x64.png", "yuv444p", 30, None),
            ("avif-grey-96x64", "grey-96x64.png", "gray", 30, None),
            ("avif-10bit-96x64", "grad-96x64.png", "yuv420p10le", 30, None),
            ("avif-420-shapes", "shapes-128x96.png", "yuv420p", 24, None),
            ("avif-444-allval", "allval-64x64.png", "yuv444p", 20, None),
            ("avif-422-96x64", "grad-96x64.png", "yuv422p", 30, None),
            ("avif-420-odd", "odd-17x13.png", "yuv420p", 30, None),
            ("avif-420-1x9", "odd-1x9.png", "yuv420p", 30, None),
        ]
        for name, src, pix_fmt, crf, colr in avif_cases:
            path = out / f"{name}.avif"
            try:
                write_avif_color(path, tmp / src, pix_fmt, crf, tmp / (name + ".obu"), colr=colr)
            except Exception as exc:  # keep going, report at the end
                print(f"avif {name}: {exc}", file=sys.stderr)
                continue
            ok = decode_reference(path, tmp / f"{name}.rgba")
            if ok:
                (out / f"{name}.rgba").write_bytes((tmp / f"{name}.rgba").read_bytes())
            corpus.record("avif", {
                "file": path.name, "source": src, "pix_fmt": pix_fmt, "crf": crf,
                "encoder": "ffmpeg libaom-av1 -still-picture 1 (AVIF written by make_fixtures.py)",
                "reference": "ffmpeg libdav1d" if ok else None,
                "reference_raw": f"{name}.rgba" if ok else None,
                "tolerance": {"max_abs": 2, "min_psnr_db": 38},
            })
            print(f"avif {name}: {path.stat().st_size} bytes reference={'yes' if ok else 'no'}")

        path = out / "avif-alpha-96x64.avif"
        try:
            write_avif_alpha(path, tmp / "alpha-96x64.png", "yuv444p", 30, tmp / "alpha.obu")
            ok = decode_reference(path, tmp / "avif-alpha.rgba")
            if ok:
                (out / "avif-alpha-96x64.rgba").write_bytes((tmp / "avif-alpha.rgba").read_bytes())
            corpus.record("avif", {
                "file": path.name, "source": "alpha-96x64.png",
                "note": "alpha auxiliary item (auxC aux_type=0)",
                "reference": "ffmpeg libdav1d" if ok else None,
                "reference_raw": "avif-alpha-96x64.rgba" if ok else None,
                "tolerance": {"max_abs": 3, "min_psnr_db": 34},
            })
            print(f"avif alpha: {path.stat().st_size} bytes reference={'yes' if ok else 'no'}")
        except Exception as exc:
            print(f"avif alpha: {exc}", file=sys.stderr)

        tiles = [tmp / f"tile-{i}.png" for i in range(4)]
        for i, tile in enumerate(tiles):
            shapes(64, 48, 40 + i).save(tile)
        path = out / "avif-grid-2x2.avif"
        try:
            write_avif_grid(path, tiles, 2, 2, 30, tmp / "grid.obu")
            ok = decode_reference(path, tmp / "avif-grid.rgba")
            if ok:
                (out / "avif-grid-2x2.rgba").write_bytes((tmp / "avif-grid.rgba").read_bytes())
            corpus.record("avif", {
                "file": path.name, "note": "2x2 image grid, dimg references",
                "reference": "ffmpeg libdav1d" if ok else None,
                "reference_raw": "avif-grid-2x2.rgba" if ok else None,
                "tolerance": {"max_abs": 3, "min_psnr_db": 34},
            })
            print(f"avif grid: {path.stat().st_size} bytes reference={'yes' if ok else 'no'}")
        except Exception as exc:
            print(f"avif grid: {exc}", file=sys.stderr)

    # ---- JPEG XL ----------------------------------------------------------
    if want("jxl"):
        jxl_cases = [
            ("jxl-modular-96x64", "grad-96x64.png", ["-define", "jxl:lossless=true"]),
            ("jxl-vardct-90-96x64", "grad-96x64.png", ["-q", "90"]),
            ("jxl-vardct-50-96x64", "shapes-128x96.png", ["-q", "50"]),
            ("jxl-modular-512x384", "shapes-512x384.png", ["-define", "jxl:lossless=true"]),
        ]
        for name, src, extra in jxl_cases:
            src_path = tmp / src
            path = out / f"{name}.jxl"
            ok_enc = False
            for tool in (["convert", str(src_path)] + extra + [str(path)],
                         ["ffmpeg", "-hide_banner", "-loglevel", "error", "-y", "-i", str(src_path),
                          "-c:v", "libjxl"] + extra + [str(path)]):
                try:
                    run(tool)
                    ok_enc = True
                    break
                except Exception:
                    continue
            if not ok_enc:
                print(f"jxl {name}: encoder failed", file=sys.stderr)
                continue
            reference = tmp / f"{name}.rgba"
            ok = decode_reference(path, reference) or decode_reference_pillow(path, reference)
            if ok:
                (out / f"{name}.rgba").write_bytes(reference.read_bytes())
            corpus.record("jxl", {
                "file": path.name, "source": src, "params": " ".join(extra),
                "encoder": tool[0],
                "reference": "ffmpeg libjxl" if ok else None,
                "reference_raw": f"{name}.rgba" if ok else None,
                "tolerance": {"max_abs": 1, "min_psnar_db": 45} if "lossless" in " ".join(extra)
                             else {"max_abs": 6, "min_psnr_db": 30},
            })
            print(f"jxl {name}: {path.stat().st_size} bytes reference={'yes' if ok else 'no'}")

    corpus.write_manifest()
    print(f"\nmanifest: {out / 'manifest.json'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
