
/// Lower C labels, loops, and switch fallthrough to explicit Zig control flow.
/// Local storage is hoisted, while initialization stays at its C execution point.
const ControlFlow = struct {
    t: *Translator,
    scope: *Scope.Block,
    pc_name: []const u8,
    blocks: std.ArrayList(Block) = .empty,
    current: ?usize = null,
    labels: std.StringHashMapUnmanaged(usize) = .empty,
    variables: std.AutoHashMapUnmanaged(Node.Index, []const u8) = .empty,
    parameters: std.StringHashMapUnmanaged([]const u8) = .empty,

    const Block = struct {
        instructions: std.ArrayList(ZigNode) = .empty,
        terminal: ?Terminal = null,
    };
    const Branch = struct { condition: ZigNode, yes: usize, no: usize };
    const Case = struct { value: ZigNode, target: usize };
    const Dispatch = struct {
        condition: ZigNode,
        cases: std.ArrayList(Case) = .empty,
        fallback: usize,
    };
    const Terminal = union(enum) { jump: usize, branch: Branch, dispatch: *Dispatch, finish: ZigNode };

    fn needed(tree: *const Tree, stmt: Node.Index) bool {
        return switch (stmt.get(tree)) {
            .goto_stmt, .labeled_stmt, .switch_stmt => true,
            .compound_stmt => |v| blk: {
                for (v.body) |child| if (needed(tree, child)) break :blk true;
                break :blk false;
            },
            .if_stmt => |v| needed(tree, v.then_body) or if (v.else_body) |other| needed(tree, other) else false,
            .while_stmt => |v| needed(tree, v.body),
            .do_while_stmt => |v| needed(tree, v.body),
            .for_stmt => |v| needed(tree, v.body),
            else => false,
        };
    }

    fn newBlock(c: *ControlFlow) !usize {
        const index = c.blocks.items.len;
        try c.blocks.append(c.t.arena, .{});
        return index;
    }

    fn terminal(c: *ControlFlow, term: Terminal) void {
        if (c.current) |index| c.blocks.items[index].terminal = term;
        c.current = null;
    }

    fn start(c: *ControlFlow, index: usize) void {
        c.terminal(.{ .jump = index });
        c.current = index;
    }

    fn instruction(c: *ControlFlow, node: ZigNode) !void {
        if (c.current) |index| switch (node.tag()) {
            .declaration, .empty_block => {},
            else => try c.blocks.items[index].instructions.append(c.t.arena, node),
        };
    }

    fn hoist(c: *ControlFlow, stmt: Node.Index) TransError!void {
        const t = c.t;
        switch (stmt.get(t.tree)) {
            .compound_stmt => |v| for (v.body) |child| try c.hoist(child),
            .decl_stmt => |v| for (v.decls) |child| try c.hoist(child),
            .variable => |v| {
                if (c.variables.contains(stmt)) return;
                var copy = v;
                if (v.storage_class == .auto or v.storage_class == .register) {
                    copy.initializer = null;
                    copy.qt.@"const" = false;
                }
                const begin = c.scope.statements.items.len;
                const alias_begin = c.scope.variables.items.len;
                try t.transVarDecl(&c.scope.base, copy, stmt);
                const name = c.scope.variables.items[alias_begin].alias;
                try c.variables.put(t.arena, stmt, name);
                if (v.storage_class == .auto or v.storage_class == .register) {
                    for (c.scope.statements.items[begin..]) |node| {
                        if (node.castTag(.var_decl)) |decl| decl.data.is_const = false;
                    }
                }
            },
            .typedef, .struct_decl, .union_decl, .enum_decl,
            .struct_forward_decl, .union_forward_decl, .enum_forward_decl,
            => { _ = try t.transStmt(&c.scope.base, stmt); },
            .if_stmt => |v| {
                try c.hoist(v.then_body);
                if (v.else_body) |other| try c.hoist(other);
            },
            .while_stmt => |v| try c.hoist(v.body),
            .do_while_stmt => |v| try c.hoist(v.body),
            .for_stmt => |v| {
                if (v.init) |init| try c.hoist(init);
                try c.hoist(v.body);
            },
            .switch_stmt => |v| try c.hoist(v.body),
            .case_stmt => |v| try c.hoist(v.body),
            .default_stmt => |v| try c.hoist(v.body),
            .labeled_stmt => |v| {
                const name = t.tree.tokSlice(v.label_tok);
                if (!c.labels.contains(name)) try c.labels.put(t.arena, name, try c.newBlock());
                try c.hoist(v.body);
            },
            else => {},
        }
    }

    fn lower(c: *ControlFlow, stmt: Node.Index, break_to: ?usize, continue_to: ?usize, dispatch: ?*Dispatch) TransError!void {
        const t = c.t;
        const scope = &c.scope.base;
        switch (stmt.get(t.tree)) {
            .compound_stmt => |v| for (v.body) |child| try c.lower(child, break_to, continue_to, dispatch),
            .decl_stmt => |v| for (v.decls) |child| try c.lower(child, break_to, continue_to, dispatch),
            .variable => |v| {
                if (v.storage_class != .auto and v.storage_class != .register) return;
                if (v.initializer) |init| {
                    const type_node = try t.transTypeInit(scope, v.qt, init, v.name_tok);
                    const rhs = if (init.get(t.tree) == .string_literal_expr)
                        try t.transStringLiteralInitializer(init, init.get(t.tree).string_literal_expr, type_node)
                    else try t.transExprCoercing(scope, init, .used);
                    try c.instruction(try ZigTag.assign.create(t.arena, .{
                        .lhs = try ZigTag.identifier.create(t.arena, c.variables.get(stmt).?),
                        .rhs = try t.toNonBool(rhs, v.qt),
                    }));
                }
            },
            .typedef, .struct_decl, .union_decl, .enum_decl,
            .struct_forward_decl, .union_forward_decl, .enum_forward_decl => {},
            .if_stmt => |v| {
                const yes = try c.newBlock();
                const no = try c.newBlock();
                const after = try c.newBlock();
                c.terminal(.{ .branch = .{ .condition = try t.transBoolExpr(scope, v.cond), .yes = yes, .no = no } });
                c.current = yes;
                try c.lower(v.then_body, break_to, continue_to, dispatch);
                c.terminal(.{ .jump = after });
                c.current = no;
                if (v.else_body) |other| try c.lower(other, break_to, continue_to, dispatch);
                c.terminal(.{ .jump = after });
                c.current = after;
            },
            .while_stmt => |v| {
                const condition = try c.newBlock();
                const body = try c.newBlock();
                const after = try c.newBlock();
                c.start(condition);
                c.terminal(.{ .branch = .{ .condition = try t.transBoolExpr(scope, v.cond), .yes = body, .no = after } });
                c.current = body;
                try c.lower(v.body, after, condition, dispatch);
                c.terminal(.{ .jump = condition });
                c.current = after;
            },
            .do_while_stmt => |v| {
                const body = try c.newBlock();
                const condition = try c.newBlock();
                const after = try c.newBlock();
                c.start(body);
                try c.lower(v.body, after, condition, dispatch);
                c.start(condition);
                c.terminal(.{ .branch = .{ .condition = try t.transBoolExpr(scope, v.cond), .yes = body, .no = after } });
                c.current = after;
            },
            .for_stmt => |v| {
                if (v.init) |init| try c.lower(init, break_to, continue_to, dispatch);
                const condition = try c.newBlock();
                const body = try c.newBlock();
                const increment = try c.newBlock();
                const after = try c.newBlock();
                c.start(condition);
                c.terminal(.{ .branch = .{ .condition = if (v.cond) |cond| try t.transBoolExpr(scope, cond) else ZigTag.true_literal.init(), .yes = body, .no = after } });
                c.current = body;
                try c.lower(v.body, after, increment, dispatch);
                c.start(increment);
                if (v.incr) |incr| try c.lower(incr, break_to, continue_to, dispatch);
                c.terminal(.{ .jump = condition });
                c.current = after;
            },
            .switch_stmt => |v| {
                const after = try c.newBlock();
                const next = try t.arena.create(Dispatch);
                next.* = .{ .condition = try t.transExpr(scope, v.cond, .used), .fallback = after };
                c.terminal(.{ .dispatch = next });
                try c.lower(v.body, after, continue_to, next);
                c.terminal(.{ .jump = after });
                c.current = after;
            },
            .case_stmt => |v| {
                const target = try c.newBlock();
                c.start(target);
                const value = if (v.end) |end|
                    try ZigTag.ellipsis3.create(t.arena, .{ .lhs = try t.transExpr(scope, v.start, .used), .rhs = try t.transExpr(scope, end, .used) })
                else try t.transExpr(scope, v.start, .used);
                try dispatch.?.cases.append(t.arena, .{ .value = value, .target = target });
                try c.lower(v.body, break_to, continue_to, dispatch);
            },
            .default_stmt => |v| {
                const target = try c.newBlock();
                c.start(target);
                dispatch.?.fallback = target;
                try c.lower(v.body, break_to, continue_to, dispatch);
            },
            .goto_stmt => |v| c.terminal(.{ .jump = c.labels.get(t.tree.tokSlice(v.label_tok)).? }),
            .labeled_stmt => |v| {
                c.start(c.labels.get(t.tree.tokSlice(v.label_tok)).?);
                try c.lower(v.body, break_to, continue_to, dispatch);
            },
            .break_stmt => c.terminal(.{ .jump = break_to.? }),
            .continue_stmt => c.terminal(.{ .jump = continue_to.? }),
            .return_stmt => |v| c.terminal(.{ .finish = try t.transReturnStmt(scope, v) }),
            else => try c.instruction(try t.transStmt(scope, stmt)),
        }
    }

    fn number(c: *ControlFlow, value: usize) !ZigNode {
        return ZigTag.integer_literal.create(c.t.arena, try std.fmt.allocPrint(c.t.arena, "{d}", .{value}));
    }

    fn jump(c: *ControlFlow, target: usize) !ZigNode {
        return ZigTag.block.create(c.t.arena, .{ .label = null, .stmts = try c.t.arena.dupe(ZigNode, &.{
            try ZigTag.assign.create(c.t.arena, .{ .lhs = try ZigTag.identifier.create(c.t.arena, c.pc_name), .rhs = try c.number(target) }),
            ZigTag.@"continue".init(),
        }) });
    }

    fn emitTerminal(c: *ControlFlow, term: Terminal) !ZigNode {
        return switch (term) {
            .jump => |target| c.jump(target),
            .finish => |node| node,
            .branch => |v| ZigTag.@"if".create(c.t.arena, .{ .cond = v.condition, .then = try c.jump(v.yes), .@"else" = try c.jump(v.no) }),
            .dispatch => |v| blk: {
                var prongs: std.ArrayList(ZigNode) = .empty;
                for (v.cases.items) |case| try prongs.append(c.t.arena, try ZigTag.switch_prong.create(c.t.arena, .{
                    .cases = try c.t.arena.dupe(ZigNode, &.{case.value}), .cond = try c.jump(case.target),
                }));
                try prongs.append(c.t.arena, try ZigTag.switch_else.create(c.t.arena, try c.jump(v.fallback)));
                break :blk try ZigTag.@"switch".create(c.t.arena, .{ .cond = v.condition, .cases = try prongs.toOwnedSlice(c.t.arena) });
            },
        };
    }

    fn translate(t: *Translator, scope: *Scope.Block, body: Node.CompoundStmt, params: []const aro.TypeStore.Type.Func.Param) TransError!void {
        var c: ControlFlow = .{ .t = t, .scope = scope, .pc_name = try scope.makeMangledName("sdl_pc") };
        const saved = t.control_flow;
        t.control_flow = &c;
        defer t.control_flow = saved;
        for (params) |param| {
            const name = t.tree.tokSlice(param.name_tok);
            const alias = scope.base.getAlias(name) orelse name;
            try c.parameters.put(t.arena, name, alias);
            if (param.node.unpack()) |node| try c.variables.put(t.arena, node, alias);
        }
        const first = try c.newBlock();
        for (body.body) |stmt| try c.hoist(stmt);
        c.current = first;
        for (body.body) |stmt| try c.lower(stmt, null, null, null);
        c.terminal(.{ .finish = if (scope.return_type.?.is(t.comp, .void)) ZigTag.return_void.init() else ZigTag.@"unreachable".init() });
        try scope.statements.append(t.gpa, try ZigTag.var_decl.create(t.arena, .{
            .is_pub = false, .is_const = false, .is_extern = false, .is_export = false,
            .is_threadlocal = false, .linksection_string = null, .alignment = null,
            .name = c.pc_name, .type = try ZigTag.type.create(t.arena, "usize"), .init = try c.number(first),
        }));
        var prongs: std.ArrayList(ZigNode) = .empty;
        for (c.blocks.items, 0..) |*block, index| {
            try block.instructions.append(t.arena, try c.emitTerminal(block.terminal orelse .{ .finish = ZigTag.@"unreachable".init() }));
            try prongs.append(t.arena, try ZigTag.switch_prong.create(t.arena, .{
                .cases = try t.arena.dupe(ZigNode, &.{try c.number(index)}),
                .cond = try ZigTag.block.create(t.arena, .{ .label = null, .stmts = try block.instructions.toOwnedSlice(t.arena) }),
            }));
        }
        try prongs.append(t.arena, try ZigTag.switch_else.create(t.arena, ZigTag.@"unreachable".init()));
        const dispatch = try ZigTag.@"switch".create(t.arena, .{ .cond = try ZigTag.identifier.create(t.arena, c.pc_name), .cases = try prongs.toOwnedSlice(t.arena) });
        try scope.statements.append(t.gpa, try ZigTag.while_true.create(t.arena, try ZigTag.block.create(t.arena, .{
            .label = null, .stmts = try t.arena.dupe(ZigNode, &.{dispatch}),
        })));
    }
};
