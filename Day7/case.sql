-- generate a report showing the total sales for each catregory: 
-- high if sales hugher than 50 
-- medium if sales are between 20 and 50 
-- low if sales are less than 20

-- sort the reults from the highest to the lowest 

USE SalesDB;

SELECT 
    SalesCategory,
    SUM(Sales) AS TotalSales
FROM (
    SELECT 
        OrderID,
        Sales,
        CASE 
            WHEN Sales > 50 THEN 'High'
            WHEN Sales BETWEEN 20 AND 50 THEN 'Medium'
            ELSE 'Low'
        END AS SalesCategory
    FROM Sales.Orders 
) t 
GROUP BY SalesCategory
ORDER BY TotalSales DESC;


-- Retrive employees detail with gender display in full text 

SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Gender, 
    CASE
        WHEN Gender = 'M' THEN 'Male'
        WHEN Gender = 'F' THEN 'Female'
        ELSE 'UNKNOWN'
    END  FullGender

  FROM Sales.Employees 



-- find the average scores of the customers and treat null values as 0 
-- additionaly provide details such CustomerID, LastName

SELECT 
    CustomerID,
    LastName,
    AVG(COALESCE(Score, 0)) OVER () AS AvgScore
    FROM Sales.Customers 

-- DO THE SAME TASK WITH CASE STATEMENT 
SELECT 
    CustomerID,
    LastName,
    AVG(CASE 
        WHEN Score IS NULL THEN 0
        ELSE Score 
        END) 
        OVER () AS AvgScore
    FROM Sales.Customers 

-- COUNT HOW MANY TIMES EACH CUSTOMERS HAS MADE AN ORDER WITH SALES GRETER THAN 30 

SELECT 
 CustomerID, 
 SUM(CASE 
  WHEN Sales > 30 THEN 1
  ELSE 0
  END) AS  TOATL_FLAG ,
  COUNT(*) TOTALORDERS
 FROM Sales.Orders
  GROUP BY CustomerID 