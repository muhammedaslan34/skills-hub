# Raw SQL
Use bound parameters (placeholder syntax depends on driver). Prefer projections, scoped joins, EXISTS for existence, GROUP BY for aggregates and set-based operations. Example PostgreSQL-style placeholders:

```sql
SELECT o.id, u.name
FROM orders o
LEFT JOIN users u ON u.id = o.user_id AND u.tenant_id = o.tenant_id
WHERE o.tenant_id = $1
ORDER BY o.id DESC LIMIT $2;
```
For multiple to-many relations, aggregate each independently or batch children to avoid fan-out. Check NULL handling and COUNT(*) vs COUNT(column). Avoid functions/casts on indexed filter columns unless supported by a matching index. Dynamic identifiers must be allowlisted, not simply parameterized as values. Compare execution plans before choosing correlated subqueries, CTEs or joins.
