# Lucee Memcached Extension

Issues: https://luceeserver.atlassian.net/issues/?jql=labels%20%3D%20memcached

Docs: https://docs.lucee.org/categories/cache.html

## Limitations

Memcached's protocol doesn't expose key enumeration, so any CFML cache feature that needs to list or count keys is constrained:

- `cacheCount(cacheName)` returns `-1` — the documented "count not available" sentinel from the `Cache` interface. Use `if ( cacheCount(cn) GTE 0 )` before relying on the value. ([LDEV-6324](https://luceeserver.atlassian.net/browse/LDEV-6324))
- `cacheGetAllIds(filter, cacheName)` returns an empty array.
- `cacheGetAll(filter, cacheName)` is currently broken against memcached and throws — see [LDEV-2275](https://luceeserver.atlassian.net/browse/LDEV-2275).
- `cacheClear(filter, cacheName)` returns `-1`; the filter is ignored because keys can't be enumerated. `cacheClear()` without a filter performs a cache-wide flush and works.
- The Lucee Admin cache edit page shows `Clear cache (count unsupported)` for memcached connections instead of an item count.

Single-key operations work normally: `cachePut`, `cacheGet`, `cacheGetMetadata`, `cacheKeyExists`, `cacheRemove`.
