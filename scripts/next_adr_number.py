#!/usr/bin/env python3
"""Compute and validate the next sequential ADR number under docs/adr.

Usage:
    python scripts/next_adr_number.py            # print next number, e.g. 0007
    python scripts/next_adr_number.py --check    # validate existing numbering (hook mode)

In --check mode the script exits non-zero if it finds duplicate ADR numbers
or filenames that don't follow the `NNNN-titulo-corto.md` convention. It
always prints the next available number so it can be surfaced to the agent
or user after a docs/adr/*.md file is created or edited.
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ADR_DIR = ROOT / "docs" / "adr"
ADR_PATTERN = re.compile(r"^(\d{4})-[a-z0-9]+(?:-[a-z0-9]+)*\.md$")


def find_adr_files() -> list[Path]:
    if not ADR_DIR.exists():
        return []
    return sorted(p for p in ADR_DIR.glob("*.md") if p.name.lower() != "readme.md")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--check",
        action="store_true",
        help="Validate numbering (duplicates, filename format) instead of only printing the next number.",
    )
    args = parser.parse_args()

    files = find_adr_files()
    numbers: dict[int, list[Path]] = {}
    malformed: list[Path] = []

    for path in files:
        match = ADR_PATTERN.match(path.name)
        if not match:
            malformed.append(path)
            continue
        number = int(match.group(1))
        numbers.setdefault(number, []).append(path)

    next_number = (max(numbers) + 1) if numbers else 1
    next_id = f"{next_number:04d}"

    errors: list[str] = []
    for number, paths in sorted(numbers.items()):
        if len(paths) > 1:
            names = ", ".join(p.name for p in paths)
            errors.append(f"Duplicate ADR number {number:04d}: {names}")
    for path in malformed:
        errors.append(
            f"{path.relative_to(ROOT)}: filename must match 'NNNN-titulo-corto.md'"
        )

    if args.check:
        for message in errors:
            print(f"ERROR: {message}")
        print(f"Next ADR number: {next_id}")
        return 1 if errors else 0

    print(next_id)
    return 0


if __name__ == "__main__":
    sys.exit(main())
