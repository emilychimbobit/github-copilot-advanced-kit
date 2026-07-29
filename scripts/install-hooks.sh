#!/usr/bin/env bash
# Install pre-commit hooks for this repository
# Run this from the repository root

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HOOKS_DIR="$REPO_ROOT/.githooks"

echo "Installing pre-commit hooks..."
echo

# Make hooks executable
echo "📋 Making hooks executable..."
for hook in "$HOOKS_DIR"/*; do
    if [[ -f "$hook" && ! "$hook" =~ \.ps1$ ]]; then
        chmod +x "$hook"
        echo "  ✓ $(basename "$hook")"
    fi
done
echo

# Configure git to use custom hooks directory
echo "⚙️  Configuring git core.hooksPath..."
if git config core.hooksPath .githooks; then
    echo "  ✓ Git configured to use .githooks directory"
else
    echo "  ✗ Failed to configure git core.hooksPath"
    exit 1
fi
echo

# Verify installation
echo "✅ Verifying installation..."
if [[ -f "$HOOKS_DIR/pre-commit" ]]; then
    echo "  ✓ pre-commit hook found"
    if [[ -x "$HOOKS_DIR/pre-commit" ]]; then
        echo "  ✓ pre-commit hook is executable"
    else
        echo "  ✗ pre-commit hook is not executable"
    fi
fi
echo

# Information
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✓ Pre-commit hooks installed successfully!"
echo ""
echo "The following hooks are now active:"
echo "  • pre-commit: Validates configuration before each commit"
echo ""
echo "To test the hook manually:"
echo "  git diff --cached"
echo "  .githooks/pre-commit"
echo ""
echo "To bypass hooks (not recommended):"
echo "  git commit --no-verify"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
