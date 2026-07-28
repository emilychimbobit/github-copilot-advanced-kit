---
applyTo: "src/**/*,.github/workflows/**/*,infra/**/*,scripts/**/*"
description: "Controles de seguridad para código, automatización e infraestructura."
---

# Security engineering rules

- Identify trust boundaries and attacker-controlled inputs.
- Enforce authorization independently from authentication.
- Use least privilege for identities, tokens, workflow permissions and MCP tools.
- Prevent injection, XSS, SSRF, path traversal, insecure deserialization and unsafe command construction.
- Avoid dynamic code execution and shell concatenation with untrusted values.
- Use secure defaults and fail closed.
- Never include secrets in source, logs, test snapshots, prompts or generated examples.
- Prefer short-lived federated identity over long-lived credentials.
- Pin or constrain dependencies and review newly introduced packages.
- Include security-relevant negative tests.
- Flag high-impact findings clearly; do not silently rewrite security-sensitive behavior.
