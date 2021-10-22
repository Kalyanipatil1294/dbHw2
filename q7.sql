-- Find the oldest user who never reviewed any businesses.

CREATE FUNCTION AGE(DOB IN DATE)
    RETURN NUMBER
        IS AGE NUMBER;
BEGIN
select (months_between(SYSDATE , DOB) /12) INTO AGE FROM DUAL;
RETURN (AGE);
END;
/
SELECT * FROM (SELECT Y.YELP_USER_ID, MAX(AGE(Y.DOB)) as Age FROM YELP_USER Y WHERE Y.YELP_USER_ID NOT IN (SELECT R.AUTHOR FROM REVIEW R) GROUP BY Y.YELP_USER_ID) WHERE ROWNUM=1;
