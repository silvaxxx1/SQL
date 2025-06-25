-- aggregate functions 
USE MyDatabase  
-- find the totla numbers of order 
-- find the total sales of the all orders 
-- find the avg sales of order
-- highest sales among customers
-- group all of this by id

SELECT 
    COUNT(*) AS total_order,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_sales,
    MAX(sales) AS max_sales,
    MIN(sales) AS min_sales

    FROM orders
    GROUP BY customer_id 

