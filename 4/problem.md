Design at least 10 SQL queries for suitable database application using SQL DML Statements: Insert, Select, Update, Delete with operators, aggregate functions and sub-queries. (Insert minimum 5 rows for each table)
Inventory Database

1)List the name of customers who stays at ‘Delhi’
2) List the details of orders made by customer ‘Raj’
3) Display the name and city of the salesman having a commission between 50,000 and 80,000.
4) List salesmen whose initials are ‘a’.
5) List all salesmen who are customers also.
6) List total commission from orders
7) Change city of salesman having id 104
8) List maximum commission of salesmen living in Mumbai.
9) List city name and city wise count of customers
10) List the customer names having sum of Purch_amt is more than 2000.
11) Update 10% commission to all salesmen.
12) Delete all orders before 10/01/2021.


## Solution

### Create Tables
```sql
CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    salesman_name VARCHAR(20),
    city VARCHAR(20),
    commission DECIMAL(10, 2)
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(20),
    city VARCHAR(20),
    grade DECIMAL(10, 2),
    salesman_id INT
);

ALTER TABLE customer
ADD FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id) ON DELETE CASCADE;

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt VARCHAR(20),
    ord_date VARCHAR(20),
    customer_id INT,
    salesman_id INT
);

ALTER TABLE orders
ADD FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id) ON DELETE CASCADE;

ALTER TABLE orders
ADD FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE;

describe salesman;
describe customer;
describe orders;
```

Salesman Table
```
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| salesman_id | int          | NO   | PRI | NULL    |       |
| name        | varchar(20)  | YES  |     | NULL    |       |
| city        | varchar(20)  | YES  |     | NULL    |       |
| commission  | decimal(5,2) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
```

Customer Table
```
+---------------+---------------+------+-----+---------+-------+
| Field         | Type          | Null | Key | Default | Extra |
+---------------+---------------+------+-----+---------+-------+
| customer_id   | int           | NO   | PRI | NULL    |       |
| customer_name | varchar(20)   | YES  |     | NULL    |       |
| city          | varchar(20)   | YES  |     | NULL    |       |
| grade         | decimal(10,2) | YES  |     | NULL    |       |
| salesman_id   | int           | YES  | MUL | NULL    |       |
+---------------+---------------+------+-----+---------+-------+
```

Orders Table
```
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| ord_no      | int         | NO   | PRI | NULL    |       |
| purch_amt   | varchar(20) | YES  |     | NULL    |       |
| ord_date    | varchar(20) | YES  |     | NULL    |       |
| customer_id | int         | YES  | MUL | NULL    |       |
| salesman_id | int         | YES  | MUL | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
```
