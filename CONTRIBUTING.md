# Contributing

## Setup

1. Clone or fork the repository.
2. Install pre-commit hooks:
   - **Linux/macOS**: `bash scripts/install-hooks.sh`
   - **Windows**: `.\scripts\install-hooks.ps1` or `bash scripts/install-hooks.sh`

## Development Workflow

1. Create or update an issue using the **Copilot-ready task** template.
2. Work in a short-lived branch.
3. Keep changes focused.
4. Pre-commit hooks will run automatically before each commit and validate:
   - Copilot configuration integrity
   - Secrets and sensitive patterns
   - JSON validity in critical files
   - YAML frontmatter in instruction/skill files
5. Ensure the pre-commit hook passes (run `python scripts/validate_copilot_config.py` for additional checks).
6. Open a pull request using the provided template.
7. Obtain human review before merge.

## Important Notes

- Changes to MCP, hooks, skills with scripts, or agent tool permissions require security review.
- The pre-commit hook runs automatically; to bypass (not recommended): `git commit --no-verify`
- See [`.githooks/README.md`](.githooks/README.md) for hook details and troubleshooting.
