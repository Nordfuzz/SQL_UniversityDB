-- Group students by the courses that they are enrolled in

SELECT courses.name AS Course_name, students.name AS Student_name
FROM courses
JOIN students ON courses.id = students.course_1_id OR courses.id = students.course_2_id
GROUP BY courses.name, students.name;
