-- Active: 1681720350602@@127.0.0.1@3306@week13

create table year_state_01(
    year char(5),
    WI int,
    CA int,
    total int
);

insert into year_state_01 values(
    '1995',
    (SELECT sum(sales) from sale,location where sale.location_id = location.location_id and location.state = 'WI' and sale.time_id= 1995),
    (SELECT sum(sales) from sale,location where sale.location_id = location.location_id and location.state = 'CA' and sale.time_id= 1995),
    (SELECT sum(sales) from sale,location where sale.location_id = location.location_id and sale.time_id= 1995)
),(
    '1996',
    (SELECT sum(sales) from sale,location where sale.location_id = location.location_id and location.state = 'WI' and sale.time_id= 1996),
    (SELECT sum(sales) from sale,location where sale.location_id = location.location_id and location.state = 'CA' and sale.time_id= 1996),
    (SELECT sum(sales) from sale,location where sale.location_id = location.location_id and sale.time_id= 1996)
),(
    '1997',
    (SELECT sum(sales) from sale,location where sale.location_id = location.location_id and location.state = 'WI' and sale.time_id= 1997),
    (SELECT sum(sales) from sale,location where sale.location_id = location.location_id and location.state = 'CA' and sale.time_id= 1997),
    (SELECT sum(sales) from sale,location where sale.location_id = location.location_id and sale.time_id= 1997)
),(
    'Total',
    (SELECT sum(sales) from sale,location where sale.location_id = location.location_id and location.state = 'WI'),
    (SELECT sum(sales) from sale,location where sale.location_id = location.location_id and location.state = 'CA' ),
    (SELECT sum(sales) from sale,location where sale.location_id = location.location_id)
);


-- 4 a i,ii,iii
SELECT WI from year_state_01 where year =1995;
SELECT CA from year_state_01 where year =1995;
SELECT total from year_state_01 where year =1995;

-- 4a iv,v,vi
SELECT WI from year_state_01 where year =1996;
SELECT CA from year_state_01 where year =1996;
SELECT total from year_state_01 where year =1996;


-- 4a vii,viii,ix
SELECT WI from year_state_01 where year =1997;
SELECT CA from year_state_01 where year =1997;
SELECT total from year_state_01 where year =1997;

-- 4a x,xi,xii
SELECT WI from year_state_01 where year ='total';
SELECT CA from year_state_01 where year ='total';
SELECT total from year_state_01 where year ='total';


create table year_state(
    year char(5),
    WI int,
    CA int,
    total int
);

INSERT INTO year_state (year,WI,CA,total)
SELECT year,WI,CA,total FROM year_state_01;

-- 4a xiii
SELECT * from year_state;