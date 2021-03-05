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
	
--List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
create view employee_Hercules as
select first_name, last_name, hire_date
from employees
where last_name like 'B%'
and first_name = 'Hercules';

--List all employees in the Sales department (d007), including their 
--employee number, last name, first name, and department name.
create view sales_employees as
select emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
from employees as emp
inner join dept_emp as demp
	on (emp.emp_no = demp.emp_no)
inner join departments as dep
	on (demp.dept_no = dep.dept_no)
	where dep.dept_no = 'd007';
	
	
--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.	
create view sales_dev as
select emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
from employees as emp
inner join dept_emp as demp
	on (emp.emp_no = demp.emp_no)
inner join departments as dep
	on (demp.dept_no = dep.dept_no)
	where dep.dept_no = 'd007'
	or dep.dept_no = 'd005';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
create view last_names as
SELECT last_name, count(last_name) as name_count
from employees
GROUP BY last_name
ORDER BY name_count DESC;
