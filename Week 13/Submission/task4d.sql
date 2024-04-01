
drop table year_state_04;

CREATE TABLE year_state_04 AS (SELECT 
        SUM(CASE WHEN state="WI" THEN sales ELSE 0 END) AS WI,
        SUM(CASE WHEN state="CA" THEN sales ELSE 0 END) AS CA,
        SUM(CASE WHEN (state="WI" OR state="CA") THEN sales ELSE 0 END) AS Total
FROM sale NATURAL JOIN location
GROUP BY time_id
WITH ROLLUP);

SELECT * from year_state_04;