-- Get the businesses in San Jose, CA that have the highest percentage of reviews with rating of
-- 5, and have been reviewed at least 5 times. Results should be ordered by the percentage in
-- descending order. Return for the top 5 businesses, the business id, business name, review
-- count, and percentage of reviews with rating of 5.
--done


ALTER TABLE BUSINESS add REVIEW_COUNT int;
UPDATE BUSINESS
SET REVIEW_COUNT = (SELECT COUNT(*)
                            FROM REVIEW
                            WHERE BUSINESS.BUSINESS_ID = REVIEW.BUSINESS_NO
);

SELECT B.BUSINESS_ID,B.B_NAME,B.REVIEW_COUNT,((SELECT COUNT(*) FROM REVIEW R WHERE R.RATING = 5 AND R.BUSINESS_NO=B.BUSINESS_ID)/(SELECT COUNT(*) FROM REVIEW R WHERE R.RATING=5)) AS PERCENTABE
FROM BUSINESS B
WHERE B.CITY='San Jose' AND B.STATE ='CA'
GROUP BY B.BUSINESS_ID, B.B_NAME, B.REVIEW_COUNT
having B.REVIEW_COUNT>=5
ORDER BY PERCENTABE DESC;