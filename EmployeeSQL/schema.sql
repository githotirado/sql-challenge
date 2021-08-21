-- Drop tables if they exist, include cascade for dependent tables deletes
-- Makes schema sql reusable to destroy and recreate
DROP TABLE IF EXISTS titles cascade;
DROP TABLE IF EXISTS employees cascade;
DROP TABLE IF EXISTS departments cascade;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;

-- Create the titles table, with a primary id and a title
CREATE TABLE titles(
	title_id char(5) PRIMARY KEY,
	title varchar(20)
);
-- Create an employees table, with the following: 
--    employee number, 
--    employee title id,
--    birth date
--    first name
--    last name
--    sex
--    hire date
-- set the foreign key and primary key relationships accordingly

CREATE TABLE employees(
	emp_no int PRIMARY KEY
--	, emp_title_id char(5) REFERENCES titles
	, emp_title_id char(5)
	, FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
	, birth_date date
	, first_name varchar
	, last_name varchar
	, sex char(1)
	, hire_date date
);

-- Create an departments table, with the following: 
--    department number, 
--    department name
-- set the primary key relationships accordingly

CREATE TABLE departments(
	dept_no char(4) PRIMARY KEY
	, dept_name varchar(20)
);

-- Create an dept_manager table, with the following: 
--    department number, 
--    employee number
-- set the foreign key and primary key relationships accordingly

CREATE TABLE dept_manager(
--	dept_no char(4) REFERENCES departments
--	, emp_no int REFERENCES employees
	dept_no char(4)
	, emp_no int
	, PRIMARY KEY (dept_no, emp_no)
	, FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	, FOREIGN KEY (emp_no)  REFERENCES employees(emp_no)
);

-- Create an dept_emp table, with the following: 
--    department number, 
--    employee number
-- set the foreign key and primary key relationships accordingly

CREATE TABLE dept_emp(
-- 	emp_no int REFERENCES employees
-- 	, dept_no char(4) REFERENCES departments
	emp_no int
	, dept_no char(4)
	, PRIMARY KEY (emp_no, dept_no)
	, FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	, FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create an salaries table, with the following: 
--    salary 
--    employee number
-- set the foreign key and primary key relationships accordingly

CREATE TABLE salaries(
-- 	emp_no int REFERENCES employees
	emp_no int
	,FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	, salary money
);

-- Import data from Data folder
COPY titles(title_id, title)
FROM '/Users/henrytirado/git/usc_homework/sql-challenge/EmployeeSQL/Data/titles.csv'
DELIMITER ','
CSV HEADER;

COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM '/Users/henrytirado/git/usc_homework/sql-challenge/EmployeeSQL/Data/employees.csv'
DELIMITER ','
CSV HEADER;

COPY departments(dept_no, dept_name)
FROM '/Users/henrytirado/git/usc_homework/sql-challenge/EmployeeSQL/Data/departments.csv'
DELIMITER ','
CSV HEADER;

COPY dept_manager(dept_no, emp_no)
FROM '/Users/henrytirado/git/usc_homework/sql-challenge/EmployeeSQL/Data/dept_manager.csv'
DELIMITER ','
CSV HEADER;

COPY dept_emp(emp_no, dept_no)
FROM '/Users/henrytirado/git/usc_homework/sql-challenge/EmployeeSQL/Data/dept_emp.csv'
DELIMITER ','
CSV HEADER;

COPY salaries(emp_no, salary)
FROM '/Users/henrytirado/git/usc_homework/sql-challenge/EmployeeSQL/Data/salaries.csv'
DELIMITER ','
CSV HEADER;