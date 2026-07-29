# Pre-commit hook: Validate Copilot configuration and repository integrity (PowerShell version)
# Prevents commits with configuration errors, secrets, or integrity issues

param(
    [switch]$Verbose
)

$RepoRoot = Split-Path -Parent $PSScriptRoot
$ExitCode = 0

# Colors for output
$Colors = @{
    Red    = "`e[0;31m"
    Yellow = "`e[1;33m"
    Green  = "`e[0;32m"
    Reset  = "`e[0m"
}

function Write-Status {
    param([string]$Message, [string]$Status = "Info")
    switch ($Status) {
        "Success" { Write-Host "✓ $Message" -ForegroundColor Green }
        "Error"   { Write-Host "✗ $Message" -ForegroundColor Red }
        "Warning" { Write-Host "⚠ $Message" -ForegroundColor Yellow }
        default   { Write-Host "ℹ $Message" }
    }
}

Write-Host "🔍 Running pre-commit validations..." -ForegroundColor Cyan
Write-Host

# 1. Validate Copilot configuration
Write-Host "📋 Validating Copilot configuration..." -ForegroundColor Cyan
try {
    $ValidationOutput = & python3 "$RepoRoot/scripts/validate_copilot_config.py" 2>&1
    Write-Status "Copilot configuration is valid" "Success"
}
catch {
    Write-Status "Copilot configuration validation failed" "Error"
    Write-Host $ValidationOutput
    $ExitCode = 1
}
Write-Host

# 2. Check for secrets and sensitive patterns
Write-Host "🔐 Checking for secrets and sensitive patterns..." -ForegroundColor Cyan
$SecretsFound = $false

$Patterns = @(
    'password\s*=\s*[''"].*[''"]',
    'api[_-]?key\s*=\s*[''"].*[''"]',
    'secret\s*=\s*[''"].*[''"]',
    'token\s*=\s*[''"].*[''"]',
    'aws_access_key',
    'private[_-]?key'
)

# Get staged files
$StagedFiles = git diff --cached --name-only --diff-filter=ACM 2>$null

foreach ($File in $StagedFiles) {
    # Skip binary and media files
    if ($File -match '\.(bin|lock|jpg|png|gif|zip|exe)$') {
        continue
    }
    
    # Check each pattern
    $Content = git show ":$File" 2>$null
    foreach ($Pattern in $Patterns) {
        if ($Content -match $Pattern) {
            Write-Status "Potential secret in $File : $Pattern" "Warning"
            $SecretsFound = $true
        }
    }
}

if (-not $SecretsFound) {
    Write-Status "No secrets detected" "Success"
}
else {
    Write-Status "Potential secrets found. Review before committing." "Error"
    $ExitCode = 1
}
Write-Host

# 3. Verify critical files integrity (if modified)
Write-Host "📁 Checking critical files integrity..." -ForegroundColor Cyan
$CriticalFiles = @(
    ".github/copilot-instructions.md",
    "AGENTS.md",
    ".vscode/mcp.json",
    ".vscode/settings.json"
)

$StagedFiles = git diff --cached --name-only 2>$null
foreach ($File in $CriticalFiles) {
    if ($File -in $StagedFiles) {
        if ($File -match '\.json$') {
            try {
                $Content = git show ":$File" 2>$null
                $null = $Content | ConvertFrom-Json
                Write-Status "$File has valid JSON" "Success"
            }
            catch {
                Write-Status "$File has invalid JSON" "Error"
                $ExitCode = 1
            }
        }
    }
}
Write-Host

# 4. Check for common issues in instruction/skill files
Write-Host "📚 Validating instruction and skill files..." -ForegroundColor Cyan
$InstructionFiles = git diff --cached --name-only --diff-filter=ACM 2>$null | Where-Object { $_ -match '\.instructions\.md$|/SKILL\.md$' }

foreach ($File in $InstructionFiles) {
    $Content = git show ":$File" 2>$null
    $Lines = $Content -split '\n'
    
    if ($Lines[0] -ne "---") {
        Write-Status "$File missing YAML frontmatter start" "Error"
        $ExitCode = 1
    }
    elseif (($Lines | Select-Object -First 5) -notcontains "---") {
        Write-Status "$File missing YAML frontmatter end" "Error"
        $ExitCode = 1
    }
    else {
        Write-Status "$File has valid frontmatter" "Success"
    }
}
Write-Host

# 5. Warn about large files
Write-Host "📦 Checking file sizes..." -ForegroundColor Cyan
$LargeFiles = git diff --cached --name-only --diff-filter=ACM 2>$null | ForEach-Object {
    $Content = git show ":$_" 2>$null
    $Size = [System.Text.Encoding]::UTF8.GetByteCount($Content)
    if ($Size -gt 1000000) {  # 1MB
        "$_ ($([Math]::Round($Size / 1024 / 1024))MB)"
    }
}

if ($LargeFiles) {
    Write-Status "Large files detected:" "Warning"
    $LargeFiles | ForEach-Object { Write-Host "  $_" -ForegroundColor Yellow }
    Write-Host "Consider using Git LFS or splitting changes" -ForegroundColor Yellow
}
else {
    Write-Status "File sizes are reasonable" "Success"
}
Write-Host

# Summary
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if ($ExitCode -eq 0) {
    Write-Status "Pre-commit validation passed" "Success"
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}
else {
    Write-Status "Pre-commit validation failed" "Error"
    Write-Host "Fix the issues above before committing" -ForegroundColor Yellow
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

exit $ExitCode
