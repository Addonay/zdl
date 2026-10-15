#!/usr/bin/env python3
"""Scratch generator for src/video/wayland/protocol.zig (not part of build.zig).

    python3 -I tools/gen/wayland_protocol.py > src/video/wayland/protocol.zig

Reads the protocol XML listed in FILES (wayland-scanner format) and emits:
  * one `binding.Interface` table per interface (requests, then events, in XML
    order, so opcodes match libwayland); `types` entries point at other emitted
    tables for object/new_id arguments that libwayland needs typed;
  * one wrapper struct per interface (`Surface` for wl_surface, `ZwpTextInputV3`
    for zwp_text_input_v3) with enums/bitfields and one function per request.

Wrappers marshal through binding.Library. Typed constructors use the library's
exported `wl_*_interface` for core objects (EXPORTED) and the emitted table
otherwise; they take their version from the parent proxy as wayland-scanner
does. Event listeners are hand-written in binding.zig because each needs a
private C trampoline that copies arguments into the inbox.
"""

import xml.etree.ElementTree as ET

ROOT = "/usr/share/"
FILES = [
    "wayland/wayland.xml",
    "wayland-protocols/stable/xdg-shell/xdg-shell.xml",
    "wayland-protocols/stable/viewporter/viewporter.xml",
    "wayland-protocols/staging/fractional-scale/fractional-scale-v1.xml",
    "wayland-protocols/staging/cursor-shape/cursor-shape-v1.xml",
    "wayland-protocols/staging/xdg-activation/xdg-activation-v1.xml",
    "wayland-protocols/unstable/xdg-decoration/xdg-decoration-unstable-v1.xml",
    "wayland-protocols/unstable/primary-selection/primary-selection-unstable-v1.xml",
    "wayland-protocols/unstable/text-input/text-input-unstable-v3.xml",
    "wayland-protocols/unstable/relative-pointer/relative-pointer-unstable-v1.xml",
    "wayland-protocols/unstable/pointer-constraints/pointer-constraints-unstable-v1.xml",
    "wayland-protocols/unstable/xdg-output/xdg-output-unstable-v1.xml",
    "wayland-protocols/staging/pointer-warp/pointer-warp-v1.xml",
    "wayland-protocols/unstable/tablet/tablet-unstable-v2.xml",
]

# Core interfaces exported by libwayland-client as `wl_<name>_interface`, as
# binding.Interfaces names them (the field is the name without `wl_`).
EXPORTED = {
    "wl_display", "wl_registry", "wl_callback", "wl_compositor", "wl_surface",
    "wl_region", "wl_shm", "wl_shm_pool", "wl_buffer", "wl_data_device_manager",
    "wl_data_device", "wl_data_source", "wl_data_offer", "wl_seat", "wl_pointer",
    "wl_keyboard", "wl_touch", "wl_output",
}

ZIG_KEYWORDS = set("""addrspace align allowzero and anyframe anytype asm async await
break callconv catch comptime const continue defer else enum errdefer error export
extern fn for if inline linksection noalias noinline nosuspend opaque or orelse packed
pub resume return struct suspend switch test threadlocal try union unreachable
usingnamespace var volatile while null true false undefined""".split())

ARG_SIG = {"int": "i", "uint": "u", "fixed": "f", "string": "s", "object": "o",
           "new_id": "n", "array": "a", "fd": "h"}


def ident(name):
    if name in ZIG_KEYWORDS or name[0].isdigit():
        return '@"' + name + '"'
    return name


def pascal(name):
    return "".join(part[:1].upper() + part[1:] for part in name.split("_"))


def wrapper(iface):
    """Wrapper struct name: the interface name without `wl_`, in PascalCase."""
    base = iface[3:] if iface.startswith("wl_") else iface
    return pascal(base)


def table(iface):
    return iface + "_interface"


def summary(node):
    desc = node.find("description")
    text = desc.get("summary", "") if desc is not None else ""
    return " ".join(text.split())


def expanded_args(msg):
    """Argument list as libwayland sees it: an untyped new_id (wl_registry.bind)
    is preceded by an implicit string interface name and uint version."""
    out = []
    for arg in msg.findall("arg"):
        if arg.get("type") == "new_id" and not arg.get("interface"):
            out.append({"name": "interface", "type": "string"})
            out.append({"name": "version", "type": "uint"})
        out.append({"name": arg.get("name"), "type": arg.get("type"),
                    "interface": arg.get("interface"), "enum": arg.get("enum"),
                    "allow-null": arg.get("allow-null")})
    return out


def signature(msg):
    since = int(msg.get("since", "1"))
    out = str(since) if since > 1 else ""
    for arg in expanded_args(msg):
        kind = arg["type"]
        code = ARG_SIG[kind]
        if arg.get("allow-null") == "true" and kind in ("string", "object"):
            code = "?" + code
        out += code
    return out


