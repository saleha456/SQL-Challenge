---Data Analysis----

---Employee Details
SELECT 	e.emp_no, 
		e.first_name, 
		e.last_name,
		e.sex, 
		s.salary 
FROM employees e
INNER JOIN salaries s on e.emp_no = s.emp_no;


---Employees Hired in 1986
SELECT 	first_name, 
		last_name, 
		hire_date 
FROM employees
WHERE date_part('year', hire_date) = 1986 ;


--Manager of each department
SELECT 	dm.dept_no, 
		d.dept_name, 
		dm.emp_no, 
		e.first_name, 
		e.last_name 
FROM dept_manager dm
LEFT JOIN departments d on dm.dept_no = d.dept_no
LEFT JOIN employees e on dm.emp_no = e.emp_no;


-- List of Department of each Employee
SELECT 	e.emp_no, 
		e.last_name, 
		e.first_name, 
		d.dept_name 
FROM employees e
INNER JOIN dept_emp de on e.emp_no = de.emp_no
LEFT JOIN departments d on de.dept_no = d.dept_no;


--- People with First Name 'Hercules' and Last Name Starting with 'B'
SELECT 	e.first_name, 
		e.last_name, 
		e.sex 
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name like 'B%';


---All Employees in Sales Department
SELECT	de.emp_no, 
		e.last_name, 
		e.first_name, 
		d.dept_name 
FROM dept_emp de
LEFT JOIN departments d on de.dept_no = d.dept_no
LEFT JOIN employees e on de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'
 
 
---All Employees in Sales and Development Departments
SELECT	de.emp_no, 
		e.last_name, 
		e.first_name, 
		d.dept_name 
FROM dept_emp de
LEFT JOIN departments d on de.dept_no = d.dept_no
LEFT JOIN employees e on de.emp_no = e.emp_no
WHERE d.dept_name in ('Sales','Development');



---Frequence of Employee Last Names
SELECT 	last_name, 
		count(last_name) as "frequency" 
FROM employees
GROUP BY last_name
ORDER BY "frequency" desc;
