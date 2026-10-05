SUBQUERIES
────────────────────────
Subquery = query inside query

Correlated subquery
→ inner query refers to outer query
→ evaluated conceptually for each outer row

IN
→ matches ANY value in returned list

NOT IN
→ beware NULL
→ NULL in subquery can make comparison UNKNOWN
→ WHERE keeps only TRUE

NOT EXISTS
→ checks whether matching row DOES NOT exist
→ works safely with NULLs

ALL
→ condition must be true for EVERY value

ANY
→ condition must be true for AT LEAST ONE value


SET OPERATIONS
────────────────────────
UNION
→ A + B
→ removes duplicates

INTERSECT
→ A ∩ B
→ common values

EXCEPT
→ A − B
→ values in first query but NOT second

EXAM TIPS
────────────────────────
NOT IN + NULL       → UNKNOWN
NOT EXISTS          → checks row-by-row existence

> ALL              → greater than maximum
> ANY              → greater than at least one

Correlated         → inner query references outer alias

UNION              → duplicates removed