use employees_mod;
-- 1. Upload the sql script to create the employees database.
DELIMITER $$ 
CREATE PROCEDURE emp()
BEGIN 
        SELECT * FROM t_employees 
        LIMIT 1000;
END$$ 
DELIMITER;
call emp();

-- 2. Create a procedure that will provide the average salary of all employees
DELIMITER $$ 
CREATE PROCEDURE avg_sal()
BEGIN 
SELECT avg(salary)
		from t_salaries;
END$$ 
DELIMITER;
call avg_sal();

-- 3. Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual,and returns their employee number.
-- 4. Call the procedures
DELIMITER $$ 
CREATE PROCEDURE emp_info(in p_first_name varchar (255), in p_last_name varchar(255), out p_emp_no integer)
begin 
	select 
		e.emp_no
    from 
		t_employees e
	where 
		e.first_name = p_first_name
	and
		e.last_name = p_last_name;
    END$$ 
 DELIMITER $$    
 call emp_info('Saniya', 'Kalloufi');
 
 -- 5. Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, 
 -- and returns the salary from the newest contract of that employee.
 
 DELIMITER $$
CREATE function emp_info1(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
                DECLARE v_max_from_date date;
               DECLARE v_salary decimal(10,2);
SELECT
    MAX(from_date)
INTO v_max_from_date FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
SELECT
	s.salary
INTO v_salary FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
      
                RETURN v_salary;
END$$
DELIMITER ;
SELECT emp_info1('Aruna', 'Journel');

-- 6. Create a trigger that checks if the hire date of an employee is higher than the current date. 
-- If true, set this date to be the current date. Format the output appropriately (YY-MM-DD)
DELIMITER $$
CREATE TRIGGER trig_hire_date 
BEFORE INSERT ON t_employees
FOR EACH ROW 
BEGIN 
	IF NEW.hire_date > date_format(sysdate(), '%Y-%m-%d') THEN    
		SET NEW.hire_date = date_format(sysdate(), '%Y-%m-%d');    
	END IF; 
END $$ 
DELIMITER ; 
  
INSERT
	employees
VALUES
	('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01'); 
SELECT 
	* 
FROM 
	t_employees
ORDER BY
	emp_no DESC;
    
-- 7. Create ‘i_hire_date’ and Drop the ‘i_hire_date’ index.

DELIMITER $$
CREATE FUNCTION emp_info2(p_first_name varchar(255), p_last_name varchar(255)) RETURNS decimal(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
                DECLARE v_max_from_date date;
               DECLARE v_salary decimal(10,2);
SELECT
    MAX(from_date)
INTO v_max_from_date FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
SELECT
    s.salary
INTO v_salary FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
                RETURN v_salary;
END$$
DELIMITER ;
SELECT emp_info2('Saniya', 'Kalloufi');

-- 8. Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
-- Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.

use employees_mood;
call emp;
select *from t_salaries where salary > 89000;
CREATE INDEX i_salary ON t_salaries(salary);
SELECT * FRom t_salaries
WHERE salary > 89000;

-- 9. Use Case statement and obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990.
-- Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee. 

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    t_employees e
        LEFT JOIN
    t_dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;
    
    -- 10. Extract a dataset containing the following information about the managers: employee number, first name, and last name. 
    -- Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee,
    -- and another one saying whether this salary raise was higher than $30,000 or NOT.
    
    SELECT
    dm.emp_no,
	e.first_name,
	e.last_name,
	MAX(s.salary) - MIN(s.salary) AS salary_difference,
	CASE
    	WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more then $30,000'
    	ELSE 'Salary was NOT raised by more then $30,000'
	END AS salary_raise
FROM
	t_dept_manager dm
    	JOIN
	t_employees e ON e.emp_no = dm.emp_no
    	JOIN
	t_salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;

-- 11. Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” saying “Is still employed” 
-- if the employee is still working in the company, or “Not an employee anymore” if they aren’t. 
-- Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise.
SELECT
    e.emp_no,
	e.first_name,
	e.last_name,
	CASE
		WHEN MAX(de.to_date) >= SYSDATE() THEN 'Is still employed'
    	ELSE 'Not an employee anymore'
		END AS current_employee
FROM
	t_employees e
    	JOIN
	t_dept_emp de ON de.emp_no = e.emp_no
GROUP BY de.emp_no
LIMIT 100;



