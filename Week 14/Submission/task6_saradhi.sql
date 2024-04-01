


-- task 6B 
USE week14a;
LOCK TABLES week14a.account READ;
LOCK TABLES week14a.account WRITE;
CALL transfer_funds_1 ('52149', '15873', '250');
UNLOCK TABLES;