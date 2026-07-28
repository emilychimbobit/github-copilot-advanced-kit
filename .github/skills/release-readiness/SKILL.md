---
name: release-readiness
description: "Comprueba si el repositorio está listo para release mediante checklist y script de higiene de solo lectura."
argument-hint: "[versión opcional]"
user-invocable: true
---

# Release readiness

1. Run `python .github/skills/release-readiness/check_repository.py` from the repository root.
2. Review changed files and release scope.
3. Run the project's build, lint and test commands.
4. Check migrations, configuration, documentation and rollback.
5. Check security findings and dependency changes.
6. Return READY, READY WITH CONDITIONS or NOT READY.

The bundled script is read-only. Do not publish or deploy.
