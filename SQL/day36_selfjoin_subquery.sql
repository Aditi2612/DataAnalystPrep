-- ============================================
-- Day 36 — Interview SQL: Self-Join + Subquery
-- ============================================

-- 1. SELF-JOIN: show each employee next to their manager's name
--    Manager is in the SAME table, so join the table to itself
--    Two aliases (e = employee, m = manager) treat one table as two
SELECT e.name AS employee, m.name AS manager
FROM employees e
JOIN employees m ON e.manager_id = m.id;

-- 2. SECOND HIGHEST SALARY (subquery, no LIMIT)
--    Take the max salary that is LESS than the overall max
SELECT MAX(salary) AS second_highest
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

-- ============================================
-- KEY:
-- Self-join → a JOIN
