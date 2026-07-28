---
name: prepare-release
description: "Evalúa preparación de release sin desplegar."
argument-hint: "version=\"...\""
agent: devops
---

Evalúa la preparación de `${input:version:la próxima versión}`.

Comprueba:

- working tree y alcance;
- build, lint y tests;
- migraciones y compatibilidad;
- vulnerabilidades y secretos;
- changelog y documentación;
- configuración y variables;
- rollback;
- observabilidad;
- aprobaciones pendientes.

No publiques ni despliegues. Devuelve un veredicto: READY, READY WITH CONDITIONS o NOT READY, con evidencia.
