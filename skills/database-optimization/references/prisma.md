# Prisma
Inspect installed client/version, provider and generated schema. Use select/include to load required relations; avoid findUnique/findMany per result. Verify query logs: relation strategy and batching behavior vary by version/provider. If supported, evaluate relationLoadStrategy join versus query empirically.

```ts
const rows = await prisma.order.findMany({
  where: { tenantId }, take: 100, orderBy: { id: 'desc' },
  select: { id: true, userId: true },
});
const ids = [...new Set(rows.map(r => r.userId).filter(id => id != null))];
const users = ids.length ? await prisma.user.findMany({
  where: { tenantId, id: { in: ids } }, select: { id: true, name: true },
}) : [];
```
Map users to parent records by ID while preserving missing relations. Use createMany/updateMany where semantics permit; nested writes or transactions when atomicity matters. Avoid unsafe raw SQL APIs. Do not assume Promise.all resolves N+1.
