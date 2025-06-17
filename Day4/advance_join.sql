USE MyDatabase 

-- left anti join 
-- get all the customers who dont have orders 
SELECT 
    *
    FROM customers AS c
    LEFT JOIN orders AS o
    ON c.id = o.customer_id 
    WHERE o.customer_id IS NULL 

-- right anti join 
-- get all the orders who dont have customers 
SELECT 
    *
    FROM customers AS c
    RIGHT JOIN orders AS o
    ON c.id = o.customer_id 
    WHERE c.id IS NULL

-- full anti join 
-- get all the orders who dont have customers and all the customers who dont have orders 
SELECT 
    *
    FROM orders AS o
    FULL JOIN customers AS c
    ON c.id = o.customer_id 
    WHERE c.id IS NULL OR o.customer_id IS NULL 

-- practice 
-- get all the customers along the with thier orders but only for customers who have places an order (with out using inner join )
SELECT 
    *
    FROM customers AS c
    LEFT JOIN orders AS o
    ON c.id = o.customer_id 
    WHERE o.customer_id IS NOT NULL 


-- 4- Cross Join 
SELECT 
    *
    FROM customers
    CROSS JOIN orders
    