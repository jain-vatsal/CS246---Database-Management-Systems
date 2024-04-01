-- Active: 1680510836421@@127.0.0.1@3306@week11
use week11;

-- 2A
create table emp_boss_small(
    ename varchar(50),
    bname varchar(50),
    primary key(ename,bname)
);


-- 2B
create table emp_boss_large(
    ename varchar(50),
    bname varchar(50),
    primary key(ename,bname)
);