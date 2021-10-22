-- List all 5-star businesses that have been reviewed by any users between the ages of 15 and
-- 25. A 5-star business is a business which has an average review rating of 5.
--DONE

CREATE FUNCTION AGE(DOB IN DATE)
    RETURN NUMBER
        IS AGE NUMBER;
BEGIN
select (months_between(SYSDATE , DOB) /12) INTO AGE FROM DUAL;
RETURN (AGE);
END;
/

SELECT B.BUSINESS_ID, AVG(R.RATING), AGE(Y.DOB) FROM BUSINESS B, REVIEW R, YELP_USER Y WHERE R.RATING=5 AND R.BUSINESS_NO = B.BUSINESS_ID AND R.AUTHOR = Y.YELP_USER_ID AND AGE(Y.DOB)<=25 AND AGE(Y.DOB)>=15 GROUP BY B.BUSINESS_ID, AGE(Y.DOB);
