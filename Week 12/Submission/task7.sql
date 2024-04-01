-- Active: 1681115649572@@127.0.0.1@3306@week12



SELECT name from student natural join speak
where language="Japanese"
order by iq desc
limit 2;
