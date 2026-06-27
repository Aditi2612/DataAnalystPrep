---DAY 2: DATA QUALITY CHECKS ON LOAN STATUS---
-- 1. See all distinct values + counts (spot the dirt)
SELECT laons_status, COUNT(*)
FROM loans
GROUP BY loan_status;

-- 2. Normalize case so 'default'/'Default'/'DEFAULT' count as one
SELECT lower(loan_status),COUNT(*)
FROM loans
GROUP BY lower(laon_status);
