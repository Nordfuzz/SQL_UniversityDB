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
