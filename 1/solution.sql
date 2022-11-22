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
INSERT INTO salesman values(102, 'ajay', 'bangalore', 40000);
INSERT INTO salesman values(103, 'amar', 'bangalore', 90000);
INSERT INTO salesman values(104, 'ram', 'pune', 55000);
INSERT INTO salesman values(105, 'laxman', 'mathura', 58000);
INSERT INTO salesman values(106, 'sita', 'nagpur', 32000);

INSERT INTO customer values(201, 'raj', 'delhi', 20, 101);
INSERT INTO customer values(202, 'gopal', 'bangalore', 20, NULL);
INSERT INTO customer values(203, 'krishna', 'bangalore', 15, NULL);
INSERT INTO customer values(204, 'shyam', 'pune', 18, NULL);

INSERT INTO orders values(301, 500, '09/01/2021', 201, 104);
INSERT INTO orders values(302, 1000, '09/01/2021', 203, 104);
INSERT INTO orders values(303, 1500, '10/01/2021', 204, 103);
INSERT INTO orders values(305, 2000, '10/01/2021', 203, 102);
INSERT INTO orders values(304, 1500, '10/02/2021', 204, 103);
INSERT INTO orders values(308, 3000, '11/02/2021', 201, 103);
INSERT INTO orders values(306, 2500, '11/02/2021', 202, 101);
INSERT INTO orders values(307, 2500, '13/02/2021', 202, 101);
INSERT INTO orders values(309, 3000, '11/06/2021', 201, 103);


describe salesman;
SELECT * FROM salesman;

describe customer;
SELECT * FROM customer;

describe orders;
SELECT * FROM orders;


-- 1) Count the customers with grades above Bangalore's Average. 

SELECT * from customer where grade > (SELECT AVG(grade) from customer where city = 'bangalore');

-- 2) Find the name and numbers of all salesmen who had more than one customer.

SELECT
    unique_orders.salesman_id,
    count(unique_orders.salesman_id)
    from (SELECT DISTINCT customer_id, salesman_id from orders) as unique_orders
    group by unique_orders.salesman_id
    having count(unique_orders.salesman_id) > 1;

-- 3) List all salesmen and indicate those who have and don’t have customers in their cities (Use UNION operation.) 

SELECT salesman_name, city, 'True' as HaveCustomer from salesman where city in (SELECT city from customer)
UNION
SELECT salesman_name, city, 'False' as HaveCustomer from salesman where city not in (SELECT city from customer);

--4) Create a view that finds the salesman who has the customer with the highest order of a day.

SELECT ord_date, MAX(purch_amt) from orders group by ord_date;

--5) Demonstrate the DELETE operation by removing salesmen with id 1000. All his orders must also be deleted.