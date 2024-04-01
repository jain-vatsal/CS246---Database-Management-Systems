

CREATE TABLE year_state_03 AS (SELECT 
        SUM(CASE WHEN state="WI" THEN sales ELSE 0 END) AS WI,
        SUM(CASE WHEN state="CA" THEN sales ELSE 0 END) AS CA,
        SUM(CASE WHEN (state="WI" OR state="CA") THEN sales ELSE 0 END) AS Total
FROM sale NATURAL JOIN location
GROUP BY time_id) UNION (SELECT  
        SUM(CASE WHEN state="WI" THEN sales ELSE 0 END) AS WI,
        SUM(CASE WHEN state="CA" THEN sales ELSE 0 END) AS CA,
        SUM(CASE WHEN (state="WI" OR state="CA") THEN sales ELSE 0 END) AS Total
FROM sale NATURAL JOIN location);

SELECT * from year_state_03;