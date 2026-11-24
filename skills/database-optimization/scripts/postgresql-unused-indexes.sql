-- Candidates only. Counters can reset; inspect every workload and constraint.
SELECT stats_reset FROM pg_stat_database WHERE datname = current_database();
SELECT s.schemaname, s.relname, s.indexrelname, s.idx_scan,
       pg_size_pretty(pg_relation_size(s.indexrelid)) AS index_size,
       x.indisunique, x.indisprimary, x.indisvalid,
       EXISTS (SELECT 1 FROM pg_constraint c WHERE c.conindid = s.indexrelid) AS constraint_reference
FROM pg_stat_user_indexes s JOIN pg_index x ON x.indexrelid = s.indexrelid
WHERE s.idx_scan = 0
ORDER BY pg_relation_size(s.indexrelid) DESC
LIMIT 200;
