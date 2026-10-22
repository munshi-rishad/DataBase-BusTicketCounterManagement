-- Bus Ticket Counter Management System
-- MySQL / MariaDB version for XAMPP (phpMyAdmin) and the Java programs.
-- Open phpMyAdmin -> SQL tab -> paste this whole file -> Go.

DROP DATABASE IF EXISTS bus_ticket_counter_management_system;
CREATE DATABASE bus_ticket_counter_management_system;
USE bus_ticket_counter_management_system;

-- ===== Tables =====

-- 1. manager: Managers who supervise ticket agents
CREATE TABLE manager (
    manager_id INT PRIMARY KEY,
    manager_name VARCHAR(20) NOT NULL,
    manager_phone VARCHAR(11) NOT NULL UNIQUE,
    manager_salary INT DEFAULT 20000 NOT NULL CHECK (manager_salary > 0),
    manager_hire_date DATE DEFAULT (CURRENT_DATE) NOT NULL,
    CONSTRAINT chk_manager_phone CHECK (CHAR_LENGTH(manager_phone) = 11)
);

-- 2. ticket_agent: Ticket agents (each works under one manager)
CREATE TABLE ticket_agent (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(40) NOT NULL,
    agent_phone VARCHAR(11) UNIQUE NOT NULL,
    agent_salary INT DEFAULT 15000 NOT NULL CHECK (agent_salary > 0),
    ticket_agent_hire_date DATE DEFAULT (CURRENT_DATE) NOT NULL,
    manager_id INT NOT NULL,
    CONSTRAINT chk_agent_phone CHECK (CHAR_LENGTH(agent_phone) = 11),
    CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES manager(manager_id)
);

-- 3. ticket_info: Tickets sold by an agent
CREATE TABLE ticket_info (
    ticket_id INT PRIMARY KEY,
    amount INT NOT NULL CHECK (amount > 0),
    price INT NOT NULL CHECK (price > 0),
    travel_date DATE NOT NULL,
    pickup_point VARCHAR(30) NOT NULL,
    dropoff_point VARCHAR(30) NOT NULL,
    agent_id INT NOT NULL,
    CONSTRAINT FK_ticket_agent FOREIGN KEY (agent_id) REFERENCES ticket_agent(agent_id)
);

-- 4. customer_info: Customers who buy tickets
CREATE TABLE customer_info (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(40) NOT NULL,
    customer_address VARCHAR(50) DEFAULT 'Not Provided' NOT NULL,
    customer_age INT CHECK (customer_age > 0) NOT NULL,
    customer_phone VARCHAR(11) NOT NULL,
    category VARCHAR(10) CHECK (category IN ('AC', 'NON AC')) NOT NULL,
    payment_history VARCHAR(20) DEFAULT 'PENDING' NOT NULL CHECK (payment_history IN ('PAID', 'PENDING')),
    ticket_id INT NOT NULL,
    CONSTRAINT FK_ticket_info FOREIGN KEY (ticket_id) REFERENCES ticket_info(ticket_id),
    CONSTRAINT chk_customer_phone CHECK (CHAR_LENGTH(customer_phone) = 11)
);

-- 5. payment_details: Payment for each customer (30% off for NON AC)
CREATE TABLE payment_details (
    payment_id INT PRIMARY KEY,
    total_price_NON_AC_30_OFF DECIMAL(6,2) NOT NULL,
    ticket_id INT NOT NULL,
    customer_id INT NOT NULL,
    CONSTRAINT ticket_fk FOREIGN KEY (ticket_id) REFERENCES ticket_info(ticket_id),
    CONSTRAINT customer_fk FOREIGN KEY (customer_id) REFERENCES customer_info(customer_id)
);

-- 6. passenger_info: Passengers travelling for a customer
CREATE TABLE passenger_info (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(40) NOT NULL,
    passenger_age INT CHECK (passenger_age > 0) NOT NULL,
    passenger_phone VARCHAR(11) NOT NULL,
    passenger_address VARCHAR(60) DEFAULT 'Not Provided' NOT NULL,
    customer_id INT NOT NULL,
    CONSTRAINT chk_phone_length CHECK (CHAR_LENGTH(passenger_phone) = 11),
    CONSTRAINT FK_customer_info FOREIGN KEY (customer_id) REFERENCES customer_info(customer_id)
);

-- 7. info_seat: Seat given to each passenger
CREATE TABLE info_seat (
    seat_id VARCHAR(10) PRIMARY KEY,
    seat_type VARCHAR(20) NOT NULL CHECK (seat_type IN ('WINDOW', 'AISLE')),
    passenger_id INT NOT NULL,
    CONSTRAINT FK_passenger FOREIGN KEY (passenger_id) REFERENCES passenger_info(passenger_id)
);

