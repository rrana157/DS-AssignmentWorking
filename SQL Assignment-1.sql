/*
Question-1
*/
SELECT
first_name AS WORKER_NAME 
FROM 
Employees


/*
Question-2
*/
SELECT
DISTINCT
dept_name AS DEPARTMENT
FROM
Departments

/*
Question-3
*/

SELECT 
TOP 5 *
FROM
Employees
ORDER BY sid_Employee DESC