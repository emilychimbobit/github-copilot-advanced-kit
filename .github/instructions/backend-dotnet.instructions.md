---
applyTo: "src/backend/**/*.cs,tests/backend/**/*.cs"
description: "Convenciones para backend .NET 8 y sus pruebas."
---

# .NET 8 backend rules

- Preserve the existing solution structure and architectural boundaries.
- Enable and respect nullable reference types.
- Use asynchronous APIs end-to-end for I/O and propagate `CancellationToken`.
- Keep controllers or endpoints thin; place business rules in application/domain services.
- Do not expose persistence entities directly through public API contracts.
- Validate request DTOs at the boundary and return consistent problem details.
- Use dependency injection and constructor injection.
- Use structured logging with named properties; do not interpolate secrets or personal data.
- Prefer explicit result/error handling over broad catch-all exception blocks.
- Use parameterized queries or the established ORM safely.
- Add XML documentation only for public APIs where it adds value.
- For tests, follow the rules in `tests.instructions.md`.
