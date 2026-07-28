---
applyTo: "src/frontend/**/*.ts,src/frontend/**/*.tsx"
description: "Convenciones para React y TypeScript."
---

# React and TypeScript rules

- Keep TypeScript strict; do not introduce `any` unless a documented external boundary requires it.
- Prefer function components and focused hooks.
- Keep server state, form state and local UI state conceptually separate.
- Reuse the existing design system and component primitives.
- Preserve keyboard navigation, semantic HTML, labels, focus management and accessible names.
- Avoid hidden side effects in render functions.
- Handle loading, empty, error and success states.
- Validate and encode untrusted content before rendering.
- Do not place secrets or privileged business rules in frontend code.
- Add tests for user-visible behavior rather than implementation details.
- Avoid new dependencies when a small existing utility is sufficient.
