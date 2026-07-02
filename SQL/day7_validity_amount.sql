-- Validity check: impossible loan amounts (<= 0)
SELECT *
FROM loans
WHERE loan_amnt <= 0;
