-- MySQL 8+. Requires selected database and approved metadata access.
SELECT TABLE_SCHEMA, TABLE_NAME, INDEX_NAME, NON_UNIQUE, SEQ_IN_INDEX,
       COLUMN_NAME, EXPRESSION, COLLATION, CARDINALITY, SUB_PART,
       INDEX_TYPE, IS_VISIBLE
FROM information_schema.STATISTICS
WHERE TABLE_SCHEMA = DATABASE()
ORDER BY TABLE_NAME, INDEX_NAME, SEQ_IN_INDEX LIMIT 1000;

-- Optional usage view: requires Performance Schema instrumentation and privileges.
-- Zero counts are candidates only; never automatically drop.
SELECT OBJECT_SCHEMA, OBJECT_NAME, INDEX_NAME, COUNT_STAR, COUNT_READ, COUNT_WRITE
FROM performance_schema.table_io_waits_summary_by_index_usage
WHERE OBJECT_SCHEMA = DATABASE() AND INDEX_NAME IS NOT NULL
ORDER BY COUNT_READ, OBJECT_NAME, INDEX_NAME LIMIT 200;
