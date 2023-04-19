-- Average grade that is given by each professor
  
SELECT professors.name AS professor_name, AVG(grades.grade) AS Average_grade
FROM professors
JOIN courses ON professors.id = courses.professor_id
JOIN grades ON courses.id = grades.course_1_id OR courses.id = grades.course_2_id
GROUP BY professors.id;
