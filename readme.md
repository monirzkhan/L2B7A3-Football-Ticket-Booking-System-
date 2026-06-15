# ⚽ Football Ticket Booking System

## Assignment 03 - PostgreSQL Database Project

### 📌 Project Overview

The Football Ticket Booking System is a relational database project designed to manage football matches, ticket bookings, users, and booking transactions efficiently.

The system allows users to:

* View available football matches
* Book tickets for matches
* Manage users information
* Track ticket sales
* Monitor match availability and booking status

This project demonstrates the use of PostgreSQL concepts including table creation, constraints, primary keys, foreign keys, joins, aggregate functions, subqueries, and data integrity.

---

## 🛠️ Technologies Used

* PostgreSQL
* SQL
* Beekeeper Studio

---

## 🗄️ Database Schema

### Matches Table

Stores football match information.

| Column              | Description                                  |
| ------------------- | -------------------------------------------- |
| match_id            | Unique match identifier                      |
| fixture             | Match name                                   |
| tournament_category | Tournament category                          |
| base_ticket_price   | Ticket price                                 |
| match_status        | Available, Selling Fast, Sold Out, Postponed |

### users Table

Stores customer information.

| Column        | Description                   |
| ------------- | --------------------------    |
| user_id       | Unique user identifier        |
| full_name     | full name                     |
| email         | Customer email                |
| role          | Ticket Manager or Football Fan|
| phone         | Contact number                |

### Bookings Table

Stores ticket booking records.

| Column        | Description                                       |
| ------------  | ------------------------------                    |
| booking_id    | Unique booking identifier                         |
| user_id       | References the users table                        |
| match_id      | References Matches table                          |
| seat_number   | Number of seat                                    |
| payment_status| Pending, Confirmed, Cancelled, Refunded           |
| total_cost    | Total booking amount                              |

---

## 🔑 Key Database Features

### Primary Keys

Used to uniquely identify records in each table.

### Foreign Keys

Maintain relationships between tables and prevent invalid data entry.

### Constraints

Used to enforce business rules and maintain data integrity.

Examples:

* NOT NULL
* CHECK
* PRIMARY KEY
* FOREIGN KEY

---

## 📊 SQL Concepts Demonstrated

* SELECT Statements
* Filtering with WHERE
* Sorting with ORDER BY
* Aggregate Functions

  * COUNT()
  * SUM()
  * AVG()
* GROUP BY
* HAVING
* INNER JOIN
* LEFT JOIN
* FULL JOIN
* Subqueries
* Data Validation with Constraints

---

## 📌 Example Query

Find matches with more than 10 bookings:

```sql
SELECT match_id, COUNT(booking_id)
FROM bookings
GROUP BY match_id
HAVING COUNT(booking_id) > 10;
```

---

## 🎯 Learning Outcomes

Through this assignment I learned:

* Database design principles
* Table relationships
* Referential integrity
* SQL querying techniques
* Aggregate functions
* Join operations
* Subquery implementation
* PostgreSQL best practices

---

## 👨‍💻 Author

**Mohammad Moniruzzaman**

Assignment 03 – Football Ticket Booking System

PostgreSQL Database Project

Submission Date: 15 June 2026
