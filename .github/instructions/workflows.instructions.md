---
applyTo: ".github/workflows/**/*.yml,.github/workflows/**/*.yaml"
description: "Reglas para GitHub Actions y CI/CD."
---

# GitHub Actions rules

- Set explicit minimal `permissions`.
- Add job timeouts and concurrency controls where appropriate.
- Use environments and approvals for production deployments.
- Prefer OIDC or federated credentials over long-lived cloud secrets.
- Never echo secrets, contexts or full environment dumps.
- Keep untrusted pull request code away from privileged credentials.
- Use immutable or well-controlled action versions according to repository policy.
- Separate build validation from deployment.
- Upload only necessary artifacts and set retention intentionally.
- Fail on lint, test, security or validation errors; do not mask failures with `continue-on-error` unless documented.
