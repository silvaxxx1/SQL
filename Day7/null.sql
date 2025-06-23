-- find the average scores of the customers 
-- handle the null values for accuracy 
USE SalesDB

SELECT 
 CustomerID,
 Score,
 AVG(COALESCE(Score, 0)) OVER () AS AvgScore
 FROM Sales.Customers  


 -- display the full name of the customer in a single field by merginf the first and last name
 -- AND ADD 10 POINTS TO EACH CUSTIOMER SCORE 

 SELECT 
 CustomerID,
 FirstName,
 LastName,
 Score AS OLD_SCORE,
 COALESCE(Score, 0)  + 10 AS Score,
 FirstName + ' ' + COALESCE(LastName, '')  AS FullName 
 
 FROM Sales.Customers 

-- Sort the customers score from the highest to the lowest 
-- with the  null always at the end 

SELECT 
 CustomerID,
 Score
 FROM Sales.Customers 
 ORDER BY   CASE WHEN Score IS NULL THEN 1 ELSE 0 END , Score 


-- find the sales price for each order by dividing sales by the quantity 

SELECT 
 OrderID,
 Sales,
 Quantity,
 Sales / NULLIF(Quantity, 0) AS Price
 FROM Sales.Orders 


 -- IDENTIFY CUSTOMERS WHO HAS NO SCORE 
 
 SELECT * FROM Sales.Customers 
 WHERE Score IS NULL 


 -- IDENTIFY CUSTOMERS WHO HAS  SCORE 
 
 SELECT * FROM Sales.Customers 
 WHERE Score IS NOT NULL 


 USE SalesDB 

-- LIST ALL THE CUSTOMERS WHO HAVE NOT PALCED ANY ORDER 
-- LEFT INT JOIN  
SELECT 
  c.* ,
  o.OrderID
FROM Sales.Customers c 
LEFT JOIN Sales.Orders o 
ON c.CustomerID = o.CustomerID 
WHERE o.CustomerID IS NULL


