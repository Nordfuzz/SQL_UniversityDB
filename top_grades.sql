	-- Top grades for each students

SELECT students.id, students.name, MAX(grades.grade) AS Top_grade
FROM students
JOIN grades ON students.id = grades.student_id
GROUP BY students.id, students.name;
