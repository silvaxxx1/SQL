-- WINDOWS FUNCTIONS 

-- FIND THE TOTAL SALES FOR EACH PRODUCT
-- ADDITIONALY PROVIDE DEAILS SUCH AS ORDER ID AND ORDER DATE
USE SalesDB 

SELECT 
        OrderID,
        OrderDate,
        ProductID,
        SUM(Sales) OVER (PARTITION BY ProductID) AS TotalSaleByProducts 
    FROM Sales.Orders

-- for the prev example add 
-- find the total sales for each combination of product and order status


SELECT 
        OrderID,
        OrderDate,
        ProductID,
        OrderStatus,
        Sales,
        SUM(Sales) OVER (PARTITION BY ProductID , OrderStatus) AS TotalSaleByProducts 

    FROM Sales.Orders 


-- rank each order based on thier sales from the highest to the lowest 
-- additionaly provide details such as order id and order date 

SELECT 
        OrderID,
        OrderDate,
        Sales,
        RANK()OVER(ORDER BY Sales DESC) AS Sales_Ranked
    FROM Sales.Orders 


-- frame function 


SELECT 
        OrderID,
        OrderDate,
        OrderStatus,
        SUM(Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate 
        ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) Total_sales 
    FROM Sales.Orders 

-- Rank Customers basaed on thier total sales 
SELECT 
    SUM(Sales)  AS Total_Sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) RankCustomer
    FROM Sales.Orders 
    GROUP BY CustomerID
