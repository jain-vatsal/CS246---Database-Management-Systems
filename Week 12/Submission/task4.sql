

select language,count(*) as freq from speak
        group by language
          having count(*) =(select min(freq) from 
            (select language,count(*) as freq from speak group by language) speak);

-- task 4b
SELECT  language , ranked from (select language, RANK() over (order by count(*) ASC) as ranked from speak group by language) as table_with_rank where ranked =1;