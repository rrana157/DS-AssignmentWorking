/*
Question-1
*/

SELECT
DISTINCT
first_name AS BEFORE_REPLACE_NAME,
REPLACE(first_name,'a','A') AS AFTER_REPLACE_NAME
FROM
Employees

/*
Question-2
*/

SELECT
emp.*,
dep.dept_name AS DEPARTMENT
FROM
Employees emp
INNER JOIN
Salary_History sal ON sal.emp_no = emp.emp_no
INNER JOIN Employee_Movements_History dep1 ON dep1.sid_Employee = emp.sid_Employee
INNER JOIN Departments dep ON dep.dept_no = dep1.dept_no
ORDER BY emp.first_name ASC, dep.dept_name DESC

/*
Question-3
*/
SELECT
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
WHERE SALARY = ( SELECT MAX(SALARY) FROM (SELECT emp.emp_no,CONCAT(emp.first_name,' ',emp.last_name) AS EMPLOYEE_NAME, SUM(sal.current_salary) AS SALARY
FROM Employees emp INNER JOIN Salary_History sal ON sal.emp_no = emp.emp_no
GROUP BY emp.emp_no, emp.first_name, emp.last_name)JACK)