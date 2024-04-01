-- Active: 1681115649572@@127.0.0.1@3306@week12

-- task 6a
SELECT gender from student group by gender having avg(iq) = (select max(iqq) from (select gender,avg(iq) as iqq from student group by gender) student);

-- task 6b
SELECT gender from (select gender,rank() over(order by avg(iq) desc) as ranking from student group by gender) as tab where ranking =1;

