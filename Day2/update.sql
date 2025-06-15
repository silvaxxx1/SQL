-- change the score of customer with ID 3 TO 220 

USE MyDatabase 

UPDATE customers 
SET score = 220 
-- IF NOT SPECIFIED IT WILL UPDATE ALL THE ROWS (BE CAUTIOUS)
WHERE id = 3 


UPDATE customers 
SET score = 0,
country = 'UK' 
WHERE id = 7

SELECT * FROM customers
 
