# 📊 Task 3: SQL for Data Analysis

## 👨‍💻 Internship Task – Data Analyst Role

## 📁 Dataset:
Created a sample E-commerce Database with 3 main tables:
- `cust` – Customer details
- `prod` – Product details
- `ord` – Order details

---

## ✅ Key Concepts Covered:

- Basic SQL Queries: SELECT, WHERE, ORDER BY, GROUP BY
- Aggregate Functions: SUM, AVG
- JOINS: INNER JOIN, LEFT JOIN, RIGHT JOIN
- Subqueries (Nested Queries)
- Views for analysis
- Indexes for query optimization

---

## 📂 Files Included:

- `task3_queries.sql` – Full SQL code for database creation, data insertion, and all queries
- `screenshots/` – Folder containing output screenshots (if needed)

---

## 📌 How to Use:

1. Open your SQL client (MySQL Workbench, phpMyAdmin, etc.)
2. Run the `task3_queries.sql` script step-by-step or all at once
3. Analyze the output for each query

---

## 🔍 Sample Views Used:

- `view_total_spent`: Shows total spending per customer
- `view_order_details`: Shows order ID, customer name, date, and total amount

---

## 🚀 Optimization:

- Index created on `cust(name)` for faster search
- Used `EXPLAIN` to check if index was used
---
