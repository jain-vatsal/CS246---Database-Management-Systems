-- Active: 1681115649572@@127.0.0.1@3306@week12

use week12;

create table student(
        name varchar(50) PRIMARY KEY,
        iq int,
        gender varchar(1)
        
);


create table speak(
    name varchar(50), 
    language varchar(50),
    PRIMARY key(name,language)
);

