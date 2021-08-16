drop table if exists titles;

-- Create the titles table, with a primary id and a title
create table titles(
	title_id char(5) primary key,
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
drop table if exists employees;
create table employees(
	emp_no int primary key
	, emp_title_id char(5) references titles
	, birth_date char(10)
	, first_name varchar
	, last_name varchar
	, sex char(1)
	, hire_date char(10)
);

-- Create an departments table, with the following: 
--    department number, 
--    department name
-- set the primary key relationships accordingly
drop table if exists departments;
create table departments(
	dept_no char(4) primary key
	, dept_name varchar(20)
);

-- Create an dept_manager table, with the following: 
--    department number, 
--    employee number
-- set the foreign key and primary key relationships accordingly
drop table if exists dept_manager;
create table dept_manager(
	dept_no char(4) references departments
	, emp_no int references employees
);

-- Create an dept_emp table, with the following: 
--    department number, 
--    employee number
-- set the foreign key and primary key relationships accordingly
drop table if exists dept_emp;
create table dept_emp(
	emp_no int references employees
	, dept_no char(4) references departments
);

-- Create an salaries table, with the following: 
--    salary 
--    employee number
-- set the foreign key and primary key relationships accordingly
drop table if exists salaries;
create table salaries(
	emp_no int references employees
	, salary int
);
