
--1. list detailed information of each employee #
SELECT employees.emp_no, last_name, first_name, gender, salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no
--2.employess who were hired in 1996
SELECT emp_no, last_name, first_name, hire_date 
FROM employees 
WHERE hire_date like '%1996%'

--3.manager of each department and detailed infor
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name   
employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM employees
JOIN dept_manager
ON dept_manager.emp_no = employees.emp_no
JOIN departments
ON departments.dept_no = dept_manager.dept_no


--4. the department of each employee and
--5. all the employess whose first name is "Hercules" and last name begins with "B"
SELECT emp_no, last_name, first_name 
FROM employees
WHERE last_name like 'B%'
AND first_name = 'Hercules'
--6. all employees in sales's department including emp_no, last_name, first_name and department name
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name 
FROM employees 
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
on departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
--7.list all emplyees in the sales and development department
SELECT employees.emp_no, employees. last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
on departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'or departments.dept_name = 'Development'

--8. desending order of employee's sharing last name
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
