-- Source: https://leetcode.com/problems/primary-department-for-each-employee/description/?envType=study-plan-v2&envId=top-sql-50

-- Table: Employee

-- +---------------+---------+
-- | Column Name   |  Type   |
-- +---------------+---------+
-- | employee_id   | int     |
-- | department_id | int     |
-- | primary_flag  | varchar |
-- +---------------+---------+
-- (employee_id, department_id) is the primary key (combination of columns with unique values) for this table.
-- employee_id is the id of the employee.
-- department_id is the id of the department to which the employee belongs.
-- primary_flag is an ENUM (category) of type ('Y', 'N'). If the flag is 'Y', the department is the primary department for the employee. If the flag is 'N', the department is not the primary.

-- Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. Note that when an employee belongs to only one department, their primary column is 'N'.

-- Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.

-- Return the result table in any order.

------------------------------------------------------------------------------

-- SQL Schema

Create table If Not Exists Employee (employee_id int, department_id int, primary_flag ENUM('Y','N'))
Truncate table Employee
insert into Employee (employee_id, department_id, primary_flag) values ('1', '1', 'N')
insert into Employee (employee_id, department_id, primary_flag) values ('2', '1', 'Y')
insert into Employee (employee_id, department_id, primary_flag) values ('2', '2', 'N')
insert into Employee (employee_id, department_id, primary_flag) values ('3', '3', 'N')
insert into Employee (employee_id, department_id, primary_flag) values ('4', '2', 'N')
insert into Employee (employee_id, department_id, primary_flag) values ('4', '3', 'Y')
insert into Employee (employee_id, department_id, primary_flag) values ('4', '4', 'N')

-- MS SQL Server Code

SELECT employee_id, department_id
FROM Employee e
WHERE employee_id IN (
    SELECT employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING count(distinct department_id) = 1
) OR primary_flag = "Y"
