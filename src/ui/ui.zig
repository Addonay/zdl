//! Experimental retained scene foundation. No widgets, layout, native text,
//! renderer or accessibility bridge is claimed by this model-only API.
pub const scene = @import("scene.zig");
pub const Scene = scene.Scene;
pub const Snapshot = scene.Snapshot;
pub const Update = scene.Update;
pub const Key = scene.Key;
pub const NodeId = scene.NodeId;
pub const DraftId = scene.DraftId;
pub const Kind = scene.Kind;

/// Separate immutable typed state channels on the same scene transaction engine.
pub const with_states = scene.with_states;
/// Pointer-free value policies and explicit ownership-policy support.
pub const state = struct {
    /// Pointer-free scalar/aggregate ownership policy; owned resources need a custom policy.
    pub const Value = @import("state.zig").Value;
};

/// Semantic intent and actions, not a native accessibility bridge.
pub const semantics = struct {
    const model = @import("semantics.zig");
    pub const Id = model.Id;
    pub const Draft = model.Draft;
    pub const Role = model.Role;
    pub const Action = model.Action;
    pub const Actions = model.Actions;
    pub const Bounds = model.Bounds;
    pub const Number = model.Number;
    pub const Document = model.Document;
    pub const Properties = model.Properties;
    pub const Relations = model.Relations;
    pub const ResolvedRelations = model.ResolvedRelations;
    pub const Text = model.Text;
    pub const View = model.View;
    pub const Payload = model.Payload;
    pub const Source = model.Source;
    pub const Request = model.Request;
    pub const Resolved = model.Resolved;
};
/// Retained scene model with atomic semantic-tree publication.
pub const with_semantics = scene.with_semantics;

/// Bounded owner-thread delivery, owned payloads and explicit final receipts.
pub const action_queue = @import("action_queue.zig");

/// Checked execution of queued document edits and selections.
pub const document_actions = @import("document_actions.zig");
