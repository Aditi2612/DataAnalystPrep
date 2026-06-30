-- Completeness check: count missing interest rates (NULL or blank)
SELECT COUNT(*) AS missing_int_rate
FROM loans
WHERE loan_int_rate IS NULL OR loan_int_rate = '';
