

-- task 8

CREATE PROCEDURE main_transfer_2()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE from_acc CHAR(5);
    DECLARE to_acc CHAR(5);
    DECLARE transfer_amt INT;

    DECLARE cur CURSOR FOR SELECT * FROM move_funds;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO from_acc, to_acc, transfer_amt;
        IF done THEN
            LEAVE read_loop;
        END IF;

        CALL transfer_funds_2(from_acc, to_acc, transfer_amt);
    END LOOP;

    CLOSE cur;
END;

GRANT EXECUTE ON PROCEDURE main_transfer_2 TO saradhi, pbhaduri;