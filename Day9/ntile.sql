-- NTILE 

USE SalesDB
SELECT 
    OrderID,
    OrderDate,
    NTILE(5) OVER (ORDER BY OrderDate) AS [QUARTER]
FROM 
    Sales.Orders 

SELECT 
    OrderID,
    Sales,
    NTILE(5) OVER (ORDER BY Sales DESC) AS [QUARTER] ,
    NTILE(10) OVER (ORDER BY Sales DESC) AS [DECILE] , 
    NTILE(100) OVER (ORDER BY Sales DESC) AS [PERCENTILE]
FROM 
    Sales.Orders 

-- DATA SEGMENTATION 
-- SEGMENTATION OF THE ORDERS INTO 3 CATAGORIES BASED ON THE SALES 

SELECT * , 
    CASE WHEN SEGMENT = 1 THEN 'HIGH'
         WHEN SEGMENT = 2 THEN 'MEDIUM'
         ELSE 'LOW' 
    END AS SalesSegment
    FROM (
SELECT  
    OrderID,
    Sales,
    NTILE(3) OVER (ORDER BY Sales DESC)  SEGMENT
FROM 
    Sales.Orders 
    )t