USE streamvault;

CREATE TABLE IF NOT EXISTS activity_audit (
audit_id INT AUTO_INCREMENT PRIMARY KEY,
table_name VARCHAR(50) NOT NULL,
record_id INT NOT NULL,
action_type VARCHAR(20) NOT NULL,
action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
details VARCHAR(255));

DELIMITER $$
CREATE TRIGGER after_rating_insert
AFTER INSERT ON ratings
FOR EACH ROW
BEGIN
INSERT INTO activity_audit (
table_name,record_id,
action_type,details)
VALUES (
'ratings',NEW.rate_id,
'INSERT',CONCAT('Rating added: ', NEW.rate));
END$$

CREATE TRIGGER after_payment_update
AFTER UPDATE ON payment
FOR EACH ROW
BEGIN
IF OLD.pay_status <> NEW.pay_status THEN
INSERT INTO activity_audit (
table_name,record_id,
action_type,details)
VALUES (
'payment',NEW.pay_id,
'UPDATE',
CONCAT('Payment status changed from ',
OLD.pay_status,' to ',NEW.pay_status));
END IF;
END$$

DELIMITER ;
