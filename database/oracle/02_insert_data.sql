-- Bus Ticket Counter Management System
-- Step 2: insert sample data (run after 01_create_tables.sql)
-- Database: Oracle (tested on Oracle Database XE / Application Express)

-- 1. manager (5 rows)
INSERT INTO manager (manager_id, manager_name, manager_phone, manager_salary, manager_hire_date)
VALUES (1, 'Abdul Karim', '01711111111', 20000, DATE '2025-01-10');
INSERT INTO manager (manager_id, manager_name, manager_phone, manager_salary, manager_hire_date)
VALUES (2, 'Sultana Ahmed', '01733333333', 20000, DATE '2025-01-10');
INSERT INTO manager (manager_id, manager_name, manager_phone, manager_salary, manager_hire_date)
VALUES (3, 'Mohammad Shahid', '01722222222', 30000, DATE '2024-01-01');
INSERT INTO manager (manager_id, manager_name, manager_phone, manager_salary, manager_hire_date)
VALUES (4, 'Mizanur Rahman', '01744444444', 28000, DATE '2024-02-01');
INSERT INTO manager (manager_id, manager_name, manager_phone, manager_salary, manager_hire_date)
VALUES (5, 'Rasel Hossain', '01755555555', 25000, DATE '2024-03-01');

-- 2. ticket_agent (10 rows)
INSERT INTO ticket_agent (agent_id, agent_name, agent_phone, agent_salary, ticket_agent_hire_date, manager_id)
VALUES (11, 'Abdul Rahim', '01711111112', 15000, DATE '2025-01-11', 1);
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

-- 7. route (10 rows, one route for each destination)
INSERT INTO route (route_id, distance, stoppage_location)
VALUES ('R1', 250, 'Chittagong');
INSERT INTO route (route_id, distance, stoppage_location)
VALUES ('R2', 240, 'Sylhet');
INSERT INTO route (route_id, distance, stoppage_location)
VALUES ('R3', 270, 'Rajshahi');
INSERT INTO route (route_id, distance, stoppage_location)
VALUES ('R4', 230, 'Barisal');
INSERT INTO route (route_id, distance, stoppage_location)
VALUES ('R5', 330, 'Khulna');
INSERT INTO route (route_id, distance, stoppage_location)
VALUES ('R6', 120, 'Mymensingh');
INSERT INTO route (route_id, distance, stoppage_location)
VALUES ('R7', 95, 'Comilla');
INSERT INTO route (route_id, distance, stoppage_location)
VALUES ('R8', 80, 'Tangail');
INSERT INTO route (route_id, distance, stoppage_location)
VALUES ('R9', 80, 'Rajbari');
INSERT INTO route (route_id, distance, stoppage_location)
VALUES ('R10', 200, 'Noakhali');

-- 8. bus_info (20 rows, two buses (AC and NON AC) on each route)
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (1, 'B-A1', 'AC', DATE '2025-01-15', 'Dhaka', 'Chittagong', 55, 'R1');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (2, 'B-B1', 'NON AC', DATE '2025-01-15', 'Dhaka', 'Chittagong', 60, 'R1');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (3, 'B-C1', 'AC', DATE '2025-01-20', 'Dhaka', 'Sylhet', 55, 'R2');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (4, 'B-D1', 'NON AC', DATE '2025-01-20', 'Dhaka', 'Sylhet', 60, 'R2');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (5, 'B-E1', 'AC', DATE '2025-01-18', 'Dhaka', 'Rajshahi', 55, 'R3');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (6, 'B-F1', 'NON AC', DATE '2025-01-18', 'Dhaka', 'Rajshahi', 60, 'R3');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (7, 'B-G1', 'AC', DATE '2025-01-22', 'Dhaka', 'Barisal', 55, 'R4');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (8, 'B-H1', 'NON AC', DATE '2025-01-22', 'Dhaka', 'Barisal', 60, 'R4');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (9, 'B-I1', 'AC', DATE '2025-01-25', 'Dhaka', 'Khulna', 55, 'R5');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (10, 'B-J1', 'NON AC', DATE '2025-01-25', 'Dhaka', 'Khulna', 60, 'R5');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (11, 'B-K1', 'AC', DATE '2025-01-28', 'Dhaka', 'Mymensingh', 55, 'R6');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (12, 'B-L1', 'NON AC', DATE '2025-01-28', 'Dhaka', 'Mymensingh', 60, 'R6');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (13, 'B-M1', 'AC', DATE '2025-01-30', 'Dhaka', 'Comilla', 55, 'R7');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (14, 'B-N1', 'NON AC', DATE '2025-01-30', 'Dhaka', 'Comilla', 60, 'R7');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (15, 'B-O1', 'AC', DATE '2025-02-02', 'Dhaka', 'Tangail', 55, 'R8');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (16, 'B-P1', 'NON AC', DATE '2025-02-02', 'Dhaka', 'Tangail', 60, 'R8');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (17, 'B-Q1', 'AC', DATE '2025-02-05', 'Dhaka', 'Rajbari', 55, 'R9');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (18, 'B-R1', 'NON AC', DATE '2025-02-05', 'Dhaka', 'Rajbari', 60, 'R9');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (19, 'B-S1', 'AC', DATE '2025-02-10', 'Dhaka', 'Noakhali', 55, 'R10');
INSERT INTO bus_info (bus_id, bus_no, bus_type, departure_time, starting_point, destination, capacity, route_id)
VALUES (20, 'B-T1', 'NON AC', DATE '2025-02-10', 'Dhaka', 'Noakhali', 60, 'R10');

-- 9. info_seat (20 rows)
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('A1', 'WINDOW', 1, 1);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('B1', 'AISLE', 2, 2);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('C1', 'WINDOW', 3, 3);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('D1', 'AISLE', 4, 4);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('E1', 'WINDOW', 5, 5);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('F1', 'AISLE', 6, 6);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('G1', 'WINDOW', 7, 7);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('H1', 'AISLE', 8, 8);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('I1', 'WINDOW', 9, 9);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('J1', 'AISLE', 10, 10);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('K1', 'WINDOW', 11, 11);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('L1', 'AISLE', 12, 12);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('M1', 'WINDOW', 13, 13);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('N1', 'AISLE', 14, 14);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('O1', 'WINDOW', 15, 15);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('P1', 'AISLE', 16, 16);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('Q1', 'WINDOW', 17, 17);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('R1', 'AISLE', 18, 18);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('S1', 'WINDOW', 19, 19);
INSERT INTO info_seat (seat_id, seat_type, passenger_id, bus_id)
VALUES ('T1', 'AISLE', 20, 20);

COMMIT;

-- See the data
SELECT * FROM manager;
SELECT * FROM ticket_agent;
SELECT * FROM ticket_info;
SELECT * FROM customer_info;
SELECT * FROM payment_details;
SELECT * FROM passenger_info;
SELECT * FROM route;
SELECT * FROM bus_info;
SELECT * FROM info_seat;
