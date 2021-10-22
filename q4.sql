-- Get the businesses in San Jose, CA that have been reviewed by more than 5 `elite' users.
-- Users who have written more than 10 reviews are called `elite' users. Results should be
-- ordered by the `elite' user count in descending order. Return for the top 5 businesses, the
-- business id, business name, business review count, average rating, and the count of the `elite'
-- users for the particular business.


SELECT B.BUSINESS_ID, B.B_NAME, B.COUNT, AVG(R.RATING), COUNT(R.AUTHOR)
FROM BUSINESS B, REVIEW R
WHERE B.BID=R.BUSINESSID AND B.CITY='SAN JOSE' AND B.STATE='CA' AND R.AUTHOR IN( SELECT R1.AUTHOR
                                                                                 FROM REVIEW R1
                                                                                 GROUP BY R1.AUTHOR
                                                                                 HAVING COUNT(*) >= 10)
GROUP BY B.BID, B.NAME, B.COUNT
HAVING COUNT(*) > 5;