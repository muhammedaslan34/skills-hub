# N+1 and relationship loading

Look for DB calls in loops, async maps, property access that triggers lazy loading, GraphQL field resolvers, serializers, nested relationship traversal, and per-row count/existence queries. A list of N parents with one lookup per parent can issue 1+N queries; nested relations can grow faster.

- To-one: use a scoped join or collect distinct foreign keys, fetch via IN, and map by key.
- To-many: fetch children for a bounded parent page and group by foreign key. Avoid multiplying rows across independent to-many joins.
- Counts: use grouped aggregate or correlated aggregate with a suitable plan; existence: use EXISTS.
- Resolver batching: use request-scoped loaders, not globally shared authorization-sensitive caches.
- Preserve missing relations, ordering, per-parent limits and duplicate handling. For top K children per parent consider window functions or lateral queries where supported.
- Chunk large IN lists; query count may grow with chunks, not individual rows.
- Test at 1, 10, 100 parents. Inspect normalized query fingerprints and assert a justified query budget.
