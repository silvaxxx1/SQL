USE MyDatabase 

SELECT * FROM customers 

INSERT INTO customers (id, first_name, country, score) 
VALUES (6, 'Doe', 'USA', 500),
        (7, 'Harry', 'UK', NULL),
        (8, 'Hermione', 'USA', 500),
        (9, 'Ron' , 'Germany', NULL)


SELECT * FROM customers 