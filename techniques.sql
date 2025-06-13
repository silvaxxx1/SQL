-- 1- multi query 


USE MyDatabase 

SELECT * 
FROM customers 


SELECT * 
FROM orders 

-- 2- also we can use static values 
SELECT 123 AS new_random_number

-- and use it with the database 
SELECT 
    'HI' AS string,
    score 

FROM customers
    
-- 3- execute the the highlighted code 

