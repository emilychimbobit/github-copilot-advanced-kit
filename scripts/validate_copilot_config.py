#!/usr/bin/env python3
"""Validate GitHub Copilot customization structure without external packages."""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
errors: list[str] = []
warnings: list[str] = []


def error(message: str) -> None:
    errors.append(message)


def warning(message: str) -> None:
    warnings.append(message)


def read_frontmatter(path: Path) -> dict[str, str]:
    text = path.read_text(encoding="utf-8")
    if not text.startswith("---\n"):
        error(f"{path.relative_to(ROOT)}: missing YAML frontmatter")
        return {}
    end = text.find("\n---\n", 4)
    if end == -1:
        error(f"{path.relative_to(ROOT)}: unterminated YAML frontmatter")
        return {}
    data: dict[str, str] = {}
    current_key = None
    for raw in text[4:end].splitlines():
        if not raw.strip() or raw.lstrip().startswith("#"):
            continue
        if raw.startswith("  - ") and current_key:
            data[current_key] = data.get(current_key, "") + "|" + raw[4:].strip()
            continue
        match = re.match(r"^([A-Za-z0-9_-]+):\s*(.*)$", raw)
        if match:
            current_key = match.group(1)
            data[current_key] = match.group(2).strip().strip('"').strip("'")
    return data


required_files = [
    ".github/copilot-instructions.md",
    "AGENTS.md",
    ".vscode/mcp.json",
    ".vscode/settings.json",
    ".github/agents/architect.agent.md",
    ".github/prompts/plan-feature.prompt.md",
]
for rel in required_files:
    if not (ROOT / rel).exists():
        error(f"Missing required file: {rel}")

for rel in [".vscode/mcp.json", ".vscode/settings.json", ".vscode/extensions.json"]:
    path = ROOT / rel
    if path.exists():
        try:
            json.loads(path.read_text(encoding="utf-8"))
        except json.JSONDecodeError as exc:
            error(f"{rel}: invalid JSON: {exc}")

agent_names: set[str] = set()
for path in sorted((ROOT / ".github/agents").glob("*.agent.md")):
    fm = read_frontmatter(path)
    if not fm.get("description"):
        error(f"{path.relative_to(ROOT)}: agent requires description")
    key = path.stem.replace(".agent", "")
    if key in agent_names:
        error(f"Duplicate agent id: {key}")
    agent_names.add(key)

prompt_names: set[str] = set()
for path in sorted((ROOT / ".github/prompts").glob("*.prompt.md")):
    fm = read_frontmatter(path)
    name = fm.get("name") or path.name.removesuffix(".prompt.md")
    if name in prompt_names:
        error(f"Duplicate prompt name: {name}")
    prompt_names.add(name)
    agent = fm.get("agent")
    if agent and agent not in {"ask", "agent", "plan"} and agent not in agent_names:
        error(f"{path.relative_to(ROOT)}: unknown agent '{agent}'")

for path in sorted((ROOT / ".github/instructions").rglob("*.instructions.md")):
    fm = read_frontmatter(path)
    if not fm.get("applyTo"):
        error(f"{path.relative_to(ROOT)}: instructions require applyTo")

skill_names: set[str] = set()
for path in sorted((ROOT / ".github/skills").glob("*/SKILL.md")):
    fm = read_frontmatter(path)
    name = fm.get("name")
    if not name:
        error(f"{path.relative_to(ROOT)}: skill requires name")
    elif name in skill_names:
        error(f"Duplicate skill name: {name}")
    else:
        skill_names.add(name)
    if not fm.get("description"):
        error(f"{path.relative_to(ROOT)}: skill requires description")
    if name and path.parent.name != name:
        warning(f"{path.relative_to(ROOT)}: directory and skill name differ")

# Simple secret guard. Examples with explicit placeholders are allowed.
secret_patterns = [
    re.compile(r"ghp_[A-Za-z0-9]{20,}"),
    re.compile(r"github_pat_[A-Za-z0-9_]{20,}"),
    re.compile(r"AKIA[0-9A-Z]{16}"),
    re.compile(r"-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----"),
]
for path in ROOT.rglob("*"):
    if not path.is_file() or ".git" in path.parts or path.suffix in {".zip", ".png", ".jpg"}:
        continue
    try:
        text = path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        continue
    for pattern in secret_patterns:
        if pattern.search(text):
            error(f"{path.relative_to(ROOT)}: possible real secret pattern detected")

print(f"Agents: {len(agent_names)}")
print(f"Prompts: {len(prompt_names)}")
print(f"Skills: {len(skill_names)}")
print(f"Warnings: {len(warnings)}")
for item in warnings:
    print("WARNING:", item)
print(f"Errors: {len(errors)}")
for item in errors:
    print("ERROR:", item)

if errors:
    sys.exit(1)

print("Copilot customization validation passed.")
