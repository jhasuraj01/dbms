drop table employee;

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(20),
    -- lastname VARCHAR(20),
    -- firstname VARCHAR(20),
    -- middlename VARCHAR(20),
    job_id INT,
    manager_id INT,
    hiredate DATE,
    credit_limit INT,
    department_Id INT,
    FOREIGN KEY (manager_id) REFERENCES employee(employee_id) ON DELETE CASCADE
);

INSERT INTO employee values(1, 'Ram', 101, NULL, '2022/11/10', 750000, 201);
INSERT INTO employee values(2, 'Shyam', 102, 1, '2022/10/10', 50000, 201);
INSERT INTO employee values(3, 'Gopal', 103, 1, '2022/09/11', 25000, 201);
INSERT INTO employee values(4, 'Ganesh', 104, 2, '2022/09/10', 8000, 201);
INSERT INTO employee values(5, 'Shiv', 105, 3, '2022/08/10', 1000, 201);

-- cursor
DROP PROCEDURE tag;
DELIMITER $$
CREATE PROCEDURE tag()
BEGIN
    DECLARE finished INT default 0;
    DECLARE credit INT;
    DECLARE emp_name VARCHAR(20);

	DECLARE employee_cursor CURSOR FOR SELECT employee_name, credit_limit FROM employee;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
	OPEN employee_cursor;
	my_loop: LOOP
		FETCH employee_cursor INTO emp_name, credit;
		IF finished = 1 THEN LEAVE my_loop;
		END IF;
		SELECT
            emp_name,
            credit,
            CASE
                WHEN 50000 <= credit THEN 'Platinum'
                WHEN 10000 <= credit AND credit < 50000 THEN 'Gold'
                ELSE 'Silver'
            END as Tag;
	END LOOP my_loop;
	CLOSE employee_cursor;
END$$
DELIMITER ;

call tag();