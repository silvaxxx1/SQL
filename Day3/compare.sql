USE MyDatabase

SELECT * FROM customers 

-- lets just filter it by country germany 
WHERE country = 'Germany' 


SELECT * FROM customers 
-- retrieve everything except germany 
WHERE country != 'Germany'


-- retrieve everything except germany and the more than 7 
SELECT * FROM customers 
WHERE country != 'Germany' AND id > 7  


-- retrieve everything except germany OR the more than 7 
SELECT * FROM customers 
WHERE country != 'Germany' OR id > 7 