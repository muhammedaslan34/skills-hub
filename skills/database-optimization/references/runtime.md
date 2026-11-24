# Writes, transactions, pooling and caching
Batch independent writes with bounded sizes. Preserve validation, model events, auditing, idempotency and conflict behavior. Use explicit transactions when multiple changes must be atomic; avoid network waits within transactions where feasible. Keep lock ordering consistent and retry transient failures only with bounded backoff and safe idempotency. Do not lower isolation without a correctness analysis.

Pool sizes must account for all processes, workers and replicas, database capacity and reserved connections. Measure checkout waits and saturation before increasing limits. Use backpressure rather than unbounded parallelism. Replicas may lag; route consistency-sensitive reads appropriately.

Cache only measured expensive or frequent reads where staleness is acceptable. Define TTL, invalidation, tenant and authorization scoping, stampede protection and behavior on failure. Never cache sensitive results across principals. Caching is not a substitute for correcting inefficient SQL.
