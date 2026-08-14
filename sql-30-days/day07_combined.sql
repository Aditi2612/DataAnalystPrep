-- ============================================
-- Day 7 — Combined queries (JOIN + GROUP BY + HAVING)
-- How real interview questions come: multiple concepts at once
-- customers: id, name, city | orders: id, customer_id, amount
-- ============================================

-- 1. Customers whose total order amount is more than 5000
SELECT c.name, SUM(o.amount) AS total_amnt
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
GROUP BY c.name
HAVING SUM(o.amount) > 5000;

-- 2. Cities with more than 2 customers who placed at least one order
SELECT c.city, COUNT(DISTINCT o.customer_id) AS customer_count
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
GROUP BY c.city
HAVING COUNT(DISTINCT o.customer_id) > 2;

-- ============================================
-- KEY:
-- HAVING runs BEFORE SELECT assigns aliases → safest to repeat the
--   aggregate in HAVING: HAVING SUM(o.amount) > 5000 (works everywhere)
-- Consistency rule: whatever you COUNT/aggregate in SELECT, match it
--   in HAVING. Used COUNT(DISTINCT ...) in SELECT → use it in HAVING too.
-- ============================================
