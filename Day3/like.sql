USE MyDatabase

SELECT * FROM customers

-- lets filter by first name that starts with D
SELECT * FROM customers 
WHERE first_name LIKE 'D%'


-- lets filter by first name that ends with H
SELECT * FROM customers 
WHERE first_name LIKE 'H%' 

-- lets filter by country that contains U
SELECT * FROM customers 
WHERE country LIKE '%U%' 


-- lets seacrh for name with r 
SELECT * FROM customers 
WHERE first_name LIKE '%r%' 


-- seaech for name with r in the third position
SELECT * FROM customers 
WHERE first_name LIKE '_r%'