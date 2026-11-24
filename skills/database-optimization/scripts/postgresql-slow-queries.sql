-- PostgreSQL 13+; requires pg_stat_statements already installed and accessible.
-- Adjust schema qualification if extension lives outside search_path.
-- Query text may be sensitive. Do not export without redaction.
SELECT queryid, calls, total_exec_time, mean_exec_time, rows,
       shared_blks_hit, shared_blks_read, left(query, 2000) AS query_sample
FROM pg_stat_statements
WHERE dbid = (SELECT oid FROM pg_database WHERE datname = current_database())
ORDER BY total_exec_time DESC LIMIT 50;