class Model:
    def __init__(self, paths):
        self.interfaces = []
        for path in paths:
            for node in ET.parse(ROOT + path).getroot().findall("interface"):
                self.interfaces.append(node)
        self.names = {node.get("name") for node in self.interfaces}
        # (interface name, enum name) -> enum node; unqualified references fall back
        # to a unique enum of that name in any interface, as wayland-scanner does.
        self.enums = {}
        for node in self.interfaces:
            for enum in node.findall("enum"):
                self.enums[(node.get("name"), enum.get("name"))] = enum

    def resolve_enum(self, owner, ref):
        if "." in ref:
            iface, name = ref.split(".", 1)
            return iface, self.enums[(iface, name)]
        if (owner, ref) in self.enums:
            return owner, self.enums[(owner, ref)]
        matches = [(i, n) for (i, n) in self.enums if n == ref]
        if len(matches) != 1:
            raise SystemExit("cannot resolve enum %r in %s" % (ref, owner))
        return matches[0][0], self.enums[matches[0]]

    def types_list(self, msg):
        refs = []
        for arg in expanded_args(msg):
            target = arg.get("interface")
            if arg["type"] in ("object", "new_id") and target in self.names:
                refs.append("&" + table(target))
            else:
                refs.append("null")
        return refs

    def emit_tables(self, out):
        for node in self.interfaces:
            name = node.get("name")
            requests = node.findall("request")
            events = node.findall("event")
            if requests:
                out.append("const %s_requests = [_]binding.Message{" % name)
                out.extend(self.message_line(msg) for msg in requests)
                out.append("};")
            if events:
                out.append("const %s_events = [_]binding.Message{" % name)
                out.extend(self.message_line(msg) for msg in events)
                out.append("};")
            out.append("pub const %s: binding.Interface = .{" % table(name))
            out.append('    .name = "%s",' % name)
            out.append("    .version = %s," % node.get("version", "1"))
            out.append("    .method_count = %d," % len(requests))
            out.append("    .methods = %s," % ("&%s_requests" % name if requests else "null"))
            out.append("    .event_count = %d," % len(events))
            out.append("    .events = %s," % ("&%s_events" % name if events else "null"))
            out.append("};")
            out.append("")

    def message_line(self, msg):
        refs = self.types_list(msg)
        types = "null" if not refs else "&[_]?*const binding.Interface{ %s }" % ", ".join(refs)
        return '    .{ .name = "%s", .signature = "%s", .types = %s },' % (msg.get("name"), signature(msg), types)

    def emit_wrappers(self, out):
        for node in self.interfaces:
            self.emit_interface(node, out)

    def emit_interface(self, node, out):
        iface = node.get("name")
        out.append("/// `%s` version %s." % (iface, node.get("version", "1")))
        out.append("pub const %s = struct {" % wrapper(iface))
        out.append('    pub const interface = "%s";' % iface)
        out.append("    pub const version: u32 = %s;" % node.get("version", "1"))
        for enum in node.findall("enum"):
            self.emit_enum(enum, out)
        for opcode, msg in enumerate(node.findall("request")):
            self.emit_request(iface, opcode, msg, out)
        out.append("};")
        out.append("")

    def emit_enum(self, enum, out):
        name = enum.get("name")
        entries = []
        seen = set()
        for entry in enum.findall("entry"):
            value = int(entry.get("value"), 0)
            if value in seen and enum.get("bitfield") != "true":
                continue
            seen.add(value)
            entries.append((entry.get("name"), value))
        if enum.get("bitfield") == "true":
            out.append("    pub const %s = struct {" % pascal(name))
            for key, value in entries:
                out.append("        pub const %s: u32 = %d;" % (ident(key), value))
            out.append("    };")
        else:
            out.append("    pub const %s = enum(u32) {" % pascal(name))
            for key, value in entries:
                out.append("        %s = %d," % (ident(key), value))
            out.append("        _,")
            out.append("    };")

    def param_type(self, owner, arg):
        kind = arg.get("type")
        nullable = arg.get("allow-null") == "true"
        if kind == "int":
            return "i32"
        if kind == "uint":
            if arg.get("enum"):
                iface, enum = self.resolve_enum(owner, arg.get("enum"))
                if enum.get("bitfield") == "true":
                    return "u32"
                return "%s.%s" % (wrapper(iface), pascal(enum.get("name")))
            return "u32"
        if kind == "fixed":
            return "f64"
        if kind == "string":
            return "?[:0]const u8" if nullable else "[:0]const u8"
        if kind == "object":
            return "?binding.Proxy" if nullable else "binding.Proxy"
        if kind == "fd":
            return "i32"
        if kind == "array":
            return "?*anyopaque"
        raise SystemExit("unsupported parameter type " + kind)

    def argument(self, owner, arg, name):
        kind = arg.get("type")
        if kind == "int":
            return ".{ .i = %s }" % name
        if kind == "uint":
            if arg.get("enum"):
                _, enum = self.resolve_enum(owner, arg.get("enum"))
                if enum.get("bitfield") != "true":
                    return ".{ .u = @backingInt(%s) }" % name
            return ".{ .u = %s }" % name
        if kind == "fixed":
            return ".{ .f = binding.fixed(%s) }" % name
        if kind == "string":
            if arg.get("allow-null") == "true":
                return ".{ .s = if (%s) |text| text.ptr else null }" % name
            return ".{ .s = %s.ptr }" % name
        if kind == "object":
            return ".{ .o = %s }" % name
        if kind == "fd":
            return ".{ .h = %s }" % name
        if kind == "array":
            return ".{ .a = %s }" % name
        raise SystemExit("unsupported argument type " + kind)

    def emit_request(self, owner, opcode, msg, out):
        name = msg.get("name")
        args = msg.findall("arg")
        new_ids = [a for a in args if a.get("type") == "new_id"]
        typed = [a for a in new_ids if a.get("interface")]
        untyped = [a for a in new_ids if not a.get("interface")]
        doc = summary(msg)
        params = ["lib: *const binding.Library", "self: binding.Proxy"]
        values = []
        for arg in expanded_args(msg):
            arg_name = arg["name"]
            kind = arg["type"]
            if kind == "new_id" and arg.get("interface"):
                values.append(".{ .o = null }")
                continue
            if kind == "new_id":
                # Untyped new_id (wl_registry.bind): the caller supplies the
                # interface table and version, which are the implicit string and
                # uint arguments that precede this id.
                params.append("interface_name: *const binding.Interface")
                params.append("version_number: u32")
                values.append(".{ .o = null }")
                continue
            if untyped and arg_name == "interface" and kind == "string":
                values.append(".{ .s = interface_name.name }")
                continue
            if untyped and arg_name == "version" and kind == "uint":
                values.append(".{ .u = version_number }")
                continue
            params.append("%s: %s" % (ident(arg_name), self.param_type(owner, arg)))
            values.append(self.argument(owner, arg, ident(arg_name)))
        # Typed/untyped constructors are the only requests returning a proxy.
        if typed:
            target = typed[0].get("interface")
            ref = "lib.interfaces.%s" % target[3:] if target in EXPORTED else "&" + table(target)
            if target not in self.names:
                raise SystemExit("unknown new_id interface " + target)
            ret = "binding.Error!binding.Proxy"
            call = "lib.constructor(self, %d, %s, &[_]binding.Argument{ %s })" % (opcode, ref, ", ".join(values))
        elif untyped:
            ret = "binding.Error!binding.Proxy"
            call = "lib.constructor_version(self, %d, interface_name, version_number, &[_]binding.Argument{ %s })" % (opcode, ", ".join(values))
        else:
            ret = "void"
            call = "lib.send(self, %d, &[_]binding.Argument{ %s })" % (opcode, ", ".join(values))
        if doc:
            out.append("    /// Request %d `%s`: %s" % (opcode, name, doc))
        else:
            out.append("    /// Request %d `%s`." % (opcode, name))
        out.append("    pub fn %s(%s) %s {" % (ident(name), ", ".join(params), ret))
        if ret == "void":
            out.append("        %s;" % call)
        else:
            out.append("        return %s;" % call)
        out.append("    }")
        out.append("")


