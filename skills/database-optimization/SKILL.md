---
name: database-optimization
description: Detect, prevent, diagnose and optimize database query performance, including N+1, over-fetching, missing indexes, inefficient pagination, bulk operations, execution plans, locking and connection pooling. Use when writing, reviewing or auditing database-backed code, ORM queries, schemas, migrations, APIs, reports or slow jobs.
---

# Database Optimization

## Modes
- Development: review changed database operations before completion.
- Audit: inventory query paths, rank findings, and propose or implement scoped fixes as requested.
- Incident: identify the bottleneck from available telemetry before changing code.

## Workflow
1. Identify database engine, version, ORM, schema, relationships, tenancy, transaction semantics and workload. Inspect existing conventions and indexes. Load only relevant references.
2. Establish baseline where possible: queries per request, repeated normalized SQL, latency (p50/p95/p99), rows returned/scanned, memory, locks and pool saturation. Use representative data and safe environments. Distinguish measurements from estimates.
3. Trace queries through loops, serializers, resolvers, hooks, jobs and helper calls. Check whether query count grows with input size. Parallelizing N+1 does not remove it.
4. Choose the smallest effective change: projection, eager loading, batched lookup, join, EXISTS, aggregation, bounded pagination, bulk writes or suitable index. Consider cardinality, payload and round trips. Do not automatically use joins for multiple to-many relationships.
5. Preserve ordering, null semantics, duplicates, pagination, authorization, tenant boundaries, soft deletes, precision, transaction guarantees and existing business behavior. Parameterize inputs.
6. Validate with regression tests, query-count instrumentation and representative execution plans. Compare before/after under equivalent conditions. Check write costs, memory, lock duration and pool usage.
7. Report remaining risks and rollback options. Never fabricate measurements or claim a speedup solely from fewer queries.

## Mandatory guardrails
- No unbounded list reads, avoid SELECT * on hot paths unless justified.
- Batch independent queries; retain sequential dependencies where correctness requires them.
- Scope every batch/join to required authorization and tenant filters; do not trust globally unique IDs as a replacement for authorization.
- Preserve per-parent limits; a global LIMIT on child rows is not equivalent.
- Bound batch sizes by driver limits and memory; use deterministic keyset pagination for large sequential lists where appropriate.
- Evaluate composite index order against actual filters and ordering. Avoid redundant indexes and speculative migrations.
- Do not run mutating EXPLAIN ANALYZE, load tests, production migrations, or destructive operations without explicit authorization. Even read-only analysis can be costly; prefer staging or approved replicas.
- Cache only when consistency, invalidation, authorization and tenant-scoped keys are defined.
- Keep transactions short but do not weaken atomicity or isolation for performance.

## Reference routing
- N+1 and fetching: references/n-plus-one.md
- Drizzle: references/drizzle.md
- Laravel Eloquent: references/laravel.md
- Prisma: references/prisma.md
- Raw SQL: references/sql.md
- PostgreSQL: references/postgresql.md
- MySQL: references/mysql.md
- Indexes and pagination: references/indexing-pagination.md
- Writes, transactions, pooling and caching: references/runtime.md
- Testing and reporting: references/validation.md

## Finding format
For each finding include severity, file:line, evidence, affected workload, query growth, proposed fix, semantic risks, validation and measured results (or explicitly not measured). Prioritize observed impact and correctness over speculative improvements. Report skipped checks and why.
