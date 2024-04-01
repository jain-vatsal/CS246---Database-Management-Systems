


-- task 3
SET GLOBAL local_infile=1;

-- 3A
LOAD DATA LOCAL INFILE "files/account.csv" INTO TABLE account FIELDS TERMINATED BY ",";


-- 3B
LOAD DATA LOCAL INFILE "files/trnx.csv" INTO TABLE move_funds FIELDS TERMINATED BY ",";