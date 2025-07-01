USE SalesDB 


-- find the total number of sales (oveall analysis)
-- provide details like order id and order date (high level aggregation)
-- find the total number of orders for each customer 

SELECT 
    OrderID,
    OrderDate,
    CustomerID,
    COUNT(*) OVER () TotalOrders,
    COUNT(*) OVER (PARTITION BY CustomerID) OrderByCustomer
 FROM Sales.Orders 


-- FIND THE TOTAL NUMBER OF CUSTOMERS AND PROVIDE ALL CUSTOMER DETAILS 
-- FIND THE TOTOAL NUMBER OF SCORES OF THE CUSTOMERS

SELECT
    * ,
    COUNT(*) OVER () TotalCustomers,
    COUNT(Score) OVER () TotalScores

FROM Sales.Customers 


-- FIND THE DUPLOCATE IN THE ORDERS TABLE 

SELECT 
    OrderID,
    COUNT(*) OVER (PARTITION BY OrderID) CheckPK 
 FROM Sales.Orders 

SELECT 
* 
FROM (
    SELECT
        OrderID,
        COUNT(*) OVER (PARTITION BY OrderID) CheckPK 
    FROM Sales.OrdersArchive 

)t WHERE CheckPK > 1  


-- FIND THE PRECENTAGE CONTRIBUTION OF EACH PRODUCT TO THE TOTAL SALES 
-- part to whole analysis 
SELECT 
    ProductID,
    OrderID,
    Sales,
    SUM(Sales) OVER () TotalSales,
    ROUND(CAST(Sales AS FLoat)/ SUM(Sales) OVER () * 100, 2)  PercentageContribution 
FROM Sales.Orders 


-- show the employee who have the highest salary 

SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    MAX(Salary) OVER () MaxSalary 
FROM Sales.Employees