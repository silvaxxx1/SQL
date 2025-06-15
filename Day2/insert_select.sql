USE MyDatabase;

INSERT INTO person (id, name, phone_no, grade)
SELECT 
    id,
    first_name,
    'UNKNOWN',
    0
    
FROM customers;


SELECT * FROM person