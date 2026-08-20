-- Day 10

-- 1. Top 2 highest-paid employees per department (CTE + RANK + WHERE)
WITH ranked AS (
    SELECT id, name, department, salary,
           RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT id, name, department, salary
FROM ranked
WHERE rnk < 3;

-- 2. Month-over-month revenue change
SELECT id, month, revenue,
       revenue - LAG(revenue) OVER (ORDER BY month) AS mom_change
FROM sales;

-- KEY: after ranking with a window function, filter the rank with WHERE,
-- not GROUP BY/HAVING. You're filtering rows, not aggregating them.
