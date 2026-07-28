---
name: adr-authoring
description: "Facilita decisiones de arquitectura y genera ADRs trazables con alternativas, consecuencias y rollback."
argument-hint: "[decisión]"
user-invocable: true
---

# ADR workflow

1. Gather context from code, docs, constraints and stakeholders stated by the user.
2. Separate hard constraints from preferences.
3. Compare at least two viable options when they exist.
4. Record why rejected options were not chosen.
5. Include consequences, migration, security, operations and reversibility.
6. Use the next sequential ADR number under `docs/adr`.
7. Set status to `Proposed` until human approval.
