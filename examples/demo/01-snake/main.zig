//! SDL demo/01-snake: grid-based snake game with wall wrapping and food growth.
//! Keyboard controls are always available; Linux evdev hats are polled explicitly.
const std = @import("std");
const zdl = @import("zdl");
const common = @import("common");

const board_width = 24;
const board_height = 18;
const block_pixels = 24;
const step_ns: i96 = 125 * std.time.ns_per_ms;

const Cell = enum(u3) { empty, right, up, left, down, food };
const Direction = enum { right, up, left, down };

const Snake = struct {
    cells: [board_width * board_height]Cell = @splat(.empty),
    head_x: u8 = board_width / 2,
    head_y: u8 = board_height / 2,
    tail_x: u8 = board_width / 2,
    tail_y: u8 = board_height / 2,
    next_direction: Direction = .right,
    tail_delay: u8 = 4,
    occupied_cells: u16 = 0,

    fn index(x: usize, y: usize) usize {
        return x + y * board_width;
    }

    fn cell_at(self: *const Snake, x: usize, y: usize) Cell {
        return self.cells[index(x, y)];
    }

    fn set_cell(self: *Snake, x: usize, y: usize, cell: Cell) void {
        self.cells[index(x, y)] = cell;
    }

    fn initialize(self: *Snake, random: *std.Random.DefaultPrng) void {
        @memset(&self.cells, .empty);
        self.head_x = board_width / 2;
        self.tail_x = self.head_x;
        self.head_y = board_height / 2;
        self.tail_y = self.head_y;
        self.next_direction = .right;
        self.tail_delay = 4;
        // These count semantics match SDL's example, including the three
        // reserved growth cells represented by the initial tail delay.
        self.occupied_cells = 3;
        self.set_cell(self.tail_x, self.tail_y, .right);
        for (0..4) |_| {
            self.new_food(random);
            self.occupied_cells += 1;
        }
    }

    fn redirect(self: *Snake, direction: Direction) void {
        const head = self.cell_at(self.head_x, self.head_y);
        const allowed = switch (direction) {
            .right => head != .left,
            .up => head != .down,
            .left => head != .right,
            .down => head != .up,
        };
        if (allowed) self.next_direction = direction;
    }

    fn step(self: *Snake, random: *std.Random.DefaultPrng) void {
        self.tail_delay -= 1;
        if (self.tail_delay == 0) {
            self.tail_delay = 1;
            const tail_cell = self.cell_at(self.tail_x, self.tail_y);
            self.set_cell(self.tail_x, self.tail_y, .empty);
            switch (tail_cell) {
                .right => self.tail_x = wrap(@as(i32, self.tail_x) + 1, board_width),
                .up => self.tail_y = wrap(@as(i32, self.tail_y) - 1, board_height),
                .left => self.tail_x = wrap(@as(i32, self.tail_x) - 1, board_width),
                .down => self.tail_y = wrap(@as(i32, self.tail_y) + 1, board_height),
                else => {},
            }
        }

        const previous_x = self.head_x;
        const previous_y = self.head_y;
        switch (self.next_direction) {
            .right => self.head_x = wrap(@as(i32, self.head_x) + 1, board_width),
            .up => self.head_y = wrap(@as(i32, self.head_y) - 1, board_height),
            .left => self.head_x = wrap(@as(i32, self.head_x) - 1, board_width),
            .down => self.head_y = wrap(@as(i32, self.head_y) + 1, board_height),
        }
        const destination = self.cell_at(self.head_x, self.head_y);
        if (destination != .empty and destination != .food) {
            self.initialize(random);
            return;
        }

        const direction_cell: Cell = switch (self.next_direction) {
            .right => .right,
            .up => .up,
            .left => .left,
            .down => .down,
        };
        self.set_cell(previous_x, previous_y, direction_cell);
        self.set_cell(self.head_x, self.head_y, direction_cell);
        if (destination == .food) {
            if (self.occupied_cells == board_width * board_height) {
                self.initialize(random);
                return;
            }
            self.new_food(random);
            self.tail_delay += 1;
            self.occupied_cells += 1;
        }
    }

    fn new_food(self: *Snake, random: *std.Random.DefaultPrng) void {
        var candidate = random.random().int(u32) % (board_width * board_height);
        while (true) {
            const x: usize = candidate % board_width;
            const y: usize = candidate / board_width;
            if (self.cell_at(x, y) == .empty) {
                self.set_cell(x, y, .food);
                return;
            }
            candidate = (candidate + 1) % (board_width * board_height);
        }
    }
};

