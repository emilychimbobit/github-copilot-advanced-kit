# GitHub Copilot Advanced Kit

Repositorio plantilla para implementar una configuración avanzada, auditable y reutilizable de GitHub Copilot en Visual Studio Code y GitHub.

Incluye:

- Instrucciones globales y por ruta.
- `AGENTS.md` compatible con múltiples agentes.
- Prompt files reutilizables, visibles como comandos `/`.
- Agentes especializados con herramientas limitadas y handoffs.
- Agent Skills invocables automáticamente o mediante `/skill-name`.
- MCP de GitHub y Playwright configurados sin secretos hardcodeados.
- Flujos de arquitectura, implementación, pruebas, seguridad, CI/CD y documentación.
- Plantillas de issues y pull requests preparadas para trabajo con agentes.
- Validador local y workflow de GitHub Actions para controlar la calidad de las customizaciones.
- Ejemplo opcional de hooks, deshabilitado por seguridad.

> Este kit está orientado a repositorios empresariales con backend .NET 8, frontend React/TypeScript, GitHub Actions y despliegues en Azure. Las rutas y reglas se pueden adaptar a otro stack.

## Inicio rápido

1. Abre la carpeta raíz del repositorio en una versión actual de Visual Studio Code.
2. Instala las extensiones recomendadas cuando VS Code lo solicite.
3. Inicia sesión en GitHub Copilot.
4. Abre Copilot Chat con `Ctrl+Alt+I` y selecciona **Agent**.
5. Ejecuta `MCP: List Servers`, inicia los servidores y aprueba únicamente los que reconozcas.
6. Autentica el servidor remoto de GitHub mediante OAuth.
7. Escribe `/` en el chat para ver los prompt files y skills.
8. Selecciona un agente en el selector inferior del chat.
9. Ejecuta el validador:

```bash
python scripts/validate_copilot_config.py
```

La guía completa está en [docs/GUIA-USO-COPILOT-CHAT.md](docs/GUIA-USO-COPILOT-CHAT.md).

## Flujo recomendado

```text
/analyze-repository
        ↓
/plan-feature
        ↓ handoff
Implementer
        ↓ handoff
Test Engineer
        ↓ handoff
Security Reviewer
        ↓
/prepare-release
```

Para una tarea completa basada en un issue:

```text
/issue-to-pr issue=https://github.com/OWNER/REPO/issues/123
```

## Estructura

```text
.github/
  copilot-instructions.md       Reglas siempre activas
  instructions/                 Reglas automáticas por tipo de archivo
  prompts/                      Comandos reutilizables /
  agents/                       Personas y permisos especializados
  skills/                       Capacidades cargadas bajo demanda
  hooks/                        Documentación de hooks opcionales
  ISSUE_TEMPLATE/               Requerimientos aptos para agentes
  workflows/                    Validación automática
.vscode/
  mcp.json                      Servidores MCP del workspace
  settings.json                 Descubrimiento y controles seguros
docs/                           Guías, gobierno y ejemplos
scripts/                        Instalación y validación
AGENTS.md                       Contrato común para agentes
```

## Principios de seguridad

- No almacena tokens, PAT, claves ni secretos.
- El MCP remoto de GitHub utiliza OAuth.
- Los MCP locales requieren confirmación de confianza.
- La aprobación global de herramientas está desactivada.
- Ningún skill preaprueba `shell` o `bash`.
- Los agentes de revisión son de solo lectura por diseño.
- Toda operación destructiva o de escritura remota debe confirmarse.
- El agente nunca debe afirmar que una prueba pasó si no ejecutó el comando y verificó el código de salida.

## Adaptación

Antes de usar este kit en un proyecto real, revisa:

- Rutas de `applyTo` en `.github/instructions`.
- Comandos de build y test en `AGENTS.md`.
- Arquitectura real del repositorio.
- Servidores MCP autorizados por seguridad.
- Nombres de agentes y handoffs.
- Reglas de protección de ramas y CODEOWNERS.

Consulta [docs/ADAPTAR-A-TU-PROYECTO.md](docs/ADAPTAR-A-TU-PROYECTO.md).
