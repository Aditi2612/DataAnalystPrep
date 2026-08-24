-- Day 14

-- 1. Categories whose most expensive product is priced above 1000
SELECT category, MAX(price) AS max_price
FROM products
GROUP BY category
HAVING MAX(price) > 1000;

-- 2. Each employee next to their manager (self-join, LEFT keeps CEO)
SELECT e1.name AS employee_name, e2.name AS manager_name
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.id;
