-- Create Tables

drop table orders;
drop table customer;
drop table salesman;

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    salesman_name VARCHAR(20),
    city VARCHAR(20),
    commission DECIMAL
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(20),
    city VARCHAR(20),
    grade DECIMAL,
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

INSERT INTO salesman values(101, 'raj', 'delhi', 60000);
INSERT INTO salesman values(102, 'ajay', 'mumbai', 40000);
INSERT INTO salesman values(103, 'amar', 'pune', 90000);
INSERT INTO salesman values(104, 'ram', 'pune', 55000);

INSERT INTO customer values(201, 'raj', 'delhi', 10, 101);
INSERT INTO customer values(202, 'ajay', 'mumbai', 20, NULL);
INSERT INTO customer values(203, 'amar', 'pune', 15, NULL);
INSERT INTO customer values(204, 'ram', 'pune', 18, NULL);


INSERT INTO orders values(301, 500, '09/01/2021', 201, 104);
INSERT INTO orders values(302, 1000, '09/01/2021', 203, 104);
INSERT INTO orders values(303, 1500, '10/01/2021', 204, 103);
INSERT INTO orders values(304, 2000, '10/01/2021', 203, 102);
INSERT INTO orders values(305, 2500, '11/02/2021', 202, 101);
INSERT INTO orders values(306, 3000, '11/02/2021', 201, 103);


describe salesman;
SELECT * FROM salesman;

describe customer;
SELECT * FROM customer;

describe orders;
SELECT * FROM orders;

-- 1) List the name of customers who stays at ‘Delhi’
SELECT customer_name as 'Customers FROM Delhi' FROM customer WHERE city = 'delhi';

-- 2) List the details of orders made by customer ‘Raj’
SELECT * FROM orders WHERE customer_id IN (SELECT customer_id FROM customer WHERE customer_name = 'Raj');

-- 3) Display the name and city of the salesman having a commission between 50,000 and 80,000.
SELECT salesman_name, city from salesman where commission BETWEEN 50000 AND 80000;

-- 4) List salesmen whose initials are ‘a’
SELECT * from salesman where salesman_name like 'a%';

-- 5) List all salesmen who are customers also.
select * from salesman where salesman_id in (select salesman_id from customer where salesman_id IS NOT NULL);

-- 6) List total commission from orders
SELECT SUM(commission) as 'Total Commission' from
orders INNER JOIN salesman
ON orders.salesman_id = salesman.salesman_id;

-- 7) Change city of salesman having id 104
select * from salesman;
UPDATE salesman
set city = 'Ooty'
where salesman_id = 104;
select * from salesman;

-- 8) List maximum commission of salesmen living in Mumbai.
select max(commission) as 'Maximum Commission in Mumbai' from salesman where city = 'mumbai';

-- 9) List city name and city wise count of customers
select city, count(city) from customer GROUP BY city;

-- 10) List the customer names having sum of purch_amt is more than 2000.
select customer_name, purch_amt from
customer INNER JOIN orders
ON customer.customer_id = orders.customer_id
where orders.purch_amt >= 2000;

-- 11) Update 10% commission to all salesmen.
select * from salesman;
update salesman
set commission = commission * 1.1;
select * from salesman;

-- 12) Delete all orders before 10/01/2021.
select * from orders;
DELETE from orders where ord_date < '10/01/2021';
select * from orders;