-- Get the review counts for businesses in each business category. Results should be sorted by
-- the review counts in descending order.
select COUNT(BUSINESS_ID) from BUSINESS;
select COUNT(B_CAT_ID) AS ReviewCount from BUSINESS_CATEGORY;
SELECT B.BUSINESS_ID
FROM BUSINESS B, REVIEW R
WHERE
GROUP BY B.BUSINESS_ID