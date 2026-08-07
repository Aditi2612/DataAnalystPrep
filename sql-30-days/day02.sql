-- Day 2 — JOINs
-- Tables: customers(id, name, city) | orders(id, customer_id, amount)

-- 1. Customers who placed orders + their amounts (INNER)
SELECT c.name, o.amount
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id;

-- 2. ALL customers + amounts, non-orderers show NULL (LEFT)
SELECT c.name, o.amount
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id;

-- 3. Total order amount per customer, only those who ordered (INNER + GROUP BY)
SELECT c.name, SUM(o.amount) AS total_order
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
GROUP BY c.name;

-- 4. Customers who placed NO orders (anti-join: LEFT + IS NULL)
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;

-- KEY:
-- INNER = intersection (matches only)
-- LEFT = all left rows + matches (unmatched → NULL)
-- Anti-join: LEFT JOIN + WHERE right.col IS NULL = "who has NONE"
-- Always join on the FOREIGN KEY (o.customer_id), not the other PK
