-- Active: 1678701470592@@127.0.0.1@3306@week08

-- task 5b i
SELECT Marks from cs246_marks
where roll_number ="270123065";
-- marks value is 68

-- task 5b ii 
DELETE FROM  cs245_marks
where roll_number = "210123065";
-- DELETE command denied to user 'headTA'@'localhost' for table 'cs245_marks'

-- task 6 b i
SELECT email,phone
from cs245_student 
WHERE name = "Craig Salazar";
-- SELECT command denied to user 'headTA'@'localhost' for column 'phone' in table 'cs245_student'


-- task 6 b ii 
SELECT roll_number,email
from cs245_student 
WHERE name = "Lionel Battle";
-- one row comes in output , with roll no. 270101015

-- task 6b iii
DELETE from cs246_student
where name = "Jennete Parks";
-- DELETE command denied to user 'headTA'@'localhost' for table 'cs246_student'

-- 6b iv
UPDATE cs246_student
set email = "jparks@aol.ca";
-- UPDATE command denied to user 'headTA'@'localhost' for table 'cs246_student'

-- task 7b
create view cs245rollnameemailmarks as
    SELECT cs245_marks.roll_number,cs245_student.name,cs245_student.email,cs245_marks.marks
    from cs245_marks,cs245_student;

-- task 7c 
create view cs245rollnameemailgrade as
    SELECT roll_number,name,email,letter_grade
    from cs245_marks;

-- task 7d ii 
UPDATE cs245rollnameemailgrade
SET letter_grade = "AA" 
WHERE name  = "Zenaida Flemming";
--error as view is not created


-- task 8c 
SELECT  cs246_student.roll_number ,cs246_student.name,cs246_student.email,cs246_marks.marks,cs246_grade.letter_grade
from cs246_student,cs246_grade,cs246_marks
where cs246_student.roll_number = cs246_marks.roll_number and cs246_student.roll_number = cs246_grade.roll_number;
-- total 206 rows 

-- task 9b
SELECT  cs246_student.roll_number ,cs246_student.name,cs246_student.email,cs246_marks.marks,cs246_grade.letter_grade
from cs246_student,cs246_grade,cs246_marks
where cs246_student.roll_number = cs246_marks.roll_number and cs246_student.roll_number = cs246_grade.roll_number;
-- ERROR