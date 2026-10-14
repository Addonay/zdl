//! Text input (zwp_text_input_v3) support for the Wayland backend: the typed
//! payloads the window emits, and the pending batch the protocol defines.
//!
//! The protocol sends preedit, commit and delete-surrounding requests as a batch
//! that takes effect at `done`, applied in the order delete, commit, preedit. The
//! `Batch` collects those between `done` events. Text it holds is owned; when a
//! batch is flushed the window moves each string into its event storage.
//!
//! Content type: `ContentType` describes the kind of text a field takes, and
//! `wire` maps it to the purpose and hint bits zwp_text_input_v3 expects, with
//! the same mapping SDL uses (SDL_waylandkeyboard.c, `Wayland_StartTextInput`).
//!
//! Deliberate difference from SDL: `Window.set_surrounding_text` is an addition;
//! SDL does not send surrounding text to the input method.

const std = @import("std");
const Allocator = std.mem.Allocator;
const protocol = @import("protocol.zig");

/// Kind of text a field accepts, as SDL_TextInputType.
pub const InputType = enum { text, name, email, username, password_hidden, password_visible, number, number_password_hidden, number_password_visible };

/// Automatic capitalization, as SDL_Capitalization.
pub const Capitalization = enum { none, letters, words, sentences };

/// Content description of a text field. Defaults are plain text without hints.
pub const ContentType = struct {
    input_type: InputType = .text,
    capitalization: Capitalization = .none,
    autocorrect: bool = false,
    multiline: bool = false,
};

/// The wire values for `zwp_text_input_v3.set_content_type`.
pub const Wire = struct {
    hint: u32,
    purpose: protocol.ZwpTextInputV3.ContentPurpose,
};

/// Maps a content type to the purpose and hint bits SDL sends (SDL_waylandkeyboard.c).
pub fn wire(content: ContentType) Wire {
    const Hint = protocol.ZwpTextInputV3.ContentHint;
    var hint: u32 = Hint.none;
    const purpose: protocol.ZwpTextInputV3.ContentPurpose = switch (content.input_type) {
        .text => .normal,
        .name => .name,
        .email => .email,
        .username => blk: {
            hint |= Hint.sensitive_data;
            break :blk .normal;
        },
        .password_hidden => blk: {
            hint |= Hint.hidden_text | Hint.sensitive_data;
            break :blk .password;
        },
        .password_visible => blk: {
            hint |= Hint.sensitive_data;
            break :blk .password;
        },
        .number => .number,
        .number_password_hidden => blk: {
            hint |= Hint.hidden_text | Hint.sensitive_data;
            break :blk .pin;
        },
        .number_password_visible => blk: {
            hint |= Hint.sensitive_data;
            break :blk .pin;
        },
    };
    switch (content.capitalization) {
        .none => {},
        .letters => hint |= Hint.uppercase,
        .words => hint |= Hint.titlecase,
        .sentences => hint |= Hint.auto_capitalization,
    }
    if (content.autocorrect) hint |= Hint.completion | Hint.spellcheck;
    if (content.multiline) hint |= Hint.multiline;
    return .{ .hint = hint, .purpose = purpose };
}

/// Composition text. Cursor offsets are byte positions inside `text`; a negative
/// begin or end means the cursor is hidden.
pub const Preedit = struct {
    text: []const u8,
    cursor_begin: i32,
    cursor_end: i32,
};

/// Cursor rectangle in surface coordinates, reported to the input method so it
/// can place its candidate window.
pub const Area = struct {
    x: i32,
    y: i32,
    width: i32,
    height: i32,
};

/// Bytes to remove around the cursor before inserting a commit.
pub const Delete = struct {
    before: u32,
    after: u32,
};

/// Pending events of one text-input batch (between two `done` events). Owned
/// strings are freed by `deinit` or handed on by `take_*`.
pub const Batch = struct {
    delete: ?Delete = null,
    commit: ?[]u8 = null,
    preedit: ?Owned = null,
    /// True when the previous batch left composition text on screen; an empty
    /// preedit at `done` then clears it.
    preedit_active: bool = false,

    pub const Owned = struct {
        text: []u8,
        cursor_begin: i32,
        cursor_end: i32,
    };

    pub fn deinit(self: *Batch, allocator: Allocator) void {
        if (self.commit) |text| allocator.free(text);
        if (self.preedit) |preedit| allocator.free(preedit.text);
        self.* = .{};
    }

    /// Stores a commit, freeing any previous one from this batch.
    pub fn set_commit(self: *Batch, allocator: Allocator, text: []u8) void {
        if (self.commit) |old| allocator.free(old);
        self.commit = text;
    }

    /// Stores a preedit, freeing any previous one from this batch.
    pub fn set_preedit(self: *Batch, allocator: Allocator, preedit: Owned) void {
        if (self.preedit) |old| allocator.free(old.text);
        self.preedit = preedit;
    }
};
