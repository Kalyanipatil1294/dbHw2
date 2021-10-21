-- Get the businesses in San Jose, CA that are still “in business”. Results should be sorted by
-- review counts in descending order. Return for the top 7 businesses, the business id, name,
-- review count, and average rating of the business.
SELECT B.BUSINESS_ID, B.B_NAME, AVG (R.RATING) AS AVG_RATING, COUNT (R.R_ID) AS REVIEW_COUNT FROM BUSINESS B, REVIEW R WHERE B.STATE ='CA' AND B.CITY='San Jose'AND B.OPEN='T' AND R.BUSINESS_NO=B.BUSINESS_ID GROUP BY B.BUSINESS_ID, B.B_NAME;
SELECT B.BUSINESS_ID, AVG (R.RATING) AS AVG_RATING FROM BUSINESS B, REVIEW R WHERE R.BUSINESS_NO=B.BUSINESS_ID GROUP BY B.BUSINESS_ID;
SELECT R.R_ID FROM REVIEW R, BUSINESS B WHERE R.BUSINESS_NO=B.BUSINESS_ID;
