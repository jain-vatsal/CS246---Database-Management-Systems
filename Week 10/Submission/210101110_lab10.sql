-
-- Task 2

CREATE TABLE student18 (
    name CHAR(100),
    roll_number CHAR(10) PRIMARY KEY,
    cpi FLOAT DEFAULT 0.0
);

CREATE TABLE course18 (
    semester INT,
    cid CHAR(7) PRIMARY KEY,
    name CHAR(100),
    l INT,
    t INT,
    p INT,
    c INT
);

CREATE TABLE grade18 (
    roll_number CHAR(10),
    cid CHAR(7),
    letter_grade CHAR(2),
    PRIMARY KEY (roll_number, cid)
);

CREATE TABLE curriculum (
    dept CHAR(4),
    number INT,
    cid CHAR(7)
);

CREATE TABLE grade_point (
    letter_grade CHAR(2) PRIMARY KEY,
    value INT
);

CREATE TABLE trigger_log (
    my_action CHAR(10),
    roll_number CHAR(10),
    semester INT,
    SPI DECIMAL(4, 2),
    CPI DECIMAL(4, 2),
    CHECK (my_action IN ("INSERT", "UPDATE", "DELETE"))
);

CREATE TABLE transcript (
    roll_number CHAR(10),
    semester INT,
    SPI DECIMAL(4, 2),
    CPI DECIMAL(4, 2)
);

CREATE TABLE u_grade18 (
    roll_number CHAR(10),
    cid CHAR(7),
    letter_grade CHAR(2),
    PRIMARY KEY (roll_number, cid)
);

-- Task 3

set global local_infile=1;

LOAD DATA LOCAL INFILE "files/student18.csv"
    INTO TABLE student18
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE "files/course18.csv"
    INTO TABLE course18
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE "files/curriculum.csv"
    INTO TABLE curriculum
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

LOAD DATA LOCAL INFILE "files/u_grade18.csv"
    INTO TABLE u_grade18
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

INSERT INTO grade_point VALUES ("AS", 10),("AA", 10),("AB", 9),("BB", 8),("BC", 7),("CC", 6),("CD", 5),("DD", 4),("FP", 0),("FA", 0),("I", 0),("X", 0),("PP", 0),("NP", 0);

LOAD DATA LOCAL INFILE "files/transcript.csv"
    INTO TABLE transcript
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Task 4 a i

CREATE TRIGGER ai BEFORE INSERT ON grade18
FOR EACH ROW
BEGIN
    IF NEW.letter_grade NOT IN ("AS", "AA", "AB", "BB", "BC", "CC", "CD", "DD", "FP", "FA", "PP", "NP", "I", "X") THEN
        SIGNAL SQLSTATE '50001'
            SET MESSAGE_TEXT = "letter_grade is invalid";
    END IF;
END;

-- Task 4 a ii
CREATE TRIGGER aii AFTER INSERT ON grade18
FOR EACH ROW
BEGIN

    SET @semester = (SELECT semester
    FROM course18
    WHERE cid = NEW.cid);

    -- i

    UPDATE transcript
    SET SPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE semester=@semester AND roll_number=NEW.roll_number AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=@semester;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 1 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=1;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 2 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=2;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 3 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=3;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 4 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=4;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 5 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=5;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 6 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=6;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 7 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=7;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 8 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=8;

    UPDATE transcript
    SET SPI = 0.00
    WHERE SPI IS NULL;

    UPDATE transcript
    SET CPI = 0.00
    WHERE CPI IS NULL;

    -- ii

    SET @SPI = (SELECT SPI FROM transcript WHERE roll_number=NEW.roll_number AND semester=@semester);

    SET @CPI = (SELECT CPI FROM transcript WHERE roll_number=NEW.roll_number AND semester=@semester);

    INSERT INTO trigger_log VALUES ("INSERT", NEW.roll_number, @semester, @SPI, @CPI);

END;

-- Task 4 b i

CREATE TRIGGER bi BEFORE UPDATE ON grade18
FOR EACH ROW
BEGIN
    IF NEW.letter_grade NOT IN ("AS", "AA", "AB", "BB", "BC", "CC", "CD", "DD", "FP", "FA", "PP", "NP", "I", "X") THEN
        SIGNAL SQLSTATE '50001'
            SET MESSAGE_TEXT = "letter_grade is invalid";
    END IF;
