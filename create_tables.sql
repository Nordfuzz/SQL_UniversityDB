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

	
