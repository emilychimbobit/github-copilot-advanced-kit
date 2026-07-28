#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-}"
FORCE="${2:-}"

if [[ -z "$TARGET" ]]; then
  echo "Uso: scripts/install-into-repo.sh /ruta/al/repo [--force]" >&2
  exit 2
fi

TARGET="$(cd "$TARGET" && pwd)"
SOURCE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ ! -d "$TARGET/.git" ]]; then
  echo "El destino debe ser la raíz de un repositorio Git." >&2
  exit 1
fi

for item in .github .vscode AGENTS.md docs scripts; do
  src="$SOURCE_ROOT/$item"
  dst="$TARGET/$item"

  if [[ -e "$dst" && "$FORCE" != "--force" ]]; then
    echo "Omitido: $dst. Usa --force después de revisar backups."
    continue
  fi

  if [[ -e "$dst" ]]; then
    backup="${dst}.backup-$(date +%Y%m%d%H%M%S)"
    mv "$dst" "$backup"
    echo "Backup: $backup"
  fi

  cp -R "$src" "$dst"
  echo "Copiado: $item"
done

echo "Ejecuta: python scripts/validate_copilot_config.py"
