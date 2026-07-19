-- ============================================
-- Day 22 — LAG window function
-- LAG(column) grabs the value from the PREVIOUS row
-- ============================================

-- Previous interest rate within each grade
SELECT
    loan_grade,
    loan_int_rate,
    LAG(loan_int_rate) OVER (PARTITION BY loan_grade ORDER BY loan_int_rate) AS previous_rate
FROM loans;

-- ============================================
-- HOW IT WORKS:
-- rate | LAG(rate)
-- 5.0  | NULL      ← nothing before it
-- 6.0  | 5.0
-- 7.5  | 6.0
--
-- USE: put last year's value next to this year's → subtract → get change
-- LEAD() = same but grabs the NEXT row
-- Useful for RBI project: year-over-year change per district
-- ============================================SELECT
    loan_grade,
    loan_amnt,
    LAG(loan_amnt) OVER (PARTITION BY loan_grade ORDER BY loan_amnt) AS previous_amount
FROM loans;