END;

-- Task 4 b ii

CREATE TRIGGER bii AFTER UPDATE ON grade18
FOR EACH ROW
BEGIN

    SET @semester = (SELECT semester
    FROM course18
    WHERE cid = NEW.cid);

    -- i

    UPDATE transcript
    SET SPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE semester=@semester AND roll_number=NEW.roll_number AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=@semester;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 1 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=1;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 2 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=2;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 3 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=3;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 4 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=4;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 5 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=5;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 6 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=6;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 7 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=7;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=NEW.roll_number AND semester <= 8 AND c!=0)
    WHERE roll_number=NEW.roll_number AND semester=8;

    UPDATE transcript
    SET SPI = 0.00
    WHERE SPI IS NULL;

    UPDATE transcript
    SET CPI = 0.00
    WHERE CPI IS NULL;

    -- ii

    SET @SPI = (SELECT SPI FROM transcript WHERE roll_number=NEW.roll_number AND semester=@semester);

    SET @CPI = (SELECT CPI FROM transcript WHERE roll_number=NEW.roll_number AND semester=@semester);

    INSERT INTO trigger_log VALUES ("UPDATE", NEW.roll_number, @semester, @SPI, @CPI);

END;

-- Task 4 c i

CREATE TRIGGER ci AFTER DELETE ON grade18
FOR EACH ROW
BEGIN

    SET @semester = (SELECT semester
    FROM course18
    WHERE cid = OLD.cid);

    -- i

    UPDATE transcript
    SET SPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE semester=@semester AND roll_number=OLD.roll_number AND c!=0)
    WHERE roll_number=OLD.roll_number AND semester=@semester;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=OLD.roll_number AND semester <= 1 AND c!=0)
    WHERE roll_number=OLD.roll_number AND semester=1;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=OLD.roll_number AND semester <= 2 AND c!=0)
    WHERE roll_number=OLD.roll_number AND semester=2;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=OLD.roll_number AND semester <= 3 AND c!=0)
    WHERE roll_number=OLD.roll_number AND semester=3;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=OLD.roll_number AND semester <= 4 AND c!=0)
    WHERE roll_number=OLD.roll_number AND semester=4;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=OLD.roll_number AND semester <= 5 AND c!=0)
    WHERE roll_number=OLD.roll_number AND semester=5;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=OLD.roll_number AND semester <= 6 AND c!=0)
    WHERE roll_number=OLD.roll_number AND semester=6;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=OLD.roll_number AND semester <= 7 AND c!=0)
    WHERE roll_number=OLD.roll_number AND semester=7;

    UPDATE transcript
    SET CPI = (SELECT sum(value * c) / sum (c)
    FROM grade18 NATURAL JOIN course18 NATURAL JOIN grade_point
    WHERE roll_number=OLD.roll_number AND semester <= 8 AND c!=0)
    WHERE roll_number=OLD.roll_number AND semester=8;

    UPDATE transcript
    SET SPI = 0.00
    WHERE SPI IS NULL;

    UPDATE transcript
    SET CPI = 0.00
    WHERE CPI IS NULL;

    -- ii

    SET @SPI = (SELECT SPI FROM transcript WHERE roll_number=OLD.roll_number AND semester=@semester);

    SET @CPI = (SELECT CPI FROM transcript WHERE roll_number=OLD.roll_number AND semester=@semester);

    INSERT INTO trigger_log VALUES ("DELETE", OLD.roll_number, @semester, @SPI, @CPI);

END;

-- Task 5

LOAD DATA LOCAL INFILE "files/grade18.csv"
    INTO TABLE grade18
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

-- Task 6

UPDATE grade18
SET letter_grade=(SELECT letter_grade FROM u_grade18 WHERE u_grade18.cid = grade18.cid AND u_grade18.roll_number = grade18.roll_number)
WHERE EXISTS (SELECT * FROM u_grade18 WHERE u_grade18.cid = grade18.cid AND u_grade18.roll_number = grade18.roll_number);

-- Task 7

DELETE FROM grade18;