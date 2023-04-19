	-- Create database

create database UniversityDB;
use UniversityDB;

	-- Delete tables

DROP TABLE students;
DROP TABLE professors;
DROP TABLE courses;
DROP TABLE grades;

	-- Create professors table

CREATE TABLE IF NOT EXISTS professors (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);

	-- Create courses table

CREATE TABLE IF NOT EXISTS courses (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  professor_id INT,
  FOREIGN KEY (professor_id) REFERENCES professors(id)
);

	-- Create students table

CREATE TABLE IF NOT EXISTS students (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  course_1_id INT,
  course_2_id INT,
  FOREIGN KEY (course_1_id) REFERENCES courses(id),
  FOREIGN KEY (course_2_id) REFERENCES courses(id)
);

	-- Create grades table

CREATE TABLE IF NOT EXISTS grades (
  id INT PRIMARY KEY auto_increment,
  student_id INT,
  course_1_id INT,
  course_2_id INT,
  grade FLOAT,
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (course_1_id) REFERENCES courses(id),
  FOREIGN KEY (course_2_id) REFERENCES courses(id)
);

	-- Populate the professors table

INSERT INTO professors (id, name, email)
VALUES
  (1, 'Dr. Brown', 'drbrown@email.com'),
  (2, 'Dr. Kim', 'drkim@email.com'),
  (3, 'Dr. Singh', 'drsingh@email.com'),
  (4, 'Prof. Wilson', 'profwilson@email.com'),
  (5, 'Prof. Lee', 'proflee@email.com');

	-- Populate the courses table

INSERT INTO courses (id, name, professor_id)
VALUES
  (1, 'Introduction to Computer Science', 1),
  (2, 'Data Structures and Algorithms', 2),
  (3, 'Calculus I', 3),
  (4, 'Introduction to Physics', 4),
  (5, 'Introduction to Psychology', 5),
  (6, 'Artificial Intelligence', 1),
  (7, 'Web Development', 2),
  (8, 'Mobile Application Development', 5),
  (9, 'English Composition', 4),
  (10, 'Spanish for Beginners', 3);

	-- Populate the students table

INSERT INTO students (id, name, email, course_1_id, course_2_id)
VALUES
  (1, 'John Doe', 'johndoe@email.com', 1, 3),
  (2, 'Jane Smith', 'janesmith@email.com', 2, 7),
  (3, 'Bob Johnson', 'bobjohnson@email.com', 3, 9),
  (4, 'Samantha Lee', 'samanthalee@email.com', 1, 2),
  (5, 'Michael Chen', 'michaelchen@email.com', 2, 4),
  (6, 'David Kim', 'davidkim@email.com', 3, 1),
  (7, 'Linda Nguyen', 'lindanguyen@email.com', 4, 10),
  (8, 'Andrew Wong', 'andrewwong@email.com', 5, 4),
  (9, 'Stephanie Rodriguez', 'stephanierodriguez@email.com', 1, 7),
  (10, 'Richard Hernandez', 'richardhernandez@email.com', 2, 10),
  (11, 'Jennifer Davis', 'jenniferdavis@email.com', 3, 4),
  (12, 'Jonathan Thompson', 'jonathanthompson@email.com', 4, 1),
  (13, 'Megan Garcia', 'megangarcia@email.com', 5, 10),
  (14, 'William Baker', 'williambaker@email.com', 1, 2),
  (15, 'Emily Wilson', 'emilywilson@email.com', 2, 7),
  (16, 'Jason Lee', 'jasonlee@email.com', 3, 8),
  (17, 'Melissa Martinez', 'melissamartinez@email.com', 4, 6),
  (18, 'Erica Flores', 'ericaflores@email.com', 5, 3),
  (19, 'Jacob Brown', 'jacobbrown@email.com', 1, 10),
  (20, 'Julia Kim', 'juliakim@email.com', 2, 3),
  (21, 'Daniel Lee', 'daniellee@email.com', 3, 7),
  (22, 'Gabriela Hernandez', 'gabrielahernandez@email.com', 4, 8),
  (23, 'Nicholas Rodriguez', 'nicholasrodriguez@email.com', 5, 9),
  (24, 'Olivia Thompson', 'oliviathompson@email.com', 1, 2),
  (25, 'Christopher Davis', 'christopherdavis@email.com', 2, 10),
  (26, 'Victoria Garcia', 'victoriagarcia@email.com', 3, 10),
  (27, 'Robert Baker', 'robertbaker@email.com', 4, 9),
  (28, 'Natalie Wilson', 'nataliewilson@email.com', 5, 7),
  (29, 'Anthony Lee', 'anthonylee@email.com', 1, 8),
  (30, 'Katherine Martinez', 'katherinemartinez@email.com', 2, 4);

	-- Populate the grades table  

INSERT INTO grades (student_id, course_1_id, course_2_id, grade)
SELECT id, course_1_id, course_2_id, ROUND(RAND()*10,2)
FROM students;

-- QUERIES

	-- Average grade that is given by each professor

SELECT professors.name AS professor_name, AVG(grades.grade) AS Average_grade
FROM professors
JOIN courses ON professors.id = courses.professor_id
JOIN grades ON courses.id = grades.course_1_id OR courses.id = grades.course_2_id
GROUP BY professors.id;

	-- Top grades for each students

SELECT students.id, students.name, MAX(grades.grade) AS Top_grade
FROM students
JOIN grades ON students.id = grades.student_id
GROUP BY students.id, students.name;

	-- Group students by the courses that they are enrolled in

SELECT courses.name AS Course_name, students.name AS Student_name
FROM courses
JOIN students ON courses.id = students.course_1_id OR courses.id = students.course_2_id
GROUP BY courses.name, students.name;

	-- Summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course

SELECT c.id, c.name AS course_name, AVG(g.grade) AS average_grade
FROM courses c
INNER JOIN grades g ON c.id = g.course_1_id OR c.id = g.course_2_id
GROUP BY c.id
ORDER BY average_grade DESC;

	-- Finding which student and professor have the most courses in common

SELECT s.name AS student_name, p.name AS professor_name, COUNT(*) AS num_common_courses
FROM courses c
JOIN professors p ON c.professor_id = p.id
JOIN students s ON (c.id = s.course_1_id OR c.id = s.course_2_id)
WHERE p.id = c.professor_id
GROUP BY s.name, p.name
ORDER BY num_common_courses DESC
LIMIT 10;



SET SQL_SAFE_UPDATES = 0;
DELETE FROM students;
DELETE FROM professors;
DELETE FROM courses;
DELETE FROM grades;
DELETE FROM students_courses;
SET SQL_SAFE_UPDATES = 1;
