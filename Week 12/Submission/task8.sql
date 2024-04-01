-- Active: 1681115649572@@127.0.0.1@3306@week12

-- for male
SELECT student.gender,student.name ,maximum_iq from student,(select gender,max(iq) as maximum_iq from student group by gender) as table_max_iq where table_max_iq.gender = student.gender and table_max_iq.maximum_iq = student.iq;