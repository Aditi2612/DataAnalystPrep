# SQL Notes

## Order written
SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY

## Order executed
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY
(Why you can't use a SELECT alias in WHERE)

## Key rules
- WHERE filters rows (before grouping) | HAVING filters groups (after)
- Strings need single quotes: WHERE dept = 'Sales'
- Match case exactly in string comparisons
- NULL → use IS NULL / IS NOT NULL, never = NULL
