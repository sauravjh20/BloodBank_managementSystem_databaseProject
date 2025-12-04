SELECT *
FROM information_schema.VIEWS
WHERE TABLE_SCHEMA = 'blood_bank';

CREATE VIEW active_donors AS
SELECT DISTINCT p.person_id, p.person_name, p.person_blood_group
FROM person p
JOIN donation d ON p.person_id = d.person_id;

select * from active_donors;

CREATE VIEW blood_stock AS
SELECT stock_blood_group, stock_quantity
FROM stock
ORDER BY stock_quantity DESC;

select * from blood_stock;

CREATE VIEW recent_donations AS
SELECT d.person_id, p.person_name, d.donation_date, d.donation_quantity
FROM donation d
JOIN person p ON d.person_id = p.person_id
WHERE d.donation_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

select * from recent_donations;

CREATE VIEW blood_receivers AS
SELECT DISTINCT p.person_id, p.person_name, p.person_blood_group
FROM person p
JOIN receive r ON p.person_id = r.person_id;

select * from blood_receivers;

CREATE VIEW donor_blood_groups AS
SELECT person_blood_group, COUNT(*) AS donor_count
FROM person
GROUP BY person_blood_group;

select * from donor_blood_groups;