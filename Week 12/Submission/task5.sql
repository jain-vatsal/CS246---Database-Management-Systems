-- Active: 1681115649572@@127.0.0.1@3306@week12


select language,count(*) as freq from speak
        group by language
          having count(*) =(select max(freq) from 
            (select language,count(*) as freq from speak group by language) speak);

-- task 5b
SELECT  language , ranked from (select language, RANK() over (order by count(*) desc) as ranked from speak group by language) as table_with_rank where ranked =1;