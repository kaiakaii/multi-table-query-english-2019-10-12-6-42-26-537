# 1.Query the existence of 1 course
SELECT * FROM course WHERE id=1;
# 2.Query the presence of both 1 and 2 courses
SELECT * FROM course WHERE id IN(1,2);
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT s.id,s.name,AVG(c.score) FROM student s JOIN student_course c ON s.id=c.studentId GROUP BY c.studentId HAVING AVG(c.score)>=60;
# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT * FROM student s LEFT JOIN student_course c ON c.studentId=s.id WHERE score IS NULL;
# 5.Query all SQL with grades
SELECT * FROM student s LEFT JOIN student_course c ON c.studentId=s.id WHERE score IS NOT NULL;
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT * FROM student
WHERE id IN(
    SELECT c1.studentId FROM student_course c1,student_course c2
    WHERE c1.studentId=c2.studentId AND c1.courseId=1 AND c2.courseId=2);
# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT * FROM student WHERE id IN(
    SELECT studentId FROM student_course WHERE score<60 ORDER BY score DESC
);
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT courseId,course.name,AVG(score) AS a FROM course,student_course WHERE course.id = student_course.courseId;
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT s.name,score FROM student s,course o,student_course c WHERE s.id=c.studentId AND c.courseId=o.id AND o.name='Math' AND score<60;