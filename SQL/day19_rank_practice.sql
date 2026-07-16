-- ============================================
-- Day 19 — RANK window function practice
-- RULE: "within" → PARTITION BY | "by" → ORDER BY
-- ============================================

-- 1. Rank loans by AMOUNT (highest first) within each grade
SELECT
    loan_grade,
    loan_amnt,
    RANK() OVER (PARTITION BY loan_grade ORDER BY loan_amnt DESC) AS rank_in_grade
FROM loans;

-- 2. Rank loans by INTEREST RATE (highest first) within each grade
SELECT
    loan_grade,
    loan_amnt,
    RANK() OVER (PARTITION BY loan_grade ORDER BY loan_int_rate DESC) AS rank_in_grade
FROM loans;

-- ============================================
-- PARTITION BY = the group you rank WITHIN
-- ORDER BY     = the value you rank BY
-- ============================================
