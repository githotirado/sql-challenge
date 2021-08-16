-- Select the employee number, last name, first name, sex, and salary of all employees, ordered by employee number
select
	e.emp_no
	, e.last_name
	, e.first_name
	, e.sex
	, s.salary
from employees e
join salaries s on e.emp_no = s.emp_no
order by emp_no;

-- Select the first name, last name, and hiring date for all employees hired in 1986 
select
	e.first_name
	, e.last_name
	, e.hire_date
from employees e
where
	e.hire_date like '%1986';

-- Select the department number, department name, employee number, last name, and first name of all managers of each department
select
	ds.dept_no
	, ds.dept_name
	, e.emp_no
	, e.last_name
	, e.first_name
	, t.title
from
	departments ds
	left join dept_manager dm on ds.dept_no = dm.dept_no
	left join employees e on e.emp_no = dm.emp_no
	left join titles t  on e.emp_title_id = t.title_id
order by dept_no;

-- Select the employee number, last name, first name, and department of each employee, ordered by employee number
select
    e.emp_no
	, e.last_name
	, e.first_name
	, d.dept_name
from
	employees e
	left join dept_emp de on e.emp_no = de.emp_no
	left join departments d on de.dept_no = d.dept_no
order by e.emp_no;

-- Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B"
select
	e.first_name
	, e.last_name
	, e.birth_date
	, e.sex
from employees e
where e.first_name = 'Hercules'
and e.last_name like 'B%'

-- Select employee number, last name, first name, and department name of all employees in the Sales department, ordered by employee number
select
	e.emp_no
	, e.last_name
	, e.first_name
	, d.dept_name
from 
	employees e
	left join dept_emp de on e.emp_no = de.emp_no
	left join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales'
order by e.emp_no;

-- Select employee number, last name, first name, and department name of all employees in the 'Sales' OR the 'Development' department, ordered by employee number
select
	e.emp_no
	, e.last_name
	, e.first_name
	, d.dept_name
from
	employees e
	left join dept_emp de on e.emp_no = de.emp_no
	left join departments d on de.dept_no = d.dept_no
where
	d.dept_name in ('Sales', 'Development')
order by e.emp_no;
	

-- Count the number of employees, grouped by last name
select
	e.last_name
	, count(e.last_name) emp_count
from employees e
group by e.last_name
order by e.last_name;