HEADER = """//! Typed Wayland protocol tables and request wrappers, GENERATED by
//! `tools/gen/wayland_protocol.py` from the protocol XML in /usr/share/wayland and
//! /usr/share/wayland-protocols (run `python3 -I tools/gen/wayland_protocol.py > src/video/wayland/protocol.zig`, then zig fmt).
//! Do not edit by hand; change the generator instead. Private to the Wayland
//! backend.
//!
//! Request wrappers marshal through `binding.Library`. `binding.Interface` tables
//! carry the exact opcode order and argument signatures libwayland needs to
//! decode events. Event listeners are hand-written in `binding.zig`.
//!
//! Deliberate choices: the generator emits every interface of the listed files
//! (not only the ones the backend uses) so that object arguments always resolve.
//! Enum values are non-exhaustive (`_`), so unknown compositor values round-trip
//! instead of failing. Bitfield enums become structs of `u32` constants. The
//! untyped `wl_registry.bind` takes an explicit interface table and version.

const binding = @import("binding.zig");

"""


def main():
    model = Model(FILES)
    body = []
    model.emit_tables(body)
    wrappers = []
    model.emit_wrappers(wrappers)
    print(HEADER, end="")
    print("\n".join(body))
    print("// ---- request wrappers ----")
    print("\n".join(wrappers))


if __name__ == "__main__":
    main()
