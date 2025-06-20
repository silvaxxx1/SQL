USE SalesDB  

-- combine the data from employees and customers 
SELECT 
    FirstName , 
    LastName
FROM Sales.Customers 

UNION

SELECT 
    FirstName ,
    LastName
FROM Sales.Employees;

 -- USIGN UNION ALL 
 -- get all the data from employees and customers but not distinct 

SELECT 
    FirstName , 
    LastName
FROM Sales.Customers

UNION ALL

SELECT 
    FirstName ,
    LastName
FROM Sales.Employees
