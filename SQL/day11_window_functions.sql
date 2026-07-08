
-- ============================================
-- WINDOW FUNCTIONS — Day 11
-- Rule: OVER(PARTITION BY) keeps all rows; GROUP BY collapses them.
-- "Filtering or showing?" → Filtering = use CTE. Showing = single query.
-- ============================================

-- 1. AVG per grade, shown on every row
SELECT
    loan_grade,
    loan_amnt,
    AVG(loan_amnt) OVER (PARTITION BY loan_grade) AS avg_for_grade
FROM loans;

-- 2. MAX interest rate per grade, on every row
SELECT
    loan_grade,
    loan_int_rate,
    MAX(loan_int_rate) OVER (PARTITION BY loan_grade) AS max_rate_for_grade
FROM loans;

-- 3. COUNT of loans per grade, on every row
SELECT
    loan_grade,
    loan_amnt,
    COUNT(loan_id) OVER (PARTITION BY loan_grade) AS no_of_loans_per_grade
FROM loans;

-- 4. RANK loans by amount (highest first) within each grade
SELECT
    loan_grade,
    loan_amnt,
    RANK() OVER (PARTITION BY loan_grade ORDER BY loan_amnt DESC) AS rank_in_grade
FROM loans;

-- ============================================
-- KEY CONCEPTS
-- RANK: skips after ties (1,1,3)
-- DENSE_RANK: no gaps (1,1,2)
-- LIMIT counts ROWS; DENSE_RANK counts DISTINCT values
-- CTE needed only when filtering on the rank (WHERE rnk = 2)
-- ============================================
