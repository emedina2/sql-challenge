--List the following details of each employee: 
--employee number, last name, first name, sex, and salary.

create view employee_info_1986 as
select emp.last_name, emp.first_name, emp.sex, sal.salary
from employees as emp
join salaries as sal
	on (emp.emp_no = sal.emp_no);
	
--List first name, last name, and hire date for employees who were hired in 1986.
create view employee_info_1986 as
select first_name, last_name, hire_date
from employees
where hire_date like '%1986';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
create view managers as
select man.dept_no, dep.dept_name, man.emp_no, emp.last_name, emp.first_name
from employees as emp
inner join dept_manager as man
	on (emp.emp_no = man.emp_no)
inner join departments as dep
	on (man.dept_no = dep.dept_no);
	
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
create view departments2 as
select emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
from employees as emp
inner join dept_emp as de
	on (emp.emp_no = de.emp_no)
inner join departments as dep
	on (de.dept_no = dep.dept_no);