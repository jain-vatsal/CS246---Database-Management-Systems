
-- task 5

GRANT SELECT, INSERT, UPDATE, DELETE ON account TO saradhi, pbhaduri;
GRANT SELECT, INSERT, UPDATE, DELETE ON move_funds TO saradhi, pbhaduri;
GRANT SELECT, INSERT, UPDATE, DELETE ON move_funds_log TO saradhi, pbhaduri;

GRANT LOCK TABLES ON week14a.* TO saradhi, pbhaduri;