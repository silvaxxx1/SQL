-- find the average score for each country considering only cistomers with score not equal yo 0 and 
-- return only those countries with average score graeter than 430 

USE MyDatabase 

SELECT
    country,
    AVG(Score) AS Avg_score

FROM customers
WHERE score != 0  
GROUP BY country 
HAVING AVG(Score)  > 430 