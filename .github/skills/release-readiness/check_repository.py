#!/usr/bin/env python3
"""Read-only repository hygiene checks used by the release-readiness skill."""

from pathlib import Path
import subprocess
import sys

ROOT = Path.cwd()
required = ["README.md", ".github/copilot-instructions.md", "AGENTS.md"]
missing = [item for item in required if not (ROOT / item).exists()]

print("Repository:", ROOT)
print("Required files:", "OK" if not missing else f"MISSING {missing}")

try:
    result = subprocess.run(
        ["git", "status", "--porcelain"],
        cwd=ROOT,
        text=True,
        capture_output=True,
        check=False,
    )
    if result.returncode == 0:
        changes = [line for line in result.stdout.splitlines() if line.strip()]
        print("Working tree:", "clean" if not changes else f"{len(changes)} changed entries")
        for line in changes[:20]:
            print(" ", line)
    else:
        print("Git status unavailable:", result.stderr.strip())
except FileNotFoundError:
    print("Git executable not found")

secret_like = []
for pattern in ("*.pem", "*.key", "*.pfx", ".env", ".env.*"):
    secret_like.extend(p for p in ROOT.rglob(pattern) if ".git" not in p.parts)

if secret_like:
    print("Potential secret-bearing files present:")
    for path in secret_like[:20]:
        print(" ", path.relative_to(ROOT))
else:
    print("Potential secret-bearing files: none detected by filename")

sys.exit(1 if missing else 0)
