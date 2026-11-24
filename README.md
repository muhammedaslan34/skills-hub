# Skills Hub

Reusable engineering skills for AI coding agents — one repository, multiple skills, independent of project and technology stack.

## Skills catalog

| Skill | Capabilities | Status |
| --- | --- | --- |
| [Database Optimization](skills/database-optimization/) | N+1 prevention, query tuning, index audits, execution plans, pagination, transactions and caching | Available |

## Quick start

Clone the repository:

```bash
git clone https://github.com/muhammedaslan34/skills-hub.git
cd skills-hub
```

**Codex (user-level):**
```bash
mkdir -p ~/.agents/skills
cp -r skills/database-optimization ~/.agents/skills/
```

**Claude Code (user-level):**
```bash
mkdir -p ~/.claude/skills
cp -r skills/database-optimization ~/.claude/skills/
```

**Windows PowerShell (Codex):**
```powershell
New-Item -ItemType Directory -Force "$HOME/.agents/skills" | Out-Null
Copy-Item -Recurse -Force ./skills/database-optimization "$HOME/.agents/skills/"
```

For Claude Code on Windows, substitute `$HOME/.claude/skills`. Confirm discovery paths for your installed agent/version. For other agents, use their supported skill location or explicitly reference SKILL.md. Reload the agent if required.

## Usage

Ask your agent:

> Use database-optimization to audit the backend. Identify N+1 patterns, missing or redundant indexes and inefficient execution plans. Report evidence and risks before editing.

Or add to AGENTS.md / CLAUDE.md:

> Consult database-optimization whenever creating or reviewing database-backed code. Preserve semantics, authorization and tenant isolation. Validate performance with evidence.

## Design principles

- Portable instructions and focused, progressively loaded references.
- Evidence over speculative optimization; no fabricated benchmarks.
- Safe diagnostics, explicit authorization for production changes.
- Small, independently installable skills; no runtime dependency in your application.

## Repository layout

```text
skills-hub/
  README.md
  skills/
    database-optimization/
      SKILL.md
      README.md
      references/
        indexing/
      scripts/
```

## Contributing a skill

Create `skills/<skill-name>/SKILL.md` with name and description frontmatter, a focused workflow, and clear guardrails. Add optional references, scripts and usage documentation. Test instructions against realistic scenarios, document prerequisites, and update the catalog. Never commit credentials or customer data.

## Updating

Pull the latest changes and reinstall the skill folder. Review changes before using scripts against any database. See each skill README for supported engines and limitations.
