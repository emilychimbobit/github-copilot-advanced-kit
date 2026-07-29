---
name: "Pre-commit Hooks Setup"
description: "Guide for setting up and using pre-commit hooks to validate commits before they are made"
---

# Pre-commit Hooks - Quick Start

## What are pre-commit hooks?

Pre-commit hooks are scripts that run automatically **before** each Git commit is created. They validate your changes and can prevent commits that don't meet quality standards.

## Quick Setup

### Linux/macOS

```bash
bash scripts/install-hooks.sh
```

### Windows (PowerShell)

```powershell
.\scripts\install-hooks.ps1
```

### Windows (Git Bash)

```bash
bash scripts/install-hooks.sh
```

## What Gets Validated?

The pre-commit hook checks:

1. ✅ **Copilot Configuration** - Validates `.github/copilot-instructions.md`, `AGENTS.md`, skills, and other configuration files
2. 🔐 **Secrets Detection** - Scans for passwords, API keys, tokens, and other sensitive patterns
3. 📄 **File Integrity** - Ensures JSON is valid in critical configuration files
4. 📋 **YAML Frontmatter** - Validates instruction and skill files have proper YAML headers
5. 📦 **File Size Warnings** - Alerts if large files are being committed

## Examples

### Example 1: Successful Commit

```bash
# Make a small documentation change
echo "## New Feature" >> docs/README.md

git add docs/README.md
git commit -m "docs: add new feature section"

# Output:
# 🔍 Running pre-commit validations...
# ✓ Pre-commit validation passed
# [master abc1234] docs: add new feature section
```

### Example 2: Blocked Commit - Invalid Configuration

If you accidentally modify `.github/copilot-instructions.md` with invalid YAML:

```bash
# Edit and save invalid YAML
git add .github/copilot-instructions.md
git commit -m "fix: update instructions"

# Output:
# ✗ Pre-commit validation failed
# Fix the issues above before committing
# 
# Commit rejected! Review the errors and try again.
```

### Example 3: Blocked Commit - Potential Secret

```bash
# Accidentally add a password to a config file
echo 'db_password="super_secret_123"' > config.json

git add config.json
git commit -m "add db config"

# Output:
# ⚠ Potential secret in config.json: password\s*=\s*[''"].*[''"]
# ✗ Pre-commit validation failed
# Fix the issues above before committing
```

### Example 4: Warning - Large File

```bash
# Add a large binary file
git add large-dataset.bin  # 50MB file

git commit -m "add dataset"

# Output:
# ⚠ Large files detected:
# large-dataset.bin (50MB)
# Consider using Git LFS or splitting changes
# ✓ Pre-commit validation passed (warning only)
# [master abc1234] add dataset
```

## Bypass Hooks (When Necessary)

⚠️ **Use with caution!** Only bypass hooks if you have a very good reason.

```bash
git commit --no-verify
```

## Testing the Hook

### Test manual execution:

**PowerShell (Windows):**
```powershell
.\.githooks\pre-commit.ps1
```

**Bash (Linux/macOS/Git Bash):**
```bash
./.githooks/pre-commit
```

### Test with staged changes:

```bash
# Stage some changes
git add some-file.ts

# Run the hook
bash ./.githooks/pre-commit  # Linux/macOS
# or
.\.githooks\pre-commit.ps1   # PowerShell

# Check the exit code
echo $?  # or $LastExitCode in PowerShell
```

## Troubleshooting

### Hook doesn't run on commit

Check if hooks are configured:
```bash
git config core.hooksPath
# Should output: .githooks
```

If empty, reinstall:
```bash
bash scripts/install-hooks.sh     # Linux/macOS
# or
.\scripts\install-hooks.ps1        # Windows PowerShell
```

### "Permission denied" error (Linux/macOS)

```bash
chmod +x ./.githooks/pre-commit
```

### Python 3 not found

Install Python 3 or check the error in detail:
```bash
which python3
python3 --version
```

### Hook reports false positive

Review the validation and consider if it's a real issue or if the pattern needs updating.

## Integration with CI/CD

The same validations run in GitHub Actions. Commits that pass pre-commit hooks will be more likely to pass CI/CD checks.

## Related Documentation

- [`.githooks/README.md`](.githooks/README.md) - Detailed hook documentation
- [CONTRIBUTING.md](CONTRIBUTING.md) - Contributing guidelines
- [Security Policy](SECURITY.md) - Security best practices

## FAQ

**Q: Can I skip validation for a specific file?**
A: You can bypass the hook with `git commit --no-verify`, but it's not recommended.

**Q: Does the hook modify my files?**
A: No, it only validates and reports issues. Your files are unchanged.

**Q: What if I want to add custom validations?**
A: Edit `.githooks/pre-commit` or `.githooks/pre-commit.ps1` and add your checks.

**Q: Is the hook required?**
A: It's strongly recommended. It helps maintain code quality and prevents common mistakes.
