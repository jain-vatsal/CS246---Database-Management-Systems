-- Active: 1678704225381@@127.0.0.1@3306@week08
-- task 5b iii
DELETE from cs246_grade
WHERE roll_number = "270101005";
-- DELETE command denied to user 'saradhi'@'localhost' for table 'cs246_grade'

-- task 5b iv
UPDATE cs246_grade 
set letter_grade = "BC"
WHERE roll_number = "270101005";
-- this works 

SELECT * from cs246_grade
where roll_number="270101005";

-- task 5b ix
UPDATE cs245_grade 
set letter_grade = "DD"
WHERE roll_number = "270101053";
-- UPDATE command denied to user 'saradhi'@'localhost' for table 'cs245_grade'

-- task 6b v
UPDATE cs246_student
SET roll_number = "290101051"
where roll_number = "270101051";
-- UPDATE command denied to user 'saradhi'@'localhost' for table 'cs246_student'

-- task 6 b vi 
SELECT email, marks
from cs246_student,cs246_marks
where cs246_student.roll_number = cs246_marks.roll_number
and name = "Garrison Donovan";
-- SELECT command denied to user 'saradhi'@'localhost' for table 'cs246_marks'

-- task 7a 
create view cs246rollnonameemailgrade as
SELECT cs246_student.roll_number,cs246_student.name,cs246_student.email,cs246_grade.letter_grade
from cs246_student,cs246_grade
where cs246_student.roll_number = cs246_grade.roll_number; 

-- task 7d i 
delete from cs246rollnonameemailgrade
where email ="quisque.porttitor@google.couk";
-- error

-- task 8b
grant SELECT on cs246_grade to 'headTA'@'localhost';

-- task 9a
REVOKE SELECT on cs246_grade from 'headTA'@'localhost';