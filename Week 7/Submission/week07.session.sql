-- Active: 1676286506677@@127.0.0.1@3306@week07
-- use week07;


CREATE table student18a(
    name VARCHAR(100),
    roll_number varchar(10) PRIMARY KEY
);

CREATE Table course18a(
    semester INT, 
    cid VARCHAR(7) PRIMARY KEY,
    name VARCHAR(100), 
    l INT,
    t INT,
    p INT,
    c INT
);

CREATE TABLE grade18a(
    roll_number VARCHAR(10), 
    cid VARCHAR(7), 
    letter_grade VARCHAR(2), 
    PRIMARY KEY(roll_number,cid)
);


set GLOBAL local_infile =1;
LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week07/student18.csv' INTO TABLE student18a FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week07/course18.csv' INTO TABLE course18a FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week07/grade18.csv' INTO TABLE grade18a FIELDS TERMINATED BY ',';

SELECT * from grade18a;


-- taks 4a i
CREATE view minorstudents as 
SELECT roll_number, cid, letter_grade
FROM grade18a 
where cid like '%M';


-- taks 4a ii
INSERT INTO grade18a VALUES(180101000,'CS101','AB');

-- task 4a iii
SELECT * 
FROM minorstudents
where roll_number =180101000;
-- non-materialized

-- task 4b i
CREATE view discidnletter as 
SELECT DISTINCT cid,letter_grade
from grade18a;


-- taks 4b ii
INSERT INTO discidnletter values ('CS101','PM');


-- task 4b iii cant insert as DISTINCT is used

-- task 4c I
CREATE view group_by AS
SELECT cid,letter_grade,count(roll_number) 
from grade18a 
group by letter_grade;

INSERT INTO discidnletter values ('CS101','NP',17);
-- can't insert


-- task 5a i
CREATE Table course18b(
    semester int,
    cid VARCHAR(7), 
    name VARCHAR(100), 
    l int, 
    t int, 
    p int, 
    c int, 
    PRIMARY KEY(cid),
    check(semester in (1,2,3,4,5,6,7,8))
);


-- task 5a II
INSERT INTO course18b values(10, 'CS 777', 'Introduction to Chat GPT',3, 0, 0, 6);
-- can't insert . the constraint is violated.

-- task 5b
CREATE Table allowable_letter_grade(
    grade VARCHAR(2),
    value int
);

INSERT into allowable_letter_grade values('AS',10),('AA',10),('AB',9),('BB',8),('BC',7),('CC',6),('CD',5),('DD',4),('FP',0),('FA',0),('NP',0),('PP',0),('I',0),('X',0);



-- TASK 5C i
CREATE TABLE grade18b(
    roll_number VARCHAR(10), 
    cid VARCHAR(7), 
    letter_grade VARCHAR(2), 
    PRIMARY KEY(roll_number,cid),
    check(letter_grade in ('AS','AA','AB','BB','BC','CC','CD','DD','FP','FA','NP','PP','I','X'))
);


-- task 5c ii 
LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week07/grade18.csv' INTO TABLE grade18b FIELDS TERMINATED BY ',';


-- task 5c iii 
UPDATE grade18b
SET letter_grade = 'MP'
where cid like '%M' and letter_grade ='DD';
-- violated


-- task 6a 
CREATE Table student18c(
    name VARCHAR(100),
    roll_number varchar(10),
    constraint roll PRIMARY KEY(roll_number)
);

-- task 6b
CREATE TABLE grade18c(
    roll_number VARCHAR(10), 
    cid VARCHAR(7), 
    letter_grade VARCHAR(2), 
    constraint rollandcid PRIMARY KEY(roll_number,cid),
    constraint rollforeign Foreign Key (roll_number) REFERENCES student18c(roll_number)
);

-- task 6c 
alter table grade18c drop CONSTRAINT rollforeign;

-- task 7a
CREATE table student18d(
    name VARCHAR(100),
    roll_number varchar(10) PRIMARY KEY 
);

-- task 7b 
LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week07/student18.csv' INTO TABLE student18d FIELDS TERMINATED BY ',';


-- task 7c 
SELECT cast(sum(roll_number) as UNSIGNED INT), cast(min(roll_number) as UNSIGNED INT), cast(max(roll_number) as UNSIGNED INT),cast(AVG(roll_number) as UNSIGNED INT)
from student18d;

-- task 7d
SELECT cast(roll_number as DATETIME)
from student18d;


-- task 8a
CREATE TABLE cours
e18e like course18a;

-- task 8b
INSERT INTO course18e SELECT * from course18a;


-- task 9a
create table student18f(
    roll_number VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    reduntant01 int default 10
);

CREATE Table course18f(
    semester INT, 
    cid VARCHAR(7) PRIMARY KEY,
    name VARCHAR(100), 
    l INT,
    t INT,
    p INT,
    c INT,
    reduntant01 int DEFAULT 10  
);

CREATE TABLE grade18f(
    roll_number VARCHAR(10), 
    cid VARCHAR(7), 
    letter_grade VARCHAR(2), 
    reduntant01 int DEFAULT 10,
    PRIMARY KEY(roll_number,cid)
);

-- task 9b 
LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week07/student18.csv' INTO TABLE student18f FIELDS TERMINATED BY ',' (name,roll_number);
LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week07/course18.csv' INTO TABLE course18f FIELDS TERMINATED BY ',' (semester,cid,name,l,t,p,c);
LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week07/grade18.csv' INTO TABLE grade18f FIELDS TERMINATED BY ',' (roll_number,cid,letter_grade);
SELECT * from grade18f;

-- task 9c

SELECT roll_number,student18f.name,letter_grade
from (student18f join grade18f using(roll_number)) join course18f using(cid)
where (l,t,p,c) = (3,1,0,8);



-- task 9d
DELETE from grade18f;

-- task 9e
LOAD DATA LOCAL INFILE '/home/vj_vatsal_/week07/cs570.csv' INTO TABLE grade18f FIELDS TERMINATED BY ',' (roll_number,cid,letter_grade);


-- task 9f
SELECT student18f.roll_number , name , letter_grade
FROM student18f join grade18f using(roll_number);
