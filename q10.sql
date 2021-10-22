-- List users that have been to at least 3 distinct states. Order by number of states traveled to
-- (decreasing), break ties with user id (increasing). For each user, list his/her user id, name and
-- list of states traveled to.

SELECT DISTINCT Y.YELP_USER_ID, Y.F_NAME, B.STATE FROM YELP_USER Y, REVIEW R, BUSINESS B WHERE Y.YELP_USER_ID=R.AUTHOR AND R.BUSINESS_NO=B.BUSINESS_ID AND Y.YELP_USER_ID IN (SELECT R1.AUTHOR FROM REVIEW R1, BUSINESS B1 WHERE R1.BUSINESS_NO=B1.BUSINESS_ID GROUP BY R1.AUTHOR HAVING COUNT(UNIQUE B1.STATE)>=3) GROUP BY Y.YELP_USER_ID, B.STATE, Y.F_NAME ORDER BY COUNT(UNIQUE B.STATE) DESC;