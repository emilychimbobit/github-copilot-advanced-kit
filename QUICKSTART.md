# Quickstart — 10 minutos

## 1. Abrir correctamente el repositorio

Abre la **raíz** del repositorio, no una subcarpeta. La raíz debe contener `.git`, `.github`, `.vscode` y `AGENTS.md`.

## 2. Activar Copilot Chat

1. Inicia sesión con tu cuenta de GitHub.
2. Abre Chat con `Ctrl+Alt+I`.
3. Selecciona **Agent**.
4. En el selector de agentes aparecerán `Architect`, `Implementer`, `Test Engineer`, `Security Reviewer`, entre otros.

## 3. Verificar customizaciones

Ejecuta `Chat: Open Customizations` desde la Command Palette.

También puedes hacer clic derecho dentro del Chat y seleccionar **Diagnostics** para revisar:

- instrucciones cargadas;
- prompt files;
- agentes;
- skills;
- errores de frontmatter o rutas.

## 4. Activar MCP

Ejecuta `MCP: List Servers`.

- `github`: autentica mediante OAuth.
- `playwright`: revisa la configuración, confirma que confías en el paquete y permite el inicio.

No apruebes un MCP cuyo publisher, comando o URL no reconozcas.

## 5. Primeras pruebas

En Copilot Chat:

```text
/analyze-repository
```

Luego:

```text
/plan-feature requerimiento="Agregar endpoint para registrar clientes con validación y auditoría"
```

Selecciona el handoff **Implement approved plan** para pasar al agente implementador.

Después:

```text
/generate-tests alcance="cambios actuales"
```

Finalmente:

```text
/review-pr alcance="working tree"
```

## 6. Validación del kit

```bash
python scripts/validate_copilot_config.py
```
