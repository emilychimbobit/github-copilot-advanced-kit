---
name: analyze-repository
description: "Genera un mapa técnico verificable del repositorio."
argument-hint: "[área opcional del repositorio]"
agent: architect
---

Analiza el repositorio completo o el área `${input:area:todo el repositorio}`.

Produce:

1. estructura y responsabilidades de módulos;
2. entry points y flujos principales;
3. arquitectura observada, no idealizada;
4. dependencias internas y externas;
5. comandos de build, test y ejecución encontrados;
6. controles de seguridad y CI/CD;
7. deuda o riesgos con evidencia;
8. preguntas que no pueden resolverse desde el código.

No edites archivos. Distingue hechos verificados de inferencias.
