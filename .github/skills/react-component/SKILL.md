---
name: react-component
description: "Crea o modifica componentes React TypeScript accesibles, probados y alineados al design system."
argument-hint: "[componente y comportamiento]"
user-invocable: true
---

# React component workflow

1. Find the nearest comparable component and design-system primitive.
2. Define props and state ownership with strict TypeScript types.
3. Implement semantic HTML, keyboard support, labels and focus behavior.
4. Handle loading, empty, error and success states.
5. Avoid embedding privileged business rules or secrets in the client.
6. Add behavior-oriented tests.
7. Run lint, tests and build.
8. Report accessibility and browser assumptions.
