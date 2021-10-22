-- Get the review counts for businesses in each business category. Results should be sorted by
-- the review counts in descending order.
--done

SELECT B.BUSINESS_ID, B.BCT_ID, COUNT(*) as Review_Count FROM  BUSINESS_CATEGORY CAT INNER JOIN BUSINESS B ON CAT.B_CAT_ID = B.BCT_ID INNER JOIN REVIEW R ON R.BUSINESS_NO = B.BUSINESS_ID GROUP BY B.BUSINESS_ID, B.BCT_ID ORDER BY COUNT(*) DESC;