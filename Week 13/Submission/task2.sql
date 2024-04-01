-- Active: 1681720350602@@127.0.0.1@3306@week13


create table location(
    location_id int PRIMARY KEY, 
    city varchar(10),
    state varchar(2),
    country varchar(20)
);

create table product(
    product_id int PRIMARY KEY, 
    product_name varchar(10),
    category varchar(2),
   price INTEGER
);


create table sale(
    product_id int,
    time_id int,
    location_id int,
    sales int,
    primary KEY (product_id,time_id,location_id)
);

