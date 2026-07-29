---
name: "Setup Pre-commit Hooks"
description: "Installation and configuration guide for pre-commit hooks"
---

# Pre-commit Hooks - Installation Summary

## 📋 Overview

A pre-commit hook has been added to validate changes before they are committed to the repository. This ensures code quality, prevents secrets from being committed, and maintains configuration integrity.

## 📁 Files Created

### Hook Scripts
- **`.githooks/pre-commit`** - Bash version of the pre-commit hook (Linux/macOS/Git Bash)
- **`.githooks/pre-commit.ps1`** - PowerShell version of the pre-commit hook (Windows PowerShell)
- **`.githooks/README.md`** - Detailed documentation about hooks

### Installation Scripts
- **`scripts/install-hooks.sh`** - Bash script to install hooks on Linux/macOS
- **`scripts/install-hooks.ps1`** - PowerShell script to install hooks on Windows

### Documentation
- **`docs/GUIA-HOOKS-PRECOMMIT.md`** - Quick start guide with examples

## ✅ What the Hook Validates

1. **Copilot Configuration** 
   - Validates `.github/copilot-instructions.md`
   - Validates `AGENTS.md`
   - Validates instruction files (`.instructions.md`)
   - Validates skill files (`/SKILL.md`)

2. **Secrets Detection**
   - Passwords
   - API keys
   - Tokens
   - AWS credentials
   - Private keys

3. **File Integrity**
   - JSON validation for `.vscode/mcp.json`, `.vscode/settings.json`
   - YAML frontmatter in instruction/skill files

4. **File Size Warnings**
   - Alerts for files larger than 1MB

## 🚀 Installation

### For Linux/macOS Users

```bash
bash scripts/install-hooks.sh
```

### For Windows Users (PowerShell)

```powershell
.\scripts\install-hooks.ps1
```

### For Windows Users (Git Bash)

```bash
bash scripts/install-hooks.sh
```

### Manual Installation

```bash
git config core.hooksPath .githooks
chmod +x .githooks/pre-commit  # Linux/macOS only
```

## 🧪 Test the Installation

### Test Hook Execution

**PowerShell:**
```powershell
.\.githooks\pre-commit.ps1
```

**Bash:**
```bash
./.githooks/pre-commit
```

### Test with a Real Commit

```bash
git add -A
git commit -m "test: pre-commit hook installation"

# Should output validation messages
# If all checks pass, commit will proceed
```

## 📖 Documentation Links

- [`.githooks/README.md`](.githooks/README.md) - Complete hook documentation
- [`docs/GUIA-HOOKS-PRECOMMIT.md`](docs/GUIA-HOOKS-PRECOMMIT.md) - Quick start guide with examples
- [CONTRIBUTING.md](CONTRIBUTING.md) - Updated contributing guidelines

## ⚙️ Configuration

After running the installation script (or configuring manually), Git will be set to use the `.githooks` directory:

    git config core.hooksPath
    # Output: .githooks

This setting is stored per-clone in `.git/config` (it is not committed to the repository).
## 🔄 Workflow Integration

The pre-commit hook:
- ✅ Runs **automatically** before each commit
- ✅ Prevents commits with configuration errors
- ✅ Prevents commits with potential secrets
- ✅ Can be bypassed with `git commit --no-verify` (not recommended)
- ✅ Works on Windows, macOS, and Linux

## 🛠️ Customization

To add or modify validations:

1. Edit `.githooks/pre-commit` (Bash version)
2. Edit `.githooks/pre-commit.ps1` (PowerShell version)
3. Add your validation logic
4. Test the hook: `./.githooks/pre-commit` or `.\.githooks\pre-commit.ps1`

## 🔗 Compatibility

### Operating Systems
- ✅ Linux (Bash)
- ✅ macOS (Bash)
- ✅ Windows 10/11 (PowerShell)
- ✅ Windows with Git Bash
- ✅ GitHub Actions (CI/CD)

### Git Versions
- ✅ Git 2.9+ (for `core.hooksPath` support)

## 📝 Notes

- Hooks are **not** copied to other developers' repositories automatically
- Each developer must run the installation script after cloning
- Consider adding a CI/CD check that fails if hooks are not installed
- Pre-commit hooks run **before** commit is created, not after

## 🚨 Troubleshooting

### Hook not running?
```bash
git config core.hooksPath
# Should output: .githooks
```

### Permission denied (Linux/macOS)?
```bash
chmod +x ./.githooks/pre-commit
```

### Need to bypass for a specific commit?
```bash
git commit --no-verify
# NOT RECOMMENDED - Use only in exceptional cases
```

For more troubleshooting, see [`.githooks/README.md`](.githooks/README.md).

## 📋 Changes Made to Existing Files

**CONTRIBUTING.md**
- Added setup section with hook installation instructions
- Updated workflow with automatic hook validation
- Added link to hook documentation

---

**Status:** ✅ Ready to use

**Next Steps:**
1. Run the installation script for your OS
2. Test with `git commit -m "test"`
3. Review the validation output
4. Start developing with automatic commit validation!
