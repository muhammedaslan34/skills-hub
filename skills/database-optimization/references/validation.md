# Validation and reporting
Establish comparable baseline and after measurements on representative data, same filters, workload, hardware and cache conditions. Capture query count, normalized fingerprints, latency distribution, rows scanned/returned, buffer/IO and memory where available. Test empty results, missing relations, duplicate keys, cross-tenant access, soft deletes, ordering, pagination boundaries, bulk operation failures and concurrent changes.

For N+1 regression tests, instrument the existing driver/ORM around the complete request including serialization. Test multiple page sizes and assert a documented upper bound or expected chunk-based growth. Do not count unrelated setup queries. Redact SQL bindings and personal data.

Report: severity (critical/high/medium/low with rationale), file:line, evidence, before/after implementation, measured or estimated query counts (label clearly), latency if measured, correctness checks, index/migration impact, rollback, remaining risks. A query-count reduction is not proof of latency improvement. If tools or data are unavailable, report the validation as not run.
