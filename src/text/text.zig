//! Pure application-owned document editing. Paragraph providers and Unicode
//! navigation remain separate, optional services rather than core dependencies.
pub const document = @import("document.zig");
pub const Document = document.Document;
pub const Snapshot = document.Snapshot;

/// Checked owner-thread routing for application-owned mutable documents.
pub const registry = @import("registry.zig");
pub const Registry = registry.Registry;
