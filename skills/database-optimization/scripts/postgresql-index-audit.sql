-- Read-only inventory; run with approved access. Review output before sharing.
SELECT n.nspname AS schema_name, t.relname AS table_name,
       i.relname AS index_name, x.indisunique, x.indisprimary,
       x.indisvalid, x.indisready,
       EXISTS (SELECT 1 FROM pg_constraint c WHERE c.conindid = i.oid) AS constraint_reference,
       pg_get_indexdef(i.oid) AS definition
FROM pg_index x
JOIN pg_class i ON i.oid = x.indexrelid
JOIN pg_class t ON t.oid = x.indrelid
JOIN pg_namespace n ON n.oid = t.relnamespace
WHERE n.nspname NOT IN ('pg_catalog', 'information_schema')
  AND n.nspname NOT LIKE 'pg_toast%'
  AND n.nspname NOT LIKE 'pg_temp_%'
ORDER BY n.nspname, t.relname, i.relname
LIMIT 1000;