-- 8. bus_info: Buses and the passenger on board
CREATE TABLE bus_info (
    bus_id INT PRIMARY KEY,
    bus_no VARCHAR(10) NOT NULL,
    bus_type VARCHAR(10) NOT NULL CHECK (bus_type IN ('AC', 'Non-AC')),
    departure_time DATE NOT NULL,
    starting_point VARCHAR(20) NOT NULL,
    destination VARCHAR(20) NOT NULL,
    capacity INT DEFAULT 50 CHECK (capacity > 0) NOT NULL,
    passenger_id INT NOT NULL,
    CONSTRAINT FK_bus_passenger FOREIGN KEY (passenger_id) REFERENCES passenger_info(passenger_id)
);

-- 9. route: Route / stoppage of each bus
CREATE TABLE route (
    route_id VARCHAR(4) PRIMARY KEY,
    distance DECIMAL(5,1) NOT NULL,
    stoppage_location VARCHAR(20) NOT NULL,
    bus_id INT NOT NULL,
    CONSTRAINT fk_bus_id FOREIGN KEY (bus_id) REFERENCES bus_info(bus_id)
);

-- ===== Sample data =====

-- 1. manager (5 rows)
INSERT INTO manager (manager_id, manager_name, manager_phone)
VALUES (1, 'Abdul Karim', '01711111111');
INSERT INTO manager (manager_id, manager_name, manager_phone)
VALUES (2, 'Sultana Ahmed', '01733333333');
INSERT INTO manager (manager_id, manager_name, manager_phone, manager_salary, manager_hire_date)
VALUES (3, 'Mohammad Shahid', '01722222222', 30000, DATE '2024-01-01');
INSERT INTO manager (manager_id, manager_name, manager_phone, manager_salary, manager_hire_date)
VALUES (4, 'Mizanur Rahman', '01744444444', 28000, DATE '2024-02-01');
INSERT INTO manager (manager_id, manager_name, manager_phone, manager_salary, manager_hire_date)
VALUES (5, 'Rasel Hossain', '01755555555', 25000, DATE '2024-03-01');

-- 2. ticket_agent (10 rows)
INSERT INTO ticket_agent (agent_id, agent_name, agent_phone, manager_id)
VALUES (11, 'Abdul Rahim', '01711111112', 1);
INSERT INTO ticket_agent (agent_id, agent_name, agent_phone, agent_salary, ticket_agent_hire_date, manager_id)
VALUES (12, 'Mehedi Hasan', '01711111113', 16000, DATE '2025-02-01', 1);
INSERT INTO ticket_agent (agent_id, agent_name, agent_phone, agent_salary, ticket_agent_hire_date, manager_id)
VALUES (13, 'Rakib Hossain', '01711111114', 18000, DATE '2024-03-01', 2);
INSERT INTO ticket_agent (agent_id, agent_name, agent_phone, agent_salary, ticket_agent_hire_date, manager_id)
VALUES (14, 'Tareq Aziz', '01711111115', 17500, DATE '2024-04-01', 2);
INSERT INTO ticket_agent (agent_id, agent_name, agent_phone, agent_salary, ticket_agent_hire_date, manager_id)
VALUES (15, 'Arif Chowdhury', '01711111116', 19000, DATE '2024-05-01', 3);
INSERT INTO ticket_agent (agent_id, agent_name, agent_phone, agent_salary, ticket_agent_hire_date, manager_id)
VALUES (16, 'Sakib Al Hasan', '01711111117', 18500, DATE '2024-06-01', 3);
INSERT INTO ticket_agent (agent_id, agent_name, agent_phone, agent_salary, ticket_agent_hire_date, manager_id)
VALUES (17, 'Shahin Alam', '01711111118', 17000, DATE '2025-07-01', 4);
INSERT INTO ticket_agent (agent_id, agent_name, agent_phone, agent_salary, ticket_agent_hire_date, manager_id)
VALUES (18, 'Nusrat Jahan', '01711111119', 16000, DATE '2025-08-01', 4);
INSERT INTO ticket_agent (agent_id, agent_name, agent_phone, agent_salary, ticket_agent_hire_date, manager_id)
VALUES (19, 'Rifat Ahmed', '01711111120', 15000, DATE '2025-09-01', 5);
INSERT INTO ticket_agent (agent_id, agent_name, agent_phone, agent_salary, ticket_agent_hire_date, manager_id)
VALUES (20, 'Rashed Khan', '01711111121', 20000, DATE '2024-10-01', 5);

