/*
Question - 1
*/
SELECT
LEFT(first_name,3) AS FIRST_NAME
FROM
Employees


/*
Question - 2
*/
SELECT 
first_name,
CHARINDEX('a',first_name) AS [a_Position]
FROM
Employees

/*
Question - 3
*/
SELECT
EMPLOYEE_NAME,
DEPARTMENT
FROM
(SELECT
emp.emp_no,
CONCAT(emp.first_name,' ',emp.last_name) AS EMPLOYEE_NAME,
dep.dept_name AS DEPARTMENT,
SUM(sal.current_salary) AS SALARY,
DENSE_RANK()OVER(PARTITION BY dep.dept_name ORDER BY SUM(sal.current_salary) DESC) AS #ROW
FROM
Employees emp
INNER JOIN
Salary_History sal ON sal.emp_no = emp.emp_no
INNER JOIN Employee_Movements_History dep1 ON dep1.sid_Employee = emp.sid_Employee
INNER JOIN Departments dep ON dep.dept_no = dep1.dept_no
GROUP BY
emp.emp_no,
emp.first_name,
emp.last_name,
dep.dept_name)JACK
WHERE #ROW = 1

