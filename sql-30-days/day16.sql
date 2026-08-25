-- Day 16

-- 1. Total revenue per month
SELECT MONTH(order_date) AS month, SUM(amount) AS total_revenue
FROM orders
GROUP BY month
ORDER BY month;

-- 2. Second-highest salary in each department
WITH ranked AS (
    SELECT id, name, department, salary,
           DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT id, name, department, salary
FROM ranked
WHERE rnk = 2;
