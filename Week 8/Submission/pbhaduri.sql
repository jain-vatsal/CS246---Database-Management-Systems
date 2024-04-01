-- Active: 1678706059462@@127.0.0.1@3306@week08


-- task 5b v 
update cs245_marks SET
marks = 95 WHERE roll_number = "270101064";
-- UPDATE command denied to user 'pbhaduri'@'localhost' for table 'cs245_marks'

-- task 5b Vi
SELECT letter_grade from cs245_grade where roll_number = "270101064";
-- grade is FP

-- task 5b x
DELETE FROM cs245_grade 
where roll_number in  (270101004,
270101019, 270101029, 270101039, 270101049, 270101059);
-- DELETE command denied to user 'pbhaduri'@'localhost' for table 'cs245_grade'

-- task 6b VII
update cs245_student SET reg_status = 'Approved', audit_credit='Audit' where email like '%icloud.couk';
-- UPDATE command denied to user 'pbhaduri'@'localhost' for table 'cs245_student'

-- task 6b viii
SELECT cs245_student.email,cs245_grade.letter_grade
from cs245_student,cs245_grade
where cs245_student.roll_number = cs245_grade.roll_number and cs245_student.name = "Benedict Warren";
-- only one row