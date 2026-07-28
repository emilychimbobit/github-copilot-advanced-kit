---
name: secure-code-review
description: "Realiza una revisión de seguridad basada en evidencia para código, PRs, workflows o infraestructura."
argument-hint: "[PR, diff, archivo o módulo]"
user-invocable: true
---

# Secure review process

Read [checklist.md](checklist.md), then:

1. Determine the attack surface and trust boundaries.
2. Inspect authentication, authorization and data isolation.
3. Trace untrusted input to sensitive sinks.
4. Review secret use, logging and error disclosure.
5. Review workflow and dependency permissions.
6. Check existing security tests.
7. Report only findings with evidence and realistic impact.

Never execute exploit code against external or production systems.
