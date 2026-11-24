# Laravel Eloquent
Use with() for known relationships, loadMissing() for already retrieved models, withCount()/withExists() for aggregates. Include relationship keys in projections. Check resource serializers, accessors and nested relations for lazy loads.

```php
$orders = Order::query()
    ->where('tenant_id', $tenantId)
    ->select('id', 'tenant_id', 'user_id', 'created_at')
    ->with(['user' => fn ($q) => $q->where('tenant_id', $tenantId)->select('id', 'name')])
    ->orderByDesc('id')->limit(100)->get();
```
Adapt tenant scopes to schema. Consider Model::preventLazyLoading() in development/tests; use query listeners or Telescope in appropriate environments without exposing sensitive bindings. Use chunkById/lazyById for large jobs where compatible. Bulk updates/inserts can bypass model events: preserve required effects. Cursor pagination needs stable unique ordering.
