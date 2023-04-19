	-- Finding which student and professor have the most courses in common

SELECT s.name AS student_name, p.name AS professor_name, COUNT(*) AS num_common_courses
FROM courses c
JOIN professors p ON c.professor_id = p.id
JOIN students s ON (c.id = s.course_1_id OR c.id = s.course_2_id)
WHERE p.id = c.professor_id
GROUP BY s.name, p.name
ORDER BY num_common_courses DESC
LIMIT 10;
