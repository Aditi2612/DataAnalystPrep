-- ============================================
-- Day 32 — SQL Practice: GROUP BY/HAVING + Window AVG
-- ============================================

-- 1. Total loan amount per grade, only where total > 1,000,000
--    GROUP BY collapses rows into one per grade; HAVING filters the groups
SELECT loan_grade, SUM(loan_amnt) AS total_amt
FROM loans
GROUP BY loan_grade
HAVING total_amt > 1000000;

-- 2. Average loan amount per grade, shown on EVERY row (window function)
--    OVER(PARTITION BY) keeps all rows; no ORDER BY needed for a plain average
SELECT loan_grade, loan_amnt,
       AVG(loan_amnt) OVER (PARTITION BY loan_grade) AS avg_for_grade
FROM loans;

-- KEY: ORDER BY inside OVER() is only for sequence-dependent things
-- (running totals, RANK, LAG). Plain AVG/SUM/COUNT of a group don't need it.
