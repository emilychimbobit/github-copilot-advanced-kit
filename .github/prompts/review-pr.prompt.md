---
name: review-pr
description: "Revisa un PR o diff con foco en defectos y seguridad."
argument-hint: "alcance=\"PR URL|PR #|working tree\""
agent: security-reviewer
---

Revisa `${input:alcance:el working tree actual}`.

Prioriza únicamente hallazgos reales en:

- comportamiento incorrecto;
- regresiones;
- seguridad y privacidad;
- autorización;
- concurrencia y manejo de errores;
- CI/CD y secretos;
- pruebas faltantes de alto valor.

Para cada hallazgo incluye severidad, evidencia, escenario, corrección y prueba. Separa hallazgos confirmados de preguntas.
