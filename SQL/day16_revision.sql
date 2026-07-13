-- ============================================
-- Day 16 Revision — GROUP BY/HAVING + Window Functions
-- ============================================

-- 1. Loan grades with more than 100 loans (GROUP BY + HAVING)
SELECT
    loan_grade,
    COUNT(loan_id) AS cnt
FROM loans
GROUP BY loan_grade
HAVING cnt > 100;

-- 2. Count of loans per grade, shown on EVERY row (window function)
SELECT
    loan_grade,
    loan_amnt,
    COUNT(loan_id) OVER (PARTITION BY loan_grade) AS count_of_loans
FROM loans;

-- ============================================
-- KEY: GROUP BY collapses rows into one per group.
--      OVER (PARTITION BY) keeps all rows, adds the group calc alongside.
-- ============================================
