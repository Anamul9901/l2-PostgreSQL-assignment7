-- Active: 1729482640868@@127.0.0.1@5432@university_db

-- create 'university_db' database
CREATE DATABASE university_db;

-- create 'students' table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT,
    email VARCHAR(100),
    frontend_mark INT,
    backend_mark INT,
    status VARCHAR(20)
);

-- create 'courses' table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INT
);


-- create 'enrollment' table
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id)
);



-- insert students data
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status) VALUES
    ('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
    ('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
    ('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
    ('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
    ('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
    ('Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);


-- insert course data
INSERT INTO courses (course_name, credits) VALUES
    ('Next.js', 3),
    ('React.js', 4),
    ('Databases', 3),
    ('Prisma', 3)


-- insert enrollment data
INSERT INTO enrollment (student_id, course_id) VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 2)




--------------------------- ANSWER ALL QUERY --------------------------

-- Query 1: Insert New Student-
-- Adds a new record to the students table with the specified details.
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status) VALUES
    ('Anamul Haque', 21, 'anamul@gmail.com', 60, 58, NULL)



-- Query 2: Retrieve Student Names for 'Next.js': 
-- Join all table to find students name enrolled in the Next.js course.
SELECT student_name FROM enrollment
    JOIN students USING(student_id)
    JOIN courses USING(course_id)
    WHERE course_name = 'Next.js'



-- Query 3:Update Student Status- 
-- Finds the student with the highest total marks on frontend_mark and frontend_mark and updates his status.
UPDATE students
    SET status = 'Awarded'
    WHERE (frontend_mark + frontend_mark) = (SELECT max(frontend_mark + frontend_mark) FROM students);
     


-- Query 4:Delete Unenrolled Courses-
-- find courses with course_id that have no enrollments then remove.
DELETE FROM courses
    WHERE course_id NOT IN (SELECT course_id from enrollment);



-- Query 5:Limit and Offset-
-- Retrieves a limited number of student names, starting from the specified row.
SELECT student_name FROM students
    LIMIT 2 OFFSET 2;



-- Query 6:Count Students per Course-
-- Join courses with enrollment by course_id then create a croup by course_name and useing count.
SELECT course_name, count(course_id) as students_enrolled FROM enrollment
    JOIN courses USING(course_id)
    GROUP BY course_name;



-- Query 7:Average Age Calculation-
-- use aggregate avg() function for get average age of students.
SELECT avg(age) as average_age FROM students;



-- Query 8:Email Filtering-
-- Retrieves student names with email addresses containing 'example.com', using where and like.
SELECT student_name FROM students
    WHERE email LIKE '%example.com';