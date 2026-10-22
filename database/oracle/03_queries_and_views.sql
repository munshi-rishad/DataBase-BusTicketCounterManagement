-- Bus Ticket Counter Management System
-- Step 3: test queries and views (run after 02_insert_data.sql)
-- Database: Oracle (tested on Oracle Database XE / Application Express)

-- 1. Simple query: agents who work under manager 1
SELECT agent_id, agent_name, agent_phone, agent_salary
FROM ticket_agent
WHERE manager_id = 1;

-- 2. Single row function: manager names in upper case
SELECT UPPER(manager_name) AS manager_name_uppercase, manager_salary
FROM manager;

-- 3. Aggregate (group) function: average agent salary for each manager
SELECT manager_id, AVG(agent_salary) AS avg_agent_salary
FROM ticket_agent
GROUP BY manager_id;

-- 4. Single row subquery 1: manager with the highest salary
SELECT manager_name
FROM manager
WHERE manager_salary = (SELECT MAX(manager_salary) FROM manager);

-- 5. Single row subquery 2: agent hired most recently
SELECT agent_name
FROM ticket_agent
WHERE ticket_agent_hire_date = (SELECT MAX(ticket_agent_hire_date) FROM ticket_agent);

-- 6. Multiple row subquery 1: agents whose manager earns more than 25000
SELECT agent_name
FROM ticket_agent
WHERE manager_id IN (SELECT manager_id FROM manager WHERE manager_salary > 25000);

-- 7. Multiple row subquery 2: managers who have an agent earning more than 18000
SELECT manager_name
FROM manager
WHERE manager_id IN (SELECT manager_id FROM ticket_agent WHERE agent_salary > 18000);

-- 8. Inner join: each ticket with the agent who sold it
SELECT ti.ticket_id, ti.price, ta.agent_name
FROM ticket_info ti, ticket_agent ta
WHERE ti.agent_id = ta.agent_id;

-- 9. Left outer join: every manager with their agents
SELECT m.manager_name, ta.agent_name
FROM manager m, ticket_agent ta
WHERE m.manager_id = ta.manager_id(+);

-- 10. Right outer join: every agent with their manager
SELECT m.manager_name, ta.agent_name
FROM manager m, ticket_agent ta
WHERE m.manager_id(+) = ta.manager_id;

-- 11. Full outer join (left join UNION right join)
SELECT m.manager_name, ta.agent_name
FROM manager m, ticket_agent ta
WHERE m.manager_id = ta.manager_id(+)
UNION
SELECT m.manager_name, ta.agent_name
FROM ticket_agent ta, manager m
WHERE m.manager_id(+) = ta.manager_id;

-- 12. Simple view: manager contact list
CREATE VIEW simple_manager_view AS
SELECT manager_id, manager_name, manager_phone
FROM manager;

SELECT * FROM simple_manager_view;

-- 13. Complex view (join + group function): tickets sold by each manager's agents
CREATE VIEW manager_sales_view AS
SELECT m.manager_id, m.manager_name,
       COUNT(ti.ticket_id) AS tickets_sold,
       SUM(ti.price) AS total_sales
FROM manager m, ticket_agent ta, ticket_info ti
WHERE m.manager_id = ta.manager_id
AND ta.agent_id = ti.agent_id
GROUP BY m.manager_id, m.manager_name;

SELECT * FROM manager_sales_view;

-- Extra: which bus and seat each passenger has, and the route distance
SELECT p.passenger_name, s.seat_id, s.seat_type, b.bus_no, b.bus_type, r.stoppage_location, r.distance
FROM passenger_info p, info_seat s, bus_info b, route r
WHERE p.passenger_id = s.passenger_id
AND s.bus_id = b.bus_id
AND b.route_id = r.route_id;
