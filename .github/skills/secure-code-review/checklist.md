# Security review checklist

- Broken access control and tenancy escape.
- Injection into SQL, command, template, LDAP or logs.
- SSRF and unsafe outbound URL handling.
- XSS and unsafe HTML rendering.
- Path traversal and archive extraction.
- Insecure deserialization.
- Secret leakage and sensitive logs.
- Weak token validation or lifetime.
- Missing rate limiting for abuse-sensitive operations.
- Unsafe CORS, CSRF or cookie settings.
- Excessive workflow permissions.
- Untrusted pull request code with privileged secrets.
- Dependency or action supply-chain risk.
