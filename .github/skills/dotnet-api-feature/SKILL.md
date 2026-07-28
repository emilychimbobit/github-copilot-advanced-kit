---
name: dotnet-api-feature
description: "Implementa una feature de API .NET 8 siguiendo arquitectura, validación, autorización, persistencia y pruebas. Úsala para endpoints o casos de uso backend."
argument-hint: "[requerimiento o endpoint]"
user-invocable: true
---

# .NET API feature workflow

1. Locate a similar endpoint and trace controller/endpoint, application, domain, persistence and tests.
2. Identify the public request, response, error and authorization contracts.
3. Define validation, idempotency, cancellation and transaction behavior.
4. Implement from the domain/application boundary outward.
5. Keep transport and persistence models separate when the repository already does so.
6. Add unit and integration tests, including unauthorized and invalid requests.
7. Run formatter, build and relevant tests.
8. Report API compatibility, migration and observability impact.

Never add secrets or real connection strings. Never expose persistence entities directly without explicit repository precedent.
