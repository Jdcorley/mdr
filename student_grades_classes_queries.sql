-- Returns student names for a specific class

SELECT s.first_name, s.last_name, ct.class_name 
FROM students s
JOIN grades_received gr ON gr.student_id = s.student_id 
JOIN classes_taken as ct ON ct.class_id = gr.class_id
WHERE ct.class_name LIKE 'Biology';

-- Returns classes with grades and a count for each letter grade

SELECT DISTINCT class_name, grade_received, grade_count
FROM(SELECT grades.grade_received, grades.class_id, COUNT (grade_received) as grade_count FROM (
  SELECT *, COUNT (grade_received)
  FROM grades_received
  GROUP BY grades_received.grade_id
) AS grades
GROUP BY grades.class_id, grades.grade_received) as final
JOIN classes_taken ct
ON ct.class_id = final.class_id
ORDER BY class_name, grade_received;

-- Returns student count for each class name

SELECT DISTINCT ct.class_name, COUNT(gr.student_id) as students_enrolled
FROM students s
JOIN grades_received gr ON gr.student_id = s.student_id 
JOIN classes_taken as ct ON ct.class_id = gr.class_id
GROUP BY ct.class_name;

-- Returns the highest enrolled class and number of enrolled students 

SELECT MAX(class_name) as highest_enrolled_class, MAX(students_enrolled) as amount_enrolled
FROM (SELECT DISTINCT ct.class_name, COUNT(gr.student_id) as students_enrolled
FROM students s
JOIN grades_received gr ON gr.student_id = s.student_id 
JOIN classes_taken as ct ON ct.class_id = gr.class_id
GROUP BY ct.class_name) as highest_enrollment;