-- 1.Write a SQL query to display employee ID ,first name, last name,  and department name
-- for employee who belong to a department
SELECT employees.EmployeeID,
	   employees.FirstName,employees.LastName,
       departments.DepartmentName
FROM employees
INNER JOIN departments
ON employees.DepartmentID=departments.DepartmentID ;

-- 2.Write a SQL query to display employee ID , first name ,and salary for employees
-- who have salary record
SELECT employees.EmployeeID,employees.FirstName,salaries.Salary
FROM employees
INNER JOIN salaries 
ON employees.EmployeeID=salaries.EmployeeID ;

-- or another approach
SELECT e.EmployeeID,e.FirstName,s.Salary
FROM employees e
INNER JOIN salaries s
ON e.EmployeeID=s.EmployeeID ;

-- 3.Write a SQL query to diplay employeeID , firstname & departmentName for all employees
-- even if they belong to any department
SELECT e.EmployeeID,e.FirstName,d.DepartmentName
FROM employees e
LEFT JOIN departments d
ON e.DepartmentID=d.DepartmentID ;
 
 -- 4.Write a SQL query to display all departments along with employees working
 -- in them departments without employees should also appear
 SELECT e.EmployeeID,e.FirstName,d.DepartmentName
 FROM employees e
 RIGHT JOIN departments d
 ON d.DepartmentID=e.DepartmentID ;
 -- using LEFT JOIN
 SELECT e.EmployeeID,e.FirstName,d.DepartmentName
 FROM departments d
 LEFT JOIN employees e
 ON d.DepartmentID=e.DepartmentID ;
 
 -- 5.Write a SQL Query to display employeeID,firstName,departmentName, and salary for 
 -- employee who have both department & salary information
 SELECT e.EmployeeID,e.FirstName,d.DepartmentName,s.Salary
 FROM employees e
 INNER JOIN departments d
 ON e.DepartmentID=d.DepartmentID
 INNER JOIN salaries s
 ON e.EmployeeID=s.EmployeeID ;
 
 -- 6. Write a SQL query to display all employees and their salary.
-- Employees without salary should also appear.
SELECT e.EmployeeID,e.FirstName,s.Salary
FROM employees e
LEFT JOIN salaries s
ON e.EmployeeID=s.EmployeeID ;

-- 7. Write a SQL query to display employees who do not have a salary record.
SELECT e.EmployeeID,e.FirstName,s.Salary
FROM employees e
LEFT JOIN salaries s
ON e.EmployeeID=s.EmployeeID 
WHERE s.EmployeeID IS NULL ;

-- 8. Write a SQL query to display all departments and employees working in them.
-- Departments with no employees should also be displayed.
SELECT e.EmployeeID,e.FirstName,d.DepartmentName
FROM departments d
LEFT JOIN employees e
ON e.DepartmentID=d.DepartmentID ;

-- 9.Write a SQL query using UNION to combine
-- the FirstName of employees and the DepartmentName from departments.
SELECT FirstName AS Name
FROM employees
UNION
SELECT DepartmentName AS Name
FROM departments;

--  10.Write a SQL query using UNION ALL to combine
-- the FirstName of employees and DepartmentName
SELECT FirstName AS Name
FROM employees
UNION ALL
SELECT DepartmentName AS Name
FROM departments;

--  11.Write a SQL query to display EmployeeID from employees
-- and EmployeeID from salaries using UNION.
SELECT EmployeeID AS ID
FROM employees
UNION 
SELECT EmployeeID AS ID
FROM salaries ;

-- 12.Write a SQL query to find employees who appear
-- in both employees and salaries tables (common EmployeeID)
SELECT e.EmployeeID,s.Salary
FROM employees e
INNER JOIN salaries s
ON e.EmployeeID=s.EmployeeID ;

-- 13.Write a SQL query to generate all possible combinations of employees and departments
SELECT e.EmployeeID,e.FirstName,e.LastName,d.DepartmentName
FROM employees e
CROSS JOIN departments d ;

-- 14.Write a SQL query using self join to display Pairs of employees 
-- who work in the same department
SELECT e1.FirstName,e2.FirstName,e1.DepartmentID
FROM employees e1
JOIN employees e2
ON e1.DepartmentID=e2.DepartmentID
AND e2.EmployeeID>e1.EmployeeID ;