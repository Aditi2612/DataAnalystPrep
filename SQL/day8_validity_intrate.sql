-- Validity check: impossible interest rates (> 100%)
SELECT *
FROM loans
WHERE loan_int_rate > 100;
