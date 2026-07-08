## SQL: Second Highest Value — 3 approaches

# 1. LIMIT/OFFSET — sorts rows, skips 1
SELECT salary FROM emp ORDER BY salary DESC LIMIT 1 OFFSET 1;
# ⚠️ Counts ROWS. If two tie for top, returns duplicate top, not true 2nd.

# 2. Subquery — max below the max
SELECT MAX(salary) FROM emp WHERE salary < (SELECT MAX(salary) FROM emp);
# ✅ Handles ties, returns true 2nd distinct value.

# 3. CTE + DENSE_RANK (interview favorite)
WITH ranked AS (
  SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
  FROM emp
)
SELECT salary FROM ranked WHERE rnk = 2;
# ✅ Counts DISTINCT values, ties share rank, no gaps.

## Key concept
- DENSE_RANK counts distinct values; LIMIT counts rows.
- RANK skips numbers after ties (1,1,3); DENSE_RANK doesn't (1,1,2).
- For "Nth highest distinct value" → use DENSE_RANK.
