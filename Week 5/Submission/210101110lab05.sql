-- use week05;

-- CREATE Table student(
--     cid VARCHAR(7),
--     roll_number VARCHAR(10), 
--     name VARCHAR(100) NOT NULL,  
--     approval_status VARCHAR(20), 
--     credit_status VARCHAR(10),
--     PRIMARY KEY(roll_number,cid),
-- );

-- CREATE Table course(
--     cid VARCHAR(7) PRIMARY KEY,
--     name VARCHAR(100) NOT NULL 
-- );

-- CREATE Table credit(
--     cid VARCHAR(7) PRIMARY KEY,
--     l INT NOT NULL,
--     t INT NOT NULL,
--     p INT NOT NULL,
--     c FLOAT NOT NULL
-- );


-- set GLOBAL local_infile =1;
-- LOAD DATA LOCAL INFILE '/home/vj_vatsal_/dbmslab/LAB05/students-credits.csv' INTO TABLE student FIELDS TERMINATED BY ',';
-- SELECT * from student;
-- LOAD DATA LOCAL INFILE '/home/vj_vatsal_/dbmslab/LAB05/courses.csv' INTO TABLE course FIELDS TERMINATED BY ',';


-- LOAD DATA LOCAL INFILE '/home/vj_vatsal_/dbmslab/LAB05/credits.csv' INTO TABLE credit FIELDS TERMINATED BY ',';



-- 4a
-- SELECT * 
-- FROM student 
-- WHERE name = "Adarsh Kumar Udai";



-- 4c
-- SELECT cid,roll_number , credit_status,approval_status
-- FROM student
-- WHERE approval_status = "Pending" and credit_status = "Credit";


-- 4b
-- SELECT cid,name,credit_status
-- FROM student
-- WHERE cid = "EE 390";

-- 4d
-- SELECT cid, l, t, p, c 
-- FROM credit
-- WHERE c <> 6;


-- 4e
-- SELECT roll_number, name, cid, credit_status,approval_status
-- FROM student
-- WHERE credit_status = "Audit" and approval_status="Approved";


-- 5a
-- SELECT name, l, t, p, c
-- FROM course,credit
-- WHERE c = 8 and course.cid = credit.cid;


-- 5b
-- SELECT name, l, t, p, c
-- FROM course,credit
-- WHERE t>0;

-- 5c
-- SELECT course.cid,course.name, l, t, p, c
-- FROM course,credit
-- WHERE c=6 and NOT(l=3 and t=0 and p=0) and course.cid = credit.cid;


-- 5d
-- SELECT course.cid,course.name, student.name,l, t, p, c
-- FROM course,credit,student
-- WHERE student.name="Pasch Paul Ole" and student.cid = course.cid and course.cid=credit.cid;


-- 5e
-- SELECT roll_number,student.name,student.cid, course.name,l,t,p,c
-- FROM course,credit,student
-- where course.cid = student.cid and course.cid = credit.cid and credit_status = "Credit" and (l,t,p,c) = (3,1,0,8) and course.cid like 'EE%';



-- 6a
-- SELECT cid,name 
-- FROM student
-- where UPPER(name) like "%ATUL%";


-- 6b
-- SELECT roll_number,credit_status,course.name
-- from course,credit,student
-- where course.cid= credit.cid and credit.cid = student.cid and LOWER(course.name) LIKE "introduction to%";

-- 6c
-- SELECT COUNT(student.roll_number)
-- FROM student
-- WHERE cid like "EE 3%";



-- 6d
-- SELECT credit.cid, course.name
-- from credit,course 
-- where credit.cid like "____2_M" and credit.cid = course.cid ;



-- 6e
-- SELECT student.name, course.cid , course.name , student.credit_status 
-- from student,course
-- WHERE student.cid = course.cid and UPPER(student.name) like "A%TA" and student.credit_status = "Credit";

