# Sesión end-to-end de ejemplo

```text
Usuario: /analyze-repository area="autenticación"
Architect: [mapa técnico]

Usuario: /plan-feature requerimiento="Agregar MFA adaptativo sin cambiar el contrato de login actual"
Architect: [plan, riesgos y preguntas]

Usuario: Apruebo la opción B. Usa el handoff Implement approved plan.
Implementer: [cambios y pruebas]

Usuario: Usa el handoff Generate and run tests.
Test Engineer: [tests y resultados]

Usuario: Usa el handoff Security review.
Security Reviewer: [hallazgos con evidencia]

Usuario: Aplica los hallazgos confirmados.
Implementer: [fixes y regresión]

Usuario: /document-feature feature="MFA adaptativo"
Documentation: [documentación]

Usuario: /prepare-release version="2.3.0"
DevOps: [READY WITH CONDITIONS]
```
