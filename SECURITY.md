# Security Policy for AI-Assisted Development

## Never commit

- passwords, API keys, PATs or OAuth tokens;
- private keys, certificates or connection strings;
- production customer data;
- unredacted logs containing personal or confidential information;
- local MCP credentials.

## MCP

Use OAuth where available. Store secrets in secure user inputs, environment variables or a managed secret store. Do not hardcode authorization headers in `.vscode/mcp.json`.

Local MCP servers execute with the privileges of the current user. Review the package, command, arguments and publisher before trusting the server.

## Agent permissions

Keep review and planning agents read-only. Require explicit confirmation before remote writes, branch deletion, merge, release, deployment or secret modification.

## Reporting

Report security findings privately to the repository maintainers. Do not open a public issue containing exploit details or real secrets.
