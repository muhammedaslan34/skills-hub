-- Largest user indexes; sizes are point-in-time values.
SELECT schemaname, relname, indexrelname,
       pg_relation_size(indexrelid) AS bytes,
       pg_size_pretty(pg_relation_size(indexrelid)) AS size,
       idx_scan
FROM pg_stat_user_indexes
ORDER BY bytes DESC LIMIT 100;
