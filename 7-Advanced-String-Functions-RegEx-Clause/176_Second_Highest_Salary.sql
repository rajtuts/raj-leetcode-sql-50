-- Source: https://leetcode.com/problems/second-highest-salary/description/?envType=study-plan-v2&envId=top-sql-50

-- Table: Employee

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains information about the salary of an employee.

-- Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

-- The result format is in the following example.

-- Example 1:

-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+
-- Example 2:

-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- +----+--------+
-- Output: 
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | null                |
-- +---------------------+

------------------------------------------------------------------------------

-- SQL Schema

Create table If Not Exists Employee (id int, salary int)
Truncate table Employee
insert into Employee (id, salary) values ('1', '100')
insert into Employee (id, salary) values ('2', '200')
insert into Employee (id, salary) values ('3', '300')

-- MS SQL Server Code

SELECT (
    SELECT DISTINCT salary
     FROM Employee
     ORDER BY salary DESC
     OFFSET 1 ROW
     FETCH NEXT 1 ROW ONLY
) AS SecondHighestSalary;

-- ORACLE ---
Solution 1:

Select max(Salary) from Employee
    where salary < (select max(SALARY) from EMPLOYEE)

Solution 2:

/* Write your PL/SQL query statement below */
with final as (
  select 
    salary, dense_rank() OVER (ORDER BY salary desc) rn
  from Employee
),
secondH as (
  select rowNum, salary from final where rn = 2
)
select 
  (select salary from secondH where rowNum = 1) as SecondHighestSalary
from dual

Solution 3:
select max(SecondHighestSalary) as SecondHighestSalary from(
select salary as SecondHighestSalary,dense_rank() over(order by salary desc) as rank from Employee
order by salary desc
)
where rank=2

Solution 4:
select emp.salary as SecondHighestSalary
from (select 2 as id from dual) d 
left join (select salary, row_number() over (order by salary desc) seqnum from employee group by salary) emp 
on d.id = emp.seqnum

Solution 5:
/* Write your PL/SQL query statement below */
select max(salary) as SecondHighestSalary  from(
    select salary, dense_rank() over(order by salary desc) as rn from Employee
)
where rn=2

