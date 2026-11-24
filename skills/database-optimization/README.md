# Database Optimization Agent Skill

Copy the entire database-optimization folder into the skills directory supported by your coding agent. Common user-level locations are ~/.agents/skills/ for Codex and ~/.claude/skills/ for Claude Code; confirm your installed client's discovery rules. On Windows, ~ means your user profile. Restart or reload if required.

Use explicitly: "Use the database-optimization skill to audit the reservation module. Report findings before editing." Or: "Use database-optimization when implementing this endpoint; verify query count and tenant isolation."

For project instructions (AGENTS.md or CLAUDE.md):

> Consult database-optimization when creating, modifying or reviewing database operations. Prevent N+1, preserve authorization and semantics, and validate performance changes. Report unmeasured claims as estimates. Do not change production databases without authorization.

This is an instruction/reference skill, not a runtime scanner. It contains no executable scripts and makes no automatic production changes. Actual diagnostics depend on agent tools, repository access and instrumentation.
