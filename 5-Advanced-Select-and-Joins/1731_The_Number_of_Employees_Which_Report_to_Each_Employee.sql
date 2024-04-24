-- Source: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/?envType=study-plan-v2&envId=top-sql-50

-- Table: Employees

-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | employee_id | int      |
-- | name        | varchar  |
-- | reports_to  | int      |
-- | age         | int      |
-- +-------------+----------+
-- employee_id is the primary key for this table.
-- This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null). 

-- For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

-- Write an SQL query to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

-- Return the result table ordered by employee_id.

------------------------------------------------------------------------------

-- SQL Schema

Create table If Not Exists Employees(employee_id int, name varchar(20), reports_to int, age int)
Truncate table Employees
insert into Employees (employee_id, name, reports_to, age) values ('9', 'Hercy', 'None', '43')
insert into Employees (employee_id, name, reports_to, age) values ('6', 'Alice', '9', '41')
insert into Employees (employee_id, name, reports_to, age) values ('4', 'Bob', '9', '36')
insert into Employees (employee_id, name, reports_to, age) values ('2', 'Winston', 'None', '37')

-- MS SQL Server Code

SELECT e.employee_id, e.name, COUNT(*) AS 'reports_count', ROUND(CAST(SUM(m.age) AS FLOAT)/COUNT(*),0) AS 'average_age'
FROM Employees e
JOIN Employees m
ON e.employee_id = m.reports_to
GROUP BY e.employee_id, e.name
ORDER BY e.employee_id
