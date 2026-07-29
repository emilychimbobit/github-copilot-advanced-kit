# Pre-commit Hooks

This directory contains Git hooks that validate your changes before committing.

## Overview

The pre-commit hook validates:

- **Copilot Configuration**: Ensures `.github/copilot-instructions.md`, `AGENTS.md`, and other configuration files are valid
- **Secrets Detection**: Scans for common patterns like passwords, API keys, and tokens
- **File Integrity**: Validates JSON syntax in critical configuration files
- **Frontmatter Validation**: Ensures instruction and skill files have proper YAML frontmatter
- **File Size Warnings**: Alerts when large files are being committed

## Installation

### On Linux/macOS (Bash):

```bash
bash scripts/install-hooks.sh
```

### On Windows (PowerShell):

```powershell
.\scripts\install-hooks.ps1
```

Or manually configure git:

```bash
git config core.hooksPath .githooks
chmod +x .githooks/pre-commit  # Linux/macOS only
```

## Available Hooks

### `pre-commit`

Runs automatically before each commit. Prevents commits with:
- Invalid Copilot configuration
- Potential secrets or sensitive data
- Malformed JSON in critical files
- Missing or invalid YAML frontmatter

**Manual invocation:**

```bash
# Bash/Linux/macOS
./.githooks/pre-commit

# PowerShell/Windows
.\.githooks\pre-commit.ps1
```

## Bypass Hooks (Not Recommended)

To skip hooks for a specific commit:

```bash
git commit --no-verify
```

⚠️ Only use this in exceptional circumstances. The hooks exist to maintain code quality and security.

## Troubleshooting

### Hook not running on commit

1. Verify installation:
   ```bash
   git config core.hooksPath
   # Should output: .githooks
   ```

2. Check hook is executable:
   ```bash
   ls -la .githooks/pre-commit
   # Should have 'x' permission on Linux/macOS
   ```

3. Reinstall hooks:
   ```bash
   bash scripts/install-hooks.sh  # Linux/macOS
   # or
   .\scripts\install-hooks.ps1     # Windows
   ```

### "Permission denied" error

On Linux/macOS:
```bash
chmod +x .githooks/pre-commit
```

### Hook fails with "python3 not found"

Install Python 3 or use the full path to your Python installation.

### Secrets detected but they're not real

Update the pattern in `.githooks/pre-commit` or use `git commit --no-verify` after confirming the content is safe.

## Development

### Testing the hook

Create a test commit:

```bash
echo "test" > test.txt
git add test.txt
git commit -m "test"
```

### Adding new validations

Edit `.githooks/pre-commit` or `.githooks/pre-commit.ps1` and add your validation. Make sure to:

1. Provide clear error messages
2. Exit with status 1 on failure, 0 on success
3. Document the validation in this README

### Git hook flow

When you run `git commit`, Git:

1. Looks up `core.hooksPath` (defaults to `.git/hooks`)
2. Finds `pre-commit` hook in that directory
3. Executes it with staged changes available
4. If hook exits with 0, commit proceeds
5. If hook exits with non-zero, commit is rejected

## Related Documentation

- [Contributing Guidelines](../CONTRIBUTING.md)
- [Copilot Instructions](../.github/copilot-instructions.md)
- [Security Policy](../SECURITY.md)

## Supported Systems

- **Linux**: Bash hook (`.githooks/pre-commit`)
- **macOS**: Bash hook (`.githooks/pre-commit`)
- **Windows**: Bash hook via Git Bash, or PowerShell hook (`.githooks/pre-commit.ps1`)

## License

Same as the repository.