const JoystickInput = struct {
    allocator: std.mem.Allocator,
    devices: []zdl.joystick.linux_evdev.Device,
    states: []zdl.joystick.joystick.Joystick,
    changes: std.ArrayList(zdl.joystick.joystick.Change) = .empty,

    fn init(allocator: std.mem.Allocator) !JoystickInput {
        const devices = zdl.joystick.linux_evdev.scan(allocator, .{}) catch |err| {
            std.debug.print("joystick scan unavailable: {s}\n", .{@errorName(err)});
            return .{ .allocator = allocator, .devices = &.{}, .states = &.{} };
        };
        errdefer {
            for (devices) |*device| device.deinit();
            allocator.free(devices);
        }
        const states = try allocator.alloc(zdl.joystick.joystick.Joystick, devices.len);
        var initialized: usize = 0;
        errdefer {
            for (states[0..initialized]) |*state| state.deinit();
            allocator.free(states);
        }
        for (devices, 0..) |*device, i| {
            states[i] = try device.create_joystick(allocator);
            initialized += 1;
        }
        return .{ .allocator = allocator, .devices = devices, .states = states };
    }

    fn deinit(self: *JoystickInput) void {
        for (self.states) |*state| state.deinit();
        self.allocator.free(self.states);
        for (self.devices) |*device| device.deinit();
        self.allocator.free(self.devices);
        self.changes.deinit(self.allocator);
        self.* = undefined;
    }

    fn poll(self: *JoystickInput, snake: *Snake) !void {
        self.changes.items.len = 0;
        for (self.devices, self.states) |*device, *state| {
            device.poll(self.allocator, state, &self.changes) catch continue;
        }
        for (self.changes.items) |change| switch (change.event) {
            .hat => |hat| switch (hat.value.bits()) {
                2 => snake.redirect(.right),
                1 => snake.redirect(.up),
                8 => snake.redirect(.left),
                4 => snake.redirect(.down),
                else => {}, // SDL's sample ignores diagonal hats.
            },
            else => {},
        };
    }
};

const App = struct {
    pub const render_width: u31 = board_width * block_pixels;
    pub const render_height: u31 = board_height * block_pixels;

    snake: Snake,
    random: *std.Random.DefaultPrng,
    joysticks: *JoystickInput,
    last_step_ns: i96 = 0,

    fn before_frame(self: *App, io: std.Io) !void {
        try self.joysticks.poll(&self.snake);
        const now = std.Io.Timestamp.now(io, .awake).nanoseconds;
        if (self.last_step_ns == 0) {
            self.last_step_ns = now;
            return;
        }
        while (now - self.last_step_ns >= step_ns) : (self.last_step_ns += step_ns) self.snake.step(self.random);
    }

    pub fn event(self: *App, _: *zdl.app.callbacks.Context, ev: zdl.app.callbacks.Event) zdl.app.callbacks.Result {
        switch (ev) {
            .key => |key| if (key.kind == .down) switch (key.keycode) {
                .escape, .q => return .success,
                .r => self.snake.initialize(self.random),
                .right => self.snake.redirect(.right),
                .up => self.snake.redirect(.up),
                .left => self.snake.redirect(.left),
                .down => self.snake.redirect(.down),
                else => {},
            },
            else => {},
        }
        return .@"continue";
    }
};

pub fn main(init: std.process.Init) !void {
    var random = std.Random.DefaultPrng.init(0x534e414b45);
    var snake: Snake = .{};
    snake.initialize(&random);
    var joysticks = try JoystickInput.init(init.gpa);
    defer joysticks.deinit();
    var app = App{ .snake = snake, .random = &random, .joysticks = &joysticks };
    try common.run(App, &app, init, "examples/demo/snake", frame);
}

fn frame(app: *App, renderer: *common.Renderer, _: usize) !void {
    try common.clear(renderer, .{ .r = 0, .g = 0, .b = 0, .a = 255 });
    for (0..board_height) |y| {
        for (0..board_width) |x| {
            const cell = app.snake.cell_at(x, y);
            if (cell == .empty) continue;
            renderer.set_draw_color(if (cell == .food) .{ .r = 80, .g = 80, .b = 255, .a = 255 } else .{ .r = 0, .g = 128, .b = 0, .a = 255 });
            try renderer.fill_rect(.{ .x = @floatFromInt(x * block_pixels), .y = @floatFromInt(y * block_pixels), .width = block_pixels, .height = block_pixels });
        }
    }
    renderer.set_draw_color(.{ .r = 255, .g = 255, .b = 0, .a = 255 });
    try renderer.fill_rect(.{
        .x = @as(f32, @floatFromInt(app.snake.head_x)) * block_pixels,
        .y = @as(f32, @floatFromInt(app.snake.head_y)) * block_pixels,
        .width = block_pixels,
        .height = block_pixels,
    });
}

fn wrap(value: i32, limit: usize) u8 {
    return @intCast(@mod(value, @as(i32, limit)));
}
