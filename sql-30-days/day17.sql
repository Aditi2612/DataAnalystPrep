-- Day 17

-- 1. Regions with total sales above 10000, highest first
SELECT region, SUM(amount) AS total_sales
FROM sales
GROUP BY region
HAVING SUM(amount) > 10000
ORDER BY total_sales DESC;

-- 2. Top earner in each department
WITH ranked AS (
    SELECT id, name, department, salary,
           RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT id, name, department, salary
FROM ranked
WHERE rnk = 1;

-- KEY: after RANK + WHERE filters the rows, you're done.
-- Don't add GROUP BY — you're selecting rows, not aggregating.
