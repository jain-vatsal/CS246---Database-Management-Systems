-- Active: 1679302000333@@127.0.0.1@3306@week9


-- use week9;



-- task 2a
CREATE table student18(
    name varchar(100),
    roll_number varchar(10) primary key
);


-- task 2b 
create table course18(
        semester int,
        cid varchar(7) primary key,
        name varchar(100),
        l int,
        t int,
        p int,
        c int

);


-- task 2c 
create table grade18(
    roll_number varchar(10),
    cid varchar(7),
    letter_grade varchar(2),
    primary key(roll_number,cid)
);


-- task 2d 
create table curriculum(
    dept varchar(3),
    number int,
    cid varchar(7)
);

-- task 3
-- set global local_infile=1;
-- load data local infile 'files/student18.csv' into table student18 fields terminated by ',';
-- load data local infile 'files/course18.csv' into table course18 fields terminated by ',';
-- load data local infile 'files/grade18.csv' into table grade18 fields terminated by ',';
-- load data local infile 'files/curriculum.csv' into table curriculum fields terminated by ',';

SELECT course18.semester,course18.cid,course18.name,grade18.letter_grade,course18.c
from course18,student18,grade18
where student18.roll_number = grade18.roll_number and course18.cid = grade18.cid and student18.roll_number = 180101002
order by course18.semester,course18.cid;
-- SELECT * from student18;

SELECT * from course18;

create table grade(
    letter_grade varchar(5),
    credit int
);


insert into grade values ("AS",10), ("AA",10),("AB",9),("BB",8),("BC",7),("CC",6),("CD",5),("DD",4);


SELECT * FROM curriculum;


drop table grade;