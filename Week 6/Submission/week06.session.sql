use week06;

-- CREATE Table student(
--     cid VARCHAR(7),
--     roll_number VARCHAR(10), 
--     name VARCHAR(100) NOT NULL,  
--     approval_status VARCHAR(20), 
--     credit_status VARCHAR(10),
--     PRIMARY KEY(roll_number,cid)
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


-- CREATE Table faculty(
--     cid VARCHAR(7),
--     name VARCHAR(50)
-- );

-- CREATE Table semester(
--     dept VARCHAR(4),
--     name VARCHAR(4),
--     cid VARCHAR(7)
-- );

-- set GLOBAL local_infile =1;
-- LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week06/students-credits-1.csv' INTO TABLE student FIELDS TERMINATED BY ',';
-- LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week06/courses-1.csv' INTO TABLE course FIELDS TERMINATED BY ',';
-- LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week06/credits-1.csv' INTO TABLE credit FIELDS TERMINATED BY ',';
-- LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week06/faculty-course.csv' INTO TABLE faculty FIELDS TERMINATED BY ',';
-- LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week06/semester.csv' INTO TABLE semester FIELDS TERMINATED BY ',';





-- task 4a
SELECT SUM(l)
from credit; -- sum = 816 


-- task 4b
SELECT SUM(c)
from credit
where cid like 'EE%'; -- SUM 365

-- task 4c
SELECT SUM(p)
from credit
where cid like 'DD%'; -- SUM 54


-- TASK 5A
SELECT cid,count(*)
from student
where cid like '%M' and credit_status = "Audit"
group by cid;


-- task 5b
SELECT SUBSTRING(cid,1,2) as subcid, sum(c)
from credit
group by subcid;


-- task 6a
SELECT cid  , count(*) as studcount
from student
where credit_status = "Audit" 
group by cid
having studcount>3;


-- task 6b 
SELECT course.cid,course.name, count(*) as facount
from course,faculty
where course.cid = faculty.cid
GROUP BY cid
having facount>1;


-- task 6c
SELECT faculty.name , count(*) as teachcount
from faculty
group by faculty.name
having teachcount>1;

-- task 7a
SELECT course.cid, course.name , credit.c 
from course,credit 
where course.cid = credit.cid and c = (SELECT MIN(c) from credit);


-- task 7b
SELECT faculty.cid, faculty.name
from faculty, credit
where faculty.cid = credit.cid and credit.c  = (SELECT MIN(c) from credit where credit.cid like 'CS%');

-- task 8a
CREATE TABLE temp as (SELECT name,sum(c) as minsum
from semester,credit 
where semester.cid = credit.cid and semester.dept = "DD" group by name);

CREATE TABLE tempBB as (SELECT name,sum(c) as minsumBB
from semester,credit 
where semester.cid = credit.cid and semester.dept = "BSBE" group by name);

SELECT name from tempBB
where minsumBB<=(SELECT MAX(minsum) from temp);


-- task 8b
SELECT name from tempBB
where minsumBB>=(SELECT MAX(minsum) from temp);


