# DBA Technical Challenge

## Background

You have been handed access to the production database for **Acme Shop**, a small
e-commerce company. The system was written by a single developer two years ago
and has never had a formal database review.

The business is growing and is starting to see data quality problems, slow queries,
and reports that are difficult to write. Your job is to review the database and
provide actionable recommendations.

---

## Connecting to the Database

| Field    | Value                                    |
|----------|------------------------------------------|
| JDBC URL | `jdbc:h2:tcp://localhost:9092/challenge` |
| Username | `sa`                                     |
| Password | *(leave blank)*                          |

A browser-based SQL console is available at **http://localhost:8082** — use the
same connection details above.

---

## Your Tasks

### Part 1 — Schema Review

Explore the database schema and data. Identify and document **any design
problem** you find. For each issue:

- Name the table and column(s) involved.
- Explain what the problem is.
- Explain what real-world harm it causes or could cause.

There is no minimum or maximum number of issues — find as many as you can.

---

### Part 2 — Proposed Redesign

Write the DDL (`CREATE TABLE` statements) for an improved schema that fixes
the issues you found. Your redesign should:

- Preserve all the data that the current schema holds.
- Be properly normalised.
- Include appropriate primary keys, foreign keys, and constraints.
- Use correct data types throughout.

You do not need to write the data migration — just the new schema.

---

### Part 3 — Demonstrate the Problems with SQL

Write two queries against the **existing (broken) schema**:

1. **Product breakdown query** — List every order alongside each product in
   that order (one row per product per order). The result should include
   `ORDER_ID`, `CUSTOMER_NAME`, `PROD_NAME`, and `UNIT_PRICE`.

2. **Data quality query** — Write a query that surfaces at least one data
   quality or consistency problem in the data.

Then write the equivalent of query #1 against your **proposed new schema**
(using your redesigned table structure) and comment on the difference.

---

### Part 4 — Indexing Strategy *(Bonus)*

Given the following common queries run against this system, identify which
indexes you would add to the **improved schema** and explain your reasoning:

- Find all orders placed by a specific customer email address.
- List all orders with a status of `PENDING`, sorted by order date ascending.
- Retrieve all products in a given category.


