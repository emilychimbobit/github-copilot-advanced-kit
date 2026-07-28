# Prompt and Agent Governance

## Ownership

Assign owners for:

- repository instructions;
- path instructions;
- prompt files;
- agents and their tool permissions;
- skills and bundled scripts;
- MCP allowlist;
- hooks.

## Change control

Any change that adds write-capable MCP tools, shell execution, auto-approval or hooks requires security review.

## Quality review

Quarterly, verify:

- instructions are not contradictory;
- prompts still map to current workflows;
- tool names remain valid;
- agent permissions remain least privilege;
- skills have accurate descriptions;
- obsolete MCP servers are removed;
- example commands are safe and current.

## Metrics

Track useful outcomes, not prompt volume:

- PR rework;
- escaped defects;
- test coverage of changed behavior;
- security findings;
- lead time;
- agent task completion with human acceptance;
- tool approval exceptions.
