-- Get the businesses in San Jose, CA that have been reviewed by more than 5 `elite' users.
-- Users who have written more than 10 reviews are called `elite' users. Results should be
-- ordered by the `elite' user count in descending order. Return for the top 5 businesses, the
-- business id, business name, business review count, average rating, and the count of the `elite'
-- users for the particular business.

SELECT * FROM (SELECT R.BUSINESS_NO, COUNT(R.BUSINESS_NO) AS "elite", AVG (R.RATING) AS AVG, B.B_NAME, B.REVIEW_COUNT FROM REVIEW R JOIN BUSINESS B ON B.BUSINESS_ID=R.BUSINESS_NO WHERE R.AUTHOR IN (SELECT AUTHOR FROM REVIEW R GROUP BY AUTHOR HAVING COUNT(AUTHOR) >= 10) GROUP BY R.BUSINESS_NO, B.B_NAME, B.REVIEW_COUNT ORDER BY "elite" DESC) WHERE ROWNUM <= 5;