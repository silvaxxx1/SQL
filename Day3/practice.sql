USE MyDatabase;

-- Drop table if already exists
IF OBJECT_ID('student', 'U') IS NOT NULL
    DROP TABLE student;

-- Create the student table
CREATE TABLE student (
    id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    faculty VARCHAR(50) NOT NULL,
    GPA DEC(3, 2) NOT NULL,
    CONSTRAINT pk_student PRIMARY KEY (id)
);

-- Insert sample data into the student table
INSERT INTO student (id, first_name, last_name, faculty, GPA)
VALUES 
    (1, 'Alice', 'Smith', 'Engineering', 3.75),
    (2, 'Bob', 'Johnson', 'Computer Science', 3.40),
    (3, 'Charlie', 'Brown', 'Economics', 3.10),
    (4, 'Diana', 'Lee', 'Mathematics', 3.90),
    (5, 'Ethan', 'Khan', 'Physics', 2.95),
    (6, 'Fatima', 'Ali', 'Biology', 3.60),
    (7, 'George', 'Miller', 'Law', 3.20),
    (8, 'Hannah', 'Wilson', 'Medicine', 3.85),
    (9, 'Ivan', 'Petrov', 'Engineering', 2.75),
    (10, 'Jasmine', 'Nguyen', 'Business', 3.30),
    (11, 'Kevin', 'Garcia', 'Psychology', 3.55),
    (12, 'Laura', 'Davis', 'Sociology', 3.00),
    (13, 'Mohamed', 'Omar', 'Computer Science', 3.80),
    (14, 'Nina', 'Patel', 'Engineering', 3.65),
    (15, 'Oscar', 'Martinez', 'Philosophy', 2.85),
    (16, 'Priya', 'Sharma', 'Mathematics', 3.95),
    (17, 'Quinn', 'Walker', 'Economics', 3.25),
    (18, 'Ravi', 'Singh', 'Law', 2.90),
    (19, 'Sara', 'Kim', 'Biology', 3.45),
    (20, 'Tom', 'Anderson', 'Physics', 2.70);

-- 1. List all students.
SELECT * FROM student

-- 2. Find the first and last names of students in the 'Engineering' faculty.
SELECT 
    first_name,
    last_name
    FROM student
    WHERE faculty = 'Engineering'

-- 3. Show the students who have a GPA greater than 3.5.
SELECT 
    first_name,
    last_name,
    GPA
    FROM student 
    WHERE GPA > 3.5 

-- 4. Display all students with a GPA between 3.0 and 3.8.
SELECT * 
    FROM student 
    WHERE GPA BETWEEN 3.0 AND 3.8 

-- 5. List the names and GPAs of students in 'Computer Science' OR 'Mathematics'.
SELECT 
    id,
    first_name,
    last_name
    FROM student 
    WHERE faculty = 'Computer Science' OR faculty = 'Mathematics' 

-- 6. Get students whose last names start with 'S'.
SELECT * 
    FROM student 
    WHERE last_name LIKE 'S%'


-- 7. Order the students by GPA in descending order.
-- 7. Order the students by GPA in descending order.
SELECT * 
    FROM student
    ORDER BY GPA DESC;


-- 8. Find the top 3 students with the highest GPA.
SELECT TOP 3 * 
    FROM student 
    ORDER BY GPA DESC 

-- 9. Find all students not in the 'Law' or 'Economics' faculty.
SELECT * 
    FROM student 
    WHERE faculty NOT IN ('Law' , 'Economics')

-- 10. List students who have NULL last names.
SELECT * 
    FROM student 
    WHERE first_name = NULL OR last_name = NULL 

-- 11. Find the average GPA of all students.
SELECT AVG(GPA) AS Average_GPA 
    FROM student 

-- 12. Show the number of students in each faculty.
SELECT faculty, COUNT(*) AS student_count
    FROM student
    GROUP BY faculty;
 

-- 13. What is the highest GPA in each faculty?
SELECT faculty , MAX(GPA) AS max 
    FROM student 
    GROUP BY faculty

-- 14. Which faculty has the lowest average GPA?
SELECT TOP 1 faculty , AVG(GPA) AS avg_gpa 
    FROM student 
    GROUP BY faculty 
    ORDER BY avg_gpa ASC

-- 15. List faculties with more than 2 students.
SELECT faculty , COUNT(*) AS STUDENT_COUNT 
    FROM student 
    GROUP BY faculty 
    HAVING COUNT(*) > 2 

-- 16. Update GPA to 4.0 for all students in 'Mathematics'.
UPDATE student 
    SET GPA = 4.0 
    WHERE faculty = 'Mathematics' 

-- SELECT * FROM student 

-- 17. Increase the GPA by 0.1 for all students in 'Engineering'.
UPDATE student 
    SET GPA = GPA + 0.1 
    WHERE faculty = 'Engineering' AND GPA != 4.0 

-- 18. Set the last name of student with id = 3 to 'Ahmed'.
UPDATE student 
    SET last_name = 'Ahmed' 
    WHERE id = 3 

SELECT * FROM student 
WHERE id = 3 



-- 19. Delete all students with GPA less than 3.0.
DELETE FROM student
WHERE GPA < 3.0;


-- 20. Delete all students from the 'Philosophy' faculty.
DELETE FROM student 
WHERE faculty = 'Philosophy'

-- 21. Find the students with the second-highest GPA. 
-- 21. Find the students with the second-highest GPA.
SELECT * 
FROM student
WHERE GPA = (
    SELECT MAX(GPA)
    FROM student
    WHERE GPA < (
        SELECT MAX(GPA)
        FROM student
    )
)


-- 22. List all students whose GPA is above the average GPA.
SELECT * 
FROM student
WHERE GPA > (
    SELECT AVG(GPA)
    FROM student
)


-- 24. Get the student(s) with the longest first name.
SELECT *
FROM student
WHERE LEN(first_name) = (
    SELECT MAX(LEN(first_name))
    FROM student
)

-- 25. Show all students where the GPA is exactly the same as another student.
SELECT *
FROM student
WHERE GPA IN (
    SELECT GPA
    FROM student
    GROUP BY GPA
    HAVING COUNT(*) > 1
);
