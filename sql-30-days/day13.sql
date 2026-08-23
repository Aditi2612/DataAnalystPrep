-- Day 13

-- 1. Number of employees hired per year
SELECT YEAR(hire_date) AS hire_year, COUNT(id) AS num_hired
FROM employees
GROUP BY hire_year
ORDER BY hire_year;

-- 2. All customers + total order amount (including never-ordered)
SELECT c.id, c.name, SUM(o.amount) AS total_amount
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name;

-- KEY: SELECT mixing an aggregate (SUM/COUNT/AVG) with plain columns
-- → every plain column must appear in GROUP BY.
