-- find the total score and the totAL number of customers for each country 

-- FIRST LETS SPECIFY THE DB 
USE MyDatabase

-- 
SELECT  country ,
        SUM(score) AS total_score,
        COUNT(id)

FROM customers 

GROUP BY country
