//! Deterministic synthetic JPEG benchmark corpus; regenerate with tools/image/jpeg_fixtures.py.
pub const baseline = @embedFile("jpeg-baseline.jpg");
pub const progressive = @embedFile("jpeg-progressive.jpg");
pub const noise = @embedFile("jpeg-noise.jpg");
pub const grey = @embedFile("jpeg-grey.jpg");
