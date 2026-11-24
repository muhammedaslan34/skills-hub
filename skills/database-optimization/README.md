# Database Optimization

An ORM-independent engineering skill for preventing and diagnosing database performance problems in AI-assisted development. Works through instructions, reference guides and optional read-only SQL diagnostics; not an autonomous database scanner.

## Capabilities

| Area | Coverage |
| --- | --- |
| Queries | N+1, eager loading, batching, projection, joins, aggregation |
| Indexes | Missing, composite, covering, partial, expression, redundant and unused indexes; maintenance and safe migrations |
| Plans | Estimated vs actual rows, scans, loops, sorting, IO and plan regressions |
| Runtime | Bulk writes, transactions, connection pools, caching |
| Correctness | Tenant isolation, permissions, stable pagination, regression tests |

## Supported stacks

ORM examples: Drizzle, Prisma, Laravel Eloquent and raw SQL. Database guides: PostgreSQL, MySQL, SQLite and SQL Server (indexing). Other engines can use the general workflow with version-specific documentation. Diagnostic SQL scripts are provided for PostgreSQL and MySQL only.

## Install

Follow the [root installation guide](../../README.md). Copy the complete folder, including references and scripts, not just SKILL.md. No application dependencies are required.

## Prompt examples

- Development: "Use database-optimization while implementing this endpoint. Avoid N+1 and verify tenant isolation."
- Audit: "Audit the backend for inefficient SQL and indexes; report findings before editing."
- Index review: "Map hot queries to existing indexes, examine execution plans and propose safe migrations with rollback."
- Regression: "Review this Git diff for database performance regressions and add query-budget tests."

## Workflow

1. Discover schema, engine/version, ORM and workload.
2. Establish a baseline and inspect query fingerprints.
3. Diagnose N+1 and index/plan issues.
4. Propose scoped changes with trade-offs.
5. Implement only within authorized scope, test correctness and compare measurements.
6. Report evidence, risks and rollback. Mark unavailable measurements as not run.

## Reference map

Start with [SKILL.md](SKILL.md). Load [N+1](references/n-plus-one.md), [indexing and pagination](references/indexing-pagination.md), [index audit fundamentals](references/indexing/index-fundamentals.md), [execution plans](references/indexing/execution-plans.md), [safe index migrations](references/indexing/safe-index-migrations.md), and the relevant ORM/engine guide. See [validation](references/validation.md) for test and report format.

## SQL diagnostics

| Script | Engine | Purpose |
| --- | --- | --- |
| [postgresql-index-audit.sql](scripts/postgresql-index-audit.sql) | PostgreSQL | Index inventory, definition, constraint and validity flags |
| [postgresql-unused-indexes.sql](scripts/postgresql-unused-indexes.sql) | PostgreSQL | Low/zero scan candidates and stats reset context |
| [postgresql-index-sizes.sql](scripts/postgresql-index-sizes.sql) | PostgreSQL | Largest indexes |
| [postgresql-slow-queries.sql](scripts/postgresql-slow-queries.sql) | PostgreSQL 13+ | Expensive normalized queries; requires existing pg_stat_statements |
| [mysql-index-audit.sql](scripts/mysql-index-audit.sql) | MySQL 8+ | Index inventory and optional Performance Schema usage |

Run only with approved access, preferably on staging or an approved replica. Use a read-only account, query timeouts and bounded output. Review each statement before running; diagnostics can consume resources and expose query text or identifiers. Scripts contain no DDL/DML; they do not install extensions or change settings. Example:

```bash
psql -X -v ON_ERROR_STOP=1 -f scripts/postgresql-index-audit.sql
mysql --database=my_database < scripts/mysql-index-audit.sql
```

Use your existing secure connection configuration; do not embed passwords. Some views require privileges or enabled instrumentation. Results are candidates, not automatic migration instructions. Zero scans never justify dropping an index alone.

## Safety and limitations

Never automatically drop indexes, change production schema, run load tests or execute mutating EXPLAIN ANALYZE. Even read-only diagnostics require approved access. Inspect constraints, statistics reset windows, replicas and rare workloads. Index changes require evidence, rollout and rollback plans. Fewer queries do not guarantee lower latency. The scripts are templates; validate against your server version before use.
