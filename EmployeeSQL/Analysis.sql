--Data Analysis

--Employee Details
select e.emp_no, e.first_name, e.last_name, e.sex, s.salary from employees e
inner join salaries s on e.emp_no = s.emp_no;


--Employees Hired in 1986
select first_name, last_name, hire_date from employees
where hire_date between '1986-01-01' and '1986-12-31';


select first_name, last_name, hire_date from employees
where date_part('year', hire_date) = 1986 ;


--Manager of each department
select dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name from dept_manager dm
left join departments d on dm.dept_no = d.dept_no
left join employees e on dm.emp_no = e.emp_no;


-- List of Department of each Employee
select e.emp_no, e.last_name, e.first_name, d.dept_name from employees e
inner join dept_emp de on e.emp_no = de.emp_no
left join departments d on de.dept_no = d.dept_no;


--- People with First Name 'Hercules' and Last Name Starting with 'B'
select e.first_name, e.last_name, e.sex from employees e
where e.first_name = 'Hercules' and e.last_name like 'B%';


---All Employees in Sales Department
select de.emp_no, e.last_name, e.first_name, d.dept_name from dept_emp de
left join departments d on de.dept_no = d.dept_no
left join employees e on de.emp_no = e.emp_no
where d.dept_name = 'Sales'
 
 
---All Employees in Sales and Development Departments
select de.emp_no, e.last_name, e.first_name, d.dept_name from dept_emp de
left join departments d on de.dept_no = d.dept_no
left join employees e on de.emp_no = e.emp_no
where d.dept_name in ('Sales','Development');



---Frequence of Employee Last Names
select last_name, count(last_name) as "frequency" from employees
group by last_name
order by "frequency" desc;