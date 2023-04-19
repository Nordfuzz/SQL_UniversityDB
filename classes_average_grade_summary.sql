-- Summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course

SELECT c.id, c.name AS course_name, AVG(g.grade) AS average_grade
FROM courses c
INNER JOIN grades g ON c.id = g.course_1_id OR c.id = g.course_2_id
GROUP BY c.id
ORDER BY average_grade DESC;