-- 3. ticket_info (10 rows)
INSERT INTO ticket_info (ticket_id, amount, price, travel_date, pickup_point, dropoff_point, agent_id)
VALUES (1, 80, 1500, DATE '2025-01-15', 'Dhaka', 'Chittagong', 11);
INSERT INTO ticket_info (ticket_id, amount, price, travel_date, pickup_point, dropoff_point, agent_id)
VALUES (2, 85, 1200, DATE '2025-01-20', 'Dhaka', 'Sylhet', 12);
INSERT INTO ticket_info (ticket_id, amount, price, travel_date, pickup_point, dropoff_point, agent_id)
VALUES (3, 90, 1800, DATE '2025-01-18', 'Dhaka', 'Rajshahi', 13);
INSERT INTO ticket_info (ticket_id, amount, price, travel_date, pickup_point, dropoff_point, agent_id)
VALUES (4, 95, 1600, DATE '2025-01-22', 'Dhaka', 'Barisal', 14);
INSERT INTO ticket_info (ticket_id, amount, price, travel_date, pickup_point, dropoff_point, agent_id)
VALUES (5, 100, 2000, DATE '2025-01-25', 'Dhaka', 'Khulna', 15);
INSERT INTO ticket_info (ticket_id, amount, price, travel_date, pickup_point, dropoff_point, agent_id)
VALUES (6, 85, 1600, DATE '2025-01-28', 'Dhaka', 'Mymensingh', 16);
INSERT INTO ticket_info (ticket_id, amount, price, travel_date, pickup_point, dropoff_point, agent_id)
VALUES (7, 88, 1700, DATE '2025-01-30', 'Dhaka', 'Comilla', 17);
INSERT INTO ticket_info (ticket_id, amount, price, travel_date, pickup_point, dropoff_point, agent_id)
VALUES (8, 92, 1900, DATE '2025-02-02', 'Dhaka', 'Tangail', 18);
INSERT INTO ticket_info (ticket_id, amount, price, travel_date, pickup_point, dropoff_point, agent_id)
VALUES (9, 97, 2000, DATE '2025-02-05', 'Dhaka', 'Rajbari', 19);
INSERT INTO ticket_info (ticket_id, amount, price, travel_date, pickup_point, dropoff_point, agent_id)
VALUES (10, 99, 2300, DATE '2025-02-10', 'Dhaka', 'Noakhali', 20);

