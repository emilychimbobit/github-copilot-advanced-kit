param(
    [Parameter(Mandatory = $true)]
    [string]$TargetRepo,
    [switch]$Force
)

$ErrorActionPreference = "Stop"
$SourceRoot = Split-Path -Parent $PSScriptRoot
$Target = (Resolve-Path $TargetRepo).Path

if (-not (Test-Path (Join-Path $Target ".git"))) {
    throw "TargetRepo debe apuntar a la raíz de un repositorio Git."
}

$Items = @(".github", ".vscode", "AGENTS.md", "docs", "scripts")

foreach ($Item in $Items) {
    $Source = Join-Path $SourceRoot $Item
    $Destination = Join-Path $Target $Item

    if ((Test-Path $Destination) -and -not $Force) {
        Write-Warning "Omitido porque ya existe: $Destination. Usa -Force después de revisar backups."
        continue
    }

    if (Test-Path $Destination) {
        $Backup = "$Destination.backup-$(Get-Date -Format yyyyMMddHHmmss)"
        Move-Item $Destination $Backup
        Write-Host "Backup: $Backup"
    }

    Copy-Item $Source $Destination -Recurse
    Write-Host "Copiado: $Item"
}

Write-Host "Ejecuta: python scripts/validate_copilot_config.py"
