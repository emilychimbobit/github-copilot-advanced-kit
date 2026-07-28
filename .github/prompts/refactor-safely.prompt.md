---
name: refactor-safely
description: "Refactoriza preservando comportamiento mediante una red de pruebas."
argument-hint: "objetivo=\"...\""
agent: implementer
---

Refactoriza `${input:objetivo:el código seleccionado o indicado}` sin cambiar comportamiento observable.

Antes de editar:

- identifica contratos y consumidores;
- confirma pruebas existentes;
- agrega caracterización si la cobertura es insuficiente;
- define una secuencia reversible.

Después ejecuta pruebas, compara el diff y explica por qué el comportamiento se conserva.
