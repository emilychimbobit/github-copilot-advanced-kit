---
name: plan-feature
description: "Convierte un requerimiento en un plan técnico implementable."
argument-hint: "requerimiento=\"...\""
agent: architect
---

Planifica el siguiente requerimiento:

`${input:requerimiento:Describe la funcionalidad o pega el contenido del issue}`

Usa las [instrucciones del repositorio](../copilot-instructions.md).

Entrega:

- interpretación y alcance;
- supuestos y preguntas bloqueantes;
- contratos afectados;
- diseño propuesto y alternativas descartadas;
- archivos o módulos por modificar;
- secuencia de implementación;
- pruebas;
- seguridad, observabilidad y rollback;
- criterios de aceptación verificables.

No edites código.
