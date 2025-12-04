INSERT INTO `person` (`person_id`, `person_name`, `person_phone`, `person_dob`, `person_address`, `person_gender`, `person_blood_group`, `person_med_issues`) VALUES
(1, 'John Doe', '1234567890', '1990-05-15', '123 Main St, Anytown', 'M', 'A+', NULL),
(2, 'Jane Smith', '2345678901', '1985-08-22', '456 Oak Ave, Somewhere', 'F', 'B-', 'Low iron'),
(3, 'Robert Johnson', '3456789012', '1978-11-30', '789 Pine Rd, Nowhere', 'M', 'O+', 'High blood pressure'),
(4, 'Emily Davis', '4567890123', '1995-03-10', '321 Elm St, Anywhere', 'F', 'AB+', NULL),
(5, 'Michael Wilson', '5678901234', '1982-07-18', '654 Maple Dr, Everywhere', 'M', 'A-', 'Diabetes');

INSERT INTO `donation` (`person_id`, `donation_date`, `donation_time`, `donation_quantity`) VALUES
(1, '2023-01-10', '10:30:00', 1),
(2, '2023-01-15', '11:45:00', 1),
(3, '2023-02-05', '09:15:00', 1),
(1, '2023-02-20', '14:00:00', 1),
(4, '2023-03-12', '13:30:00', 1);

/*recent data last 30 days */
INSERT INTO `donation` (`person_id`, `donation_date`, `donation_time`, `donation_quantity`) VALUES
(1, '2025-04-10', '10:30:00', 1),
(2, '2025-04-15', '11:45:00', 1),
(3, '2025-04-20', '09:15:00', 1),
(1, '2025-04-25', '14:00:00', 1),
(4, '2025-05-01', '13:30:00', 1);

INSERT INTO `receive` (`person_id`, `received_date`, `received_time`, `received_quantity`, `received_hospital`) VALUES
(2, '2023-01-20', '16:20:00', 1, 'City General Hospital'),
(5, '2023-02-10', '10:15:00', 1, 'Regional Medical Center'),
(3, '2023-02-28', '08:45:00', 1, 'Community Hospital'),
(1, '2023-03-05', '15:30:00', 1, 'University Hospital'),
(4, '2023-03-20', '11:00:00', 1, 'Children''s Hospital');

INSERT INTO `stock` (`stock_blood_group`, `stock_quantity`) VALUES
('A+', 2),
('A-', 1),
('B+', 3),
('B-', 1),
('AB+', 1),
('AB-', 0),
('O+', 2),
('O-', 1)
ON DUPLICATE KEY UPDATE `stock_quantity` = VALUES(`stock_quantity`);

INSERT INTO `user` (`username`, `password`) VALUES
('admin1', 'secure123'),
('admin2', 'pass1234'),
('staff1', 'staffpass'),
('staff2', 'welcome1'),
('manager', 'mgr12345')
ON DUPLICATE KEY UPDATE `password` = VALUES(`password`);