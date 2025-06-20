USE SalesDB 

SELECT 
    OrderID,
    OrderDate,
    ShipDate,
    CreationTime 
FROM 
    Sales.Orders
   

-- we can hardcode the time 
SELECT 
    OrderID,
    
    '2021-01-01' AS CreationTime 
FROM 
    Sales.Orders

-- use current time 
SELECT 
    OrderID,
    CreationTime,
    '2021-01-01' AS CreationTime,
    GETDATE() Today 
FROM 
    Sales.Orders 

-- D&T functions 
-- DAY , MONTH , YEAR 
-- DATEPART 
-- DATENAME 

SELECT 
    OrderID,
    OrderDate,
    CreationTime,
    DAY(OrderDate) AS Day,
    MONTH(OrderDate) AS Month,
    YEAR(OrderDate) AS Year , 
    DATEPART(day , OrderDate) AS quart, 
    DATEPART(quarter , CreationTime) AS day_part,
    DATENAME(month , CreationTime) AS month_dn,
    DATENAME(day , CreationTime) AS quarter_dn 

FROM 
    Sales.Orders

-- DATETRUNC 
SELECT 
    OrderID,
    OrderDate,
    CreationTime,
    DATETRUNC(day , OrderDate) AS day_trunc,
    DATETRUNC(month , CreationTime) AS day_quarter_trunc 
FROM 
    Sales.Orders 

-- EOMONTH 
SELECT 
    OrderID,
    OrderDate,
    CreationTime,
    EOMONTH(OrderDate) AS day_trunc,
    EOMONTH(CreationTime) AS day_quarter_trunc 
FROM 
    Sales.Orders