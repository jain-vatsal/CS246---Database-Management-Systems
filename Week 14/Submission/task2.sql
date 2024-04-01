-- Active: 1682325162918@@127.0.0.1@3306@week14


-- Task 2

-- 2A 
CREATE TABLE account (
    account_number CHAR(5) PRIMARY KEY,
    balance INT,
    original_balance INT
);

-- 2B
CREATE TABLE move_funds (
    from_acc CHAR(5),
    to_acc CHAR(5),
    transfer_amount INT
);


-- 2C
CREATE TABLE move_funds_log (
    account_number CHAR(5),
    move_fund_type CHAR(10),
    amount INT,
    timestamp DATETIME,
    Foreign Key (account_number) REFERENCES account(account_number),
    CHECK (move_fund_type='deposit' OR move_fund_type='withdraw')
);

