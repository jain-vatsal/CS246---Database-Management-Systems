create database week04;

show databases;

use week04;

CREATE TABLE hss_table01(
    sno INT,
    roll_number INT,
    sname VARCHAR(50),
    cid VARCHAR(10),
    cname VARCHAR(60)
);


CREATE TABLE hss_table02(
    sno INT,
    roll_number INT,
    sname VARCHAR(50),
    cid VARCHAR(10),
    cname VARCHAR(60),
    PRIMARY KEY(cname)
);

CREATE TABLE hss_table03(
    sno INT,
    roll_number INT,
    sname VARCHAR(50),
    cid VARCHAR(10),
    cname VARCHAR(60),
    PRIMARY KEY(roll_number,cid)
);


 CREATE TABLE hss_table04(
    sno INT PRIMARY KEY,
    roll_number INT PRIMARY KEY,
    sname VARCHAR(50),
    cid VARCHAR(10),
    cname VARCHAR(60),
    PRIMARY KEY(roll_number,cid)
);


 CREATE TABLE hss_course01(
    cid VARCHAR(10) PRIMARY KEY,
    cname VARCHAR(60)
);

CREATE TABLE hss_table05(
    sno INT,
    roll_number INT PRIMARY KEY,
    sname VARCHAR(50),
    cid VARCHAR(10),
    cname VARCHAR(60),
    FOREIGN KEY (cid) REFERENCES hss_course01(cid)
);


 CREATE TABLE hss_course02(
    cid VARCHAR(10),
    cname VARCHAR(60) PRIMARY KEY
);


CREATE TABLE hss_table06(
    sno INT,
    roll_number INT PRIMARY KEY,
    sname VARCHAR(50),
    cid VARCHAR(10),
    cname VARCHAR(60),
    FOREIGN KEY (cid) REFERENCES hss_course02(cid)
);


 CREATE TABLE hss_course03(
    cid VARCHAR(10),
    cname VARCHAR(60)
);

CREATE TABLE hss_table07(
    sno INT,
    roll_number INT PRIMARY KEY,
    sname VARCHAR(50),
    cid VARCHAR(10),
    cname VARCHAR(60),
    FOREIGN KEY (cid) REFERENCES hss_course03(cid)
);


DROP TABLE hss_table01;
SELECT * FROM hss_table01;









