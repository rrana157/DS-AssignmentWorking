/*
Question-1
*/

SELECT
RTRIM(first_name) AS FIRST_NAME
FROM
Employees

/*
Question-2
*/

SELECT
DISTINCT
dep.dept_name AS DEPARTMENT,
LEN(dep.dept_name) AS DEP_LENGTH
FROM
Employees emp
INNER JOIN
Salary_History sal ON sal.emp_no = emp.emp_no
INNER JOIN Employee_Movements_History dep1 ON dep1.sid_Employee = emp.sid_Employee
INNER JOIN Departments dep ON dep.dept_no = dep1.dept_no

/*
Question-3
*/

SELECT
TOP 5
EMPLOYEE_NAME,
SALARY
FROM
(SELECT
emp.emp_no,
CONCAT(emp.first_name,' ',emp.last_name) AS EMPLOYEE_NAME,
SUM(sal.current_salary) AS SALARY
FROM
Employees emp
INNER JOIN
Salary_History sal ON sal.emp_no = emp.emp_no
GROUP BY
emp.emp_no,
emp.first_name,
emp.last_name)JACK
ORDER BY 
SALARY DESC


