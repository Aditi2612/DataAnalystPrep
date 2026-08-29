-- Day 19

-- 1. Departments with >3 employees: count + average salary
SELECT department, COUNT(id) AS num_employees, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING COUNT(id) > 3;

-- 2. Products priced above their category's average
WITH product_avg AS (
    SELECT name, price, category,
           AVG(price) OVER (PARTITION BY category) AS cat_avg
    FROM products
)
SELECT name, price, category
FROM product_avg
WHERE price > cat_avg;

-- KEY: when you GROUP BY, only select grouping columns + aggregates
--   (no individual-row columns like 'name').
-- Window functions are computed too late for a direct WHERE →
--   wrap in a CTE, then filter in the outer query.
