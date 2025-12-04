
SHOW PROCEDURE STATUS WHERE Db = 'blood_bank';

CALL GetDonationSummary();  

DELIMITER //
CREATE PROCEDURE GetDonationSummary()
BEGIN
    SELECT person_blood_group, COUNT(*) AS donation_count
    FROM donation d JOIN person p ON d.person_id = p.person_id
    GROUP BY person_blood_group;
END //
DELIMITER ;

SELECT 
    routine_name, 
    routine_definition, 
    created, 
    last_altered
FROM 
    information_schema.routines 
WHERE 
    routine_schema = 'blood_bank' 
    AND routine_type = 'PROCEDURE';

DELIMITER //
CREATE PROCEDURE AddPerson(
    IN p_name VARCHAR(25),
    IN p_phone CHAR(10),
    IN p_dob DATE,
    IN p_gender CHAR(1),
    IN p_blood_group VARCHAR(3)
)
BEGIN
    INSERT INTO person(person_name, person_phone, person_dob, person_gender, person_blood_group)
    VALUES (p_name, p_phone, p_dob, p_gender, p_blood_group);
END //
DELIMITER ;

CALL AddPerson('Smith Smith', '1234567890', '1990-05-15', 'M', 'A+');

DELIMITER //
CREATE PROCEDURE RecordDonation(
    IN p_person_id INT,
    IN p_quantity INT
)
BEGIN
    INSERT INTO donation(person_id, donation_date, donation_time, donation_quantity)
    VALUES (p_person_id, CURDATE(), CURTIME(), p_quantity);
END //
DELIMITER ;

CALL RecordDonation(1, 1);

DELIMITER //
CREATE PROCEDURE RecordReceival(
    IN p_person_id INT,
    IN p_quantity INT,
    IN p_hospital VARCHAR(50)
)
BEGIN
    INSERT INTO receive(person_id, received_date, received_time, received_quantity, received_hospital)
    VALUES (p_person_id, CURDATE(), CURTIME(), p_quantity, p_hospital);
END //
DELIMITER ;

-- Record receipt of 2 units for person_id 1 at City General Hospital
CALL RecordReceival(1, 2, '');


DELIMITER //
CREATE PROCEDURE UpdateStock(
    IN p_blood_group VARCHAR(3),
    IN p_quantity INT
)
BEGIN
    UPDATE stock SET stock_quantity = p_quantity 
    WHERE stock_blood_group = p_blood_group;
END //
DELIMITER ;


CALL UpdateStock('AB+', 8);

DELIMITER //
CREATE PROCEDURE GetPerson(IN p_person_id INT)
BEGIN
    SELECT * FROM person WHERE person_id = p_person_id;
END //
DELIMITER ;

CALL GetPerson(3);  -- Replace 3 with the ID you want to look up

DELIMITER //
CREATE PROCEDURE CountDonations(IN p_person_id INT)
BEGIN
    SELECT COUNT(*) AS total_donations 
    FROM donation WHERE person_id = p_person_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CountDonations(IN p_person_id INT)
BEGIN
    SELECT COUNT(*) AS total_donations 
    FROM donation WHERE person_id = p_person_id;
END //
DELIMITER ;

call CountDonations(3);

DELIMITER //
CREATE PROCEDURE GetStock()
BEGIN
    SELECT * FROM stock ORDER BY stock_quantity DESC;
END //
DELIMITER ;

call GetStock();

DELIMITER //

DELIMITER //
CREATE PROCEDURE GetMonthlyDonations(IN year_param INT)
BEGIN
    SELECT 
        DATE_FORMAT(donation_date, '%Y-%m') AS month,
        COUNT(*) AS donation_count,
        SUM(donation_quantity) AS total_units,
        AVG(donation_quantity) AS avg_units_per_donation
    FROM 
        donation
    WHERE 
        YEAR(donation_date) = year_param OR year_param IS NULL
    GROUP BY 
        DATE_FORMAT(donation_date, '%Y-%m')
    ORDER BY 
        month;
END //
DELIMITER ;

CALL GetMonthlyDonations(2025);

CALL FindDonorsByBloodGroup('A+');

DELIMITER //
CREATE PROCEDURE GetRecentDonations(IN p_days INT)
BEGIN
    SELECT * FROM donation 
    WHERE donation_date >= DATE_SUB(CURDATE(), INTERVAL p_days DAY);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeletePerson(IN p_person_id INT)
BEGIN
    DELETE FROM person WHERE person_id = p_person_id;
END //
DELIMITER ;

CALL GetRecentDonations(10);  



DELIMITER //
CREATE PROCEDURE GetBloodShortages(IN min_threshold INT)
BEGIN
    SELECT 
        stock_blood_group, 
        stock_quantity,
        CONCAT('CRITICAL - only ', stock_quantity, ' units left') AS status
    FROM stock
    WHERE stock_quantity < min_threshold
    ORDER BY stock_quantity ASC;
END //
DELIMITER ;

