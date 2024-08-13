-- table one
create table titles(
	title_id varchar primary key not null,
	title varchar not null
);

-- table two
create table employees(
	emp_no int primary key not null,
	emp_title_id varchar not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar not null,
	hire_date date not null
);

-- table three
create table departments(
	dept_no varchar primary key not null,
	dept_name varchar not null
);

create table dept_emp (
	emp_no int not null,
	dept_no varchar not null,
	foreign key (dept_no) references departments (dept_no),
	foreign key (emp_no) references employees (emp_no)
);

create table dept_manager(
	dept_no varchar not null,
	emp_no int not null,
	primary key (dept_no, emp_no),
	foreign key (emp_no) references employees (emp_no),
	foreign key (dept_no) references departments (dept_no)
);

create table titles(
	title_id varchar not null,
	title varchar not null
	foreign key title_id references employees (emp_title_id)
);

create table salaries(
	emp_no int not null,
	salary int not null,
	foreign key (emp_no) references employees (emp_no),
	primary key (emp_no)
);

select * from departments
select * from dept_emp
select * from dept_manager
select * from employees
select * from salaries
select * from titles
