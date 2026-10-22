-- Bus Ticket Counter Management System
-- Step 1: create all 9 tables (run in this order because of the foreign keys)
-- Database: Oracle (tested on Oracle Database XE / Application Express)

-- 1. manager: Managers who supervise ticket agents
CREATE TABLE manager (
    manager_id NUMBER(3) PRIMARY KEY,
    manager_name VARCHAR2(20) NOT NULL,
    manager_phone VARCHAR2(11) NOT NULL UNIQUE,
    manager_salary NUMBER(7) DEFAULT 20000 NOT NULL CHECK (manager_salary > 0),
    manager_hire_date DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT chk_manager_phone CHECK (LENGTH(manager_phone) = 11)
);

-- 2. ticket_agent: Ticket agents (each works under one manager)
CREATE TABLE ticket_agent (
    agent_id NUMBER(5) PRIMARY KEY,
    agent_name VARCHAR2(40) NOT NULL,
    agent_phone VARCHAR2(11) UNIQUE NOT NULL,
    agent_salary NUMBER(5) DEFAULT 15000 NOT NULL CHECK (agent_salary > 0),
    ticket_agent_hire_date DATE DEFAULT SYSDATE NOT NULL,
    manager_id NUMBER(3) NOT NULL,
    CONSTRAINT chk_agent_phone CHECK (LENGTH(agent_phone) = 11),
    CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES manager(manager_id)
);

-- 3. ticket_info: Tickets sold by an agent
CREATE TABLE ticket_info (
    ticket_id NUMBER(5) PRIMARY KEY,
    amount NUMBER(5) NOT NULL CHECK (amount > 0),
    price NUMBER(5) NOT NULL CHECK (price > 0),
    travel_date DATE NOT NULL,
    pickup_point VARCHAR2(30) NOT NULL,
    dropoff_point VARCHAR2(30) NOT NULL,
    agent_id NUMBER(5) NOT NULL,
    CONSTRAINT FK_ticket_agent FOREIGN KEY (agent_id) REFERENCES ticket_agent(agent_id)
);

-- 4. customer_info: Customers who buy tickets
CREATE TABLE customer_info (
    customer_id NUMBER(5) PRIMARY KEY,
    customer_name VARCHAR2(40) NOT NULL,
    customer_address VARCHAR2(50) DEFAULT 'Not Provided' NOT NULL,
    customer_age NUMBER(2) CHECK (customer_age > 0) NOT NULL,
    customer_phone VARCHAR2(11) NOT NULL,
    category VARCHAR2(10) CHECK (category IN ('AC', 'NON AC')) NOT NULL,
    payment_history VARCHAR2(20) DEFAULT 'PENDING' NOT NULL CHECK (payment_history IN ('PAID', 'PENDING')),
    ticket_id NUMBER(5) NOT NULL,
    CONSTRAINT FK_ticket_info FOREIGN KEY (ticket_id) REFERENCES ticket_info(ticket_id),
    CONSTRAINT chk_customer_phone CHECK (LENGTH(customer_phone) = 11)
);

-- 5. payment_details: Payment for each customer (30% off for NON AC)
CREATE TABLE payment_details (
    payment_id NUMBER(5) PRIMARY KEY,
    total_price_NON_AC_30_OFF NUMBER(6,2) NOT NULL,
    ticket_id NUMBER(5) NOT NULL,
    customer_id NUMBER(5) NOT NULL,
    CONSTRAINT ticket_fk FOREIGN KEY (ticket_id) REFERENCES ticket_info(ticket_id),
    CONSTRAINT customer_fk FOREIGN KEY (customer_id) REFERENCES customer_info(customer_id)
);

-- 6. passenger_info: Passengers travelling for a customer
CREATE TABLE passenger_info (
    passenger_id NUMBER(5) PRIMARY KEY,
    passenger_name VARCHAR2(40) NOT NULL,
    passenger_age NUMBER(2) CHECK (passenger_age > 0) NOT NULL,
    passenger_phone VARCHAR2(11) NOT NULL,
    passenger_address VARCHAR2(60) DEFAULT 'Not Provided' NOT NULL,
    customer_id NUMBER(5) NOT NULL,
    CONSTRAINT chk_phone_length CHECK (LENGTH(passenger_phone) = 11),
    CONSTRAINT FK_customer_info FOREIGN KEY (customer_id) REFERENCES customer_info(customer_id)
);

-- 7. route: Routes (destination and distance from Dhaka)
CREATE TABLE route (
    route_id VARCHAR2(4) PRIMARY KEY,
    distance NUMBER(5,1) NOT NULL,
    stoppage_location VARCHAR2(20) NOT NULL
);

-- 8. bus_info: Buses (each bus runs on one route)
CREATE TABLE bus_info (
    bus_id NUMBER(5) PRIMARY KEY,
    bus_no VARCHAR2(10) NOT NULL,
    bus_type VARCHAR2(10) NOT NULL CHECK (bus_type IN ('AC', 'NON AC')),
    departure_time DATE NOT NULL,
    starting_point VARCHAR2(20) NOT NULL,
    destination VARCHAR2(20) NOT NULL,
    capacity NUMBER(3) DEFAULT 50 CHECK (capacity > 0) NOT NULL,
    route_id VARCHAR2(4) NOT NULL,
    CONSTRAINT fk_bus_route FOREIGN KEY (route_id) REFERENCES route(route_id)
);

-- 9. info_seat: Seat of each passenger on a bus
CREATE TABLE info_seat (
    seat_id VARCHAR2(10) PRIMARY KEY,
    seat_type VARCHAR2(20) NOT NULL CHECK (seat_type IN ('WINDOW', 'AISLE')),
    passenger_id NUMBER(5) NOT NULL,
    bus_id NUMBER(5) NOT NULL,
    CONSTRAINT FK_passenger FOREIGN KEY (passenger_id) REFERENCES passenger_info(passenger_id),
    CONSTRAINT fk_seat_bus FOREIGN KEY (bus_id) REFERENCES bus_info(bus_id)
);

-- Check the structure of every table
DESC manager;
DESC ticket_agent;
DESC ticket_info;
DESC customer_info;
DESC payment_details;
DESC passenger_info;
DESC route;
DESC bus_info;
DESC info_seat;
