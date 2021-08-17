-- Select the employee number, last name, first name, sex, and salary of all employees, ordered by employee number
SELECT
	e.emp_no employee_number
	, e.last_name
	, e.first_name
	, e.sex
	, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- Select the first name, last name, and hiring date for all employees hired in 1986 
SELECT
	e.first_name
	, e.last_name
	, e.hire_date
FROM employees e
WHERE
	EXTRACT(year from e.hire_date) = 1986;

-- Select the department number, department name, employee number, last name, and first name of all managers of each department
SELECT
	ds.dept_no dept_number
	, ds.dept_name
	, e.emp_no empl_number
	, e.last_name
	, e.first_name
-- 	, t.title
FROM
	departments ds
	LEFT JOIN dept_manager dm ON ds.dept_no = dm.dept_no
	LEFT JOIN employees e ON e.emp_no = dm.emp_no
	LEFT JOIN titles t  ON e.emp_title_id = t.title_id
ORDER BY dept_number;

-- Select the employee number, last name, first name, and department of each employee, ordered by employee number
SELECT
    e.emp_no empl_number
	, e.last_name
	, e.first_name
	, d.dept_name
FROM
	employees e
	LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
	LEFT JOIN departments d ON de.dept_no = d.dept_no
ORDER BY empl_number;

-- Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B"
SELECT
	e.first_name
	, e.last_name
	, e.birth_date
	, e.sex
FROM employees e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

-- Select employee number, last name, first name, and department name of all employees in the Sales department, ordered by employee number
SELECT
	e.emp_no empl_number
	, e.last_name
	, e.first_name
	, d.dept_name
FROM 
	employees e
	LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
	LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY empl_number;

-- Select employee number, last name, first name, and department name of all employees in the 'Sales' OR the 'Development' department, ordered by employee number
SELECT
	e.emp_no empl_number
	, e.last_name
	, e.first_name
	, d.dept_name
FROM
	employees e
	LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
	LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE
	d.dept_name IN ('Sales', 'Development')
ORDER BY empl_number;
	
-- Count the number of employees, grouped by last name
SELECT
	e.last_name
	, COUNT(e.last_name) emp_count
FROM employees e
GROUP BY e.last_name
ORDER BY emp_count DESC;

-- (Bonus) Find my employee number 499942
SELECT
	e.first_name
	, e.last_name
FROM
	employees e
WHERE
	e.emp_no = 499942;
