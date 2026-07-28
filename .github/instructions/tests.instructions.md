---
applyTo: "tests/**/*,**/*.Tests/**/*.cs,**/*.test.ts,**/*.test.tsx,**/*.spec.ts,**/*.spec.tsx"
description: "Reglas para pruebas automatizadas."
---

# Test rules

- Test observable behavior and public contracts.
- Use Arrange, Act, Assert with descriptive test names.
- Keep tests deterministic and independent from execution order.
- Cover success, validation, boundary, failure and authorization scenarios.
- Mock external systems at stable boundaries; do not mock the unit under test.
- Avoid real network calls, production credentials and shared mutable test data.
- Reuse existing fixtures and builders.
- When fixing a defect, add a regression test that fails before the fix.
- Do not delete or weaken tests solely to make CI pass.
- Report skipped tests and explain why they remain skipped.
