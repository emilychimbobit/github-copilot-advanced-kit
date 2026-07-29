# Hooks — no habilitados por defecto

Los hooks ejecutan comandos determinísticos durante el ciclo del agente. Son útiles para formatear después de editar o bloquear comandos riesgosos, pero también pueden ejecutar código con los permisos del usuario.

Por seguridad, este kit no carga hooks automáticamente. Existen ejemplos deshabilitados en:

- `examples/hooks/format-after-edit.hooks.json.disabled`
- `examples/hooks/adr-next-number.hooks.json.disabled` (valida la numeración de ADRs bajo `docs/adr` tras cada edición, usando `scripts/next_adr_number.py --check`)

Antes de moverlo a `.github/hooks/*.json`:

1. revisa cada comando;
2. adapta los comandos al stack;
3. prueba en un contenedor o repositorio desechable;
4. habilita `chat.useCustomAgentHooks` únicamente si la política de la organización lo permite;
5. evita descargar o ejecutar contenido no confiable.
