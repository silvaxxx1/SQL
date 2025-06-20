USE Mydatabase 

-- concat 
SELECT 
    first_name , 
    country , 

    CONCAT(first_name , ' ', country) AS name_country
FROM 
    Customers 

-- lower and upper 
SELECT 
    first_name , 
    country , 

    LOWER(first_name) AS lower_name ,
    UPPER(country) AS upper_country
FROM 
    Customers

-- trim 
SELECT 
    first_name,
    LEN(first_name) len_name, 
    LEN(TRIM(first_name)) trimmed_len

FROM 
    customers 

-- WHERE 
--     first_name != TRIM(first_name) 

-- REPLACE (OR REMOVE)
SELECT 
    '123-456-7890' AS phone_number, 
    'report.txt',
    REPLACE('123-456-7890', '-', '') AS CLEAN_phone_number,
    REPLACE('report.txt', '.txt', '.csv')
FROM 
    customers  


-- len 
SELECT 
    first_name,
    country,
    LEN(first_name) len_name,
    LEN(country) len_country
FROM 
    customers 

-- left / right / substring 
SELECT 
    first_name,
    country,
    LEFT(first_name, 2) AS first_two_letters,
    RIGHT(first_name, 2) AS last_two_letters,
    SUBSTRING(first_name, 2, 2) AS middle_two_letters , 
    SUBSTRING(first_name, 2, LEN(first_name)) AS first_two_letters
FROM 
    customers