/*
Given the table EMPLOYEE (EmpNo, Name, Salary, Designation, DeptID)
write a cursor to select the five highest paid employees from the table.
*/

drop table employee;

CREATE TABLE employee (
    emp_no INT PRIMARY KEY,
    employee_name VARCHAR(20),
    salary INT
    -- designation VARCHAR(20),
    -- dept_id INT
);

INSERT INTO employee values(1, 'Ram', 100000);
INSERT INTO employee values(2, 'Shyam', 36515);
INSERT INTO employee values(3, 'Gopal', 86407);
INSERT INTO employee values(4, 'Laxman', 500000);
INSERT INTO employee values(5, 'Laxmi', 6549024);
INSERT INTO employee values(6, 'Sita', 8036415);
INSERT INTO employee values(7, 'Luv', 5036415);

DROP PROCEDURE getTop;

DELIMITER $$
CREATE PROCEDURE getTop()
BEGIN
    DECLARE emp_name VARCHAR(20);
    DECLARE sal INT;
    DECLARE count INT default 1;
    DECLARE employee_cursor CURSOR FOR select employee_name, salary from employee ORDER BY salary DESC;
    OPEN employee_cursor;
        my_loop: LOOP
            IF count = 6 THEN LEAVE my_loop;
            END IF;
            FETCH employee_cursor INTO emp_name, sal;
            select emp_name, sal, count;
            SET count = count + 1;
        END LOOP my_loop;
    CLOSE employee_cursor;
END $$
DELIMITER ;

-- select * from employee ORDER BY salary DESC LIMIT 5;