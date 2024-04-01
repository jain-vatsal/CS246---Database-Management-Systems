


-- Task 6 a

CREATE PROCEDURE transfer_funds_1 (IN from_acc CHAR(5), IN to_acc CHAR(5), IN transfer_amount INT)
BEGIN
    START TRANSACTION;
    UPDATE account SET balance = balance - transfer_amount WHERE account_number = from_acc;
    UPDATE account SET balance = balance + transfer_amount WHERE account_number = to_acc;
    COMMIT;
END;

GRANT EXECUTE ON PROCEDURE transfer_funds_1 TO saradhi, pbhaduri;

