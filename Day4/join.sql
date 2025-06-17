USE MyDatabase 


-- 1- NO join 
SELECT *
    FROM customers 

SELECT *
    FROM orders 


-- 2- inner join (filter the customers who got orders)
SELECT 
    c.id , 
    c.first_name,
    o.order_id,
    o.sales
    FROM customers AS c
    INNER JOIN orders AS o
    ON c.id = o.customer_id 

-- 3- left join (all customers order + no order customers)
  SELECT 
    c.id , 
    c.first_name,
    o.order_id,
    o.sales
    FROM customers AS c -- left (primary data)
    LEFT JOIN orders AS o -- right (secondary data)
    ON c.id = o.customer_id 

-- right join (all orders)
  SELECT 
    c.id , 
    c.first_name,
    o.order_id,
    o.sales
    FROM customers AS c -- left (secondary data)
    RIGHT JOIN orders AS o -- right (primary data)
    ON c.id = o.customer_id 

-- alternative 
-- practice : get the same results as above using only left join 
  SELECT 
    c.id , 
    c.first_name,
    o.order_id,
    o.sales
    FROM orders AS o-- right (secondary data)
    LEFT JOIN customers AS c -- left (primary data)
    ON c.id = o.customer_id 

-- Note : lets just use the left 

-- full join 
  SELECT 
    c.id , 
    c.first_name,
    o.order_id,
    o.sales
    FROM orders AS o
    FULL JOIN customers AS c 
    ON c.id = o.customer_id 