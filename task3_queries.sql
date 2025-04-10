-- SHOW DATABASES
SHOW DATABASES;

-- CREATE DATABASE
CREATE DATABASE ecommerce;

-- USE DATABASE
USE ecommerce;

-- CREATE TABLES
CREATE TABLE cust (
    cid INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE prod (
    pid INT PRIMARY KEY,
    pname VARCHAR(100),
    cat VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE ord (
    oid INT PRIMARY KEY,
    cid INT,
    pid INT,
    gty INT,
    odate DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (cid) REFERENCES cust(cid),
    FOREIGN KEY (pid) REFERENCES prod(pid)
);

-- INSERT INTO TABLES
INSERT INTO cust VALUES 
(1, 'VK', 'vk@mail.com'),
(2, 'max', 'max@mail.com'),
(3, 'sp', 'sp@mail.com'),
(4, 'aman', 'aman@mail.com');

INSERT INTO prod VALUES 
(101, 'Laptop', 'Electronics', 800.00),
(102, 'Phone', 'Electronics', 500.00),
(103, 'Book', 'Books', 20.00);

INSERT INTO ord VALUES 
(1001, 1, 101, 1, '2024-01-10', 800.00),
(1002, 2, 102, 1, '2024-02-15', 500.00),
(1003, 1, 103, 1, '2024-03-05', 20.00),
(1004, 3, 102, 1, '2024-03-10', 500.00);

-- BASIC QUERIES AND AGGREGATE FUNCTIONS (SELECT,WHERE,ORDER BY,GROUP BY )
SELECT * FROM ord WHERE total >= 500 ORDER BY total DESC;
SELECT * FROM ord WHERE total >= 500 ORDER BY oid DESC;
SELECT oid, SUM(total) AS spent FROM ord GROUP BY cid;
SELECT DISTINCT(pid) FROM ord;
SELECT AVG(total) AS avg_order FROM ord;

-- INNER JOIN
SELECT o.oid, c.name, o.total
FROM ord o
INNER JOIN cust c ON o.cid = c.cid;

-- LEFT JOIN
SELECT c.name, o.oid, o.total
FROM cust c
LEFT JOIN ord o ON c.cid = o.cid;

-- RIGHT JOIN
SELECT c.name, o.oid, o.total
FROM ord o
RIGHT JOIN cust c ON o.cid = c.cid;

-- SUBQUERY: Total spent by each customer
SELECT name, 
    (SELECT SUM(total) FROM ord WHERE ord.cid = cust.cid) AS total_spent
FROM cust;

-- SUBQUERY: Customers who placed orders with total > 500
SELECT name, email
FROM cust
WHERE EXISTS (
    SELECT 1 FROM ord WHERE ord.cid = cust.cid AND total > 500
);

-- CREATE VIEWS
CREATE VIEW view_total_spent AS
SELECT cid, SUM(total) AS total_spent FROM ord GROUP BY cid;

CREATE VIEW view_order_details AS
SELECT o.oid, c.name AS customer_name, o.odate, o.total
FROM ord o
JOIN cust c ON o.cid = c.cid;

-- USE VIEWS
SELECT * FROM view_total_spent;
SELECT * FROM view_order_details WHERE total > 500;

-- CREATE INDEX
CREATE INDEX idx_cust_name ON cust(name);

-- QUERY USING INDEX
SELECT * FROM cust WHERE name = 'Amit';

-- CHECK IF INDEX IS USED
EXPLAIN SELECT * FROM cust WHERE name = 'Amit';