-- 4. customer_info (20 rows)
INSERT INTO customer_info (customer_id, customer_name, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (1, 'Abdul Karim', 40, '01711111122', 'AC', 'PAID', 1);
INSERT INTO customer_info (customer_id, customer_name, customer_age, customer_phone, category, ticket_id)
VALUES (2, 'Sharmin Akter', 35, '01711111123', 'NON AC', 1);
INSERT INTO customer_info (customer_id, customer_name, customer_address, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (3, 'Rakib Hossain', 'Mirpur, Dhaka, Bangladesh', 29, '01711111124', 'AC', 'PENDING', 2);
INSERT INTO customer_info (customer_id, customer_name, customer_address, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (4, 'Tareq Aziz', 'Dhanmondi, Dhaka, Bangladesh', 32, '01711111125', 'NON AC', 'PENDING', 2);
INSERT INTO customer_info (customer_id, customer_name, customer_address, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (5, 'Rifat Ahmed', 'Bashundhara, Dhaka, Bangladesh', 28, '01711111126', 'AC', 'PENDING', 3);
INSERT INTO customer_info (customer_id, customer_name, customer_address, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (6, 'Sakib Al Hasan', 'Gulshan, Dhaka, Bangladesh', 33, '01711111127', 'NON AC', 'PAID', 3);
INSERT INTO customer_info (customer_id, customer_name, customer_address, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (7, 'Shahin Alam', 'Banani, Dhaka, Bangladesh', 31, '01711111128', 'AC', 'PENDING', 4);
INSERT INTO customer_info (customer_id, customer_name, customer_address, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (8, 'Nusrat Jahan', 'Tejgaon, Dhaka, Bangladesh', 27, '01711111129', 'NON AC', 'PAID', 4);
INSERT INTO customer_info (customer_id, customer_name, customer_address, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (9, 'Arif Chowdhury', 'Motijheel, Dhaka, Bangladesh', 36, '01711111130', 'AC', 'PENDING', 5);
INSERT INTO customer_info (customer_id, customer_name, customer_address, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (10, 'Mariam Islam', 'Khilgaon, Dhaka, Bangladesh', 22, '01711111131', 'NON AC', 'PAID', 5);
INSERT INTO customer_info (customer_id, customer_name, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (11, 'Mizanur Rahman', 35, '01712222222', 'AC', 'PAID', 6);
INSERT INTO customer_info (customer_id, customer_name, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (12, 'Shamima Akter', 28, '01713258333', 'NON AC', 'PAID', 6);
INSERT INTO customer_info (customer_id, customer_name, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (13, 'Nurul Islam', 45, '01714444444', 'AC', 'PAID', 7);
INSERT INTO customer_info (customer_id, customer_name, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (14, 'Ferdousi Begum', 32, '01715555555', 'NON AC', 'PAID', 7);
INSERT INTO customer_info (customer_id, customer_name, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (15, 'Jamil Ahmed', 38, '01716666666', 'AC', 'PAID', 8);
INSERT INTO customer_info (customer_id, customer_name, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (16, 'Ayesha Siddiqua', 27, '01717777777', 'NON AC', 'PAID', 8);
INSERT INTO customer_info (customer_id, customer_name, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (17, 'Kamal Uddin', 50, '01718888888', 'AC', 'PAID', 9);
INSERT INTO customer_info (customer_id, customer_name, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (18, 'Salma Khatun', 29, '01719999999', 'NON AC', 'PAID', 9);
INSERT INTO customer_info (customer_id, customer_name, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (19, 'Hasan Mahmud', 34, '01721111111', 'AC', 'PAID', 10);
INSERT INTO customer_info (customer_id, customer_name, customer_age, customer_phone, category, payment_history, ticket_id)
VALUES (20, 'Farhana Karim', 30, '01722222222', 'NON AC', 'PAID', 10);

-- 5. payment_details (20 rows)
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1001, 1500, 1, 1);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1002, 1050, 1, 2);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1003, 1200, 2, 3);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1004, 840, 2, 4);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1005, 1800, 3, 5);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1006, 1260, 3, 6);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1007, 1600, 4, 7);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1008, 1120, 4, 8);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1009, 2000, 5, 9);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1010, 1400, 5, 10);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1011, 1600, 6, 11);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1012, 1120, 6, 12);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1013, 1700, 7, 13);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1014, 1190, 7, 14);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1015, 1900, 8, 15);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1016, 1330, 8, 16);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1017, 2000, 9, 17);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1018, 1400, 9, 18);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1019, 2300, 10, 19);
INSERT INTO payment_details (payment_id, total_price_NON_AC_30_OFF, ticket_id, customer_id)
VALUES (1020, 1610, 10, 20);

-- 6. passenger_info (20 rows)
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, customer_id)
VALUES (1, 'Abdul Karim', 40, '01711111122', 1);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, customer_id)
VALUES (2, 'Sharmin Akter', 35, '01711111123', 2);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (3, 'Rakib Hossain', 29, '01711111124', 'Mirpur, Dhaka, Bangladesh', 3);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (4, 'Tareq Aziz', 32, '01711111125', 'Dhanmondi, Dhaka, Bangladesh', 4);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (5, 'Rifat Ahmed', 28, '01711111126', 'Bashundhara, Dhaka, Bangladesh', 5);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (6, 'Sakib Al Hasan', 33, '01711111127', 'Gulshan, Dhaka, Bangladesh', 6);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (7, 'Shahin Alam', 31, '01711111128', 'Banani, Dhaka, Bangladesh', 7);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (8, 'Nusrat Jahan', 27, '01711111129', 'Tejgaon, Dhaka, Bangladesh', 8);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (9, 'Arif Chowdhury', 36, '01711111130', 'Motijheel, Dhaka, Bangladesh', 9);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (10, 'Mariam Islam', 22, '01711111131', 'Khilgaon, Dhaka, Bangladesh', 10);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (11, 'Mizanur Rahman', 35, '01712222222', 'Not Provided', 11);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (12, 'Shamima Akter', 28, '01713258333', 'Not Provided', 12);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (13, 'Nurul Islam', 45, '01714444444', 'Not Provided', 13);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (14, 'Ferdousi Begum', 32, '01715555555', 'Not Provided', 14);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (15, 'Jamil Ahmed', 38, '01716666666', 'Not Provided', 15);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (16, 'Ayesha Siddiqua', 27, '01717777777', 'Not Provided', 16);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (17, 'Kamal Uddin', 50, '01718888888', 'Not Provided', 17);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (18, 'Salma Khatun', 29, '01719999999', 'Not Provided', 18);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (19, 'Hasan Mahmud', 34, '01721111111', 'Not Provided', 19);
INSERT INTO passenger_info (passenger_id, passenger_name, passenger_age, passenger_phone, passenger_address, customer_id)
VALUES (20, 'Farhana Karim', 30, '01722222222', 'Not Provided', 20);

