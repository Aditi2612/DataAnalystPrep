-- Day 18

-- 1. Total order amount per city, highest first
SELECT c.city, COALESCE(SUM(o.amount), 0) AS total_amount
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
GROUP BY c.city
ORDER BY total_amount DESC;;

-- 2. Running total of revenue by month
SELECT id, month, revenue,
       SUM(revenue) OVER (ORDER BY month) AS running_total
FROM sales;

-- KEY: SUM() OVER (ORDER BY ...) = running total (accumulates row by row).
-- Without ORDER BY inside OVER, it'd be the same grand total on every row.
