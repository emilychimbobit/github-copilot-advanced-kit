# Guía de uso en GitHub Copilot Chat

## 1. Qué hace cada tipo de archivo

| Componente | Se activa | Uso |
|---|---|---|
| `.github/copilot-instructions.md` | Automáticamente | Reglas transversales del repositorio |
| `.github/instructions/*.instructions.md` | Por `applyTo` | Reglas por lenguaje, carpeta o tipo de archivo |
| `AGENTS.md` | Automáticamente | Contrato común para agentes compatibles |
| `.github/prompts/*.prompt.md` | Manualmente con `/nombre` | Preprompts repetibles |
| `.github/agents/*.agent.md` | Selector de agentes | Rol, herramientas, límites y handoffs |
| `.github/skills/*/SKILL.md` | Automático o `/skill-name` | Workflow especializado y reutilizable |
| `.vscode/mcp.json` | Al iniciar y aprobar el servidor | Herramientas externas |
| Hooks | En eventos del agente | Guardrails determinísticos; deshabilitados en este kit |

## 2. Abrir el chat

- Chat lateral: `Ctrl+Alt+I`.
- Inline Chat: `Ctrl+I`.
- Command Palette: `Ctrl+Shift+P`.
- Selecciona **Agent** para permitir búsqueda, edición, terminal y MCP según herramientas activas.

## 3. Usar prompt files

Escribe `/` para ver comandos.

Ejemplos:

```text
/analyze-repository
/plan-feature requerimiento="Agregar auditoría de cambios"
/implement-feature requerimiento="Implementar el plan aprobado"
/generate-tests alcance="cambios actuales"
/review-pr alcance="working tree"
/debug-ci workflow="validate"
/create-adr decision="Adoptar arquitectura orientada a eventos"
/prepare-release version="1.4.0"
```

Los valores después del comando complementan las variables `${input:...}`.

## 4. Usar agentes

En el selector inferior del Chat:

- **Architect**: analiza y planifica; no edita.
- **Implementer**: edita, ejecuta comandos y prueba.
- **Test Engineer**: se concentra en pruebas.
- **Security Reviewer**: revisión de solo lectura.
- **DevOps**: workflows, CI/CD y releases.
- **Documentation**: documentación únicamente.
- **GitHub Operator**: GitHub MCP con confirmación para escrituras.
- **Delivery Orchestrator**: delegación avanzada a subagentes.

### Handoffs

Después de una respuesta puede aparecer un botón como **Implement approved plan**. El botón cambia al siguiente agente y conserva el contexto. Revisa el prompt antes de enviarlo.

## 5. Usar skills

Los skills pueden cargarse automáticamente cuando la descripción coincide con la tarea. También puedes invocarlos explícitamente:

```text
Use the /dotnet-api-feature skill to implement POST /customers.
Use the /secure-code-review skill to review the authentication changes.
Use the /github-actions-debugging skill to diagnose run 12345.
Use the /release-readiness skill for version 2.0.0.
```

En español:

```text
Usa el skill /mcp-safe-operations para crear un issue después de mostrarme el cambio exacto.
```

## 6. Usar MCP

Ejecuta `MCP: List Servers`.

### GitHub

El servidor `github` permite consultar y operar sobre repositorios, issues y pull requests. Autentica mediante OAuth y concede únicamente los scopes necesarios.

Ejemplos:

```text
Lista los PR abiertos de este repositorio y resume cuáles tienen checks fallidos.
Busca issues con label copilot-ready y ordénalos por riesgo.
Muestra el diff y checks del PR 42. No hagas merge.
Crea un comentario en el issue 12 con este resumen, pero muéstrame primero el texto exacto.
```

### Playwright

El servidor `playwright` permite navegación y pruebas de UI. Es un proceso local iniciado con `npx`; revisa y confía únicamente en el paquete configurado.

Ejemplos:

```text
Abre la aplicación local, completa el login de prueba y verifica navegación por teclado.
Captura una pantalla del error de validación y describe los elementos accesibles.
```

## 7. Añadir contexto explícito

Usa `#` para adjuntar archivos, selección, terminal, problemas o herramientas:

```text
Explica el flujo de autenticación usando #codebase.
Corrige el error de #problems.
Analiza la salida de #terminalLastCommand.
Usa #github para obtener el estado del PR.
```

## 8. Flujo completo de una feature

1. `/analyze-repository`.
2. `/plan-feature`.
3. Revisar y aprobar el plan.
4. Handoff a **Implementer**.
5. Handoff a **Test Engineer**.
6. Handoff a **Security Reviewer**.
7. `/document-feature`.
8. `/prepare-release`.
9. Una persona revisa el diff y el PR.

## 9. Diagnóstico

- `Chat: Open Customizations`: inventario y edición.
- Clic derecho en Chat → **Diagnostics**: archivos cargados y errores.
- `MCP: List Servers`: estado, reinicio y logs.
- `MCP: Reset Trust`: revocar confianza.
- `python scripts/validate_copilot_config.py`: validar estructura local.
