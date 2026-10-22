# Bus Ticket Counter Management System

A database project for the **Introduction to Database (CSC2108)** course at AIUB.
It stores the information of a bus ticket counter: managers, ticket agents, tickets,
customers, payments, passengers, seats, buses and routes.

The tables, data, queries and views were built in **Oracle**. The same database was also
created in **MySQL (XAMPP)** and connected to **Java** using JDBC.

## Features

- 9 related tables with primary keys, foreign keys, `CHECK`, `UNIQUE`, `NOT NULL` and `DEFAULT` constraints
- Sample data (135 rows in total)
- Test queries: simple query, single row function, aggregate function, subqueries, 4 types of joins
- One simple view and one complex view
- Java programs that connect to the database and print the tables

## Tables

| # | Table | What it stores | Foreign key |
|---|-------|----------------|-------------|
| 1 | `manager` | Managers | – |
| 2 | `ticket_agent` | Ticket agents | `manager_id` → manager |
| 3 | `ticket_info` | Tickets sold | `agent_id` → ticket_agent |
| 4 | `customer_info` | Customers who buy tickets | `ticket_id` → ticket_info |
| 5 | `payment_details` | Payments (30% off for NON AC) | `ticket_id` → ticket_info, `customer_id` → customer_info |
| 6 | `passenger_info` | Passengers | `customer_id` → customer_info |
| 7 | `route` | Routes (destination and distance) | – |
| 8 | `bus_info` | Buses | `route_id` → route |
| 9 | `info_seat` | Seat of each passenger on a bus | `passenger_id` → passenger_info, `bus_id` → bus_info |

## Project Structure

```
DataBase-BusTicketCounterManagement/
├── database/
│   ├── oracle/
│   │   ├── 01_create_tables.sql      # create all 9 tables
│   │   ├── 02_insert_data.sql        # insert sample data
│   │   ├── 03_queries_and_views.sql  # test queries and views
│   │   └── 04_drop_tables.sql        # delete everything
│   └── mysql/
│       └── bus_ticket_counter_management_system.sql   # same database for XAMPP
├── java/
│   ├── src/        # DBConnection + one program for each table
│   └── lib/        # MySQL JDBC driver (.jar)
├── docs/           # project report (.docx) and ER diagram
└── screenshots/    # tables, queries and Java output
```

## Requirements

