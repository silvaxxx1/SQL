USE SalesDB  


SELECT 
    FirstName , 
    LastName
FROM Sales.Employees 

EXCEPT 

SELECT 
    FirstName ,
    LastName
FROM Sales.Customers

 

