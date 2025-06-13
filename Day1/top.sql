-- select the to p3 customers with the higest score 


USE MyDatabase 

SELECT TOP 3 * 
FROM customers 
ORDER BY score DESC 