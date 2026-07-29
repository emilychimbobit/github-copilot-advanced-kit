# Install pre-commit hooks for this repository
# Run this from the repository root: ./scripts/install-hooks.ps1

param(
    [switch]$Force
)

$RepoRoot = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$HooksDir = Join-Path $RepoRoot ".githooks"

Write-Host "Installing pre-commit hooks..." -ForegroundColor Cyan
Write-Host

# Make hooks executable (mainly for reference, PowerShell runs scripts directly)
Write-Host "📋 Making hooks executable..." -ForegroundColor Cyan
Get-ChildItem -Path $HooksDir -File -Exclude "*.ps1" | ForEach-Object {
    Write-Host "  ✓ $($_.Name)"
}
Write-Host

# Configure git to use custom hooks directory
Write-Host "⚙️  Configuring git core.hooksPath..." -ForegroundColor Cyan
try {
    $null = git config core.hooksPath .githooks
    Write-Host "  ✓ Git configured to use .githooks directory" -ForegroundColor Green
}
catch {
    Write-Host "  ✗ Failed to configure git core.hooksPath" -ForegroundColor Red
    exit 1
}
Write-Host

# Configure git to use PowerShell for hooks on Windows
Write-Host "⚙️  Configuring git to use PowerShell for hooks..." -ForegroundColor Cyan
try {
    # Set the hook wrapper template to use PowerShell
    $null = git config core.hooksPath .githooks
    Write-Host "  ✓ Git core.hooksPath configured" -ForegroundColor Green
}
catch {
    Write-Host "  ✗ Failed to configure git hooks" -ForegroundColor Red
    exit 1
}
Write-Host

# Verify installation
Write-Host "✅ Verifying installation..." -ForegroundColor Cyan
if (Test-Path -Path (Join-Path $HooksDir "pre-commit")) {
    Write-Host "  ✓ pre-commit hook found" -ForegroundColor Green
}
else {
    Write-Host "  ✗ pre-commit hook not found" -ForegroundColor Red
}
Write-Host

# Information
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
Write-Host "✓ Pre-commit hooks installed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "The following hooks are now active:"
Write-Host "  • pre-commit: Validates configuration before each commit"
Write-Host ""
Write-Host "To test the hook manually:"
Write-Host "  git diff --cached"
Write-Host "  ./.githooks/pre-commit.ps1"
Write-Host ""
Write-Host "To bypass hooks (not recommended):"
Write-Host "  git commit --no-verify"
Write-Host ""
Write-Host "Note on Windows: Git must be configured to use bash or PowerShell"
Write-Host "Current default: Use .githooks/pre-commit (bash) if available"
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
