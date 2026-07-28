# MCP y seguridad

## Configuración incluida

`.vscode/mcp.json` configura:

- `github`: servidor HTTP remoto oficial, autenticado por OAuth.
- `playwright`: servidor local ejecutado con Node.js y `npx`.

No contiene secretos.

## Riesgos

Un MCP puede:

- ejecutar código local;
- leer archivos permitidos;
- acceder a red;
- consultar o modificar servicios externos;
- devolver contenido con prompt injection.

## Controles

1. Revisa publisher, URL, comando y argumentos.
2. Mantén desactivado el descubrimiento automático si necesitas una lista controlada.
3. Habilita solo las herramientas necesarias por tarea.
4. No uses aprobación global.
5. Usa agentes de solo lectura para análisis.
6. Lee antes de escribir.
7. Confirma operaciones remotas.
8. Revisa scopes OAuth y políticas organizacionales.
9. Nunca pegues tokens en el chat.
10. Revoca confianza con `MCP: Reset Trust` cuando cambie la configuración.

## Servidor con token mediante input

Usa `examples/mcp/mcp-with-inputs.example.json`. El valor se solicita localmente y no se guarda en el repositorio.

## Copilot CLI

El formato de CLI utiliza `mcpServers` en lugar de `servers`. Consulta `examples/mcp/copilot-cli.mcp.example.json`.
