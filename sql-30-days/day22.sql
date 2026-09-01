-- Day 22

-- 1. Order count and % of total, per status
SELECT status,
       COUNT(*) AS status_count,
       COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS pct_of_total
FROM orders
GROUP BY status;

-- 2. Employees who earn more than their manager (self-join)
SELECT e1.name AS employee, e2.name AS manager
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.id
WHERE e1.salary > e2.salary;

-- KEY:
-- COUNT(*) OVER () with empty () = grand total across all rows.
-- Multiply by 100.0 (not 100) to force decimal division.
