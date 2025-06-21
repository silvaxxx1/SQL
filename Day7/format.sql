USE SalesDB 

-- we can use the format function to format the date and time
SELECT 
    OrderID,
    CreationTime,
    FORMAT(CreationTime, 'yyyy-MM-dd') USA_FORMAT,
    FORMAT(CreationTime, 'dd-MM-yyyy') UERO_FORMAT,
    FORMAT(CreationTime, 'dd-MM-yyyy') UERO_FORMAT,
    FORMAT(CreationTime, 'dd') dd,
    FORMAT(CreationTime, 'dddd') ddd,
    FORMAT(CreationTime, 'MM') MM,
    FORMAT(CreationTime, 'yy') yy 
FROM 
    Sales.Orders 
 
-- 

SELECT 
    FORMAT(OrderDate, 'MMM yy') AS month_year, 
    COUNT(*) AS order_count 
FROM 
    Sales.Orders
    GROUP BY FORMAT(OrderDate, 'MMM yy')


-- convert 
SELECT 
    CONVERT(DATE , CreationTime) AS [DATE TIME TO DATE] ,
    CONVERT(VARCHAR , CreationTime, 32) AS [US DATE TO VARCHAR],
    CONVERT(VARCHAR , CreationTime, 34) AS [UERO DATE TO VARCHAR],
    CONVERT(VARCHAR , CreationTime, 13) AS [AR DATE TO VARCHAR]


FROM 
    Sales.Orders

-- CAST 

SELECT 
    CAST(CreationTime AS DATE) AS [DATE TIME TO DATE] ,
    CAST(CreationTime AS VARCHAR(32)) AS [US DATE TO VARCHAR],
    CAST(CreationTime AS VARCHAR(34)) AS [UERO DATE TO VARCHAR],
    CAST(CreationTime AS VARCHAR(13)) AS [AR DATE TO VARCHAR]
FROM 
    Sales.Orders 


-- DATEADD 

SELECT 
    OrderID,
    OrderDate,
    DATEADD(YEAR, 3, CreationTime) AS [3 YEARS FROM NOW],
    DATEADD(MONTH, 3, CreationTime) AS [3 MONTHS FROM NOW],
    DATEADD(DAY, -3, CreationTime) AS [3 DAYS FROM NOW]
FROM 
    Sales.Orders 


-- DATEDIFF 
-- CALCULATE THE AGE OF THE EMPLOYEES 

SELECT 
    EmployeeID,
    BirthDate,
    DATEDIFF(year , BirthDate, GETDATE()) AS AGE
FROM 
    Sales.Employees

-- find the average duration of shipping in days for each month 

SELECT 
    MONTH(OrderDate) AS MONTH,
    AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AS [AVERAGE DURATION]
FROM 
    Sales.Orders 
GROUP BY MONTH(OrderDate) 

-- time gap analysis 
-- find the number of days between each order and the previous order 

SELECT 
    OrderID,
    OrderDate,
    LEAD(OrderDate, 1) OVER (ORDER BY OrderDate) AS [NEXT ORDER DATE],
    DATEDIFF(DAY, OrderDate, LEAD(OrderDate, 1) OVER (ORDER BY OrderDate)) AS [DAYS BETWEEN ORDERS]
FROM 
    Sales.Orders 


-- date validation 
-- ISDATE

SELECT 
   ISDATE('2023-01-01') AS [IS VALID DATE],
   ISDATE('2023-01-01 00:00:00') AS [IS VALID DATE WITH TIME],
   ISDATE('2023-01-01 00:00:00.000') AS [IS VALID DATE WITH TIME AND MILLISECONDS],
    ISDATE('123') AS [IS INVALID DATE] 

    