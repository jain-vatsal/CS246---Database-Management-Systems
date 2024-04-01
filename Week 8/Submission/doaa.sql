-- Active: 1678707650268@@127.0.0.1@3306@week08

-- 5b vii
insert into cs245_student values(270123089,"Alex","Approved","Credit","alex@protonmail.edu","960-7830");
-- Duplicate entry '270123089' for key 'PRIMARY'

-- 5b viii
insert into cs245_marks  VALUES (270123089,67);
-- INSERT command denied to user 'doaa'@'localhost' for table 'cs245_marks'

--- task 6b ix
insert into cs245_student(roll_number,name,reg_status,phone) values("270123436","Anjali","Pending","844-5838");
-- Duplicate entry '270123436' for key 'PRIMARY'


-- task 6b x
update cs245_student set audit_credit = "Audit" where email = "semper.tellus.id@google.net";
-- this works

-- task 9c 
revoke SELECT(roll_number,name,reg_status,audit_credit),INSERT(roll_number,name,reg_status,audit_credit),UPDATE(roll_number,name,reg_status,audit_credit) on cs246_student from 'doaa'@'localhost';
-- GRANT command denied to user 'doaa'@'localhost' for table 'cs246_student'