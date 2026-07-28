# Troubleshooting

## No aparecen prompts o agentes

1. Confirma que abriste la raíz del repositorio.
2. Ejecuta `Chat: Open Customizations`.
3. Abre Diagnostics desde el menú contextual del Chat.
4. Verifica extensiones `.prompt.md`, `.agent.md`, `.instructions.md` y nombre `SKILL.md`.
5. Ejecuta el validador local.
6. Recarga la ventana con `Developer: Reload Window`.

## Las instrucciones no aplican

- Revisa `applyTo`.
- Confirma que el archivo objetivo coincide con el glob.
- Las instrucciones no controlan ghost text inline; se aplican a flujos de Chat/Agent compatibles.
- Evita instrucciones contradictorias entre archivos.

## Un agente ignora una herramienta

- La herramienta puede no estar instalada o habilitada.
- Abre **Configure Tools**.
- Revisa el nombre calificado del tool.
- Si es MCP, verifica que el servidor esté iniciado.

## MCP no inicia

1. `MCP: List Servers`.
2. Selecciona el servidor.
3. **Show Output**.
4. Revisa Node.js, red, OAuth y políticas de organización.
5. Reinicia el servidor.
6. Usa `MCP: Reset Trust` si cambió la configuración.

## Delivery Orchestrator no delega

La delegación a subagentes puede depender de versión o política. Usa los handoffs manuales:

Architect → Implementer → Test Engineer → Security Reviewer.

## Playwright solicita instalar paquetes

El servidor local usa `npx`. Confirma que reconoces `@microsoft/mcp-server-playwright`, que Node.js está disponible y que tu organización permite ejecución local.