-- 7. info_seat (20 rows)
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('A1', 'WINDOW', 1);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('B1', 'AISLE', 2);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('C1', 'WINDOW', 3);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('D1', 'AISLE', 4);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('E1', 'WINDOW', 5);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('F1', 'AISLE', 6);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('G1', 'WINDOW', 7);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('H1', 'AISLE', 8);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('I1', 'WINDOW', 9);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('J1', 'AISLE', 10);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('K1', 'WINDOW', 11);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('L1', 'AISLE', 12);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('M1', 'WINDOW', 13);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('N1', 'AISLE', 14);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('O1', 'WINDOW', 15);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('P1', 'AISLE', 16);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('Q1', 'WINDOW', 17);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('R1', 'AISLE', 18);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('S1', 'WINDOW', 19);
INSERT INTO info_seat (seat_id, seat_type, passenger_id)
VALUES ('T1', 'AISLE', 20);

-- 8. bus_info (20 rows)
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (1, 'B-A1', 'AC', DATE '2025-01-15', 'Dhaka', 'Chittagong', 55, 1);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (2, 'B-B1', 'Non-AC', DATE '2025-01-15', 'Dhaka', 'Chittagong', 60, 2);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (3, 'B-C1', 'AC', DATE '2025-01-20', 'Dhaka', 'Sylhet', 55, 3);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (4, 'B-D1', 'Non-AC', DATE '2025-01-20', 'Dhaka', 'Sylhet', 60, 4);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (5, 'B-E1', 'AC', DATE '2025-01-18', 'Dhaka', 'Rajshahi', 55, 5);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (6, 'B-F1', 'Non-AC', DATE '2025-01-18', 'Dhaka', 'Rajshahi', 60, 6);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (7, 'B-G1', 'AC', DATE '2025-01-22', 'Dhaka', 'Barisal', 55, 7);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (8, 'B-H1', 'Non-AC', DATE '2025-01-22', 'Dhaka', 'Barisal', 60, 8);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (9, 'B-I1', 'AC', DATE '2025-01-25', 'Dhaka', 'Khulna', 55, 9);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (10, 'B-J1', 'Non-AC', DATE '2025-01-25', 'Dhaka', 'Khulna', 60, 10);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (11, 'B-K1', 'AC', DATE '2025-01-28', 'Dhaka', 'Mymensingh', 55, 11);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (12, 'B-L1', 'Non-AC', DATE '2025-01-28', 'Dhaka', 'Mymensingh', 60, 12);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (13, 'B-M1', 'AC', DATE '2025-01-30', 'Dhaka', 'Comilla', 55, 13);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (14, 'B-N1', 'Non-AC', DATE '2025-01-30', 'Dhaka', 'Comilla', 60, 14);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (15, 'B-O1', 'AC', DATE '2025-02-02', 'Dhaka', 'Tangail', 55, 15);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (16, 'B-P1', 'Non-AC', DATE '2025-02-02', 'Dhaka', 'Tangail', 60, 16);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (17, 'B-Q1', 'AC', DATE '2025-02-05', 'Dhaka', 'Rajbari', 55, 17);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (18, 'B-R1', 'Non-AC', DATE '2025-02-05', 'Dhaka', 'Rajbari', 60, 18);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (19, 'B-S1', 'AC', DATE '2025-02-10', 'Dhaka', 'Noakhali', 55, 19);
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, passenger_id)
VALUES (20, 'B-T1', 'Non-AC', DATE '2025-02-10', 'Dhaka', 'Noakhali', 60, 20);

-- 9. route (20 rows)
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R1', 270, 'Rajshahi', 1);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R2', 270, 'Rajshahi', 2);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R3', 230, 'Barisal', 3);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R4', 230, 'Barisal', 4);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R5', 330, 'Khulna', 5);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R6', 330, 'Khulna', 6);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R7', 120, 'Mymensingh', 7);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R8', 120, 'Mymensingh', 8);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R9', 95, 'Comilla', 9);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R10', 95, 'Comilla', 10);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R11', 80, 'Tangail', 11);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R12', 80, 'Tangail', 12);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R13', 80, 'Rajbari', 13);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R14', 80, 'Rajbari', 14);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R15', 200, 'Noakhali', 15);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R16', 200, 'Noakhali', 16);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R17', 270, 'Rajshahi', 17);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R18', 270, 'Rajshahi', 18);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R19', 230, 'Barisal', 19);
INSERT INTO route (route_id, distance, stoppage_location, bus_id)
VALUES ('R20', 230, 'Barisal', 20);

COMMIT;
