-- List the employee number, last name, first name, sex, and salary of each employee.
select emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.sex,
	sal.salary
from employees as emp
	left join salaries as sal
		on (emp.emp_no = sal.emp_no);

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select emp.first_name,
	emp.last_name,
	emp.hire_date
from employees as emp
where hire_date >= '01-01-1986'
	and hire_date <= '12-31-1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
select deptman.dept_no,
	dept.dept_name,
	deptman.emp_no,
	emp.last_name,
	emp.first_name
from dept_manager as deptman
	inner join departments as dept
		on (deptman.dept_no = dept.dept_no)
	inner join employees as emp
		on (deptman.emp_no = emp.emp_no);

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select deptemp.dept_no,
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
from employees as emp
	inner join dept_emp as deptemp
		on (emp.emp_no = deptemp.emp_no)
	inner join departments as dept
		on (deptemp.dept_no = dept.dept_no);

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select emp.first_name,
	emp.last_name,
	emp.sex
from employees as emp
	where first_name = 'Hercules'
		and last_name like '%B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
select emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
from employees as emp
	inner join dept_emp as deptemp
		on (emp.emp_no = deptemp.emp_no)
	inner join departments as dept
		on (deptemp.dept_no = dept.dept_no)
where dept.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
from employees as emp
	inner join dept_emp as deptemp
		on (emp.emp_no = deptemp.emp_no)
	inner join departments as dept
		on (deptemp.dept_no = dept.dept_no)
where dept.dept_name = 'Sales'
or dept.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name)
from employees
group by last_name
order by count (last_name) desc;