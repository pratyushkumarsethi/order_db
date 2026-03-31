CREATE DATABASE ORDER_DB;
USE ORDER_DB;

CREATE TABLE SALESMAN (
    SALESMAN_ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    CITY VARCHAR(50),
    COMMISSION DECIMAL(5,2)
);

CREATE TABLE CUSTOMER (
    CUSTOMER_ID INT PRIMARY KEY,
    CUST_NAME VARCHAR(50),
    CITY VARCHAR(50),
    GRADE INT,
    SALESMAN_ID INT,
    FOREIGN KEY (SALESMAN_ID)
        REFERENCES SALESMAN(SALESMAN_ID)
);

CREATE TABLE ORDERS (
    ORD_NO INT PRIMARY KEY,
    PURCHASE_AMT DECIMAL(10,2),
    ORD_DATE DATE,
    CUSTOMER_ID INT,
    SALESMAN_ID INT,
    FOREIGN KEY (CUSTOMER_ID)
        REFERENCES CUSTOMER(CUSTOMER_ID),
    FOREIGN KEY (SALESMAN_ID)
        REFERENCES SALESMAN(SALESMAN_ID)
);

INSERT INTO SALESMAN VALUES
(101, 'Deepankar Sahoo', 'Jajpur', 0.15),
(102, 'Sandib Jena', 'baleswar', 0.13),
(103, 'Swaraj Satapathy', 'rourkela', 0.12),
(104, 'Biswa Ranjan', 'jagatsinghpur', 0.14),
(105, 'Ram krushna', 'Jajpur', 0.11),
(106, 'Biswajit Pradhan', 'Sambalpur', 0.10);


INSERT INTO CUSTOMER VALUES
(201, 'Pratyush Sethi', 'Jajpur', 100, 101),
(202, 'Subham Mohanty', 'Baleswar', 200, 102),
(203, 'Satyajit Behera', 'Rourkela', 150, 103),
(204, 'Debasis Nayak', 'Jagatsinghpur', 300, 104),
(205, 'Manas Ranjan', 'Jajpur', 250, 105),
(206, 'Rakesh Rout', 'Baleswar', 180, 102),
(207, 'Ankit Mishra', 'Rourkela', 220, 103),
(208, 'Sourav Panda', 'Jajpur', 140, 101),
(209, 'Chinmay Das', 'Jagatsinghpur', 260, 104),
(210, 'Biswajit Sahoo', 'Jajpur', 300, 105),
(211, 'Dilip Mahapatra', 'Brahampur', 300, 106);

INSERT INTO ORDERS VALUES
(301, 2500.50, '2026-01-10', 201, 101),
(302, 1800.75, '2026-01-12', 202, 102),
(303, 3200.00, '2026-01-15', 203, 103),
(304, 1500.25, '2026-01-18', 204, 104),
(305, 4100.90, '2026-01-20', 205, 105);

-- 1.count the customers with grade above Jajpur's average
SELECT COUNT(*)
FROM CUSTOMER
WHERE GRADE > (
SELECT AVG(GRADE)
FROM CUSTOMER
WHERE CITY = 'Jajpur'
);

-- find the name and numbers of all salesman who had more than one customer.
SELECT SALESMAN_ID, COUNT(CUSTOMER_ID) AS TOTAL_CUSTOMERS
FROM CUSTOMER
GROUP BY SALESMAN_ID
HAVING COUNT(CUSTOMER_ID) > 1;
