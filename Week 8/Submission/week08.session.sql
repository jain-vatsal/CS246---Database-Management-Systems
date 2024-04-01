-- Active: 1678697712963@@127.0.0.1@3306@week08
use week08;
-- end of task 1

-- task 2a
create table cs245_student(
    roll_number varchar(9) primary key,
    name varchar(100),
    reg_status varchar(20),
    audit_credit varchar(10),
    email varchar(50),
    phone varchar(8)
);

-- task 2b
create table cs245_marks(
    roll_number varchar(9) primary key,
    marks int,
    foreign key (roll_number) REFERENCES cs245_student(roll_number)
);

-- task 2c
create table cs245_grade(
    roll_number varchar(9) primary key,
    letter_grade varchar(2),
    foreign key (roll_number) REFERENCES cs245_student(roll_number)
);

-- task 2d
create table cs246_student(
    roll_number varchar(9) primary key,
    name varchar(100),
    reg_status varchar(20),
    audit_credit varchar(10),
    email varchar(50),
    phone varchar(8)
);



-- task 2e
create table cs246_marks(
    roll_number varchar(9) primary key,
    marks int,
    foreign key (roll_number) REFERENCES cs246_student(roll_number)
);

-- task 2f
create table cs246_grade(
    roll_number varchar(9) primary key,
    letter_grade varchar(2),
    foreign key (roll_number) REFERENCES cs246_student(roll_number)
);

-- task 3
set GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE 'files/cs245_student.csv' INTO TABLE cs245_student FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'files/cs245_marks.csv' INTO TABLE cs245_marks FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'files/cs245_grade.csv' INTO TABLE cs245_grade FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'files/cs246_student.csv' INTO TABLE cs246_student FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'files/cs246_marks.csv' INTO TABLE cs246_marks FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'files/cs246_grade.csv' INTO TABLE cs246_grade FIELDS TERMINATED BY ',';


-- task 4
create user 'headTA'@'localhost' IDENTIFIED BY 'headTA@123';
create user 'saradhi'@'localhost' IDENTIFIED BY 'Saradhi@123';
create user 'pbhaduri'@'localhost' IDENTIFIED BY 'Pbhaduri@123';
create user 'doaa'@'localhost' IDENTIFIED BY 'doaa@123';



-- task 5
grant SELECT,INSERT,UPDATE on week08.cs245_marks to'headTA'@'localhost';
grant SELECT,INSERT,UPDATE on week08.cs246_marks to'headTA'@'localhost';
grant SELECT,UPDATE on week08.cs246_grade to'saradhi'@'localhost'; 
grant SELECT,UPDATE on week08.cs245_grade to'pbhaduri'@'localhost'; 
grant SELECT,INSERT,UPDATE,DELETE on week08.cs245_student to'doaa'@'localhost'; 
grant SELECT,INSERT,UPDATE,DELETE on week08.cs246_student to'doaa'@'localhost'; 

show grants for 'headTA'@'localhost';
show grants for 'saradhi'@'localhost';
show grants for 'pbhaduri'@'localhost';

-- task 6a 
GRANT SELECT(roll_number,name,email) on cs245_student to 'headTA'@'localhost';
GRANT SELECT(roll_number,name,email) on cs246_student to 'headTA'@'localhost';
GRANT SELECT(roll_number,name,email) on cs245_student to 'pbhaduri'@'localhost';
GRANT SELECT(roll_number,name,email) on cs246_student to 'saradhi'@'localhost';    
-- SELECT * from cs245_student;

GRANT SELECT(roll_number,name,reg_status,audit_credit),INSERT(roll_number,name,reg_status,audit_credit),UPDATE(roll_number,name,reg_status,audit_credit) on cs246_student to 'doaa'@'localhost';



-- task 8a
GRANT SELECT(roll_number,letter_grade) on cs246_grade to 'saradhi'@'localhost' with GRANT OPTION;



-- task 9d 
REVOKE SELECT(roll_number,name,email) on cs245_student from 'headTA'@'localhost';
REVOKE SELECT(roll_number,name,email) on cs246_student from 'headTA'@'localhost';
REVOKE SELECT(roll_number,name,email) on cs245_student from 'pbhaduri'@'localhost';
REVOKE SELECT(roll_number,name,email) on cs246_student from 'saradhi'@'localhost'; 



-- task 9e
revoke SELECT,INSERT,UPDATE on week08.cs245_marks from 'headTA'@'localhost';
revoke SELECT,INSERT,UPDATE on week08.cs246_marks from 'headTA'@'localhost';
revoke SELECT,UPDATE on week08.cs246_grade from 'saradhi'@'localhost'; 
revoke SELECT,UPDATE on week08.cs245_grade from 'pbhaduri'@'localhost'; 
revoke SELECT,INSERT,UPDATE,DELETE on week08.cs245_student from 'doaa'@'localhost'; 
revoke SELECT,INSERT,UPDATE,DELETE on week08.cs246_student from 'doaa'@'localhost'; 


-- task 10
drop user 'headTA'@'localhost';
drop user 'saradhi'@'localhost';
drop user 'pbhaduri'@'localhost';
drop user 'doaa'@'localhost';

-- task 10e
SELECT USER from mysql.user;
-- this does not list the above users, hence all are deleted