# Hooks — no habilitados por defecto

Los hooks ejecutan comandos determinísticos durante el ciclo del agente. Son útiles para formatear después de editar o bloquear comandos riesgosos, pero también pueden ejecutar código con los permisos del usuario.

Por seguridad, este kit no carga hooks automáticamente. Existe un ejemplo deshabilitado en:

`examples/hooks/format-after-edit.hooks.json.disabled`

Antes de moverlo a `.github/hooks/*.json`:

1. revisa cada comando;
2. adapta los comandos al stack;
3. prueba en un contenedor o repositorio desechable;
4. habilita `chat.useCustomAgentHooks` únicamente si la política de la organización lo permite;
5. evita descargar o ejecutar contenido no confiable.
