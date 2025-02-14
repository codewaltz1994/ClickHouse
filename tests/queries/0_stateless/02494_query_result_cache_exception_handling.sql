-- Tags: no-parallel
-- Tag no-parallel: Messes with internal cache

SYSTEM DROP QUERY RESULT CACHE;

-- If an exception is thrown during query execution, no entry must be created in the query result cache
SELECT throwIf(1) SETTINGS enable_experimental_query_result_cache = true; -- { serverError FUNCTION_THROW_IF_VALUE_IS_NON_ZERO }
SELECT COUNT(*) FROM system.query_result_cache;

SYSTEM DROP QUERY RESULT CACHE;
