-- Active: 1682325162918@@127.0.0.1@3306@week14a


-- task 7
CREATE PROCEDURE transfer_funds_2(IN from_acc CHAR(5), IN to_acc CHAR(5), IN transfer_amount INT)
BEGIN
    DECLARE from_bal INT;
    DECLARE to_bal INT;
    SELECT balance INTO from_bal FROM account WHERE account_number = from_acc FOR UPDATE;
    IF from_bal < 100 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance';
    END IF;
    UPDATE account SET balance=balance-transfer_amount WHERE account_number=from_acc;
    UPDATE account SET balance=balance+transfer_amount WHERE account_number=to_acc;
    INSERT INTO move_funds_log VALUES(from_acc, 'withdraw', transfer_amount, NOW());
    INSERT INTO move_funds_log VALUES(to_acc, 'deposit', transfer_amount, NOW());
    COMMIT;
END;

GRANT EXECUTE ON PROCEDURE transfer_funds_2 TO saradhi, pbhaduri;