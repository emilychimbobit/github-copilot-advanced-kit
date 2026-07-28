---
name: github-actions-debugging
description: "Diagnostica fallos de GitHub Actions usando logs, configuración, permisos y diferencias de entorno."
argument-hint: "[workflow, run URL o error]"
user-invocable: true
---

# GitHub Actions debugging

1. Retrieve the workflow and failed run when GitHub MCP is available.
2. Find the first causal error.
3. Compare local and runner environment, versions, paths and permissions.
4. Check event context, secret availability and fork behavior.
5. Reproduce the failing command locally when safe.
6. Make the smallest correction.
7. Preserve required checks and least privilege.
8. Re-run or explain exactly how to verify.

Do not solve failures by suppressing errors, broadening permissions or exposing secrets.
