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
left join employees e on dm.emp_no = e.emp_no


--select * from employees
--where emp_title = "m0001"

--select * from titles

