-- Bus Ticket Counter Management System
-- Delete all tables (child tables first). Use this to start again from Step 1.
-- Database: Oracle (tested on Oracle Database XE / Application Express)

-- Views (only if you ran 03_queries_and_views.sql)
DROP VIEW simple_manager_view;
DROP VIEW high_paid_managers;

-- Tables
DROP TABLE route;
DROP TABLE bus_info;
DROP TABLE info_seat;
DROP TABLE passenger_info;
DROP TABLE payment_details;
DROP TABLE customer_info;
DROP TABLE ticket_info;
DROP TABLE ticket_agent;
DROP TABLE manager;
