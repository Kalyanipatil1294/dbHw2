-- Find every business in CA that has the word “Coffee” in its name.
SELECT B_NAME FROM BUSINESS B WHERE B.STATE='CA' AND B.B_NAME LIKE '%Coffee%';
