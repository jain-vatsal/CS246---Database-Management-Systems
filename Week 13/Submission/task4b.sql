

CREATE TABLE year_state_02_01 AS (SELECT  
        SUM(CASE WHEN state="WI" THEN sales ELSE 0 END) AS WI,
        SUM(CASE WHEN state="CA" THEN sales ELSE 0 END) AS CA
FROM sale NATURAL JOIN location
GROUP BY time_id);

CREATE TABLE year_state_02_02 AS
(SELECT (WI+CA) as Total
FROM year_state_02_01);

CREATE TABLE year_state_02_03 AS (SELECT SUM(WI) as WI, SUM(CA) as CA
FROM year_state_02_01);

CREATE TABLE year_state_02_04 AS (SELECT SUM(Total) as Total
FROM year_state_02_02);


