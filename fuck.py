#!/usr/bin/env python3

import re
from collections import defaultdict
from pathlib import PurePosixPath

LINE_RE = re.compile(r'^\s*([0-9.]+)s\s+(.*)$')

files = defaultdict(float)
dirs = defaultdict(float)
misc = defaultdict(float)

with open("output.txt", encoding="utf8", errors="replace") as f:
    for line in f:
        m = LINE_RE.match(line)
        if not m:
            continue

        seconds = float(m.group(1))
        text = m.group(2).strip()

        # Compiler error?
        if ":error:" in text:
            filename = text.split(":error:")[0]
            filename = filename.rsplit(":", 1)[0]

            files[filename] += seconds

            p = PurePosixPath(filename)

            for i in range(1, len(p.parts)):
                dirs["/".join(p.parts[:i])] += seconds

        # Include
        elif text.startswith("including "):
            filename = text[len("including "):]

            files[filename] += seconds

            p = PurePosixPath(filename)

            for i in range(1, len(p.parts)):
                dirs["/".join(p.parts[:i])] += seconds

        else:
            misc[text] += seconds


def dump(title, d, n=30):
    print(f"\n--{title}")
    for k, v in sorted(d.items(), key=lambda x: x[1], reverse=True)[:n]:
        print(f"{v:8.4f}s  {k}")


dump("dirs top", dirs)
dump("files", files)
dump("compiler stages (can be dismissed prolly)", misc)

class Node:
    def __init__(self, name):
        self.name = name
        self.time = 0.0
        self.children = {}

root = Node("")

for filename, seconds in files.items():
    node = root
    node.time += seconds

    for part in PurePosixPath(filename).parts:
        if part not in node.children:
            node.children[part] = Node(part)

        node = node.children[part]
        node.time += seconds


def print_tree(node, prefix=""):
    children = sorted(
        node.children.values(),
        key=lambda c: c.time,
        reverse=True
    )

    for i, child in enumerate(children):
        last = i == len(children) - 1

        print(
            f"{prefix}{'└──' if last else '├──'} "
            f"{child.name:<30} {child.time:.4f}s"
        )

        print_tree(
            child,
            prefix + ("    " if last else "│   ")
        )

print_tree(root)

print("\n -- dir tree -- ")
print(f"code{'':<30} {dirs['code']:8.4f}s")
print_tree(root.children["code"], min_time=0.05)
