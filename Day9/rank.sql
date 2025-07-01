USE SalesDB 

-- rANK THE ORDERS BASED ON THIER SALES FROM THE HIGHRST TO THE LOWEST 

SELECT 
        OrderID,
        ProductID,
        Sales,
        ROW_NUMBER() OVER(ORDER BY Sales DESC) AS SalesRank_Row,
        RANK() OVER(ORDER BY Sales DESC) AS SalesRank,
        DENSE_RANK() OVER(ORDER BY Sales DESC) AS SalesRank_Dense

    FROM Sales.Orders 

-- FIND THE TOP HIGHST SALES FROM EACH PRODUCT 
-- THIS IS CALLED TOP N ANALYSIS 
SELECT * 
    FROM (
SELECT 
        OrderID,
        ProductID,
        Sales,
        ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY Sales DESC) AS RankByProduct 

    FROM Sales.Orders 
    )t WHERE RankByProduct = 1 

-- FIND THE LOWEST  2 CUSTOMERS BASED ON THE  TOTAL SALES 
-- THIS IS CALLED TOP N ANALYSIS 

SELECT *
FROM (
SELECT 
        CustomerID,
        SUM(Sales) AS TotalSales ,
        ROW_NUMBER() OVER(ORDER BY SUM(Sales)) AS RankBySales
    FROM Sales.Orders 
    GROUP BY CustomerID 
)t WHERE RankBySales <= 2  

-- assign unique ids to the rows of the Order Archive table 

SELECT
    
        ROW_NUMBER() OVER(ORDER BY OrderID, OrderDate) AS UniqueID,
        * 
    FROM Sales.OrdersArchive 

-- identify the duplicate in the table orders archive 
-- and retuen clean reults without duplicates 

SELECT * 
    FROM (
SELECT 
        ROW_NUMBER() OVER(PARTITION BY OrderID, OrderDate ORDER BY OrderID) AS rn,
        *
    FROM Sales.OrdersArchive 
    )t WHERE rn = 1