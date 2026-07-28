---
name: debug-ci
description: "Diagnostica un fallo de GitHub Actions por causa raíz."
argument-hint: "workflow=\"...\" run=\"URL o ID opcional\""
agent: devops
---

Diagnostica `${input:workflow:el workflow fallido}` con ejecución `${input:run:la disponible en el contexto}`.

Proceso obligatorio:

1. identifica el primer error causal, no solo el último mensaje;
2. diferencia error de código, entorno, permisos, secretos, caché o dependencia;
3. reproduce localmente cuando sea posible;
4. propone el cambio mínimo;
5. revisa impacto de seguridad;
6. valida YAML y comandos;
7. reporta evidencia y limitaciones.

No uses `continue-on-error` ni elimines checks para ocultar el fallo.
