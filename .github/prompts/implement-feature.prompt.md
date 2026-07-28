---
name: implement-feature
description: "Implementa una funcionalidad con pruebas y evidencia."
argument-hint: "requerimiento=\"...\" plan=\"...\""
agent: implementer
---

Implementa `${input:requerimiento:el requerimiento proporcionado por el usuario}`.

Usa el plan aprobado `${input:plan:incluido en el contexto anterior o descrito aquí}`.

Antes de editar:

1. inspecciona implementaciones similares;
2. identifica instrucciones aplicables;
3. confirma el alcance y los archivos previstos.

Luego implementa, prueba y entrega el reporte exigido por [copilot-instructions.md](../copilot-instructions.md).

No realices merge, deploy ni release.
