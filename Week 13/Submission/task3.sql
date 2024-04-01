-- Active: 1681720350602@@127.0.0.1@3306@week13


set global local_infile =1;

load data local infile "files/location.csv" into table location fields terminated by ",";
load data local infile "files/product.csv" into table product fields terminated by ",";
load data local infile "files/sale.csv" into table sale fields terminated by ",";