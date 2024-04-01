-- Active: 1682325162918@@127.0.0.1@3306@week14a



ALTER TABLE account ADD COLUMN total_deposit INT;
ALTER TABLE account ADD COLUMN total_withdraw INT;

SELECT *
FROM
(SELECT account_number, move_fund_type, SUM(amount)
FROM move_funds_log
GROUP BY account_number, move_fund_type) as T
ORDER BY account_number;

UPDATE account
SET total_deposit = (SELECT SUM(amount)
FROM move_funds_log
WHERE move_funds_log.account_number=account.account_number AND move_funds_log.move_fund_type="deposit");

UPDATE account
SET total_withdraw = (SELECT SUM(amount)
FROM move_funds_log
WHERE move_funds_log.account_number=account.account_number AND move_funds_log.move_fund_type="withdraw");

SELECT (total_deposit-total_withdraw+original_balance-balance)
FROM account;


-- final table

-- +----------------+--------------+---------------+
-- | account_number | TotalDeposit | TotalWithdraw |
-- +----------------+--------------+---------------+
-- | 06428          |         9826 |         12884 |
-- | 15873          |        13646 |         19598 |
-- | 23904          |        20492 |         18664 |
-- | 28686          |        19934 |         22322 |
-- | 36454          |        17890 |         16448 |
-- | 52149          |        24820 |         24848 |
-- | 62151          |        14750 |          6594 |
-- +----------------+--------------+---------------+


-- +----------------+------------------+------------------------------------------+---------+
-- | account_number | original_balance | (balance - TotalDeposit + TotalWithdraw) | balance |
-- +----------------+------------------+------------------------------------------+---------+
-- | 06428          |             7074 |                                     7074 |    4016 |
-- | 15873          |            10205 |                                    10455 |    4503 |
-- | 23904          |             5500 |                                     5500 |    7328 |
-- | 28686          |             5924 |                                     5924 |    3536 |
-- | 36454          |             7311 |                                     7311 |    8753 |
-- | 52149          |             9490 |                                     9240 |    9212 |
-- | 62151          |            11037 |                                    11037 |   19193 |
-- +----------------+------------------+------------------------------------------+---------+