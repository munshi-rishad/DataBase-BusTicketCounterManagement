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

Each table shows its structure (`CREATE TABLE` + `DESC`) and the data inside it.

#### 1. manager

**Structure**

![manager structure](screenshots/tables/01_manager_structure.png)

**Data**

![manager data](screenshots/tables/01_manager_data.png)

#### 2. ticket_agent

**Structure**

![ticket_agent structure](screenshots/tables/02_ticket_agent_structure.png)

**Data**

![ticket_agent data](screenshots/tables/02_ticket_agent_data.png)

#### 3. ticket_info

**Structure**

![ticket_info structure](screenshots/tables/03_ticket_info_structure.png)

**Data**

![ticket_info data](screenshots/tables/03_ticket_info_data.png)

#### 4. customer_info

**Structure**

![customer_info structure](screenshots/tables/04_customer_info_structure.png)

**Data**

![customer_info data](screenshots/tables/04_customer_info_data.png)

#### 5. payment_details

**Structure**

![payment_details structure](screenshots/tables/05_payment_details_structure.png)

**Data**

![payment_details data](screenshots/tables/05_payment_details_data.png)

#### 6. passenger_info

**Structure**

![passenger_info structure](screenshots/tables/06_passenger_info_structure.png)

**Data**

![passenger_info data](screenshots/tables/06_passenger_info_data.png)

#### 7. route

**Structure**

![route structure](screenshots/tables/07_route_structure.png)

**Data**

![route data](screenshots/tables/07_route_data.png)

#### 8. bus_info

**Structure**

![bus_info structure](screenshots/tables/08_bus_info_structure.png)

**Data**

![bus_info data](screenshots/tables/08_bus_info_data.png)

#### 9. info_seat

**Structure**

![info_seat structure](screenshots/tables/09_info_seat_structure.png)

**Data**

![info_seat data](screenshots/tables/09_info_seat_data.png)

### Queries and Views

All query screenshots are in [`screenshots/queries`](screenshots/queries). A few examples:

#### Aggregate function

Average agent salary for each manager.

![aggregate function](screenshots/queries/03_aggregate_function.png)

#### Inner join

Each ticket with the agent who sold it.

![inner join](screenshots/queries/08_inner_join.png)

#### Complex view

Tickets sold and total sales for each manager.

![complex view](screenshots/queries/13_complex_view.png)

### Java Connection (XAMPP + MySQL)

#### Code

![Java code](screenshots/java/manager_code.png)

#### Output

![Java output](screenshots/java/manager_output.png)

More screenshots for each table are in [`screenshots/java`](screenshots/java).
