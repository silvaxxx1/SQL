-- Day2/add.sql
-- this how you specifiy the database you want to talk with it
USE MyDatabase

ALTER TABLE person
ADD second_email VARCHAR(50)

SELECT * FROM person