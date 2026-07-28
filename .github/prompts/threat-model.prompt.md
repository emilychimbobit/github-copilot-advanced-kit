---
name: threat-model
description: "Genera un threat model técnico basado en el código real."
argument-hint: "flujo=\"...\""
agent: security-reviewer
---

Modela amenazas para `${input:flujo:la funcionalidad o flujo indicado}`.

Identifica:

- activos;
- actores;
- entradas y límites de confianza;
- flujo de datos;
- amenazas STRIDE relevantes;
- controles existentes con evidencia;
- brechas;
- mitigaciones priorizadas;
- pruebas de abuso;
- riesgos residuales.

No inventes controles que no estén presentes.
