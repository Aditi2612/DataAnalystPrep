-- Day 21

-- 1. Total credits and debits per account (conditional aggregation)
SELECT account_id,
       SUM(CASE WHEN type = 'credit' THEN amount ELSE 0 END) AS total_credits,
       SUM(CASE WHEN type = 'debit'  THEN amount ELSE 0 END) AS total_debits
FROM transactions
GROUP BY account_id;

-- 2. Top 3 highest-paid employees (DENSE_RANK handles ties)
WITH ranked AS (
    SELECT name, salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT name, salary
FROM ranked
WHERE rnk <= 3;

-- KEY: don't mix LIMIT with a ranking function.
-- LIMIT N = exactly N rows (ties cut arbitrarily).
-- DENSE_RANK + WHERE rnk <= N = top N including ties (needs CTE).
