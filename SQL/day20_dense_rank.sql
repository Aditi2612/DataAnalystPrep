-- ============================================
-- Day 20 — DENSE_RANK window function
-- ============================================

-- Dense rank of loans by amount (highest first) within each grade
SELECT
    loan_grade,
    loan_amnt,
    DENSE_RANK() OVER (PARTITION BY loan_grade ORDER BY loan_amnt DESC) AS rank_in_grade
FROM loans;

-- ============================================
-- RANK vs DENSE_RANK (values tied at 2nd place):
-- RANK:        1, 2, 2, 4   → SKIPS 3 after the tie
-- DENSE_RANK:  1, 2, 2, 3   → no gap, continues
--
-- RANK counts positions | DENSE_RANK counts distinct ranks
-- ============================================
