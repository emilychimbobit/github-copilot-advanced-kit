# Matriz de customizaciones

| Necesidad | Mecanismo | Razón |
|---|---|---|
| Regla que siempre aplica | `copilot-instructions.md` | Contexto automático y transversal |
| Regla solo para `.cs` o tests | `.instructions.md` | Evita saturar el contexto global |
| Tarea repetida bajo demanda | `.prompt.md` | Se invoca con `/` |
| Rol con herramientas limitadas | `.agent.md` | Controla persona, permisos y handoffs |
| Workflow especializado reutilizable | `SKILL.md` | Se carga cuando la tarea lo requiere |
| Acceso a GitHub o browser | MCP | Proporciona herramientas externas |
| Formatear o validar después de editar | Hook | Acción determinística, no dependiente del modelo |
| Reglas comunes entre agentes | `AGENTS.md` | Compatibilidad y jerarquía por carpetas |

## Regla práctica

- **Cómo debe comportarse siempre** → instrucciones.
- **Qué tarea repetitiva debe ejecutar** → prompt.
- **Quién debe actuar y con qué permisos** → agente.
- **Qué capacidad compleja debe aprender** → skill.
- **A qué sistema externo debe conectarse** → MCP.
- **Qué acción obligatoria debe ocurrir siempre** → hook.
