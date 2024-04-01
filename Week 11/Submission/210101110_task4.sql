-- Active: 1680510836421@@127.0.0.1@3306@week11

CREATE PROCEDURE sp2(IN inp CHAR(50), IN data_size CHAR(20)) BEGIN 
	DECLARE variable CHAR(50) DEFAULT inp;
	IF(data_size = 'emp_boss_small') THEN
	CREATE TABLE
	IF NOT EXISTS output_small(
	        ename CHAR(50),
	        bname CHAR(50),
	        PRIMARY KEY(ename, bname)
	    );
	WHILE variable <> 'Employee 01'
	DO
	INSERT INTO output_small
	VALUES( inp, ( SELECT  bname FROM emp_boss_small WHERE variable = emp_boss_small.ename ) );
	SET variable = ( SELECT bname FROM emp_boss_small WHERE variable = emp_boss_small.ename  );
	END WHILE;
	END IF;
    IF(data_size = 'emp_boss_large') THEN
	CREATE table
	    IF NOT EXISTS output_large(
	        ename CHAR(50),
	        bname CHAR(50),
	        PRIMARY KEY(ename, bname)
	    );
	WHILE variable <> 'Employee 01'
	DO
	INSERT INTO output_large
	VALUES ( inp, ( select bname from emp_boss_large where variable = emp_boss_large.ename ) );
	set variable = ( select bname from emp_boss_large where variable = emp_boss_large.ename  );
	END WHILE;
    END if;
END; 

-- this code is showing red sign in multiple places in vs code but is working

