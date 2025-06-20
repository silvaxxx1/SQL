USE SalesDB  


SELECT 
    FirstName , 
    LastName
FROM Sales.Employees 

INTERSECT 

SELECT 
    FirstName ,
    LastName
FROM Sales.Customers

 