- **Oracle Database XE** (with Application Express or SQL Developer) – for the Oracle scripts
- **XAMPP** – download from [apachefriends.org](https://www.apachefriends.org/) (for MySQL + phpMyAdmin)
- **JDK 8 or newer** – download from [Adoptium](https://adoptium.net/)
- **VS Code** with the **Extension Pack for Java**, or NetBeans

## Clone the Project

```bash
git clone https://github.com/munshi-rishad/DataBase-BusTicketCounterManagement.git
```

## Setup

### Oracle

Open the SQL Commands page (or SQL Developer) and run the files in order:

1. `database/oracle/01_create_tables.sql`
2. `database/oracle/02_insert_data.sql`
3. `database/oracle/03_queries_and_views.sql`

To start again, run `04_drop_tables.sql` and then step 1 again.

### MySQL (XAMPP) + Java in VS Code

1. Open the **XAMPP Control Panel** and start **Apache** and **MySQL**.
2. Go to `http://localhost/phpmyadmin`, open the **SQL** tab, paste the whole
   `database/mysql/bus_ticket_counter_management_system.sql` file and click **Go**.
   This creates the database with all tables and data.
3. Open the project folder in VS Code.
4. In the **Java Projects** panel, click **+** next to **Referenced Libraries** and add
   `java/lib/mysql-connector-java-8.0.30.jar`.
5. Open any file in `java/src` (for example `ManagerTable.java`) and click **Run**.

Or run from the terminal inside the project folder:

```bash
javac -cp java/lib/mysql-connector-java-8.0.30.jar -d out java/src/*.java

# Windows
java -cp "out;java/lib/mysql-connector-java-8.0.30.jar" ManagerTable
# macOS / Linux
java -cp "out:java/lib/mysql-connector-java-8.0.30.jar" ManagerTable
```

Replace `ManagerTable` with `TicketAgentTable`, `TicketInfoTable` or `CustomerInfoTable` to see the other tables.

> **Note:** The database name, user (`root`) and password (empty) are set in
> `java/src/DBConnection.java`. Change them there if your MySQL setup is different.

## ER Diagram

![ER Diagram](docs/er_diagram.jpeg)

## Screenshots

### Tables in Oracle

Each table shows its structure (`CREATE TABLE` + `DESC`) on the left and its data on the right.

<table>
  <tr>
    <td width="50%" align="center"><img src="screenshots/tables/01_manager_structure.png" alt="1. manager – structure"><br><sub>1. manager – structure</sub></td>
    <td width="50%" align="center"><img src="screenshots/tables/01_manager_data.png" alt="1. manager – data"><br><sub>1. manager – data</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/tables/02_ticket_agent_structure.png" alt="2. ticket_agent – structure"><br><sub>2. ticket_agent – structure</sub></td>
    <td width="50%" align="center"><img src="screenshots/tables/02_ticket_agent_data.png" alt="2. ticket_agent – data"><br><sub>2. ticket_agent – data</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/tables/03_ticket_info_structure.png" alt="3. ticket_info – structure"><br><sub>3. ticket_info – structure</sub></td>
    <td width="50%" align="center"><img src="screenshots/tables/03_ticket_info_data.png" alt="3. ticket_info – data"><br><sub>3. ticket_info – data</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/tables/04_customer_info_structure.png" alt="4. customer_info – structure"><br><sub>4. customer_info – structure</sub></td>
    <td width="50%" align="center"><img src="screenshots/tables/04_customer_info_data.png" alt="4. customer_info – data"><br><sub>4. customer_info – data</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/tables/05_payment_details_structure.png" alt="5. payment_details – structure"><br><sub>5. payment_details – structure</sub></td>
    <td width="50%" align="center"><img src="screenshots/tables/05_payment_details_data.png" alt="5. payment_details – data"><br><sub>5. payment_details – data</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/tables/06_passenger_info_structure.png" alt="6. passenger_info – structure"><br><sub>6. passenger_info – structure</sub></td>
    <td width="50%" align="center"><img src="screenshots/tables/06_passenger_info_data.png" alt="6. passenger_info – data"><br><sub>6. passenger_info – data</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/tables/07_route_structure.png" alt="7. route – structure"><br><sub>7. route – structure</sub></td>
    <td width="50%" align="center"><img src="screenshots/tables/07_route_data.png" alt="7. route – data"><br><sub>7. route – data</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/tables/08_bus_info_structure.png" alt="8. bus_info – structure"><br><sub>8. bus_info – structure</sub></td>
    <td width="50%" align="center"><img src="screenshots/tables/08_bus_info_data.png" alt="8. bus_info – data"><br><sub>8. bus_info – data</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/tables/09_info_seat_structure.png" alt="9. info_seat – structure"><br><sub>9. info_seat – structure</sub></td>
    <td width="50%" align="center"><img src="screenshots/tables/09_info_seat_data.png" alt="9. info_seat – data"><br><sub>9. info_seat – data</sub></td>
  </tr>
</table>

### Queries and Views

<table>
  <tr>
    <td width="50%" align="center"><img src="screenshots/queries/01_simple_query.png" alt="Simple query"><br><sub>Simple query</sub></td>
    <td width="50%" align="center"><img src="screenshots/queries/02_single_row_function.png" alt="Single row function"><br><sub>Single row function</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/queries/03_aggregate_function.png" alt="Aggregate function"><br><sub>Aggregate function</sub></td>
    <td width="50%" align="center"><img src="screenshots/queries/04_single_row_subquery_1.png" alt="Single row subquery 1"><br><sub>Single row subquery 1</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/queries/05_single_row_subquery_2.png" alt="Single row subquery 2"><br><sub>Single row subquery 2</sub></td>
    <td width="50%" align="center"><img src="screenshots/queries/06_multiple_row_subquery_1.png" alt="Multiple row subquery 1"><br><sub>Multiple row subquery 1</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/queries/07_multiple_row_subquery_2.png" alt="Multiple row subquery 2"><br><sub>Multiple row subquery 2</sub></td>
    <td width="50%" align="center"><img src="screenshots/queries/08_inner_join.png" alt="Inner join"><br><sub>Inner join</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/queries/09_left_outer_join.png" alt="Left outer join"><br><sub>Left outer join</sub></td>
    <td width="50%" align="center"><img src="screenshots/queries/10_right_outer_join.png" alt="Right outer join"><br><sub>Right outer join</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/queries/11_full_outer_join.png" alt="Full outer join"><br><sub>Full outer join</sub></td>
    <td width="50%" align="center"><img src="screenshots/queries/12_simple_view.png" alt="Simple view"><br><sub>Simple view</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/queries/13_complex_view.png" alt="Complex view (join + GROUP BY)"><br><sub>Complex view (join + GROUP BY)</sub></td>
    <td width="50%"></td>
  </tr>
</table>

### Java Connection (XAMPP + MySQL)

<table>
  <tr>
    <td width="50%" align="center"><img src="screenshots/java/manager_xampp_table.png" alt="Manager table in phpMyAdmin (XAMPP)"><br><sub>Manager table in phpMyAdmin (XAMPP)</sub></td>
    <td width="50%" align="center"><img src="screenshots/java/ticket_agent_xampp_table.png" alt="Ticket Agent table in phpMyAdmin (XAMPP)"><br><sub>Ticket Agent table in phpMyAdmin (XAMPP)</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/java/ticket_info_xampp_table.png" alt="Ticket Info table in phpMyAdmin (XAMPP)"><br><sub>Ticket Info table in phpMyAdmin (XAMPP)</sub></td>
    <td width="50%" align="center"><img src="screenshots/java/customer_info_xampp_table.png" alt="Customer Info table in phpMyAdmin (XAMPP)"><br><sub>Customer Info table in phpMyAdmin (XAMPP)</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/java/manager_code.png" alt="Manager – Java code"><br><sub>Manager – Java code</sub></td>
    <td width="50%" align="center"><img src="screenshots/java/manager_output.png" alt="Manager – output"><br><sub>Manager – output</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/java/ticket_agent_code.png" alt="Ticket Agent – Java code"><br><sub>Ticket Agent – Java code</sub></td>
    <td width="50%" align="center"><img src="screenshots/java/ticket_agent_output.png" alt="Ticket Agent – output"><br><sub>Ticket Agent – output</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/java/ticket_info_code.jpeg" alt="Ticket Info – Java code"><br><sub>Ticket Info – Java code</sub></td>
    <td width="50%" align="center"><img src="screenshots/java/ticket_info_output.jpeg" alt="Ticket Info – output"><br><sub>Ticket Info – output</sub></td>
  </tr>
  <tr>
    <td width="50%" align="center"><img src="screenshots/java/customer_info_code.png" alt="Customer Info – Java code"><br><sub>Customer Info – Java code</sub></td>
    <td width="50%" align="center"><img src="screenshots/java/customer_info_output.png" alt="Customer Info – output"><br><sub>Customer Info – output</sub></td>
  </tr>
</table>

