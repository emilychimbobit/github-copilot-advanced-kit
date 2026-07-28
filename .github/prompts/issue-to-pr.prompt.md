---
name: issue-to-pr
description: "Orquesta un issue desde análisis hasta preparación de PR."
argument-hint: "issue=\"URL o número\""
agent: delivery-orchestrator
---

Procesa el issue `${input:issue:proporcionado por el usuario}`.

Fases:

1. leer issue y contexto del repositorio;
2. validar criterios de aceptación y detectar ambigüedades;
3. diseñar y solicitar aprobación del plan;
4. implementar cambios mínimos;
5. ejecutar pruebas;
6. realizar revisión de seguridad;
7. actualizar documentación;
8. preparar resumen y checklist para PR.

Detente ante decisiones de producto, cambios incompatibles, migraciones destructivas o falta de permisos. No hagas merge ni deploy.
