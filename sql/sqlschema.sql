-- ==============================
-- DATABASE
-- ==============================
CREATE DATABASE banking_db;
USE banking_db;

-- ==============================
-- TABLE
-- ==============================
CREATE TABLE transactions (
    transaction_id VARCHAR(10),
    customer_id VARCHAR(10),
    transaction_date DATETIME,
    amount INT,
    transaction_type VARCHAR(10),
    location VARCHAR(50),
    device_type VARCHAR(20),
    is_fraud INT
);

-- ==============================
-- DATA
-- ==============================
INSERT INTO transactions VALUES
('T001','C001','2024-01-01 10:15:00',5000,'Debit','Delhi','Mobile',0),
('T002','C002','2024-01-01 11:30:00',15000,'Credit','Mumbai','Laptop',0),
('T003','C001','2024-01-01 12:00:00',70000,'Debit','Delhi','Mobile',1),
('T004','C003','2024-01-02 09:45:00',2000,'Debit','Bangalore','Tablet',0),
('T005','C002','2024-01-02 10:15:00',90000,'Debit','Mumbai','Laptop',1),
('T006','C004','2024-01-02 11:00:00',3000,'Credit','Chennai','Mobile',0),
('T007','C001','2024-01-03 14:20:00',120000,'Debit','Delhi','Mobile',1),
('T008','C005','2024-01-03 15:00:00',4000,'Debit','Hyderabad','Tablet',0),
('T009','C003','2024-01-03 16:30:00',80000,'Debit','Bangalore','Mobile',1),
('T010','C004','2024-01-04 09:10:00',2500,'Credit','Chennai','Laptop',0),
('T011','C002','2024-01-04 10:45:00',100000,'Debit','Mumbai','Mobile',1),
('T012','C005','2024-01-04 12:30:00',3500,'Debit','Hyderabad','Tablet',0),
('T013','C006','2024-01-05 08:15:00',6000,'Debit','Pune','Mobile',0),
('T014','C006','2024-01-05 09:00:00',95000,'Debit','Pune','Laptop',1),
('T015','C007','2024-01-05 10:30:00',2000,'Credit','Delhi','Mobile',0);