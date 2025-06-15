USE MyDatabase
-- membership operator 
-- in , not in  

-- using comparison operator
SELECT * FROM customers 
WHERE country = 'Germany' OR country = 'USA' 

-- using membership operator
SELECT * FROM customers 
WHERE country IN ('Germany' , 'USA')