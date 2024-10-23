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
)



-- insert students data
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status) VALUES
    ('Sameer', 21, 'sameer@example.com', 48, 60, NULL),
    ('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
    ('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
    ('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
    ('Sophia', 22, 'sophia@example.com', 50, 52, NULL),
    ('Hasan', 23, 'hasan@gmail.com', 43, 39, NULL);

SELECT * FROM students;

-- insert course data
INSERT INTO courses (course_name, credits) VALUES
    ('Next.js', 3),
    ('React.js', 4),
    ('Databases', 3),
    ('Prisma', 3)

SELECT * FROM courses;

-- insert enrollment data
INSERT INTO enrollment (student_id, course_id) VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 2)

SELECT * FROM enrollment;



--------------------------- ANSWER ALL QUERY --------------------------
-- Query 1: Insert a new student record.
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status) VALUES
    ('Anamul Haque', 21, 'anamul@gmail.com', 60, 58, NULL)