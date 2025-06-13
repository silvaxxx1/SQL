USE MyDatabase

SELECT 
    country, 
    first_name,
    SUM(score) AS total_score
FROM 
    customers 
GROUP BY 
    country , first_name

