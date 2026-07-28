---
name: generate-tests
description: "Diseña y ejecuta pruebas para un cambio, módulo o defecto."
argument-hint: "alcance=\"working tree|archivo|módulo|bug\""
agent: test-engineer
---

Crea o completa pruebas para `${input:alcance:cambios actuales}`.

Incluye:

- comportamiento normal;
- límites y valores inválidos;
- fallos de dependencias;
- autorización y aislamiento de datos cuando aplique;
- prueba de regresión para defectos;
- comandos ejecutados y resultados.

No cambies producción salvo que propongas y justifiques primero un refactor mínimo de testabilidad.
