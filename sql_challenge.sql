-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "First Name", 
e.sex, s.salary as "Salary"
FROM employees as e 
JOIN salaries as s
ON e.emp_no=s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
FROM employees
WHERE extract(year from hire_date)=1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dm.dept_no as "Department Number", d.dept_name as "Department", dm.emp_no as "Manager", 
e.first_name as "First Name", e.last_name as "Last Name"
FROM dept_manager as dm
JOIN employees as e
ON dm.emp_no=e.emp_no
JOIN departments as d
ON dm.dept_no=d.dept_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no as "Department Number", de.emp_no as "Employee Name", 
e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department"
FROM dept_emp as de
JOIN employees as e
ON de.emp_no=e.emp_no
JOIN departments as d
ON de.dept_no=d.dept_no;


-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name as "First Name", last_name as "Last Name", sex
FROM employees
WHERE first_name = 'Hercules' AND LEFT(last_name, 1) = 'B';


-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT de.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name as "Frist Name"
FROM dept_emp as de
JOIN employees as e
ON de.emp_no=e.emp_no
JOIN departments as d
ON de.dept_no=d.dept_no
WHERE d.dept_name = 'Sales';


-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT d.dept_name as "Department Name", de.emp_no as "Employee Number",
e.last_name as "Last Name", e.first_name as "First Name"
FROM dept_emp as de
JOIN employees as e
ON de.emp_no=e.emp_no
JOIN departments as d
ON de.dept_no=d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name as "Last Name", count(last_name) as "Number of Employees"
FROM employees
GROUP BY last_name
ORDER BY "Number of Employees" DESC;