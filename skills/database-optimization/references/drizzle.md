# Drizzle ORM
Inspect installed version and relational API before choosing syntax. Prefer explicit projections and scoped joins for to-one relationships; use relational queries or batched lookups for collections. Check emitted SQL rather than assuming the ORM's query count.

```ts
const rows = await db.select({ id: orders.id, customer: users.name })
  .from(orders)
  .leftJoin(users, and(eq(users.id, orders.userId), eq(users.tenantId, orders.tenantId)))
  .where(eq(orders.tenantId, tenantId))
  .orderBy(desc(orders.id)).limit(100);
```
Assumes numeric/orderable unique IDs and a tenant-scoped relationship. For batched reads use inArray with deduplicated keys and handle empty arrays explicitly. Use insert().values([...]) for bounded bulk inserts. Use parameterized sql templates for unsupported expressions; never interpolate untrusted raw SQL. Inspect generated SQL and driver logs in a safe environment. Verify indexes and constraints in actual migrations.
