---
name: document-feature
description: "Documenta una feature a partir de la implementación real."
argument-hint: "feature=\"...\" audiencia=\"...\""
agent: documentation
---

Documenta `${input:feature:la funcionalidad indicada}` para `${input:audiencia:desarrolladores y operadores}`.

Verifica primero código, pruebas y configuración. Incluye:

- propósito;
- arquitectura y flujo;
- configuración;
- uso;
- ejemplos;
- seguridad;
- observabilidad;
- troubleshooting;
- rollback o desactivación.

No inventes rutas, flags ni resultados.
