-- find the product that fall within the highest 40% of sales 
USE SalesDB 

SELECT * , 
    CONCAT(DistRank * 100 , '%' ) AS DistRankPrec
FROM (
    
SELECT 
    Product,
    Price,
    CUME_DIST() OVER(ORDER BY Price DESC) AS DistRank
FROM 
    Sales.Products 

) t 
WHERE DistRank <= .4 




USE SalesDB 

SELECT * , 
    CONCAT(DistRank * 100 , '%' ) AS DistRankPrec
FROM (
    
SELECT 
    Product,
    Price,
    PERCENT_RANK() OVER(ORDER BY Price DESC) AS DistRank
FROM 
    Sales.Products 

) t 
WHERE DistRank <= .4 