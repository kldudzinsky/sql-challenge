--Data Analysis 
--create employee table
Create table "Homework".employees (emp_num= varchar, 
								   emp_title_num varchar(100), 
								   birth_date date, first_name varchar, last_name varchar, sex varchar, hire_date date );
select * from "Homework".employees;
ALTER TABLE "Homework".employees
RENAME COLUMN emp_num TO emp_no;

--1. list employee number, last name, first name, sex and salary
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Homework".employees As e
INNER JOIN "Homework".salaries As s
on e.emp_no=s.emp_no; 

--2. list first name, last, hire date for employees who were hired in 1986
select first_name, last_name, hire_date from "Homework".employees where 
hire_date >= '1/1/1986' and hire_date < '1/1/1987';
--ALTERATIONS
ALTER TABLE "Homework".departments
RENAME COLUMN dept_num TO dept_no;
ALTER TABLE "Homework".dept_manager
Rename column emp_no to emp_no1;
ALTER TABLE "Homework".dept_manager ADD emp_no int;
UPDATE "Homework".dept_manager SET emp_no = CAST(emp_no1 AS int);
ALTER TABLE "Homework".dept_manager DROP COLUMN emp_no1;
--
ALTER TABLE "Homework".employees Rename column emp_no to emp_no1;
ALTER TABLE "Homework".employees ADD emp_no int;
UPDATE "Homework".employees SET emp_no = CAST(emp_no1 AS int);
ALTER TABLE "Homework".employees DROP COLUMN emp_no1;
--
Create table "Homework".dept_emp (emp_no INT, 
								   dept_no VARCHAR); 

--3. List manager of each dept with dept no, dept name, manager employer number, first and last name
select * from "Homework".dept_manager;
select * from "Homework".employees;
select* from "Homework".departments;
select * from "Homework".dept_emp;

select d.dept_name, dm.dept_no, dm.emp_no, e.first_name, e.last_name
from "Homework".employees as e 
INNEr Join "Homework".dept_manager as dm 
on e.emp_no= dm.emp_no
INNER JOIN "Homework".departments as d
on d.dept_no = dm.dept_no;
--4. List dept of each emp with: employe number, last name, firstname, dept name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from "Homework".employees as e
INNER Join "Homework".dept_emp as de 
on e.emp_no= de.emp_no
INNER JOIN "Homework".departments as d
on d.dept_no = de.dept_no;
--5. list first,last name and sex for employees who first name is "hercules" and last begins with b
select e.first_name, e.last_name, e.sex 
from "Homework".employees as e 
where e.first_name = 'Hercules' and e.last_name LIKE'B%';
--6. list all employees in sales dept: including emp no, last and first name and dept name
--sales dept_no=d006
select e.emp_no, e.last_name, e.first_name, d.dept_name
from "Homework".employees as e
INNER Join "Homework".dept_emp as de 
on e.emp_no= de.emp_no
INNER JOIN "Homework".departments as d
on d.dept_no = de.dept_no 
where d.dept_no = 'd007';
--7 list all in sales and dev dept including emp no, first and last name and dept name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from "Homework".employees as e
INNER Join "Homework".dept_emp as de 
on e.emp_no= de.emp_no
INNER JOIN "Homework".departments as d
on d.dept_no = de.dept_no 
where d.dept_no = 'd007' or d.dept_no = 'd005';
--8 in desc order, list freq count of employee last name (how many employee share last name)
SELECT COUNT(e.last_name), e.last_name
FROM "Homework".employees as e
GROUP BY e.last_name
ORDER BY e.last_name;