
SHOW TRIGGERS FROM blood_bank;

SELECT * FROM information_schema.triggers 
WHERE trigger_schema = 'blood_bank' 
AND trigger_name = 'update_last_donation_date';

DELIMITER //
CREATE TRIGGER validate_donation_amount
BEFORE INSERT ON donation
FOR EACH ROW
BEGIN
    IF NEW.donation_quantity <= 0 OR NEW.donation_quantity > 2 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Donation quantity must be between 1-2 units';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_last_donation_date
AFTER INSERT ON donation
FOR EACH ROW
BEGIN
    UPDATE person
    SET last_donation_date = NEW.donation_date
    WHERE person_id = NEW.person_id;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER update_stock_after_donation
AFTER INSERT ON donation
FOR EACH ROW
BEGIN
    UPDATE stock s
    JOIN person p ON p.person_blood_group = s.stock_blood_group
    SET s.stock_quantity = s.stock_quantity + NEW.donation_quantity
    WHERE p.person_id = NEW.person_id;
END //
DELIMITER ;

SELECT * FROM stock;
