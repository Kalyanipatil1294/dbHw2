-- Find the average rating across all reviews written by a particular user.
-- done
SELECT Y.YELP_USER_ID, AVG(R.RATING) FROM REVIEW R INNER JOIN  YELP_USER Y ON R.AUTHOR=Y.YELP_USER_ID GROUP BY Y.YELP_USER_ID;