## 175\. Combine Two Tables | Easy | [LeetCode](https://leetcode.com/problems/combine-two-tables/)

Table: `Person`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

PersonId is the primary key column for this table.
```

Table: `Address`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

AddressId is the primary key column for this table.
```

Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for each of those people:

```undefined
FirstName, LastName, City, State
```

### Solution

```sql
SELECT p.FirstName, p.LastName, a.City, a.State

ON p.PersonId = a.PersonId;
```

## 176\. Second Highest Salary | Easy | [LeetCode](https://leetcode.com/problems/second-highest-salary/)

Write a SQL query to get the second highest salary from the `Employee` table.

For example, given the above Employee table, the query should return `200` as the second highest salary. If there is no second highest salary, then the query should return `null`.

### Solution

```sql
SELECT Max(Salary) SecondHighestSalary

FROM Employee WHERE Salary < (SELECT MAX(Salary) FROM Employee)

WITH CTE AS (SELECT DISTINCT Salary

SELECT Salary as SecondHighestSalary

           DENSE_RANK() OVER (ORDER BY Salary DESC) AS DENSERANK

SELECT Salary SecondHighestSalary
```

## 177\. Nth Highest Salary | Medium | [LeetCode](https://leetcode.com/problems/nth-highest-salary/)

Write a SQL query to get the nth highest salary from the Employee table.

For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

```undefined
+------------------------+

| getNthHighestSalary(2) |

+------------------------+

+------------------------+
```

### Solution

```sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT

        SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC
```

## 178\. Rank Scores | Medium | [LeetCode](https://leetcode.com/problems/rank-scores/)

Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.

For example, given the above `Scores` table, your query should generate the following report (order by highest score):

**Important Note:** For MySQL solutions, to escape reserved words used as column names, you can use an apostrophe before and after the keyword. For example `Rank`.

### Solution

```sql
SELECT score, DENSE_RANK() OVER (ORDER By Score DESC) AS "Rank"
```

## 180\. Consecutive Numbers | Medium | [LeetCode](https://leetcode.com/problems/consecutive-numbers/)

Table: `Logs`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

id is the primary key for this table.
```

Write an SQL query to find all numbers that appear at least three times consecutively.

Return the result table in any order.

The query result format is in the following example:

```undefined
1 is the only number that appears consecutively for at least three times.
```

### Solution

```sql
SELECT a.Num as ConsecutiveNums

ON a.id = b.id+1 AND a.num = b.num

ON a.id = c.id+2 AND a.num = c.num;
```

## 181\. Employees Earning More Than Their Managers | Easy | [LeetCode](https://leetcode.com/problems/employees-earning-more-than-their-managers/)

The `Employee` table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

```undefined
+----+-------+--------+-----------+

| Id | Name  | Salary | ManagerId |

+----+-------+--------+-----------+

| 2  | Henry | 80000  | 4         |

| 3  | Sam   | 60000  | NULL      |

| 4  | Max   | 90000  | NULL      |

+----+-------+--------+-----------+
```

Given the `Employee` table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.

### Solution

```sql
SELECT E.Name as "Employee"
```

## 182\. Duplicate Emails | Easy | [LeetCode](https://leetcode.com/problems/duplicate-emails/)

Write a SQL query to find all duplicate emails in a table named `Person`.

For example, your query should return the following for the above table:

**Note:** All emails are in lowercase.

### Solution

```sql
SELECT Email, ROW_NUMBER() OVER(PARTITION BY Email ORDER BY Email) AS RN
```

## 183\. Customers Who Never Order | Easy | [LeetCode](https://leetcode.com/problems/customers-who-never-order/)

Suppose that a website contains two tables, the `Customers` table and the `Orders` table. Write a SQL query to find all customers who never order anything.

Table: `Customers`.

Table: `Orders`.

Using the above tables as example, return the following:

### Solution

```sql
ON Customers.Id = Orders.CustomerId

WHERE CustomerId IS NULL;
```

## 184\. Department Highest Salary | Medium | [LeetCode](https://leetcode.com/problems/department-highest-salary/)

The `Employee` table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.

```undefined
+----+-------+--------+--------------+

| Id | Name  | Salary | DepartmentId |

+----+-------+--------+--------------+

| 3  | Henry | 80000  | 2            |

+----+-------+--------+--------------+
```

The `Department` table holds all departments of the company.

Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, your SQL query should return the following rows (order of rows does not matter).

```undefined
+------------+----------+--------+

| Department | Employee | Salary |

+------------+----------+--------+

| Sales      | Henry    | 80000  |

+------------+----------+--------+
```

**_Explanation:_**  
Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.

### Solution

```sql
SELECT Department.Name AS Department, Employee.Name AS Employee, Salary

ON Employee.DepartmentId = Department.Id

WHERE (DepartmentId, Salary) IN(

        SELECT  DepartmentId, MAX(Salary) AS Salary
```

## 185\. Department Top Three Salaries | Hard | [LeetCode](https://leetcode.com/problems/department-top-three-salaries/)

The `Employee` table holds all employees. Every employee has an Id, and there is also a column for the department Id.

```undefined
+----+-------+--------+--------------+

| Id | Name` | Salary | DepartmentId |

+----+-------+--------+--------------+

| 2  | Henry | 80000  | 2            |

| 5  | Janet | 69000  | 1            |

| 6  | Randy | 85000  | 1            |

+----+-------+--------+--------------+
```

The `Department` table holds all departments of the company.

Write a SQL query to find employees who earn the top three salaries in each of the department. For the above tables, your SQL query should return the following rows (order of rows does not matter).

```undefined
+------------+----------+--------+

| Department | Employee | Salary |

+------------+----------+--------+

| Sales      | Henry    | 80000  |

+------------+----------+--------+
```

**_Explanation:_**  
In IT department, Max earns the highest salary, both Randy and Joe earn the second highest salary, and Will earns the third highest salary. There are only two employees in the Sales department, Henry earns the highest salary while Sam earns the second highest salary.

### Solution

```sql
WITH department_ranking AS (

SELECT Name AS Employee, Salary ,DepartmentId

  ,DENSE_RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) AS rnk

SELECT d.Name AS Department, r.Employee, r.Salary

FROM department_ranking AS r

ORDER BY d.Name ASC, r.Salary DESC;
```

## 196\. Delete Duplicate Emails | Easy | [LeetCode](https://leetcode.com/problems/delete-duplicate-emails/)

Write a SQL query to delete all duplicate email entries in a table named `Person`, keeping only unique emails based on its smallest Id.

```undefined
+----+------------------+

+----+------------------+

+----+------------------+
```

Id is the primary key column for this table. For example, after running your query, the above `Person` table should have the following rows:

```undefined
+----+------------------+

+----+------------------+

+----+------------------+
```

**Note:**  
Your output is the whole `Person` table after executing your sql. Use `delete` statement.

### Solution

## 197\. Rising Temperature | Easy | [LeetCode](https://leetcode.com/problems/rising-temperature/)

Table: `Weather`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

id is the primary key for this table.

This table contains information about the temperature in a certain day.
```

Write an SQL query to find all dates' `id` with higher temperature compared to its previous dates (yesterday).

Return the result table in any order.

The query result format is in the following example:

```undefined
+----+------------+-------------+

| id | recordDate | Temperature |

+----+------------+-------------+

+----+------------+-------------+

In 2015-01-02, temperature was higher than the previous day (10 -> 25).

In 2015-01-04, temperature was higher than the previous day (20 -> 30).
```

### Solution

```sql
FROM Weather AS t, Weather AS y

WHERE DATEDIFF(t.RecordDate, y.RecordDate) = 1

AND t.Temperature > y.Temperature;

ON DATEDIFF(t.recordDate, y.recordDate) = 1 AND

t.temperature > y.temperature;
```

## 262\. Trips and Users | Hard | [LeetCode](https://leetcode.com/problems/trips-and-users/)

Table: `Trips`

```undefined
+-------------+----------+

+-------------+----------+

+-------------+----------+

Id is the primary key for this table.

The table holds all taxi trips. Each trip has a unique Id, while Client_Id and Driver_Id are foreign keys to the Users_Id at the Users table.

Status is an ENUM type of (‘completed’, ‘cancelled_by_driver’, ‘cancelled_by_client’).
```

Table: `Users`

```undefined
+-------------+----------+

+-------------+----------+

+-------------+----------+

Users_Id is the primary key for this table.

The table holds all users. Each user has a unique Users_Id, and Role is an ENUM type of (‘client’, ‘driver’, ‘partner’).

Status is an ENUM type of (‘Yes’, ‘No’).
```

Write a SQL query to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between `"2013-10-01"` and `"2013-10-03"`.

The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

Return the result table in any order. Round `Cancellation Rate` to two decimal points.

The query result format is in the following example:

```undefined
+----+-----------+-----------+---------+---------------------+------------+

| Id | Client_Id | Driver_Id | City_Id | Status              | Request_at |

+----+-----------+-----------+---------+---------------------+------------+

| 1  | 1         | 10        | 1       | completed           | 2013-10-01 |

| 2  | 2         | 11        | 1       | cancelled_by_driver | 2013-10-01 |

| 3  | 3         | 12        | 6       | completed           | 2013-10-01 |

| 4  | 4         | 13        | 6       | cancelled_by_client | 2013-10-01 |

| 5  | 1         | 10        | 1       | completed           | 2013-10-02 |

| 6  | 2         | 11        | 6       | completed           | 2013-10-02 |

| 7  | 3         | 12        | 6       | completed           | 2013-10-02 |

| 8  | 2         | 12        | 12      | completed           | 2013-10-03 |

| 9  | 3         | 10        | 12      | completed           | 2013-10-03 |

| 10 | 4         | 13        | 12      | cancelled_by_driver | 2013-10-03 |

+----+-----------+-----------+---------+---------------------+------------+

+----------+--------+--------+

| Users_Id | Banned | Role   |

+----------+--------+--------+

+----------+--------+--------+

+------------+-------------------+

| Day        | Cancellation Rate |

+------------+-------------------+

+------------+-------------------+

- There were 4 requests in total, 2 of which were canceled.

- However, the request with Id=2 was made by a banned client (User_Id=2), so it is ignored in the calculation.

- Hence there are 3 unbanned requests in total, 1 of which was canceled.

- The Cancellation Rate is (1 / 3) = 0.33

- There were 3 requests in total, 0 of which were canceled.

- The request with Id=6 was made by a banned client, so it is ignored.

- Hence there are 2 unbanned requests in total, 0 of which were canceled.

- The Cancellation Rate is (0 / 2) = 0.00

- There were 3 requests in total, 1 of which was canceled.

- The request with Id=8 was made by a banned client, so it is ignored.

- Hence there are 2 unbanned request in total, 1 of which were canceled.

- The Cancellation Rate is (1 / 2) = 0.50
```

### Solution

```sql
SELECT Request_at AS Day,

ROUND(SUM(IF(Status<>"completed", 1, 0))/COUNT(Status),2) AS "Cancellation Rate"

WHERE Request_at BETWEEN "2013-10-01" AND "2013-10-03"

AND Client_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = 'Yes')

AND Driver_Id NOT IN (SELECT Users_Id FROM Users WHERE Banned = 'Yes')
```

## 511\. Game Play Analysis I | Easy | 🔒 [LeetCode](https://leetcode.com/problems/game-play-analysis-i/)

Table: `Activity`

```undefined
+--------------+---------+

+--------------+---------+

+--------------+---------+

(player_id, event_date) is the primary key of this table.

This table shows the activity of players of some game.

Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device.
```

Write an SQL query that reports the **first login date** for each player.

The query result format is in the following example:

```undefined
+-----------+-----------+------------+--------------+

| player_id | device_id | event_date | games_played |

+-----------+-----------+------------+--------------+

| 1         | 2         | 2016-03-01 | 5            |

| 1         | 2         | 2016-05-02 | 6            |

| 2         | 3         | 2017-06-25 | 1            |

| 3         | 1         | 2016-03-02 | 0            |

| 3         | 4         | 2018-07-03 | 5            |

+-----------+-----------+------------+--------------+

+-----------+-------------+

| player_id | first_login |

+-----------+-------------+

+-----------+-------------+
```

### Solution

```sql
SELECT player_id, MIN(event_date) as first_login
```

## 512\. Game Play Analysis II | Easy | 🔒 [LeetCode](https://leetcode.com/problems/game-play-analysis-ii/)

Table: `Activity`

```undefined
+--------------+---------+

+--------------+---------+

+--------------+---------+

(player_id, event_date) is the primary key of this table.

This table shows the activity of players of some game.

Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device.
```

Write a SQL query that reports the device that is first logged in for each player.

The query result format is in the following example:

```undefined
+-----------+-----------+------------+--------------+

| player_id | device_id | event_date | games_played |

+-----------+-----------+------------+--------------+

| 1         | 2         | 2016-03-01 | 5            |

| 1         | 2         | 2016-05-02 | 6            |

| 2         | 3         | 2017-06-25 | 1            |

| 3         | 1         | 2016-03-02 | 0            |

| 3         | 4         | 2018-07-03 | 5            |

+-----------+-----------+------------+--------------+

+-----------+-----------+

| player_id | device_id |

+-----------+-----------+

+-----------+-----------+
```

### Solution

```sql
SELECT DISTINCT player_id, device_id

WHERE (player_id, event_date) in (

    SELECT player_id, min(event_date)

SELECT a.player_id, b.device_id

(SELECT player_id, MIN(event_date) AS event_date FROM Activity

ON a.player_id = b.player_id AND a.event_date = b.event_date;

SELECT player_id, device_id

(SELECT player_id, device_id, event_date,

ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY event_date) AS r
```

## 534\. Game Play Analysis III | Medium | 🔒 [LeetCode](https://leetcode.com/problems/game-play-analysis-iii/)

Table: `Activity`

```undefined
+--------------+---------+

+--------------+---------+

+--------------+---------+

(player_id, event_date) is the primary key of this table.

This table shows the activity of players of some game.

Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device.
```

Write an SQL query that reports for each player and date, how many games played so far by the player. That is, the total number of games played by the player until that date. Check the example for clarity.

The query result format is in the following example:

```undefined
+-----------+-----------+------------+--------------+

| player_id | device_id | event_date | games_played |

+-----------+-----------+------------+--------------+

| 1         | 2         | 2016-03-01 | 5            |

| 1         | 2         | 2016-05-02 | 6            |

| 1         | 3         | 2017-06-25 | 1            |

| 3         | 1         | 2016-03-02 | 0            |

| 3         | 4         | 2018-07-03 | 5            |

+-----------+-----------+------------+--------------+

+-----------+------------+---------------------+

| player_id | event_date | games_played_so_far |

+-----------+------------+---------------------+

+-----------+------------+---------------------+

For the player with id 1, 5 + 6 = 11 games played by 2016-05-02, and 5 + 6 + 1 = 12 games played by 2017-06-25.

For the player with id 3, 0 + 5 = 5 games played by 2018-07-03.

Note that for each player we only care about the days when the player logged in.
```

### Solution

```sql
SELECT t1.player_id, t1.event_date, SUM(t2.games_played) as games_played_so_far

ON t1.player_id = t2.player_id

WHERE t1.event_date >= t2.event_date

GROUP BY t1.player_id, t1.event_date;

SELECT player_id, event_date,

SUM(games_played) OVER (PARTITION BY player_id ORDER BY event_date) AS games_played_so_far
```

## 550\. Game Play Analysis IV | Medium | 🔒 [LeetCode](https://leetcode.com/problems/game-play-analysis-iv/)

Table: Activity

```undefined
+--------------+---------+

+--------------+---------+

+--------------+---------+

(player_id, event_date) is the primary key of this table.

This table shows the activity of players of some game.

Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device.
```

Write an SQL query that reports the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

The query result format is in the following example:

```undefined
+-----------+-----------+------------+--------------+

| player_id | device_id | event_date | games_played |

+-----------+-----------+------------+--------------+

| 1         | 2         | 2016-03-01 | 5            |

| 1         | 2         | 2016-03-02 | 6            |

| 2         | 3         | 2017-06-25 | 1            |

| 3         | 1         | 2016-03-02 | 0            |

| 3         | 4         | 2018-07-03 | 5            |

+-----------+-----------+------------+--------------+

Only the player with id 1 logged back in after the first day he had logged in so the answer is 1/3 = 0.33
```

### Solution

```sql
SELECT ROUND(sum(CASE WHEN t1.event_date = t2.first_event+1 THEN 1 ELSE 0 END)/COUNT(DISTINCT t1.player_id), 2) AS fraction

    (SELECT player_id, MIN(event_date) AS first_event

    ON t1.player_id = t2.player_id;

SELECT ROUND(COUNT(DISTINCT b.player_id)/COUNT(DISTINCT a.player_id),2) AS fraction

  (SELECT player_id, MIN(event_date) AS event_date FROM Activity

  ON a.player_id = b.player_id AND a.event_date+1 = b.event_date;
```

## 569\. Median Employee Salary | Hard | 🔒 [LeetCode](https://leetcode.com/problems/median-employee-salary/)

The `Employee` table holds all employees. The employee table has three columns: Employee Id, Company Name, and Salary.

```undefined
+-----+------------+--------+

+-----+------------+--------+

+-----+------------+--------+
```

Write a SQL query to find the median salary of each company. Bonus points if you can solve it without using any built-in SQL functions.

```undefined
+-----+------------+--------+

+-----+------------+--------+

+-----+------------+--------+
```

### Solution

```sql
SELECT t1.Id AS Id, t1.Company, t1.Salary

FROM Employee AS t1 JOIN Employee AS t2

ON t1.Company = t2.Company

HAVING abs(sum(CASE WHEN t2.Salary<t1.Salary THEN 1

                  WHEN t2.Salary>t1.Salary THEN -1

                  WHEN t2.Salary=t1.Salary AND t2.Id<t1.Id THEN 1

                  WHEN t2.Salary=t1.Salary AND t2.Id>t1.Id THEN -1

ORDER BY t1.Company, t1.Salary, t1.Id
```

## 570\. Managers with at Least 5 Direct Reports | Medium | 🔒 [LeetCode](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/)

The `Employee` table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.

```undefined
+------+----------+-----------+----------+

|Id    |Name     |Department |ManagerId |

+------+----------+-----------+----------+

+------+----------+-----------+----------+
```

Given the `Employee` table, write a SQL query that finds out managers with at least 5 direct report. For the above table, your SQL query should return:

Note: No one would report to himself.

### Solution

```sql
    HAVING COUNT(DISTINCT Id) >= 5)
```

## 571\. Find Median Given Frequency of Numbers | 🔒 [LeetCode](https://leetcode.com/problems/find-median-given-frequency-of-numbers/)

The `Numbers` table keeps the value of number and its frequency.

```undefined
+----------+-------------+

+----------+-------------|

+----------+-------------+
```

In this table, the numbers are 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, so the median is (0 + 0) / 2 = 0.

Write a query to find the median of all numbers and name the result as median.

### Solution

```sql
SELECT avg(t3.Number) as median

        abs(SUM(CASE WHEN t1.Number>t2.Number THEN t2.Frequency ELSE 0 END) -

            SUM(CASE WHEN t1.Number<t2.Number THEN t2.Frequency ELSE 0 END)) AS count_diff

    FROM numbers AS t1, numbers AS t2

    GROUP BY t1.Number) AS t4

WHERE t3.Frequency>=t4.count_diff
```

## 574\. Winning Candidate | Medium | 🔒 [LeetCode](https://leetcode.com/problems/winning-candidate/)

Table: `Candidate`

Table: `Vote`

`id` is the auto-increment primary key, `CandidateId` is the id appeared in Candidate table. Write a sql to find the name of the winning candidate, the above example will return the winner B.

Notes: You may assume there is no tie, in other words there will be at most one winning candidate.

### Solution

```sql
WHERE id = (SELECT CandidateId

## Assumption: if we have two candidates with the same votes, we choose the one who get the first vote

# ON Candidate.id = t.CandidateId
```

## 577\. Employee Bonus | Easy | 🔒 [LeetCode](https://leetcode.com/problems/employee-bonus/https://leetcode.com/problems/employee-bonus/)

Select all employee’s name and bonus whose bonus is < 1000.

Table:Employee

```undefined
+-------+--------+-----------+--------+

| empId |  name  | supervisor| salary |

+-------+--------+-----------+--------+

|   3   | Brad   |  null     | 4000   |

|   4   | Thomas |  3        | 4000   |

+-------+--------+-----------+--------+

empId is the primary key column for this table.
```

Table: Bonus

```undefined
empId is the primary key column for this table.
```

Example ouput:

### Solution

```sql
FROM Employee LEFT JOIN Bonus

ON Employee.empId = Bonus.empId

WHERE bonus<1000 OR bonus IS NULL;
```

## 578\. Get Highest Answer Rate Question | Medium | 🔒 [LeetCode](https://leetcode.com/problems/get-highest-answer-rate-question/)

Get the highest answer rate question from a table survey\_log with these columns: uid, action, question\_id, answer\_id, q\_num, timestamp.

uid means user id; action has these kind of values: “show”, “answer”, “skip”; answer\_id is not null when action column is “answer”, while is null for “show” and “skip”; q\_num is the numeral order of the question in current session.

Write a sql query to identify the question which has the highest answer rate.

Example: Input:

```undefined
+------+-----------+--------------+------------+-----------+------------+

| uid  | action    | question_id  | answer_id  | q_num     | timestamp  |

+------+-----------+--------------+------------+-----------+------------+

| 5    | show      | 285          | null       | 1         | 123        |

| 5    | answer    | 285          | 124124     | 1         | 124        |

| 5    | show      | 369          | null       | 2         | 125        |

| 5    | skip      | 369          | null       | 2         | 126        |

+------+-----------+--------------+------------+-----------+------------+
```

Output:

Explanation: question 285 has answer rate 1/1, while question 369 has 0/1 answer rate, so output 285.

Note: The highest answer rate meaning is: answer number’s ratio in show number in the same question.

### Solution

```sql
SELECT question_id AS survey_log FROM

        SUM(IF(action='show', 1, 0)) AS num_show,

        SUM(IF(action='answer', 1, 0)) AS num_answer

 FROM survey_log GROUP BY question_id) AS t

ORDER BY (num_answer/num_show) DESC LIMIT 1;

SELECT question_id AS survey_log

FROM (SELECT question_id,

      sum(CASE WHEN  action='show' THEN 1 ELSE 0 END) AS show_count,

      sum(CASE WHEN  action='answer' THEN 1 ELSE 0 END) AS answer_count

    GROUP BY question_id) AS t

ORDER BY answer_count/show_count DESC LIMIT 1;
```

## 579\. Find Cumulative Salary of an Employee | Hard | 🔒 [LeetCode](https://leetcode.com/problems/find-cumulative-salary-of-an-employee/)

The `Employee` table holds the salary information in a year.

Write a SQL to get the cumulative sum of an employee’s salary over a period of 3 months but exclude the most recent month.

The result should be displayed by ‘Id’ ascending, and then by ‘Month’ descending.

Example Input

Output

Explanation Employee ‘1’ has 3 salary records for the following 3 months except the most recent month ‘4’: salary 40 for month ‘3’, 30 for month ‘2’ and 20 for month ‘1’ So the cumulative sum of salary of this employee over 3 months is 90(40+30+20), 50(30+20) and 20 respectively.

Employee ‘2’ only has one salary record (month ‘1’) except its most recent month ‘2’.

Employ ‘3’ has two salary records except its most recent pay month ‘4’: month ‘3’ with 60 and month ‘2’ with 40. So the cumulative salary is as following.

### Solution

```sql
    Employee a JOIN Employee b ON

    a.month - b.month >= 0 AND

    (a.id, a.month) NOT IN (SELECT id, MAX(month) FROM Employee GROUP BY id)
```

## 580\. Count Student Number in Departments | Medium | 🔒 [LeetCode](https://leetcode.com/problems/count-student-number-in-departments/)

A university uses 2 data tables, `student` and `department`, to store data about its students and the departments associated with each major.

Write a query to print the respective department name and number of students majoring in each department for all departments in the department table (even ones with no current students).

Sort your results by descending number of students; if two or more departments have the same number of students, then sort those departments alphabetically by department name.

The `student` is described as follow:

```undefined
|--------------|-----------|

| student_name | String    |
```

where student\_id is the student’s ID number, student\_name is the student’s name, gender is their gender, and dept\_id is the department ID associated with their declared major.

And the department table is described as below:

```undefined
|-------------|---------|
```

where dept\_id is the department’s ID number and dept\_name is the department name.

Here is an example input: `student` table:

```undefined
| student_id | student_name | gender | dept_id |

|------------|--------------|--------|---------|
```

`department` table:

```undefined
|---------|-------------|
```

The Output should be:

```undefined
| dept_name   | student_number |

|-------------|----------------|
```

### Solution

```sql
  SUM(CASE WHEN student_id IS NULL THEN 0 ELSE 1 END) AS student_number

ON department.dept_id = student.dept_id

GROUP BY department.dept_id

ORDER BY student_number DESC, dept_name
```

## 584\. Find Customer Referee | Easy | 🔒 [LeetCode](https://leetcode.com/problems/find-customer-referee/)

Given a table `customer` holding customers information and the referee.

```undefined
+------+------+-----------+

| id   | name | referee_id|

+------+------+-----------+

+------+------+-----------+
```

Write a query to return the list of customers NOT referred by the person with id ‘2’.

For the sample data above, the result is:

### Solution

```sql
WHERE referee_id != '2' OR referee_id IS NULL;
```

## 585\. Investments in 2016 | Medium | 🔒 [LeetCode](https://leetcode.com/problems/investments-in-2016/)

Write a query to print the sum of all total investment values in 2016 (TIV\_2016), to a scale of 2 decimal places, for all policy holders who meet the following criteria:

1.  Have the same TIV\_2015 value as one or more other policyholders.
2.  Are not located in the same city as any other policyholder (i.e.: the (latitude, longitude) attribute pairs must be unique). Input Format: The insurance table is described as follows:

```undefined
|-------------|---------------|

| TIV_2015    | NUMERIC(15,2) |

| TIV_2016    | NUMERIC(15,2) |
```

where PID is the policyholder’s policy ID, TIV\_2015 is the total investment value in 2015, TIV\_2016 is the total investment value in 2016, LAT is the latitude of the policy holder’s city, and LON is the longitude of the policy holder’s city.

Sample Input

```undefined
| PID | TIV_2015 | TIV_2016 | LAT | LON |

|-----|----------|----------|-----|-----|

| 2   | 20       | 20       | 20  | 20  |

| 3   | 10       | 30       | 20  | 20  |

| 4   | 10       | 40       | 40  | 40  |
```

Sample Output

Explanation

```undefined
The first record in the table, like the last record, meets both of the two criteria.

The TIV_2015 value '10' is as the same as the third and forth record, and its location unique.

The second record does not meet any of the two criteria. Its TIV_2015 is not like any other policyholders.

And its location is the same with the third record, which makes the third record fail, too.

So, the result is the sum of TIV_2016 of the first and last record, which is 45.
```

### Solution

```sql
SELECT SUM(TIV_2016) AS TIV_2016

WHERE CONCAT(LAT, ',', LON)

    IN (SELECT CONCAT(LAT, ',', LON)
```

## 586\. Customer Placing the Largest Number of Orders | Easy | 🔒 [LeetCode](https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/)

Query the customer\_number from the orders table for the customer who has placed the largest number of orders.

It is guaranteed that exactly one customer will have placed more orders than any other customer.

The orders table is defined as follows:

```undefined
|-------------------|-----------|

| order_number (PK) | int       |

| customer_number   | int       |
```

Sample Input

```undefined
| order_number | customer_number | order_date | required_date | shipped_date | status | comment |

|--------------|-----------------|------------|---------------|--------------|--------|---------|

| 1            | 1               | 2017-04-09 | 2017-04-13    | 2017-04-12   | Closed |         |

| 2            | 2               | 2017-04-15 | 2017-04-20    | 2017-04-18   | Closed |         |

| 3            | 3               | 2017-04-16 | 2017-04-25    | 2017-04-20   | Closed |         |

| 4            | 3               | 2017-04-18 | 2017-04-28    | 2017-04-25   | Closed |         |
```

Sample Output

Explanation

```undefined
The customer with number '3' has two orders, which is greater than either customer '1' or '2' because each of them  only has one order.

So the result is customer_number '3'.
```

### Solution

```sql
SELECT customer_number FROM orders

## assume: multiple matches

##  SELECT t1.customer_number

##  FROM (SELECT customer_number, COUNT(1) AS count

##        FROM orders GROUP BY customer_number) AS t1,

##        (SELECT customer_number, COUNT(1) AS count

##        FROM orders GROUP BY customer_number) AS t2

##  GROUP BY t1.customer_number

##  HAVING max(t1.count) = max(t2.count)
```

## 595\. Big Countries | Easy | [LeetCode](https://leetcode.com/problems/big-countries/)

There is a table `World`

```undefined
+-----------------+------------+------------+--------------+---------------+

| name            | continent  | area       | population   | gdp           |

+-----------------+------------+------------+--------------+---------------+

| Afghanistan     | Asia       | 652230     | 25500100     | 20343000      |

| Albania         | Europe     | 28748      | 2831741      | 12960000      |

| Algeria         | Africa     | 2381741    | 37100000     | 188681000     |

| Andorra         | Europe     | 468        | 78115        | 3712000       |

| Angola          | Africa     | 1246700    | 20609294     | 100990000     |

+-----------------+------------+------------+--------------+---------------+
```

A country is big if it has an area of bigger than 3 million square km or a population of more than 25 million.

Write a SQL solution to output big countries' name, population and area.

For example, according to the above table, we should output:

```undefined
+--------------+-------------+--------------+

| name         | population  | area         |

+--------------+-------------+--------------+

| Afghanistan  | 25500100    | 652230       |

| Algeria      | 37100000    | 2381741      |

+--------------+-------------+--------------+
```

### Solution

```sql
SELECT name, population, area

WHERE area >= 3000000 OR population > 25000000;
```

## 596\. Classes More Than 5 Students | Easy | [LeetCode](https://leetcode.com/problems/classes-more-than-5-students/)

There is a table `courses` with columns: **student** and **class**

Please list out all classes which have more than or equal to 5 students.

For example, the table:

Should output:

### Solution

```sql
HAVING count(DISTINCT Student)>=5;
```

## 597\. Friend Requests I: Overall Acceptance Rate | Easy | 🔒 [LeetCode](https://leetcode.com/problems/friend-requests-i-overall-acceptance-rate/)

In social network like Facebook or Twitter, people send friend requests and accept others’ requests as well. Now given two tables as below: Table: `friend_request`

```undefined
| sender_id | send_to_id |request_date|

|-----------|------------|------------|
```

Table: `request_accepted`

```undefined
| requester_id | accepter_id |accept_date |

|--------------|-------------|------------|
```

Write a query to find the overall acceptance rate of requests rounded to 2 decimals, which is the number of acceptance divide the number of requests. For the sample data above, your query should return the following result.

Note:

The accepted requests are not necessarily from the table friend\_request. In this case, you just need to simply count the total accepted requests (no matter whether they are in the original requests), and divide it by the number of requests to get the acceptance rate. It is possible that a sender sends multiple requests to the same receiver, and a request could be accepted more than once. In this case, the ‘duplicated’ requests or acceptances are only counted once. If there is no requests at all, you should return 0.00 as the accept\_rate. Explanation: There are 4 unique accepted requests, and there are 5 requests in total. So the rate is 0.80.

Follow-up:

Can you write a query to return the accept rate but for every month? How about the cumulative accept rate for every day?

### Solution

```sql
SELECT IFNULL((round(accepts/requests, 2)), 0.0) AS accept_rate

    (SELECT count(DISTINCT sender_id, send_to_id) AS requests FROM friend_request) AS t1,

    (SELECT count(DISTINCT requester_id, accepter_id) AS accepts FROM request_accepted) AS t2
```

## 601\. Human Traffic of Stadium | Hard | [LeetCode](https://leetcode.com/problems/human-traffic-of-stadium/)

Table: `Stadium`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+
```

visit\_date is the primary key for this table. Each row of this table contains the visit date and visit id to the stadium with the number of people during the visit. No two rows will have the same visit\_date, and as the id increases, the dates increase as well.

Write an SQL query to display the records with three or more rows with **consecutive** `id`'s, and the number of people is greater than or equal to 100 for each.

Return the result table ordered by `visit_date` in **ascending order**.

The query result format is in the following example.

```undefined
+------+------------+-----------+

| id   | visit_date | people    |

+------+------------+-----------+

| 6    | 2017-01-06 | 1455      |

+------+------------+-----------+

+------+------------+-----------+

| id   | visit_date | people    |

+------+------------+-----------+

| 6    | 2017-01-06 | 1455      |

+------+------------+-----------+

The four rows with ids 5, 6, 7, and 8 have consecutive ids and each of them has >= 100 people attended. Note that row 8 was included even though the visit_date was not the next day after row 7.

The rows with ids 2 and 3 are not included because we need at least three consecutive ids.
```

### Solution

```sql
FROM Stadium s1 JOIN Stadium s2 JOIN Stadium s3

ON (s1.id = s2.id-1 AND s1.id = s3.id-2) OR

 (s1.id = s2.id+1 AND s1.id = s3.id-1) OR

 (s1.id = s2.id+1 AND s1.id = s3.id+2)

    WHERE s1.people >= 100 AND s2.people >= 100 AND s3.people>=100
```

## 602\. Friend Requests II: Who Has the Most Friends | Medium | 🔒 [LeetCode](https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/)

In social network like Facebook or Twitter, people send friend requests and accept others’ requests as well. Table `request_accepted` holds the data of friend acceptance, while requester\_id and accepter\_id both are the id of a person.

```undefined
| requester_id | accepter_id | accept_date|

|--------------|-------------|------------|
```

Write a query to find the the people who has most friends and the most friends number. For the sample data above, the result is:

Note:

It is guaranteed there is only 1 people having the most friends. The friend request could only been accepted once, which mean there is no multiple records with the same requester\_id and accepter\_id value. Explanation: The person with id ‘3’ is a friend of people ‘1’, ‘2’ and ‘4’, so he has 3 friends in total, which is the most number than any others.

Follow-up: In the real world, multiple people could have the same most number of friends, can you find all these people in this case?

```sql
SELECT t.id, sum(t.num) AS num

      (SELECT requester_id AS id, COUNT(1) AS num

       (SELECT accepter_id AS id, COUNT(1) AS num

        GROUP BY accepter_id)) AS t
```

## 603\. Consecutive Available Seats | Easy | 🔒 [LeetCode](https://leetcode.com/problems/consecutive-available-seats/)

Several friends at a cinema ticket office would like to reserve consecutive available seats. Can you help to query all the consecutive available seats order by the seat\_id using the following cinema table?

Your query should return the following result for the sample case above.

Note:

The seat\_id is an auto increment int, and free is bool (‘1’ means free, and ‘0’ means occupied.). Consecutive available seats are more than 2(inclusive) seats consecutively available.

### Solution

```sql
SELECT DISTINCT t1.seat_id

FROM cinema AS t1 JOIN cinema AS t2

ON abs(t1.seat_id-t2.seat_id)=1

WHERE t1.free='1' AND t2.free='1'
```

## 607.Sales Person | Easy | 🔒 [LeetCode](https://leetcode.com/problems/sales-person/)

Description

Given three tables: `salesperson`, `company`, `orders`. Output all the names in the table salesperson, who didn’t have sales to company ‘RED’.

Example Input

Table: `salesperson`

```undefined
+----------+------+--------+-----------------+-----------+

| sales_id | name | salary | commission_rate | hire_date |

+----------+------+--------+-----------------+-----------+

|   1      | John | 100000 |     6           | 4/1/2006  |

|   2      | Amy  | 120000 |     5           | 5/1/2010  |

|   3      | Mark | 65000  |     12          | 12/25/2008|

|   4      | Pam  | 25000  |     25          | 1/1/2005  |

|   5      | Alex | 50000  |     10          | 2/3/2007  |

+----------+------+--------+-----------------+-----------+
```

The table salesperson holds the salesperson information. Every salesperson has a sales\_id and a name. Table: `company`

```undefined
+---------+--------+------------+

+---------+--------+------------+

|   2     | ORANGE |   New York |

+---------+--------+------------+
```

The table company holds the company information. Every company has a com\_id and a name. Table: `orders`

```undefined
+----------+----------+---------+----------+--------+

| order_id |  date    | com_id  | sales_id | amount |

+----------+----------+---------+----------+--------+

| 1        | 1/1/2014 |    3    |    4     | 100000 |

| 2        | 2/1/2014 |    4    |    5     | 5000   |

| 3        | 3/1/2014 |    1    |    1     | 50000  |

| 4        | 4/1/2014 |    1    |    4     | 25000  |

+----------+----------+---------+----------+--------+
```

The table orders holds the sales record information, salesperson and customer company are represented by sales\_id and com\_id. output

Explanation

According to order ‘3’ and ‘4’ in table orders, it is easy to tell only salesperson ‘John’ and ‘Alex’ have sales to company ‘RED’, so we need to output all the other names in table salesperson.

### Solution

```sql
    (SELECT DISTINCT salesperson.name

    FROM salesperson, orders, company

    WHERE company.name = 'RED'

    AND salesperson.sales_id = orders.sales_id

    AND orders.com_id = company.com_id)
```

## 608\. Tree Node | Medium | 🔒 [LeetCode](https://leetcode.com/problems/tree-node/)

Given a table tree, id is identifier of the tree node and p\_id is its parent node’s id.

Each node in the tree can be one of three types:

Leaf: if the node is a leaf node. Root: if the node is the root of the tree. Inner: If the node is neither a leaf node nor a root node. Write a query to print the node id and the type of the node. Sort your output by the node id. The result for the above sample is:

Explanation

Node ‘1’ is root node, because its parent node is NULL and it has child node ‘2’ and ‘3’. Node ‘2’ is inner node, because it has parent node ‘1’ and child node ‘4’ and ‘5’. Node ‘3’, ‘4’ and ‘5’ is Leaf node, because they have parent node and they don’t have child node. And here is the image of the sample tree as below:

Note

If there is only one node on the tree, you only need to output its root attributes.

### Solution

```sql
## Basic Ideas: LEFT JOIN

# In tree, each node can only one parent or no parent

## | id | p_id | id (child) |

## |----+------+------------|

        WHEN ISNULL(t1.p_id) THEN 'Root'

        WHEN ISNULL(MAX(t2.id)) THEN 'Leaf'

FROM tree AS t1 LEFT JOIN tree AS t2
```

## 610\. Triangle Judgement | Easy | 🔒 [LeetCode](https://leetcode.com/problems/triangle-judgement/)

A pupil Tim gets homework to identify whether three line segments could possibly form a triangle. However, this assignment is very heavy because there are hundreds of records to calculate. Could you help Tim by writing a query to judge whether these three sides can form a triangle, assuming table triangle holds the length of the three sides x, y and z.

For the sample data above, your query should return the follow result:

```undefined
|----|----|----|----------|
```

### Solution

```sql
           WHEN x+y>z AND y+z>x AND x+z>y THEN 'Yes'
```

## 612\. Shortest Distance in a Plane | Medium | 🔒 [LeetCode](https://leetcode.com/problems/shortest-distance-in-a-plane/)

Table point\_2d holds the coordinates (x,y) of some unique points (more than two) in a plane. Write a query to find the shortest distance between these points rounded to 2 decimals.

The shortest distance is 1.00 from point (-1,-1) to (-1,2). So the output should be:

Note: The longest distance among all the points are less than 10000.

### Solution

```sql
SELECT ROUND(MIN(SQRT((t1.x-t2.x)*(t1.x-t2.x) + (t1.y-t2.y)*(t1.y-t2.y))), 2) as shortest

FROM point_2d AS t1, point_2d AS t2

WHERE t1.x!=t2.x OR t1.y!=t2.y

# SELECT ROUND(SQRT((t1.x-t2.x)*(t1.x-t2.x) + (t1.y-t2.y)*(t1.y-t2.y)), 2) AS shortest

# FROM point_2d AS t1, point_2d AS t2

# WHERE t1.x!=t2.x OR t1.y!=t2.y
```

## 613\. Shortest Distance in a Line | Easy | 🔒 [LeetCode](https://leetcode.com/problems/shortest-distance-in-a-line/)

Table point holds the x coordinate of some points on x-axis in a plane, which are all integers. Write a query to find the shortest distance between two points in these points.

The shortest distance is ‘1’ obviously, which is from point ‘-1’ to ‘0’. So the output is as below:

Note: Every point is unique, which means there is no duplicates in table point.

Follow-up: What if all these points have an id and are arranged from the left most to the right most of x axis?

### Solution

```sql
SELECT t1.x-t2.x AS shortest

FROM point AS t1 JOIN point AS t2
```

## 614\. Second Degree Follower | Medium | 🔒 [LeetCode](https://leetcode.com/problems/second-degree-follower/)

In facebook, there is a follow table with two columns: followee, follower.

Please write a sql query to get the amount of each follower’s follower if he/she has one.

For example:

```undefined
+-------------+------------+

+-------------+------------+

+-------------+------------+
```

should output:

```undefined
+-------------+------------+

+-------------+------------+

+-------------+------------+
```

Explanation: Both B and D exist in the follower list, when as a followee, B’s follower is C and D, and D’s follower is E. A does not exist in follower list.

Note: Followee would not follow himself/herself in all cases. Please display the result in follower’s alphabet order.

### Solution

```sql
## Explain the business logic

##   A follows B. Then A is follwer, B is followee

## What are second degree followers?

##   A follows B, and B follows C.

##   Then A is the second degree followers of C

SELECT f1.follower, COUNT(DISTINCT f2.follower) AS num

FROM follow AS f1 JOIN follow AS f2

ON f1.follower = f2.followee
```

## 615\. Average Salary: Departments VS Company | Hard | 🔒 [LeetCode](https://leetcode.com/problems/average-salary-departments-vs-company)

Given two tables as below, write a query to display the comparison result (higher/lower/same) of the average salary of employees in a department to the company’s average salary. Table: salary

```undefined
| id | employee_id | amount | pay_date   |

|----|-------------|--------|------------|

| 1  | 1           | 9000   | 2017-03-31 |

| 2  | 2           | 6000   | 2017-03-31 |

| 3  | 3           | 10000  | 2017-03-31 |

| 4  | 1           | 7000   | 2017-02-28 |

| 5  | 2           | 6000   | 2017-02-28 |

| 6  | 3           | 8000   | 2017-02-28 |
```

The employee\_id column refers to the employee\_id in the following table employee.

```undefined
| employee_id | department_id |

|-------------|---------------|
```

So for the sample data above, the result is:

```undefined
| pay_month | department_id | comparison  |

|-----------|---------------|-------------|
```

Explanation In March, the company’s average salary is (9000+6000+10000)/3 = 8333.33… The average salary for department ‘1’ is 9000, which is the salary of employee\_id ‘1’ since there is only one employee in this department. So the comparison result is ‘higher’ since 9000 > 8333.33 obviously. The average salary of department ‘2’ is (6000 + 10000)/2 = 8000, which is the average of employee\_id ‘2’ and ‘3’. So the comparison result is ‘lower’ since 8000 < 8333.33. With he same formula for the average salary comparison in February, the result is ‘same’ since both the department ‘1’ and ‘2’ have the same average salary with the company, which is 7000.

### Solution

```sql
SELECT t1.pay_month, t1.department_id,

    (CASE WHEN t1.amount = t2.amount THEN 'same'

          WHEN t1.amount > t2.amount THEN 'higher'

          WHEN t1.amount < t2.amount THEN 'lower' END) AS comparison

    (SELECT left(pay_date, 7) AS pay_month, department_id, avg(amount) AS amount

    FROM salary JOIN employee

    ON salary.employee_id = employee.employee_id

    GROUP BY pay_month, department_id

    ORDER BY pay_month DESC, department_id) AS t1

    (SELECT left(pay_date, 7) AS pay_month, avg(amount) AS amount

    FROM salary JOIN employee

    ON salary.employee_id = employee.employee_id

    GROUP BY pay_month) AS t2

    ON t1.pay_month = t2.pay_month
```

## 618\. Students Report By Geography | Hard | 🔒 [LeetCode](https://leetcode.com/problems/students-report-by-geography)

A U.S graduate school has students from Asia, Europe and America. The students’ location information are stored in table student as below.

Pivot the continent column in this table so that each name is sorted alphabetically and displayed underneath its corresponding continent. The output headers should be America, Asia and Europe respectively. It is guaranteed that the student number from America is no less than either Asia or Europe. For the sample input, the output is:

```undefined
| America | Asia | Europe |

|---------|------|--------|
```

Follow-up: If it is unknown which continent has the most students, can you write a query to generate the student report?

### Solution

```sql
SELECT t1.name AS America, t2.name AS Asia, t3.name AS Europe

    (SELECT (@cnt1 := @cnt1 + 1) AS id, name

    CROSS JOIN (SELECT @cnt1 := 0) AS dummy

    WHERE continent='America'

    (SELECT (@cnt2 := @cnt2 + 1) AS id, name

    CROSS JOIN (SELECT @cnt2 := 0) AS dummy

    (SELECT (@cnt3 := @cnt3 + 1) AS id, name

    CROSS JOIN (SELECT @cnt3 := 0) AS dummy
```

## 619\. Biggest Single Number | Easy | 🔒 [LeetCode](https://leetcode.com/problems/biggest-single-number)

Table number contains many numbers in column num including duplicated ones. Can you write a SQL query to find the biggest number, which only appears once.

For the sample data above, your query should return the following result:

Note: If there is no such number, just output null.

### Solution

```sql
    LIMIT 0, 1), NULL) AS num
```

## 620\. Not Boring Movies | Easy | [LeetCode](https://leetcode.com/problems/not-boring-movies/)

X city opened a new cinema, many people would like to go to this cinema. The cinema also gives out a poster indicating the movies’ ratings and descriptions. Please write a SQL query to output movies with an odd numbered ID and a description that is not 'boring'. Order the result by rating.

For example, table `cinema`:

```undefined
+---------+-----------+--------------+-----------+

|   id    | movie     |  description |  rating   |

+---------+-----------+--------------+-----------+

|   1     | War       |   great 3D   |   8.9     |

|   2     | Science   |   fiction    |   8.5     |

|   3     | irish     |   boring     |   6.2     |

|   4     | Ice song  |   Fantacy    |   8.6     |

|   5     | House card|   Interesting|   9.1     |

+---------+-----------+--------------+-----------+
```

For the example above, the output should be:

```undefined
+---------+-----------+--------------+-----------+

|   id    | movie     |  description |  rating   |

+---------+-----------+--------------+-----------+

|   5     | House card|   Interesting|   9.1     |

|   1     | War       |   great 3D   |   8.9     |

+---------+-----------+--------------+-----------+
```

### Solution

```sql
WHERE description <> 'boring' AND ID % 2 = 1
```

## 626\. Exchange Seats | Medium | [LeetCode](https://leetcode.com/problems/exchange-seats/)

Mary is a teacher in a middle school and she has a table `seat` storing students' names and their corresponding seat ids.

The column id is continuous increment.

Mary wants to change seats for the adjacent students.

Can you write a SQL query to output the result for Mary?

For the sample input, the output is:

**_Note:_**  
If the number of students is odd, there is no need to change the last one's seat.

### Solution

```sql
IF(id<(SELECT MAX(id) FROM seat),IF(id%2=0,id-1, id+1),IF(id%2=0, id-1, id)) AS id, student
```

## 627\. Swap Salary | [LeetCode](https://leetcode.com/problems/swap-salary/)

Table: `Salary`

```undefined
+-------------+----------+

+-------------+----------+

+-------------+----------+

id is the primary key for this table.

The sex column is ENUM value of type ('m', 'f').

The table contains information about an employee.
```

Write an SQL query to swap all `'f'` and `'m'` values (i.e., change all `'f'` values to `'m'` and vice versa) with a single update statement and no intermediate temp table(s).

Note that you must write a single update statement, DO NOT write any select statement for this problem.

The query result format is in the following example:

```undefined
+----+------+-----+--------+

| id | name | sex | salary |

+----+------+-----+--------+

+----+------+-----+--------+

+----+------+-----+--------+

| id | name | sex | salary |

+----+------+-----+--------+

+----+------+-----+--------+

(1, A) and (2, C) were changed from 'm' to 'f'.

(2, B) and (4, D) were changed from 'f' to 'm'.
```

### Solution

```sql
UPDATE Salary SET sex = IF(sex='m', 'f', 'm')

UPDATE Salary SET sex = CASE WHEN sex='m' THEN 'f' ELSE 'm' END
```

## 1045\. Customers Who Bought All Products | Medium | 🔒 [LeetCode](https://leetcode.com/problems/customers-who-bought-all-products)

Table: `Customer`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+
```

product\_key is a foreign key to Product table. Table: `Product`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

product_key is the primary key column for this table.
```

Write an SQL query for a report that provides the customer ids from the Customer table that bought all the products in the Product table.

For example:

```undefined
+-------------+-------------+

| customer_id | product_key |

+-------------+-------------+

+-------------+-------------+

The customers who bought all the products (5 and 6) are customers with id 1 and 3.
```

### Solution

```sql
HAVING count(DISTINCT product_key) = (
```

## 1050\. Actors and Directors Who Cooperated At Least Three Times | Easy | 🔒 [LeetCode](https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times)

Table: `ActorDirector`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

timestamp is the primary key column for this table.
```

Write a SQL query for a report that provides the pairs (actor\_id, director\_id) where the actor have cooperated with the director at least 3 times.

Example:

```undefined
+-------------+-------------+-------------+

| actor_id    | director_id | timestamp   |

+-------------+-------------+-------------+

+-------------+-------------+-------------+

+-------------+-------------+

| actor_id    | director_id |

+-------------+-------------+

+-------------+-------------+

The only pair is (1, 1) where they cooperated exactly 3 times.
```

### Solution

```sql
SELECT actor_id, director_id

GROUP BY actor_id, director_id
```

## 1068\. Product Sales Analysis I | Easy | 🔒 [LeetCode](https://leetcode.com/problems/product-sales-analysis-i)

Table: `Sales`

```undefined
(sale_id, year) is the primary key of this table.

product_id is a foreign key to Product table.

Note that the price is per unit.
```

Table: `Product`

```undefined
+--------------+---------+

+--------------+---------+

| product_name | varchar |

+--------------+---------+

product_id is the primary key of this table.
```

Write an SQL query that reports all product names of the products in the Sales table along with their selling year and price.

For example:

```undefined
+---------+------------+------+----------+-------+

| sale_id | product_id | year | quantity | price |

+---------+------------+------+----------+-------+

| 1       | 100        | 2008 | 10       | 5000  |

| 2       | 100        | 2009 | 12       | 5000  |

| 7       | 200        | 2011 | 15       | 9000  |

+---------+------------+------+----------+-------+

+------------+--------------+

| product_id | product_name |

+------------+--------------+

+------------+--------------+

+--------------+-------+-------+

| product_name | year  | price |

+--------------+-------+-------+

+--------------+-------+-------+
```

### Solution

```sql
SELECT product_name, year, price

ON Product.product_id = Sales.product_id
```

## 1069\. Product Sales Analysis II | Easy | 🔒 [LeetCode](https://leetcode.com/problems/product-sales-analysis-ii)

Table: `Sales`

```undefined
sale_id is the primary key of this table.

product_id is a foreign key to Product table.

Note that the price is per unit.
```

Table: `Product`

```undefined
+--------------+---------+

+--------------+---------+

| product_name | varchar |

+--------------+---------+

product_id is the primary key of this table.
```

Write an SQL query that reports the total quantity sold for every product id.

The query result format is in the following example:

```undefined
+---------+------------+------+----------+-------+

| sale_id | product_id | year | quantity | price |

+---------+------------+------+----------+-------+

| 1       | 100        | 2008 | 10       | 5000  |

| 2       | 100        | 2009 | 12       | 5000  |

| 7       | 200        | 2011 | 15       | 9000  |

+---------+------------+------+----------+-------+

+------------+--------------+

| product_id | product_name |

+------------+--------------+

+------------+--------------+

+--------------+----------------+

| product_id   | total_quantity |

+--------------+----------------+

+--------------+----------------+
```

### Solution

```sql
SELECT product_id, sum(quantity) AS total_quantity
```

## 1070\. Product Sales Analysis III | Medium | 🔒 [LeetCode](https://leetcode.com/problems/product-sales-analysis-iii)

Table: `Sales`

```undefined
sale_id is the primary key of this table.

product_id is a foreign key to Product table.

Note that the price is per unit.
```

Table: `Product`

```undefined
+--------------+---------+

+--------------+---------+

| product_name | varchar |

+--------------+---------+

product_id is the primary key of this table.
```

Write an SQL query that selects the product id, year, quantity, and price for the first year of every product sold.

The query result format is in the following example:

```undefined
+---------+------------+------+----------+-------+

| sale_id | product_id | year | quantity | price |

+---------+------------+------+----------+-------+

| 1       | 100        | 2008 | 10       | 5000  |

| 2       | 100        | 2009 | 12       | 5000  |

| 7       | 200        | 2011 | 15       | 9000  |

+---------+------------+------+----------+-------+

+------------+--------------+

| product_id | product_name |

+------------+--------------+

+------------+--------------+

+------------+------------+----------+-------+

| product_id | first_year | quantity | price |

+------------+------------+----------+-------+

| 100        | 2008       | 10       | 5000  |

| 200        | 2011       | 15       | 9000  |

+------------+------------+----------+-------+
```

### Solution

```sql
WHERE (product_id, year) IN (SELECT product_id, MIN(year)
```

## 1075\. Project Employees I | Easy | 🔒 [LeetCode](https://leetcode.com/problems/project-employees-i)

Table: `Project`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

(project_id, employee_id) is the primary key of this table.

employee_id is a foreign key to Employee table.
```

Table: `Employee`

```undefined
+------------------+---------+

+------------------+---------+

| experience_years | int     |

+------------------+---------+

employee_id is the primary key of this table.
```

Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

The query result format is in the following example:

```undefined
+-------------+-------------+

| project_id  | employee_id |

+-------------+-------------+

+-------------+-------------+

+-------------+--------+------------------+

| employee_id | name   | experience_years |

+-------------+--------+------------------+

+-------------+--------+------------------+

+-------------+---------------+

| project_id  | average_years |

+-------------+---------------+

+-------------+---------------+

The average experience years for the first project is (3 + 2 + 1) / 3 = 2.00 and for the second project is (3 + 2) / 2 = 2.50
```

### Solution

```sql
    ROUND(AVG(e.experience_years),2) average_years

    Project p JOIN Employee e ON

    p.employee_id = e.employee_id
```

## 1076\. Project Employees II | Easy | 🔒 [LeetCode](https://leetcode.com/problems/project-employees-ii)

Table: `Project`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

(project_id, employee_id) is the primary key of this table.

employee_id is a foreign key to Employee table.
```

Table: `Employee`

```undefined
+------------------+---------+

+------------------+---------+

| experience_years | int     |

+------------------+---------+

employee_id is the primary key of this table.
```

Write an SQL query that reports all the projects that have the most employees.

The query result format is in the following example:

```undefined
+-------------+-------------+

| project_id  | employee_id |

+-------------+-------------+

+-------------+-------------+

+-------------+--------+------------------+

| employee_id | name   | experience_years |

+-------------+--------+------------------+

+-------------+--------+------------------+

The first project has 3 employees while the second one has 2.
```

```sql
HAVING COUNT(employee_id) = (SELECT COUNT(employee_id)

                            ORDER BY COUNT(employee_id) DESC
```

## 1077\. Project Employees III | Medium | 🔒 [LeetCode](https://leetcode.com/problems/project-employees-iii)

Table: `Project`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

(project_id, employee_id) is the primary key of this table.

employee_id is a foreign key to Employee table.
```

Table: `Employee`

```undefined
+------------------+---------+

+------------------+---------+

| experience_years | int     |

+------------------+---------+

employee_id is the primary key of this table.
```

Write an SQL query that reports the most experienced employees in each project. In case of a tie, report all employees with the maximum number of experience years.

The query result format is in the following example:

```undefined
+-------------+-------------+

| project_id  | employee_id |

+-------------+-------------+

+-------------+-------------+

+-------------+--------+------------------+

| employee_id | name   | experience_years |

+-------------+--------+------------------+

+-------------+--------+------------------+

+-------------+---------------+

| project_id  | employee_id   |

+-------------+---------------+

+-------------+---------------+

Both employees with id 1 and 3 have the most experience among the employees of the first project. For the second project, the employee with id 1 has the most experience.
```

### Solution

```sql
    Project p LEFT JOIN Employee e ON

    p.employee_id = e.employee_id

       e.experience_years) IN (SELECT

                                Project p JOIN Employee e ON

                                p.employee_id = e.employee_id
```

## 1082\. Sales Analysis I | Easy | 🔒 [LeetCode](https://leetcode.com/problems/sales-analysis-i)

Table: `Product`

```undefined
+--------------+---------+

+--------------+---------+

| product_name | varchar |

+--------------+---------+

product_id is the primary key of this table.
```

Table: Sales

```undefined
+-------------+---------+

+-------------+---------+

+------ ------+---------+

This table has no primary key, it can have repeated rows.

product_id is a foreign key to Product table.
```

Write an SQL query that reports the best seller by total sales price, If there is a tie, report them all.

The query result format is in the following example:

```undefined
+------------+--------------+------------+

| product_id | product_name | unit_price |

+------------+--------------+------------+

+------------+--------------+------------+

+-----------+------------+----------+------------+----------+-------+

| seller_id | product_id | buyer_id | sale_date  | quantity | price |

+-----------+------------+----------+------------+----------+-------+

| 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |

| 1         | 2          | 2        | 2019-02-17 | 1        | 800   |

| 2         | 2          | 3        | 2019-06-02 | 1        | 800   |

| 3         | 3          | 4        | 2019-05-13 | 2        | 2800  |

+-----------+------------+----------+------------+----------+-------+

Both sellers with id 1 and 3 sold products with the most total price of 2800.
```

### Solution

```sql
HAVING SUM(price) = (SELECT SUM(price)
```

## 1083\. Sales Analysis II | Easy | 🔒 [LeetCode](https://leetcode.com/problems/sales-analysis-ii)

Table: `Product`

```undefined
+--------------+---------+

+--------------+---------+

| product_name | varchar |

+--------------+---------+

product_id is the primary key of this table.
```

Table: `Sales`

```undefined
+-------------+---------+

+-------------+---------+

+------ ------+---------+

This table has no primary key, it can have repeated rows.

product_id is a foreign key to Product table.
```

Write an SQL query that reports the buyers who have bought S8 but not iPhone. Note that S8 and iPhone are products present in the Product table.

The query result format is in the following example:

```undefined
+------------+--------------+------------+

| product_id | product_name | unit_price |

+------------+--------------+------------+

+------------+--------------+------------+

+-----------+------------+----------+------------+----------+-------+

| seller_id | product_id | buyer_id | sale_date  | quantity | price |

+-----------+------------+----------+------------+----------+-------+

| 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |

| 1         | 2          | 2        | 2019-02-17 | 1        | 800   |

| 2         | 1          | 3        | 2019-06-02 | 1        | 800   |

| 3         | 3          | 3        | 2019-05-13 | 2        | 2800  |

+-----------+------------+----------+------------+----------+-------+

The buyer with id 1 bought an S8 but didn't buy an iPhone. The buyer with id 3 bought both.
```

### Solution

```sql
SELECT DISTINCT s.buyer_id

FROM Sales s LEFT JOIN Product p ON

    s.product_id = p.product_id

WHERE p.product_name = 'S8' AND

      s.buyer_id NOT IN (SELECT s.buyer_id

                        FROM Sales s LEFT JOIN Product p ON

                            s.product_id = p.product_id

                        WHERE p.product_name = 'iPhone')
```

## 1084\. Sales Analysis III | Easy | 🔒 [LeetCode](https://leetcode.com/problems/sales-analysis-iii)

Reports the products that were only sold in spring 2019. That is, between 2019-01-01 and 2019-03-31 inclusive. Select the product that were only sold in spring 2019.

```undefined
+------------+--------------+------------+

| product_id | product_name | unit_price |

+------------+--------------+------------+

+------------+--------------+------------+

+-----------+------------+----------+------------+----------+-------+

| seller_id | product_id | buyer_id | sale_date  | quantity | price |

+-----------+------------+----------+------------+----------+-------+

| 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |

| 1         | 2          | 2        | 2019-02-17 | 1        | 800   |

| 2         | 2          | 3        | 2019-06-02 | 1        | 800   |

| 3         | 3          | 4        | 2019-05-13 | 2        | 2800  |

+-----------+------------+----------+------------+----------+-------+

+-------------+--------------+

| product_id  | product_name |

+-------------+--------------+

+-------------+--------------+

The product with id 1 was only sold in spring 2019 while the other two were sold after.
```

### Solution

```sql
(SELECT DISTINCT s.product_id, p.product_name

FROM Sales s LEFT JOIN Product p ON

    s.product_id = p.product_id

WHERE s.sale_date >= '2019-01-01' AND

      s.sale_date <= '2019-03-31')

EXCEPT -- MINUS if Oracle

(SELECT DISTINCT s.product_id, p.product_name

FROM Sales s LEFT JOIN Product p ON

    s.product_id = p.product_id

WHERE s.sale_date < '2019-01-01' OR

      s.sale_date > '2019-03-31')
```

## 1097\. Game Play Analysis V | Hard | 🔒 [LeetCode](https://leetcode.com/problems/game-play-analysis-v)

We define the install date of a player to be the first login day of that player. We also define day 1 retention of some date X to be the number of players whose install date is X and they logged back in on the day right after X , divided by the number of players whose install date is X, rounded to 2 decimal places. Write an SQL query that reports for each install date, the number of players that installed the game on that day and the day 1 retention. The query result format is in the following example:

```undefined
+-----------+-----------+------------+--------------+

| player_id | device_id | event_date | games_played |

+-----------+-----------+------------+--------------+

| 1         | 2         | 2016-03-01 | 5            |

| 1         | 2         | 2016-03-02 | 6            |

| 2         | 3         | 2017-06-25 | 1            |

| 3         | 1         | 2016-03-01 | 0            |

| 3         | 4         | 2016-07-03 | 5            |

+-----------+-----------+------------+--------------+

+------------+----------+----------------+

| install_dt | installs | Day1_retention |

+------------+----------+----------------+

| 2016-03-01 | 2        | 0.50           |

| 2017-06-25 | 1        | 0.00           |

+------------+----------+----------------+

Player 1 and 3 installed the game on 2016-03-01 but only player 1 logged back in on 2016-03-02 so the day 1 retention of 2016-03-01 is 1/2 = 0.50

Player 2 installed the game on 2017 -06-25 but didn't log back in on 2017-06-26 so the day 1 retention of 2017-06-25 is 0/1 = 0.00
```

### Solution

```sql
    COUNT(player_id) installs,

    ROUND(COUNT(retention)/COUNT(player_id),2) Day1_retention  --the number of record on the next day / the total number of id on the day = retention rate

    SELECT a.player_id, a.install_dt, b.event_date retention -- id, the record of the first installation day and next day

        (SELECT player_id, MIN(event_date) install_dt   --subquery 1 take the first installation of date of each id

        GROUP BY player_id) a LEFT JOIN Activity b ON   --sq1 left join the original table, find the login status the next day after the first installation

            a.player_id = b.player_id AND

            a.install_dt + 1=b.event_date
```

## 1098\. Unpopular Books | Medium | 🔒 [LeetCode](https://leetcode.com/problems/unpopular-books)

Table: `Books`

```undefined
+----------------+---------+

+----------------+---------+

| available_from | date    |

+----------------+---------+

book_id is the primary key of this table.
```

Table: `Orders`

```undefined
+----------------+---------+

+----------------+---------+

+----------------+---------+

order_id is the primary key of this table.

book_id is a foreign key to the Books table.
```

Write an SQL query that reports the books that have sold less than 10 copies in the last year, excluding books that have been available for less than 1 month from today. Assume today is 2019-06-23.

The query result format is in the following example:

```undefined
+---------+--------------------+----------------+

| book_id | name               | available_from |

+---------+--------------------+----------------+

| 1       | "Kalila And Demna" | 2010-01-01     |

| 2       | "28 Letters"       | 2012-05-12     |

| 3       | "The Hobbit"       | 2019-06-10     |

| 4       | "13 Reasons Why"   | 2019-06-01     |

| 5       | "The Hunger Games" | 2008-09-21     |

+---------+--------------------+----------------+

+----------+---------+----------+---------------+

| order_id | book_id | quantity | dispatch_date |

+----------+---------+----------+---------------+

| 1        | 1       | 2        | 2018-07-26    |

| 2        | 1       | 1        | 2018-11-05    |

| 3        | 3       | 8        | 2019-06-11    |

| 4        | 4       | 6        | 2019-06-05    |

| 5        | 4       | 5        | 2019-06-20    |

| 6        | 5       | 9        | 2009-02-02    |

| 7        | 5       | 8        | 2010-04-13    |

+----------+---------+----------+---------------+

+-----------+--------------------+

+-----------+--------------------+

| 1         | "Kalila And Demna" |

| 5         | "The Hunger Games" |

+-----------+--------------------+
```

### Solution

```sql
    Books b LEFT JOIN (                    -- subquery calculates last year's sales

        SELECT book_id, SUM(quantity) nsold

        WHERE dispatch_date BETWEEN '2018-06-23' AND '2019-06-23'

    (o.nsold < 10 OR o.nsold IS NULL) AND           -- Sales less than 10 or no sales

    DATEDIFF('2019-06-23', b.available_from) > 30   -- Not a new book within 1 month
```

## 1107\. New Users Daily Count | Medium | 🔒 [LeetCode](https://leetcode.com/problems/new-users-daily-count)

Table: `Traffic`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

There is no primary key for this table, it may have duplicate rows.

The activity column is an ENUM type of ('login', 'logout', 'jobs', 'groups', 'homepage').
```

Write an SQL query that reports for every date within at most 90 days from today, the number of users that logged in for the first time on that date. Assume today is 2019-06-30.

The query result format is in the following example:

```undefined
+---------+----------+---------------+

| user_id | activity | activity_date |

+---------+----------+---------------+

| 1       | login    | 2019-05-01    |

| 1       | homepage | 2019-05-01    |

| 1       | logout   | 2019-05-01    |

| 2       | login    | 2019-06-21    |

| 2       | logout   | 2019-06-21    |

| 3       | login    | 2019-01-01    |

| 3       | jobs     | 2019-01-01    |

| 3       | logout   | 2019-01-01    |

| 4       | login    | 2019-06-21    |

| 4       | groups   | 2019-06-21    |

| 4       | logout   | 2019-06-21    |

| 5       | login    | 2019-03-01    |

| 5       | logout   | 2019-03-01    |

| 5       | login    | 2019-06-21    |

| 5       | logout   | 2019-06-21    |

+---------+----------+---------------+

+------------+-------------+

| login_date | user_count  |

+------------+-------------+

+------------+-------------+

Note that we only care about dates with non zero user count.

The user with id 5 first logged in on 2019-03-01 so he's not counted on 2019-06-21.
```

### Solution

```sql
SELECT login_date, COUNT(user_id) AS user_count

FROM (SELECT user_id, MIN(activity_date) AS login_date

WHERE login_date >= DATE_ADD('2019-06-30', INTERVAL -90 DAY) AND login_date <= '2019-06-30'

SELECT login_date, COUNT(user_id) user_count

    (SELECT user_id, MIN(activity_date) as login_date

WHERE DATEDIFF('2019-06-30', login_date) <= 90
```

## 1112\. Highest Grade For Each Student | Medium | 🔒 [LeetCode](https://leetcode.com/problems/highest-grade-for-each-student)

Table: `Enrollments`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(student_id, course_id) is the primary key of this table.
```

Write a SQL query to find the highest grade with its corresponding course for each student. In case of a tie, you should find the course with the smallest course\_id. The output must be sorted by increasing student\_id.

The query result format is in the following example:

```undefined
+------------+-------------------+

| student_id | course_id | grade |

+------------+-----------+-------+

+------------+-----------+-------+

+------------+-------------------+

| student_id | course_id | grade |

+------------+-----------+-------+

+------------+-----------+-------+
```

### Solution

```sql
SELECT student_id, MIN(course_id) course_id, grade

WHERE (student_id, grade) IN

        (SELECT student_id, MAX(grade)
```

## 1113.Reported Posts | Easy | 🔒 [LeetCode](https://leetcode.com/problems/reported-posts)

Table: `Actions`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

There is no primary key for this table, it may have duplicate rows.

The action column is an ENUM type of ('view', 'like', 'reaction', 'comment', 'report', 'share').

The extra column has optional information about the action such as a reason for report or a type of reaction.
```

Write an SQL query that reports the number of posts reported yesterday for each report reason. Assume today is 2019-07-05.

The query result format is in the following example:

```undefined
+---------+---------+-------------+--------+--------+

| user_id | post_id | action_date | action | extra  |

+---------+---------+-------------+--------+--------+

| 1       | 1       | 2019-07-01  | view   | null   |

| 1       | 1       | 2019-07-01  | like   | null   |

| 1       | 1       | 2019-07-01  | share  | null   |

| 2       | 4       | 2019-07-04  | view   | null   |

| 2       | 4       | 2019-07-04  | report | spam   |

| 3       | 4       | 2019-07-04  | view   | null   |

| 3       | 4       | 2019-07-04  | report | spam   |

| 4       | 3       | 2019-07-02  | view   | null   |

| 4       | 3       | 2019-07-02  | report | spam   |

| 5       | 2       | 2019-07-04  | view   | null   |

| 5       | 2       | 2019-07-04  | report | racism |

| 5       | 5       | 2019-07-04  | view   | null   |

| 5       | 5       | 2019-07-04  | report | racism |

+---------+---------+-------------+--------+--------+

+---------------+--------------+

| report_reason | report_count |

+---------------+--------------+

+---------------+--------------+
```

Note that we only care about report reasons with non zero number of reports.

### Solution

```sql
SELECT extra report_reason, COUNT(DISTINCT post_id) report_count

    WHERE action_date = DATE_SUB('2019-07-05', INTERVAL 1 DAY) AND

          action = 'report') AS tmp
```

## 1126\. Active Businesses | Medium | 🔒 [LeetCode](https://leetcode.com/problems/active-businesses)

Table: `Events`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(business_id, event_type) is the primary key of this table.

Each row in the table logs the info that an event of some type occured at some business for a number of times.
```

Write an SQL query to find all active businesses.

An active business is a business that has more than one event type with occurences greater than the average occurences of that event type among all businesses.

The query result format is in the following example:

```undefined
+-------------+------------+------------+

| business_id | event_type | occurences |

+-------------+------------+------------+

+-------------+------------+------------+

Average for 'reviews', 'ads' and 'page views' are (7+3)/2=5, (11+7+6)/3=8, (3+12)/2=7.5 respectively.

Business with id 1 has 7 'reviews' events (more than 5) and 11 'ads' events (more than 8) so it is an active business.
```

### Solution

```sql
FROM (SELECT a.business_id, a.event_type, a.occurences, b.event_avg  -- sub 2

        (SELECT event_type, AVG(occurences) event_avg   -- sub 1

         GROUP BY event_type) b ON

      a.event_type = b.event_type) tmp

WHERE occurences > event_avg

HAVING COUNT(event_type) > 1
```

## 1127\. User Purchase Platform | Hard | 🔒 [LeetCode](https://leetcode.com/problems/user-purchase-platform)

Table: `Spending`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

The table logs the spendings history of users that make purchases from an online shopping website which has a desktop and a mobile application.

(user_id, spend_date, platform) is the primary key of this table.

The platform column is an ENUM type of ('desktop', 'mobile').
```

Write an SQL query to find the total number of users and the total amount spent using mobile only, desktop only and both mobile and desktop together for each date.

The query result format is in the following example:

```undefined
+---------+------------+----------+--------+

| user_id | spend_date | platform | amount |

+---------+------------+----------+--------+

| 1       | 2019-07-01 | mobile   | 100    |

| 1       | 2019-07-01 | desktop  | 100    |

| 2       | 2019-07-01 | mobile   | 100    |

| 2       | 2019-07-02 | mobile   | 100    |

| 3       | 2019-07-01 | desktop  | 100    |

| 3       | 2019-07-02 | desktop  | 100    |

+---------+------------+----------+--------+

+------------+----------+--------------+-------------+

| spend_date | platform | total_amount | total_users |

+------------+----------+--------------+-------------+

| 2019-07-01 | desktop  | 100          | 1           |

| 2019-07-01 | mobile   | 100          | 1           |

| 2019-07-01 | both     | 200          | 1           |

| 2019-07-02 | desktop  | 100          | 1           |

| 2019-07-02 | mobile   | 100          | 1           |

| 2019-07-02 | both     | 0            | 0           |

+------------+----------+--------------+-------------+

On 2019-07-01, user 1 purchased using both desktop and mobile, user 2 purchased using mobile only and user 3 purchased using desktop only.

On 2019-07-02, user 2 purchased using mobile only, user 3 purchased using desktop only and no one purchased using both platforms.
```

### Solution

```sql
       COALESCE(bb.total_amount, 0) total_amount,

       COALESCE(bb.total_users,0) total_users

    (SELECT DISTINCT(spend_date), a.platform   -- table aa

        (SELECT 'desktop' AS platform UNION

        SELECT 'mobile' AS platform UNION

        SELECT 'both' AS platform

    (SELECT spend_date,                      -- table bb

            SUM(amount) total_amount,

            COUNT(user_id) total_users

                (CASE COUNT(DISTINCT platform)

        GROUP BY spend_date, user_id

    GROUP BY spend_date, platform

    ON aa.platform = bb.platform AND

    aa.spend_date = bb.spend_date
```

## 1132\. Reported Posts II | Medium | 🔒 [LeetCode](https://leetcode.com/problems/reported-posts-ii)

Table: `Actions`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

There is no primary key for this table, it may have duplicate rows.

The action column is an ENUM type of ('view', 'like', 'reaction', 'comment', 'report', 'share').

The extra column has optional information about the action such as a reason for report or a type of reaction.
```

Table: `Removals`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

post_id is the primary key of this table.

Each row in this table indicates that some post was removed as a result of being reported or as a result of an admin review.
```

Write an SQL query to find the average for daily percentage of posts that got removed after being reported as spam, rounded to 2 decimal places.

The query result format is in the following example:

```undefined
+---------+---------+-------------+--------+--------+

| user_id | post_id | action_date | action | extra  |

+---------+---------+-------------+--------+--------+

| 1       | 1       | 2019-07-01  | view   | null   |

| 1       | 1       | 2019-07-01  | like   | null   |

| 1       | 1       | 2019-07-01  | share  | null   |

| 2       | 2       | 2019-07-04  | view   | null   |

| 2       | 2       | 2019-07-04  | report | spam   |

| 3       | 4       | 2019-07-04  | view   | null   |

| 3       | 4       | 2019-07-04  | report | spam   |

| 4       | 3       | 2019-07-02  | view   | null   |

| 4       | 3       | 2019-07-02  | report | spam   |

| 5       | 2       | 2019-07-03  | view   | null   |

| 5       | 2       | 2019-07-03  | report | racism |

| 5       | 5       | 2019-07-03  | view   | null   |

| 5       | 5       | 2019-07-03  | report | racism |

+---------+---------+-------------+--------+--------+

+---------+-------------+

| post_id | remove_date |

+---------+-------------+

+---------+-------------+

+-----------------------+

| average_daily_percent |

+-----------------------+

+-----------------------+

The percentage for 2019-07-04 is 50% because only one post of two spam reported posts was removed.

The percentage for 2019-07-02 is 100% because one post was reported as spam and it was removed.

The other days had no spam reports so the average is (50 + 100) / 2 = 75%

Note that the output is only one number and that we do not care about the remove dates.
```

### Solution

```sql
SELECT a.action_date, (COUNT(DISTINCT r.post_id))/(COUNT(DISTINCT a.post_id)) AS result

FROM (SELECT action_date, post_id

WHERE extra = 'spam' AND action = 'report') a

SELECT ROUND(AVG(t1.result)*100,2) AS  average_daily_percent
```

## 1141\. User Activity for the Past 30 Days I | Easy | 🔒 [LeetCode](https://leetcode.com/problems/user-activity-for-the-past-30-days-i)

Table: `Activity`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

There is no primary key for this table, it may have duplicate rows.

The activity_type column is an ENUM of type ('open_session', 'end_session', 'scroll_down', 'send_message').

The table shows the user activities for a social media website.

Note that each session belongs to exactly one user.
```

Write an SQL query to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on some day if he/she made at least one activity on that day.

The query result format is in the following example:

```undefined
+---------+------------+---------------+---------------+

| user_id | session_id | activity_date | activity_type |

+---------+------------+---------------+---------------+

| 1       | 1          | 2019-07-20    | open_session  |

| 1       | 1          | 2019-07-20    | scroll_down   |

| 1       | 1          | 2019-07-20    | end_session   |

| 2       | 4          | 2019-07-20    | open_session  |

| 2       | 4          | 2019-07-21    | send_message  |

| 2       | 4          | 2019-07-21    | end_session   |

| 3       | 2          | 2019-07-21    | open_session  |

| 3       | 2          | 2019-07-21    | send_message  |

| 3       | 2          | 2019-07-21    | end_session   |

| 4       | 3          | 2019-06-25    | open_session  |

| 4       | 3          | 2019-06-25    | end_session   |

+---------+------------+---------------+---------------+

+------------+--------------+

+------------+--------------+

+------------+--------------+

Note that we do not care about days with zero active users.
```

### Solution

```sql
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users

WHERE activity_date > '2019-06-26' AND activity_date < '2019-07-27'
```

## 1142\. User Activity for the Past 30 Days II | Easy | 🔒 [LeetCode](https://leetcode.com/problems/user-activity-for-the-past-30-days-ii)

Table: `Activity`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

There is no primary key for this table, it may have duplicate rows.

The activity_type column is an ENUM of type ('open_session', 'end_session', 'scroll_down', 'send_message').

The table shows the user activities for a social media website.

Note that each session belongs to exactly one user.
```

Write an SQL query to find the average number of sessions per user for a period of 30 days ending 2019-07-27 inclusively, rounded to 2 decimal places. The sessions we want to count for a user are those with at least one activity in that time period.

The query result format is in the following example:

```undefined
+---------+------------+---------------+---------------+

| user_id | session_id | activity_date | activity_type |

+---------+------------+---------------+---------------+

| 1       | 1          | 2019-07-20    | open_session  |

| 1       | 1          | 2019-07-20    | scroll_down   |

| 1       | 1          | 2019-07-20    | end_session   |

| 2       | 4          | 2019-07-20    | open_session  |

| 2       | 4          | 2019-07-21    | send_message  |

| 2       | 4          | 2019-07-21    | end_session   |

| 3       | 2          | 2019-07-21    | open_session  |

| 3       | 2          | 2019-07-21    | send_message  |

| 3       | 2          | 2019-07-21    | end_session   |

| 3       | 5          | 2019-07-21    | open_session  |

| 3       | 5          | 2019-07-21    | scroll_down   |

| 3       | 5          | 2019-07-21    | end_session   |

| 4       | 3          | 2019-06-25    | open_session  |

| 4       | 3          | 2019-06-25    | end_session   |

+---------+------------+---------------+---------------+

+---------------------------+

| average_sessions_per_user |

+---------------------------+

+---------------------------+

User 1 and 2 each had 1 session in the past 30 days while user 3 had 2 sessions so the average is (1 + 1 + 2) / 3 = 1.33.
```

### Solution

```sql
SELECT IFNULL(ROUND(AVG(a.num),2),0) AS average_sessions_per_user

SELECT COUNT(DISTINCT session_id) AS num

WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
```

## 1148\. Article Views I | Easy | 🔒 [LeetCode](https://leetcode.com/problems/article-views-i)

Table: `Views`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

There is no primary key for this table, it may have duplicate rows.

Each row of this table indicates that some viewer viewed an article (written by some author) on some date.

Note that equal author_id and viewer_id indicate the same person.
```

Write an SQL query to find all the authors that viewed at least one of their own articles, sorted in ascending order by their id.

The query result format is in the following example:

```undefined
+------------+-----------+-----------+------------+

| article_id | author_id | viewer_id | view_date  |

+------------+-----------+-----------+------------+

| 1          | 3         | 5         | 2019-08-01 |

| 1          | 3         | 6         | 2019-08-02 |

| 2          | 7         | 7         | 2019-08-01 |

| 2          | 7         | 6         | 2019-08-02 |

| 4          | 7         | 1         | 2019-07-22 |

| 3          | 4         | 4         | 2019-07-21 |

| 3          | 4         | 4         | 2019-07-21 |

+------------+-----------+-----------+------------+
```

### Solution

```sql
SELECT DISTINCT author_id AS id

WHERE author_id = viewer_id
```

## 1149\. Article Views II | Medium | 🔒 [LeetCode](https://leetcode.com/problems/article-views-ii)

Table: `Views`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

There is no primary key for this table, it may have duplicate rows.

Each row of this table indicates that some viewer viewed an article (written by some author) on some date.

Note that equal author_id and viewer_id indicate the same person.
```

Write an SQL query to find all the people who viewed more than one article on the same date, sorted in ascending order by their id.

The query result format is in the following example:

```undefined
+------------+-----------+-----------+------------+

| article_id | author_id | viewer_id | view_date  |

+------------+-----------+-----------+------------+

| 1          | 3         | 5         | 2019-08-01 |

| 3          | 4         | 5         | 2019-08-01 |

| 1          | 3         | 6         | 2019-08-02 |

| 2          | 7         | 7         | 2019-08-01 |

| 2          | 7         | 6         | 2019-08-02 |

| 4          | 7         | 1         | 2019-07-22 |

| 3          | 4         | 4         | 2019-07-21 |

| 3          | 4         | 4         | 2019-07-21 |

+------------+-----------+-----------+------------+
```

### Solution

```sql
SELECT DISTINCT viewer_id AS id#, COUNT(DISTINCT article_id) AS total

GROUP BY viewer_id, view_date

HAVING count(DISTINCT article_id)>1
```

## 1158\. Market Analysis I | Medium | 🔒 [LeetCode](https://leetcode.com/problems/market-analysis-i)

Table: `Users`

```undefined
+----------------+---------+

+----------------+---------+

| favorite_brand | varchar |

+----------------+---------+

user_id is the primary key of this table.

This table has the info of the users of an online shopping website where users can sell and buy items.
```

Table: `Orders`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

order_id is the primary key of this table.

item_id is a foreign key to the Items table.

buyer_id and seller_id are foreign keys to the Users table.
```

Table: `Items`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

item_id is the primary key of this table.
```

Write an SQL query to find for each user, the join date and the number of orders they made as a buyer in 2019.

The query result format is in the following example:

```undefined
+---------+------------+----------------+

| user_id | join_date  | favorite_brand |

+---------+------------+----------------+

| 1       | 2018-01-01 | Lenovo         |

| 2       | 2018-02-09 | Samsung        |

+---------+------------+----------------+

+----------+------------+---------+----------+-----------+

| order_id | order_date | item_id | buyer_id | seller_id |

+----------+------------+---------+----------+-----------+

| 1        | 2019-08-01 | 4       | 1        | 2         |

| 2        | 2018-08-02 | 2       | 1        | 3         |

| 3        | 2019-08-03 | 3       | 2        | 3         |

| 4        | 2018-08-04 | 1       | 4        | 2         |

| 5        | 2018-08-04 | 1       | 3        | 4         |

| 6        | 2019-08-05 | 2       | 2        | 4         |

+----------+------------+---------+----------+-----------+

+-----------+------------+----------------+

| buyer_id  | join_date  | orders_in_2019 |

+-----------+------------+----------------+

+-----------+------------+----------------+
```

### Solution

```sql
SELECT user_id AS buyer_id, join_date, coalesce(a.orders_in_2019,0)

SELECT buyer_id, coalesce(count(*), 0) AS orders_in_2019

ON u.user_id = o.buyer_id

WHERE extract('year' FROM order_date) = 2019

ON users.user_id = a.buyer_id
```

## 1159\. Market Analysis II | Hard | 🔒 [LeetCode](https://leetcode.com/problems/market-analysis-ii)

Table: `Users`

```undefined
+----------------+---------+

+----------------+---------+

| favorite_brand | varchar |

+----------------+---------+

user_id is the primary key of this table.

This table has the info of the users of an online shopping website where users can sell and buy items.
```

Table: `Orders`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

order_id is the primary key of this table.

item_id is a foreign key to the Items table.

buyer_id and seller_id are foreign keys to the Users table.
```

Table: `Items`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

item_id is the primary key of this table.
```

Write an SQL query to find for each user, whether the brand of the second item (by date) they sold is their favorite brand. If a user sold less than two items, report the answer for that user as no.

It is guaranteed that no seller sold more than one item on a day.

The query result format is in the following example:

```undefined
+---------+------------+----------------+

| user_id | join_date  | favorite_brand |

+---------+------------+----------------+

| 1       | 2019-01-01 | Lenovo         |

| 2       | 2019-02-09 | Samsung        |

+---------+------------+----------------+

+----------+------------+---------+----------+-----------+

| order_id | order_date | item_id | buyer_id | seller_id |

+----------+------------+---------+----------+-----------+

| 1        | 2019-08-01 | 4       | 1        | 2         |

| 2        | 2019-08-02 | 2       | 1        | 3         |

| 3        | 2019-08-03 | 3       | 2        | 3         |

| 4        | 2019-08-04 | 1       | 4        | 2         |

| 5        | 2019-08-04 | 1       | 3        | 4         |

| 6        | 2019-08-05 | 2       | 2        | 4         |

+----------+------------+---------+----------+-----------+

+-----------+--------------------+

| seller_id | 2nd_item_fav_brand |

+-----------+--------------------+

+-----------+--------------------+

The answer for the user with id 1 is no because they sold nothing.

The answer for the users with id 2 and 3 is yes because the brands of their second sold items are their favorite brands.

The answer for the user with id 4 is no because the brand of their second sold item is not their favorite brand.
```

### Solution

```sql
SELECT user_id AS seller_id,

       IF(ISNULL(item_brand), "no", "yes") AS 2nd_item_fav_brand

(SELECT seller_id, item_brand

FROM Orders INNER JOIN Items

ON Orders.item_id = Items.item_id

WHERE (seller_id, order_date) IN

(SELECT seller_id, MIN(order_date) AS order_date

 WHERE (seller_id, order_date) NOT IN

 (SELECT seller_id, MIN(order_date) FROM Orders GROUP BY seller_id)

ON Users.user_id = t.seller_id and favorite_brand = item_brand

CASE WHEN favorite_brand = item_brand THEN "yes"

END AS 2nd_item_fav_brand

(SELECT o.item_id, seller_id, item_brand, RANK() OVER(PARTITION BY seller_id ORDER BY order_date) AS rk

FROM orders o join items i

ON u.user_id = a.seller_id

SELECT u.user_id AS seller_id, COALESCE(2nd_item_fav_brand,"no") AS 2nd_item_fav_brand

FROM users u LEFT JOIN t1
```

## 1164\. Product Price at a Given Date | Medium | 🔒 [LeetCode](https://leetcode.com/problems/product-price-at-a-given-date)

Table: `Products`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(product_id, change_date) is the primary key of this table.

Each row of this table indicates that the price of some product was changed to a new price at some date.
```

Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

The query result format is in the following example:

```undefined
+------------+-----------+-------------+

| product_id | new_price | change_date |

+------------+-----------+-------------+

+------------+-----------+-------------+
```

### Solution

```sql
SELECT a.product_id, new_price

SELECT product_id, max(change_date) AS date

WHERE change_date<='2019-08-16'

ON a.product_id = p.product_id AND a.date = p.change_date),

SELECT distinct product_id

SELECT t2.product_id, coalesce(new_price,10) AS price

ON t2.product_id = t1.product_id

SELECT t1.product_id AS product_id, IF(ISNULL(t2.price), 10, t2.price) AS price

  (SELECT distinct product_id

  FROM Products) AS t1 LEFT JOIN

  (SELECT product_id, new_price AS price

   WHERE (product_id, change_date) in

      (SELECT product_id, max(change_date)

      WHERE change_date <='2019-08-16'

      GROUP BY product_id)) AS t2

ON t1.product_id = t2.product_id
```

## 1173\. Immediate Food Delivery I | Easy | 🔒 [LeetCode](https://leetcode.com/problems/immediate-food-delivery-i)

Table: `Delivery`

```undefined
+-----------------------------+---------+

+-----------------------------+---------+

| customer_pref_delivery_date | date    |

+-----------------------------+---------+

delivery_id is the primary key of this table.

The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).
```

If the preferred delivery date of the customer is the same as the order date then the order is called immediate otherwise it's called scheduled.

Write an SQL query to find the percentage of immediate orders in the table, **rounded to 2 decimal places**.

The query result format is in the following example:

```undefined
+-------------+-------------+------------+-----------------------------+

| delivery_id | customer_id | order_date | customer_pref_delivery_date |

+-------------+-------------+------------+-----------------------------+

| 1           | 1           | 2019-08-01 | 2019-08-02                  |

| 2           | 5           | 2019-08-02 | 2019-08-02                  |

| 3           | 1           | 2019-08-11 | 2019-08-11                  |

| 4           | 3           | 2019-08-24 | 2019-08-26                  |

| 5           | 4           | 2019-08-21 | 2019-08-22                  |

| 6           | 2           | 2019-08-11 | 2019-08-13                  |

+-------------+-------------+------------+-----------------------------+

The orders with delivery id 2 and 3 are immediate while the others are scheduled.
```

### Solution

```sql
ROUND(SUM(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE 0 END)/count(1)*100, 2) immediate_percentage

ROUND(avg(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE 0 END)*100,2) AS immediate_percentage
```

## 1174\. Immediate Food Delivery II | Medium | 🔒 [LeetCode](https://leetcode.com/problems/immediate-food-delivery-ii)

Table: `Delivery`

```undefined
+-----------------------------+---------+

+-----------------------------+---------+

| customer_pref_delivery_date | date    |

+-----------------------------+---------+

delivery_id is the primary key of this table.

The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).
```

If the preferred delivery date of the customer is the same as the order date then the order is called immediate otherwise it's called scheduled.

The first order of a customer is the order with the earliest order date that customer made. It is guaranteed that a customer has exactly one first order.

Write an SQL query to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

The query result format is in the following example:

```undefined
+-------------+-------------+------------+-----------------------------+

| delivery_id | customer_id | order_date | customer_pref_delivery_date |

+-------------+-------------+------------+-----------------------------+

| 1           | 1           | 2019-08-01 | 2019-08-02                  |

| 2           | 2           | 2019-08-02 | 2019-08-02                  |

| 3           | 1           | 2019-08-11 | 2019-08-12                  |

| 4           | 3           | 2019-08-24 | 2019-08-24                  |

| 5           | 3           | 2019-08-21 | 2019-08-22                  |

| 6           | 2           | 2019-08-11 | 2019-08-13                  |

| 7           | 4           | 2019-08-09 | 2019-08-09                  |

+-------------+-------------+------------+-----------------------------+

The customer id 1 has a first order with delivery id 1 and it is scheduled.

The customer id 2 has a first order with delivery id 2 and it is immediate.

The customer id 3 has a first order with delivery id 5 and it is scheduled.

The customer id 4 has a first order with delivery id 7 and it is immediate.

Hence, half the customers have immediate first orders.
```

### Solution

```sql
SELECT ROUND(SUM(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE 0 END)/count(DISTINCT customer_id)*100, 2) immediate_percentage

WHERE (customer_id, order_date) IN

    (SELECT customer_id, MIN(order_date)

SELECT ROUND(AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END)*100,2) as

 RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS rk
```

## 1179\. Reformat Department Table | Easy | [LeetCode](https://leetcode.com/problems/reformat-department-table/)

Table: `Department`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(id, month) is the primary key of this table.

The table has information about the revenue of each department per month.

The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
```

Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

The query result format is in the following example:

```undefined
+------+---------+-------+

+------+---------+-------+

+------+---------+-------+

+------+-------------+-------------+-------------+-----+-------------+

| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |

+------+-------------+-------------+-------------+-----+-------------+

| 1    | 8000        | 7000        | 6000        | ... | null        |

| 2    | 9000        | null        | null        | ... | null        |

| 3    | null        | 10000       | null        | ... | null        |

+------+-------------+-------------+-------------+-----+-------------+

Note that the result table has 13 columns (1 for the department id + 12 for the months).
```

### Solution

```sql
SUM(IF(month='Jan', revenue, NULL)) AS Jan_Revenue,

SUM(IF(month='Feb', revenue, NULL)) AS Feb_Revenue,

SUM(IF(month='Mar', revenue, NULL)) AS Mar_Revenue,

SUM(IF(month='Apr', revenue, NULL)) AS Apr_Revenue,

SUM(IF(month='May', revenue, NULL)) AS May_Revenue,

SUM(IF(month='Jun', revenue, NULL)) AS Jun_Revenue,

SUM(IF(month='Jul', revenue, NULL)) AS Jul_Revenue,

SUM(IF(month='Aug', revenue, NULL)) AS Aug_Revenue,

SUM(IF(month='Sep', revenue, NULL)) AS Sep_Revenue,

SUM(IF(month='Oct', revenue, NULL)) AS Oct_Revenue,

SUM(IF(month='Nov', revenue, NULL)) AS Nov_Revenue,

SUM(IF(month='Dec', revenue, NULL)) AS Dec_Revenue
```

## 1193\. Monthly Transactions I | Medium | 🔒 [LeetCode](https://leetcode.com/problems/monthly-transactions-i)

Table: `Transactions`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

id is the primary key of this table.

The table has information about incoming transactions.

The state column is an enum of type ["approved", "declined"].
```

Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

The query result format is in the following example:

```undefined
+------+---------+----------+--------+------------+

| id   | country | state    | amount | trans_date |

+------+---------+----------+--------+------------+

| 121  | US      | approved | 1000   | 2018-12-18 |

| 122  | US      | declined | 2000   | 2018-12-19 |

| 123  | US      | approved | 2000   | 2019-01-01 |

| 124  | DE      | approved | 2000   | 2019-01-07 |

+------+---------+----------+--------+------------+

+----------+---------+-------------+----------------+--------------------+-----------------------+

| month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |

+----------+---------+-------------+----------------+--------------------+-----------------------+

| 2018-12  | US      | 2           | 1              | 3000               | 1000                  |

| 2019-01  | US      | 1           | 1              | 2000               | 2000                  |

| 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |

+----------+---------+-------------+----------------+--------------------+-----------------------+
```

### Solution

```sql
SELECT DATE_FORMAT(trans_date,'%Y-%m') AS month, country, COUNT(state) AS trans_count, sum(amount) AS trans_total_amount

GROUP BY country, month(trans_date)),

SELECT DATE_FORMAT(trans_date,'%Y-%m') AS month, country, COUNT(state) AS approved_count, sum(amount) AS approved_total_amount

GROUP BY country, month(trans_date))

SELECT t1.month, t1.country, COALESCE(t1.trans_count,0) AS trans_count, COALESCE(t2.approved_count,0) AS approved_count, COALESCE(t1.trans_total_amount,0) AS trans_total_amount, COALESCE(t2.approved_total_amount,0) AS approved_total_amount

ON t1.country = t2.country and t1.month = t2.month
```

## 1194\. Tournament Winners | Hard | 🔒 [LeetCode](https://leetcode.com/problems/tournament-winners)

Table: `Players`

```undefined
player_id is the primary key of this table.

Each row of this table indicates the group of each player.
```

Table: `Matches`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

match_id is the primary key of this table.

Each row is a record of a match, first_player and second_player contain the player_id of each match.

first_score and second_score contain the number of points of the first_player and second_player respectively.

You may assume that, in each match, players belongs to the same group.
```

The winner in each group is the player who scored the maximum total points within the group. In the case of a tie, the lowest player\_id wins.

Write an SQL query to find the winner in each group.

The query result format is in the following example:

```undefined
+-----------+------------+

+-----------+------------+

+-----------+------------+

+------------+--------------+---------------+-------------+--------------+

| match_id   | first_player | second_player | first_score | second_score |

+------------+--------------+---------------+-------------+--------------+

+------------+--------------+---------------+-------------+--------------+

+-----------+------------+

+-----------+------------+

+-----------+------------+
```

### Solution

```sql
SELECT first_player, SUM(first_score) AS total

(SELECT first_player, first_score

SELECT second_player, second_score

SELECT *, COALESCE(total,0) AS score

FROM players p LEFT JOIN t1

ON p.player_id = t1.first_player)

SELECT group_id, player_id

(SELECT *, ROW_NUMBER() OVER(PARTITION BY group_id ORDER BY group_id, score DESC) AS rn
```

## 1204\. Last Person to Fit in the Elevator | Medium | 🔒 [LeetCode](https://leetcode.com/problems/last-person-to-fit-in-the-elevator)

Table: `Queue`

```undefined
+-------------+---------+

+-------------+---------+

| person_name | varchar |

+-------------+---------+

person_id is the primary key column for this table.

This table has the information about all people waiting for an elevator.

The person_id and turn columns will contain all numbers from 1 to n, where n is the number of rows in the table.
```

The maximum weight the elevator can hold is 1000.

Write an SQL query to find the person\_name of the last person who will fit in the elevator without exceeding the weight limit. It is guaranteed that the person who is first in the queue can fit in the elevator.

The query result format is in the following example:

```undefined
+-----------+-------------------+--------+------+

| person_id | person_name       | weight | turn |

+-----------+-------------------+--------+------+

| 5         | George Washington | 250    | 1    |

| 3         | John Adams        | 350    | 2    |

| 6         | Thomas Jefferson  | 400    | 3    |

| 2         | Will Johnliams    | 200    | 4    |

| 4         | Thomas Jefferson  | 175    | 5    |

| 1         | James Elephant    | 500    | 6    |

+-----------+-------------------+--------+------+

Queue table is ordered by turn in the example for simplicity.

In the example George Washington(id 5), John Adams(id 3) and Thomas Jefferson(id 6) will enter the elevator as their weight sum is 250 + 350 + 400 = 1000.

Thomas Jefferson(id 6) is the last person to fit in the elevator because he has the last turn in these three people.
```

### Solution

```sql
SUM(weight) OVER(ORDER BY turn) AS cum_weight

WHERE turn = (SELECT MAX(turn) FROM t1 WHERE t1.cum_weight<=1000)
```

## 1205\. Monthly Transactions II | Medium | 🔒 [LeetCode](https://leetcode.com/problems/monthly-transactions-ii)

Table: `Transactions`

```undefined
+----------------+---------+

+----------------+---------+

+----------------+---------+

id is the primary key of this table.

The table has information about incoming transactions.

The state column is an enum of type ["approved", "declined"].
```

Table: `Chargebacks`

```undefined
+----------------+---------+

+----------------+---------+

+----------------+---------+

Chargebacks contains basic information regarding incoming chargebacks from some transactions placed in Transactions table.

trans_id is a foreign key to the id column of Transactions table.

Each chargeback corresponds to a transaction made previously even if they were not approved.
```

Write an SQL query to find for each month and country, the number of approved transactions and their total amount, the number of chargebacks and their total amount.

Note: In your query, given the month and country, ignore rows with all zeros.

The query result format is in the following example:

```undefined
+------+---------+----------+--------+------------+

| id   | country | state    | amount | trans_date |

+------+---------+----------+--------+------------+

| 101  | US      | approved | 1000   | 2019-05-18 |

| 102  | US      | declined | 2000   | 2019-05-19 |

| 103  | US      | approved | 3000   | 2019-06-10 |

| 104  | US      | approved | 4000   | 2019-06-13 |

| 105  | US      | approved | 5000   | 2019-06-15 |

+------+---------+----------+--------+------------+

+------------+------------+

| trans_id   | trans_date |

+------------+------------+

+------------+------------+

+----------+---------+----------------+-----------------+-------------------+--------------------+

| month    | country | approved_count | approved_amount | chargeback_count  | chargeback_amount  |

+----------+`---------+----------------+-----------------+-------------------+--------------------+

| 2019-05  | US      | 1              | 1000            | 1                 | 2000               |

| 2019-06  | US      | 3              | 12000           | 1                 | 1000               |

| 2019-09  | US      | 0              | 0               | 1                 | 5000               |

+----------+---------+----------------+-----------------+-------------------+--------------------+
```

### Solution

```sql
(SELECT country, extract('month' FROM trans_date), state, COUNT(*) AS approved_count, SUM(amount) AS approved_amount

SELECT t.country, extract('month' FROM c.trans_date), SUM(amount) AS chargeback_amount, COUNT(*) AS chargeback_count

FROM chargebacks c LEFT JOIN transactions t

GROUP BY t.country, extract('month' FROM c.trans_date)),

SELECT t2.date_part, t2.country, COALESCE(approved_count,0) AS approved_count, COALESCE(approved_amount,0) AS approved_amount, COALESCE(chargeback_count,0) AS chargeback_count, COALESCE(chargeback_amount,0) AS chargeback_amount

ON t2.date_part = t1.date_part AND t2.country = t1.country),

SELECT t1.date_part, t1.country, COALESCE(approved_count,0) AS approved_count, COALESCE(approved_amount,0) AS approved_amount, COALESCE(chargeback_count,0) AS chargeback_count, COALESCE(chargeback_amount,0) AS chargeback_amount

ON t2.date_part = t1.date_part AND t2.country = t1.country)

    SUM(CASE WHEN type='approved' THEN 1 ELSE 0 END) AS approved_count,

    SUM(CASE WHEN type='approved' THEN amount ELSE 0 END) AS approved_amount,

    SUM(CASE WHEN type='chargeback' THEN 1 ELSE 0 END) AS chargeback_count,

    SUM(CASE WHEN type='chargeback' THEN amount ELSE 0 END) AS chargeback_amount

    SELECT left(t.trans_date, 7) AS month, t.country, amount,'approved' AS type

    SELECT left(c.trans_date, 7) AS month, t.country, amount,'chargeback' AS type

    FROM Transactions AS t JOIN Chargebacks AS c

GROUP BY tt.month, tt.country

    SUM(CASE WHEN type='approved' THEN count ELSE 0 END) AS approved_count,

    SUM(CASE WHEN type='approved' THEN amount ELSE 0 END) AS approved_amount,

    SUM(CASE WHEN type='chargeback' THEN count ELSE 0 END) AS chargeback_count,

    SUM(CASE WHEN type='chargeback' THEN amount ELSE 0 END) AS chargeback_amount

    SELECT LEFT(t.trans_date, 7) AS month, t.country,

    COUNT(1) AS count, SUM(amount) AS amount,'approved' AS type

    FROM Transactions AS t LEFT JOIN Chargebacks AS c

    GROUP BY LEFT(t.trans_date, 7), t.country

    SELECT LEFT(c.trans_date, 7) AS month, t.country,

        COUNT(1) AS count, SUM(amount) AS amount,'chargeback' AS type

    FROM Transactions AS t JOIN Chargebacks AS c

    GROUP BY LEFT(c.trans_date, 7), t.country

GROUP BY tt.month, tt.country
```

## 1211\. Queries Quality and Percentage | Easy | 🔒 [LeetCode](https://leetcode.com/problems/queries-quality-and-percentage)

Table: `Queries`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

There is no primary key for this table, it may have duplicate rows.

This table contains information collected from some queries on a database.

The position column has a value from 1 to 500.

The rating column has a value from 1 to 5. Query with rating less than 3 is a poor query.
```

We define query `quality` as:

-   The average of the ratio between query rating and its position.

We also define `poor query percentage` as:

-   The percentage of all queries with rating less than 3.

Write an SQL query to find each `query_name`, the `quality` and `poor_query_percentage`.

Both `quality` and `poor_query_percentage` should be rounded to **2 decimal places**.

The query result format is in the following example:

```undefined
+------------+-------------------+----------+--------+

| query_name | result            | position | rating |

+------------+-------------------+----------+--------+

| Dog        | Golden Retriever  | 1        | 5      |

| Dog        | German Shepherd   | 2        | 5      |

| Cat        | Shirazi           | 5        | 2      |

| Cat        | Siamese           | 3        | 3      |

+------------+-------------------+----------+--------+

+------------+---------+-----------------------+

| query_name | quality | poor_query_percentage |

+------------+---------+-----------------------+

+------------+---------+-----------------------+

Dog queries quality is ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50

Dog queries poor_ query_percentage is (1 / 3) * 100 = 33.33

Cat queries quality equals ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66

Cat queries poor_ query_percentage is (1 / 3) * 100 = 33.33
```

### Solution

```sql
SELECT query_name, ROUND(SUM(rating/position)/COUNT(*),2) AS quality,

ROUND(AVG(CASE WHEN rating<3 THEN 1 ELSE 0 END)*100,2) AS poor_query_percentage

SELECT query_name, ROUND(AVG(rating/position), 2) AS quality,

       ROUND(100*SUM(CASE WHEN rating<3 THEN 1 ELSE 0 END)/COUNT(1), 2) AS poor_query_percentage
```

## 1212\. Team Scores in Football Tournament | Medium | 🔒 [LeetCode](https://leetcode.com/problems/team-scores-in-football-tournament)

Table: `Teams`

```undefined
+---------------+----------+

+---------------+----------+

+---------------+----------+

team_id is the primary key of this table.

Each row of this table represents a single football team.
```

Table: `Matches`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

match_id is the primary key of this table.

Each row is a record of a finished match between two different teams.

Teams host_team and guest_team are represented by their IDs in the teams table (team_id) and they scored host_goals and guest_goals goals respectively.
```

You would like to compute the scores of all teams after all matches. Points are awarded as follows:

-   A team receives three points if they win a match (Score strictly more goals than the opponent team).
    
-   A team receives one point if they draw a match (Same number of goals as the opponent team).
    
-   A team receives no points if they lose a match (Score less goals than the opponent team).
    
    Write an SQL query that selects the team\_id, team\_name and num\_points of each team in the tournament after all described matches. Result table should be ordered by num\_points (decreasing order). In case of a tie, order the records by team\_id (increasing order).
    

The query result format is in the following example:

```undefined
+-----------+--------------+

+-----------+--------------+

+-----------+--------------+

+------------+--------------+---------------+-------------+--------------+

| match_id   | host_team    | guest_team    | host_goals  | guest_goals  |

+------------+--------------+---------------+-------------+--------------+

+------------+--------------+---------------+-------------+--------------+

+------------+--------------+---------------+

| team_id    | team_name    | num_points    |

+------------+--------------+---------------+

+------------+--------------+---------------+
```

### Solution

```sql
SELECT Teams.team_id, Teams.team_name,

    SUM(CASE WHEN team_id=host_team AND host_goals>guest_goals THEN 3 ELSE 0 END) +

    SUM(CASE WHEN team_id=host_team AND host_goals=guest_goals THEN 1 ELSE 0 END) +

    SUM(CASE WHEN team_id=guest_team AND host_goals<guest_goals THEN 3 ELSE 0 END) +

    SUM(CASE WHEN team_id=guest_team AND host_goals=guest_goals THEN 1 ELSE 0 END) AS num_points

FROM Teams LEFT JOIN Matches

ON Teams.team_id = Matches.host_team OR Teams.team_id = Matches.guest_team

ORDER BY num_points DESC, Teams.team_id ASC

SELECT Teams.team_id, Teams.team_name, SUM(if(isnull(num_points), 0, num_points)) AS num_points

        SELECT host_team AS team_id,

            SUM(CASE WHEN host_goals>guest_goals THEN 3

                     WHEN host_goals=guest_goals THEN 1

                     ELSE 0 END) AS num_points

        SELECT guest_team AS team_id,

            SUM(CASE WHEN host_goals<guest_goals THEN 3

                     WHEN host_goals=guest_goals THEN 1

                     ELSE 0 END) AS num_points

ON Teams.team_id = tt.team_id

ORDER BY num_points DESC, Teams.team_id ASC

SELECT Teams.team_id, Teams.team_name, IFNULL(SUM(num_points), 0) AS num_points

        SELECT host_team AS team_id,

            SUM(CASE WHEN host_goals>guest_goals THEN 3

                     WHEN host_goals=guest_goals THEN 1

                     ELSE 0 END) AS num_points

        SELECT guest_team AS team_id,

            SUM(CASE WHEN host_goals<guest_goals THEN 3

                     WHEN host_goals=guest_goals THEN 1

                     ELSE 0 END) AS num_points

ON Teams.team_id = tt.team_id

ORDER BY num_points DESC, Teams.team_id ASC

SELECT c.host_id, c.host_name, c.host_points

SELECT a.match_id, a.team_id AS host_id, a.team_name AS host_name, b.team_id AS guest_id, b.team_name AS guest_name, a.host_goals, a.guest_goals,

CASE WHEN a.host_goals > a.guest_goals THEN 3

     WHEN a.host_goals = a.guest_goals THEN 1

     ELSE 0 END AS host_points,

CASE WHEN a.host_goals < a.guest_goals THEN 3

     WHEN a.host_goals = a.guest_goals THEN 1

     ELSE 0 END AS guest_points

ON t.team_id = m.host_team) a

ON t.team_id = m.guest_team) b

ON a.match_id = b.match_id) c

SELECT d.guest_id, d.guest_name, d.guest_points

SELECT a.match_id, a.team_id AS host_id, a.team_name AS host_name, b.team_id AS guest_id, b.team_name AS guest_name, a.host_goals, a.guest_goals,

CASE WHEN a.host_goals > a.guest_goals THEN 3

     WHEN a.host_goals = a.guest_goals THEN 1

     ELSE 0 END AS host_points,

CASE WHEN a.host_goals < a.guest_goals THEN 3

     WHEN a.host_goals = a.guest_goals THEN 1

     ELSE 0 END AS guest_points

ON t.team_id = m.host_team) a

ON t.team_id = m.guest_team) b

ON a.match_id = b.match_id) d)

SELECT team_id, team_name, coalesce(total,0) AS num_points

SELECT host_id, host_name, SUM(host_points) AS total

GROUP BY host_id, host_name) e

ON t2.team_id = e.host_id

ORDER BY num_points DESC, team_id
```

## 1225\. Report Contiguous Dates | Hard | 🔒 [LeetCode](https://leetcode.com/problems/report-contiguous-dates)

Table: `Failed`

```undefined
+--------------+---------+

+--------------+---------+

+--------------+---------+

Primary key for this table is fail_date.

Failed table contains the days of failed tasks.
```

Table: `Succeeded`

```undefined
+--------------+---------+

+--------------+---------+

+--------------+---------+

Primary key for this table is success_date.

Succeeded table contains the days of succeeded tasks.
```

A system is running one task every day. Every task is independent of the previous tasks. The tasks can fail or succeed.

Write an SQL query to generate a report of period\_state for each continuous interval of days in the period from 2019-01-01 to 2019-12-31.

period\_state is 'failed' if tasks in this interval failed or 'succeeded' if tasks in this interval succeeded. Interval of days are retrieved as start\_date and end\_date.

Order result by start\_date.

The query result format is in the following example:

```undefined
+--------------+--------------+--------------+

| period_state | start_date   | end_date     |

+--------------+--------------+--------------+

| succeeded    | 2019-01-01   | 2019-01-03   |

| failed       | 2019-01-04   | 2019-01-05   |

| succeeded    | 2019-01-06   | 2019-01-06   |

+--------------+--------------+--------------+

The report ignored the system state in 2018 as we care about the system in the period 2019-01-01 to 2019-12-31.

From 2019-01-01 to 2019-01-03 all tasks succeeded and the system state was "succeeded".

From 2019-01-04 to 2019-01-05 all tasks failed and system state was "failed".

From 2019-01-06 to 2019-01-06 all tasks succeeded and system state was "succeeded".
```

### Solution

```sql
SELECT MIN(success_date) AS start_date, MAX(success_date) AS end_date, state

SELECT *, date_sub(success_date, interval ROW_NUMBER() OVER(ORDER BY success_date) day) AS diff, 1 AS state

WHERE success_date BETWEEN "2019-01-01" AND "2019-12-31") a

SELECT MIN(fail_date) AS start_date, MAX(fail_date) AS end_date, state

SELECT *, date_sub(fail_date, interval ROW_NUMBER() OVER(ORDER BY fail_date) day) AS diff, 0 AS state

WHERE fail_date BETWEEN "2019-01-01" AND "2019-12-31") b

CASE WHEN c.state = 1 THEN "succeeded"

END AS period_state,start_date, end_date

## First generate a list of dates

## Add group id for contiguous ranges

## Notice: dates themselves are contiguous

SELECT period_state, MIN(date) AS start_date, MAX(date) AS end_date

    SELECT period_state, date,

         @rank := CASE WHEN @prev = period_state THEN @rank ELSE @rank+1 END AS rank,

         @prev := period_state AS prev

        SELECT 'failed' AS period_state, fail_date AS date

        WHERE fail_date BETWEEN '2019-01-01' AND '2019-12-31'

        SELECT 'succeeded' AS period_state, success_date AS date

        WHERE success_date BETWEEN '2019-01-01' AND '2019-12-31') AS t,

        (SELECT @rank:=0, @prev:='') AS rows
```

## 1241\. Number of Comments per Post | Easy | 🔒 [LeetCode](https://leetcode.com/problems/number-of-comments-per-post)

Table: `Submissions`

```undefined
+---------------+----------+

+---------------+----------+

+---------------+----------+

There is no primary key for this table, it may have duplicate rows.

Each row can be a post or comment on the post.

parent_id is null for posts.

parent_id for comments is sub_id for another post in the table.
```

Write an SQL query to find number of comments per each post.

Result table should contain `post_id` and its corresponding `number_of_comments`, and must be sorted by `post_id` in ascending order.

`Submissions` may contain duplicate comments. You should count the number of unique comments per post.

`Submissions` may contain duplicate posts. You should treat them as one post.

The query result format is in the following example:

```undefined
+---------+--------------------+

| post_id | number_of_comments |

+---------+--------------------+

+---------+--------------------+

The post with id 1 has three comments in the table with id 3, 4 and 9. The comment with id 3 is repeated in the table, we counted it only once.

The post with id 2 has two comments in the table with id 5 and 10.

The post with id 12 has no comments in the table.

The comment with id 6 is a comment on a deleted post with id 7 so we ignored it.
```

### Solution

```sql
SELECT a.sub_id AS post_id, coalesce(b.number_of_comments,0) AS number_of_comments

SELECT DISTINCT sub_id FROM submissions WHERE parent_id IS NULL) a

SELECT parent_id, count(DISTINCT(sub_id)) AS number_of_comments

HAVING parent_id = any(SELECT sub_id from submissions WHERE parent_id IS NULL)) b

ON a.sub_id = b.parent_id
```

## 1251\. Average Selling Price | Easy | 🔒 [LeetCode](https://leetcode.com/problems/average-selling-price)

Table: `Prices`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(product_id, start_date, end_date) is the primary key for this table.

Each row of this table indicates the price of the product_id in the period from start_date to end_date.

For each product_id there will be no two overlapping periods. That means there will be no two intersecting periods for the same product_id.
```

Table: `UnitsSold`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

There is no primary key for this table, it may contain duplicates.

Each row of this table indicates the date, units and product_id of each product sold.
```

Write an SQL query to find the average selling price for each product.

average\_price should be rounded to 2 decimal places.

The query result format is in the following example:

```undefined
+------------+------------+------------+--------+

| product_id | start_date | end_date   | price  |

+------------+------------+------------+--------+

| 1          | 2019-02-17 | 2019-02-28 | 5      |

| 1          | 2019-03-01 | 2019-03-22 | 20     |

| 2          | 2019-02-01 | 2019-02-20 | 15     |

| 2          | 2019-02-21 | 2019-03-31 | 30     |

+------------+------------+------------+--------+

+------------+---------------+-------+

| product_id | purchase_date | units |

+------------+---------------+-------+

+------------+---------------+-------+

+------------+---------------+

| product_id | average_price |

+------------+---------------+

+------------+---------------+

Average selling price = Total Price of Product / Number of products sold.

Average selling price for product 1 = ((100 * 5) + (15 * 20)) / 115 = 6.96

Average selling price for product 2 = ((200 * 15) + (30 * 30)) / 230 = 16.96
```

### Solution

```sql
SELECT UnitsSold.product_id, ROUND(SUM(units*price)/SUM(units), 2) AS average_price

FROM UnitsSold INNER JOIN Prices

ON UnitsSold.product_id = Prices.product_id

AND UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_date

GROUP BY UnitsSold.product_id
```

## 1264\. Page Recommendations | Medium | 🔒 [LeetCode](https://leetcode.com/problems/page-recommendations)

Table: `Friendship`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(user1_id, user2_id) is the primary key for this table.

Each row of this table indicates that there is a friendship relation between user1_id and user2_id.
```

Table: `Likes`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

(user_id, page_id) is the primary key for this table.

Each row of this table indicates that user_id likes page_id.
```

Write an SQL query to recommend pages to the user with `user_id` = 1 using the pages that your friends liked. It should not recommend pages you already liked.

Return result table in any order without duplicates.

The query result format is in the following example:

```undefined
User one is friend with users 2, 3, 4 and 6.

Suggested pages are 23 from user 2, 24 from user 3, 56 from user 3 and 33 from user 6.

Page 77 is suggested from both user 2 and user 3.

Page 88 is not suggested because user 1 already likes it.
```

### Solution

```sql
SELECT DISTINCT page_id AS recommended_page

WHERE user_id IN (SELECT user2_id
```

## 1270\. All People Report to the Given Manager | Medium | 🔒 [LeetCode](https://leetcode.com/problems/all-people-report-to-the-given-manager)

Table: `Employees`

```undefined
+---------------+---------+

+---------------+---------+

| employee_name | varchar |

+---------------+---------+

employee_id is the primary key for this table.

Each row of this table indicates that the employee with ID employee_id and name employee_name reports his work to his/her direct manager with manager_id

The head of the company is the employee with employee_id = 1.
```

Write an SQL query to find `employee_id` of all employees that directly or indirectly report their work to the head of the company.

The indirect relation between managers will not exceed 3 managers as the company is small.

Return result table in any order without duplicates.

The query result format is in the following example:

```undefined
+-------------+---------------+------------+

| employee_id | employee_name | manager_id |

+-------------+---------------+------------+

+-------------+---------------+------------+

The head of the company is the employee with employee_id 1.

The employees with employee_id 2 and 77 report their work directly to the head of the company.

The employee with employee_id 4 report his work indirectly to the head of the company 4 --> 2 --> 1.

The employee with employee_id 7 report his work indirectly to the head of the company 7 --> 4 --> 2 --> 1.

The employees with employee_id 3, 8 and 9 don't report their work to head of company directly or indirectly.
```

### Solution

```sql
## t3: directly report to employee_id 1

## t2: directly report to t3

## t1: directly report to t2

FROM Employees AS t1 INNER JOIN Employees AS t2

ON t1.manager_id = t2.employee_id

ON t2.manager_id = t3.employee_id

WHERE t3.manager_id = 1 AND t1.employee_id != 1

SELECT distinct employee_id

    WHERE manager_id = 1) AS t

WHERE manager_id = 1 AND employee_id != 1

WHERE manager_id = any (SELECT employee_id

WHERE manager_id = 1 AND employee_id != 1)

WHERE manager_id = any (SELECT employee_id

WHERE manager_id = any (SELECT employee_id

WHERE manager_id = 1 AND employee_id != 1))
```

## 1280\. Students and Examinations| Easy | 🔒 [LeetCode](https://leetcode.com/problems/students-and-examinations)

Table: `Students`

```undefined
+---------------+---------+

+---------------+---------+

| student_name  | varchar |

+---------------+---------+

student_id is the primary key for this table.

Each row of this table contains the ID and the name of one student in the school.
```

Table: `Subjects`

```undefined
+--------------+---------+

+--------------+---------+

| subject_name | varchar |

+--------------+---------+

subject_name is the primary key for this table.

Each row of this table contains a name of one subject in the school.
```

Table: `Examinations`

```undefined
+--------------+---------+

+--------------+---------+

| subject_name | varchar |

+--------------+---------+

There is no primary key for this table. It may contain duplicates.

Each student from Students table takes every course from Subjects table.

Each row of this table indicates that a student with ID student_id attended the exam of subject_name.
```

Write an SQL query to find the number of times each student attended each exam.

Order the result table by student\_id and subject\_name.

The query result format is in the following example:

```undefined
+------------+--------------+

| student_id | student_name |

+------------+--------------+

+------------+--------------+

+------------+--------------+

| student_id | subject_name |

+------------+--------------+

+------------+--------------+

+------------+--------------+--------------+----------------+

| student_id | student_name | subject_name | attended_exams |

+------------+--------------+--------------+----------------+

| 1          | Alice        | Physics      | 2              |

| 1          | Alice        | Programming  | 1              |

| 2          | Bob          | Physics      | 0              |

| 2          | Bob          | Programming  | 1              |

| 6          | Alex         | Physics      | 0              |

| 6          | Alex         | Programming  | 0              |

| 13         | John         | Physics      | 1              |

| 13         | John         | Programming  | 1              |

+------------+--------------+--------------+----------------+

The result table should contain all students and all subjects.

Alice attended Math exam 3 times, Physics exam 2 times and Programming exam 1 time.

Bob attended Math exam 1 time, Programming exam 1 time and didn't attend the Physics exam.

Alex didn't attend any exam.

John attended Math exam 1 time, Physics exam 1 time and Programming exam 1 time.
```

### Solution

```sql
#Solution 1: count with null

SELECT Students.student_id, student_name, Subjects.subject_name, COUNT(Examinations.student_id) AS attended_exams

FROM Students JOIN Subjects

ON Students.student_id = Examinations.student_id AND Subjects.subject_name = Examinations.subject_name

GROUP BY Students.student_id, subject_name

#Solution 2: using ISNULL

SELECT Students.student_id, student_name, Subjects.subject_name, SUM(IF(ISNULL(Examinations.student_id), 0, 1)) AS attended_exams

FROM Students JOIN Subjects

ON Students.student_id = Examinations.student_id AND Subjects.subject_name = Examinations.subject_name

GROUP BY Students.student_id, subject_name

SELECT a.student_id AS student_id, a.student_name AS student_name, a.subject_name AS subject_name, coalesce(attended_exams,0) AS attended_exams

GROUP BY student_id, student_name, subject_name) a

(SELECT e.student_id, student_name, subject_name, COUNT(*) AS attended_exams

FROM examinations e JOIN students s

ON e.student_id = s.student_id

GROUP BY e.student_id, student_name, subject_name) b

ON a.student_id = b.student_id AND a.subject_name =b.subject_name

ORDER BY a.student_id ASC, a.subject_name ASC
```

## 1285\. Find the Start and End Number of Continuous Ranges | Medium | 🔒 [LeetCode](https://leetcode.com/problems/find-the-start-and-end-number-of-continuous-ranges)

Table: `Logs`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

id is the primary key for this table.

Each row of this table contains the ID in a log Table.
```

Since some IDs have been removed from Logs. Write an SQL query to find the start and end number of continuous ranges in table Logs.

Order the result table by start\_id.

The query result format is in the following example:

```undefined
+------------+--------------+

+------------+--------------+

+------------+--------------+

The result table should contain all ranges in table Logs.

From 1 to 3 is contained in the table.

From 4 to 6 is missing in the table

From 7 to 8 is contained in the table.

Number 9 is missing in the table.

Number 10 is contained in the table.
```

### Solution

```sql
SELECT MIN(log_id) AS start_id, MAX(log_id) AS end_id

SELECT log_id, log_id-ROW_NUMBER() OVER (ORDER BY log_id) AS rk

#Solution 2: Add temporary columns of rank and prev

SELECT MIN(log_id) AS START_ID, MAX(log_id) AS END_ID

        @rank := CASE WHEN @prev = log_id-1 THEN @rank ELSE @rank+1 END AS rank,

       (SELECT @rank:=0, @prev:=-1) AS rows) AS tt

# Solution 3: Find the starting and ending sequences, then merge two AS one table

## find the starting sequence: 1, 7, 10

## find the ending sequence: 3, 8, 10

## merge them AS one table

SELECT start_id, MIN(end_id) AS end_id

FROM (SELECT t1.log_id AS start_id

    FROM logs AS t1 LEFT JOIN logs AS t2

    ON t1.log_id-1 = t2.log_id

    WHERE t2.log_id IS NULL) tt_start join

    (SELECT t1.log_id AS end_id

    FROM logs AS t1 LEFT JOIN logs AS t2

    ON t1.log_id+1 = t2.log_id

    WHERE t2.log_id IS NULL) tt_end
```

## 1294\. Weather Type in Each Country | Easy | 🔒 [LeetCode](https://leetcode.com/problems/weather-type-in-each-country)

Table: `Countries`

```undefined
+---------------+---------+

+---------------+---------+

| country_name  | varchar |

+---------------+---------+

country_id is the primary key for this table.

Each row of this table contains the ID and the name of one country.
```

Table: `Weather`

```undefined
+---------------+---------+

+---------------+---------+

| weather_state | varchar |

+---------------+---------+

(country_id, day) is the primary key for this table.

Each row of this table indicates the weather state in a country for one day.
```

Write an SQL query to find the type of weather in each country for November 2019.

The type of weather is Cold if the average weather\_state is less than or equal 15, Hot if the average weather\_state is greater than or equal 25 and Warm otherwise.

Return result table in any order.

The query result format is in the following example:

```undefined
+------------+--------------+

| country_id | country_name |

+------------+--------------+

+------------+--------------+

+------------+---------------+------------+

| country_id | weather_state | day        |

+------------+---------------+------------+

+------------+---------------+------------+

+--------------+--------------+

| country_name | weather_type |

+--------------+--------------+

+--------------+--------------+

Average weather_state in USA in November is (15) / 1 = 15 so weather type is Cold.

Average weather_state in Austraila in November is (-2 + 0 + 3) / 3 = 0.333 so weather type is Cold.

Average weather_state in Peru in November is (25) / 1 = 25 so weather type is Hot.

Average weather_state in China in November is (16 + 18 + 21) / 3 = 18.333 so weather type is Warm.

Average weather_state in Morocco in November is (25 + 27 + 31) / 3 = 27.667 so weather type is Hot.

We know nothing about average weather_state in Spain in November so we don't include it in the result table.
```

### Solution

```sql
SELECT country_name, CASE WHEN AVG(weather_state) <= 15 THEN "Cold"

                          WHEN AVG(weather_state) >= 25 THEN "Hot"

                          ELSE "Warm" END AS weather_type

FROM Countries INNER JOIN Weather

ON Countries.country_id = Weather.country_id
```

## 1303\. Find the Team Size | Easy | 🔒 [LeetCode](https://leetcode.com/problems/find-the-team-size)

Table: `Employee`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

employee_id is the primary key for this table.

Each row of this table contains the ID of each employee and their respective team.
```

Write an SQL query to find the team size of each of the employees.

Return result table in any order.

The query result format is in the following example:

```undefined
+-------------+------------+

| employee_id | team_id    |

+-------------+------------+

+-------------+------------+

+-------------+------------+

| employee_id | team_size  |

+-------------+------------+

+-------------+------------+

Employees with Id 1,2,3 are part of a team with team_id = 8.

Employees with Id 4 is part of a team with team_id = 7.

Employees with Id 5,6 are part of a team with team_id = 9.
```

### Solution

```sql
SELECT employee_id, b.team_size

SELECT team_id, count(team_id) AS team_size
```

## 1308\. Running Total for Different Genders | Medium | 🔒 [LeetCode](https://leetcode.com/problems/running-total-for-different-genders)

Table: `Scores`

```undefined
+---------------+---------+

+---------------+---------+

| player_name   | varchar |

+---------------+---------+

(gender, day) is the primary key for this table.

A competition is held between females team and males team.

Each row of this table indicates that a player_name and with gender has scored score_point in someday.

Gender is 'F' if the player is in females team and 'M' if the player is in males team.
```

Write an SQL query to find the total score for each gender at each day.

Order the result table by gender and day

The query result format is in the following example:

```undefined
+-------------+--------+------------+--------------+

| player_name | gender | day        | score_points |

+-------------+--------+------------+--------------+

| Aron        | F      | 2020-01-01 | 17           |

| Alice       | F      | 2020-01-07 | 23           |

| Bajrang     | M      | 2020-01-07 | 7            |

| Khali       | M      | 2019-12-25 | 11           |

| Slaman      | M      | 2019-12-30 | 13           |

| Joe         | M      | 2019-12-31 | 3            |

| Jose        | M      | 2019-12-18 | 2            |

| Priya       | F      | 2019-12-31 | 23           |

| Priyanka    | F      | 2019-12-30 | 17           |

+-------------+--------+------------+--------------+

+--------+------------+-------+

+--------+------------+-------+

+--------+------------+-------+

First day is 2019-12-30, Priyanka scored 17 points and the total score for the team is 17.

Second day is 2019-12-31, Priya scored 23 points and the total score for the team is 40.

Third day is 2020-01-01, Aron scored 17 points and the total score for the team is 57.

Fourth day is 2020-01-07, Alice scored 23 points and the total score for the team is 80.

First day is 2019-12-18, Jose scored 2 points and the total score for the team is 2.

Second day is 2019-12-25, Khali scored 11 points and the total score for the team is 13.

Third day is 2019-12-30, Slaman scored 13 points and the total score for the team is 26.

Fourth day is 2019-12-31, Joe scored 3 points and the total score for the team is 29.

Fifth day is 2020-01-07, Bajrang scored 7 points and the total score for the team is 36.
```

### Solution

```sql
SUM(score_points) OVER(PARTITION BY gender ORDER BY day) AS total

SELECT t1.gender, t1.day, SUM(t2.score_points) AS total

FROM Scores AS t1 JOIN Scores AS t2

GROUP BY t1.gender, t1.day
```

## 1321\. Restaurant Growth | Medium | 🔒 [LeetCode](https://leetcode.com/problems/restaurant-growth)

Table: `Customer`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(customer_id, visited_on) is the primary key for this table.

This table contains data about customer transactions in a restaurant.

visited_on is the date on which the customer with ID (customer_id) have visited the restaurant.

amount is the total paid by a customer.
```

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Write an SQL query to compute moving average of how much customer paid in a 7 days window (current day + 6 days before) .

The query result format is in the following example:

Return result table ordered by visited\_on.

`average_amount` should be rounded to 2 decimal places, all dates are in the format ('YYYY-MM-DD').

```undefined
+-------------+--------------+--------------+-------------+

| customer_id | name         | visited_on   | amount      |

+-------------+--------------+--------------+-------------+

| 1           | Jhon         | 2019-01-01   | 100         |

| 2           | Daniel       | 2019-01-02   | 110         |

| 3           | Jade         | 2019-01-03   | 120         |

| 4           | Khaled       | 2019-01-04   | 130         |

| 5           | Winston      | 2019-01-05   | 110         |

| 6           | Elvis        | 2019-01-06   | 140         |

| 7           | Anna         | 2019-01-07   | 150         |

| 8           | Maria        | 2019-01-08   | 80          |

| 9           | Jaze         | 2019-01-09   | 110         |

| 1           | Jhon         | 2019-01-10   | 130         |

| 3           | Jade         | 2019-01-10   | 150         |

+-------------+--------------+--------------+-------------+

+--------------+--------------+----------------+

| visited_on   | amount       | average_amount |

+--------------+--------------+----------------+

| 2019-01-07   | 860          | 122.86         |

| 2019-01-08   | 840          | 120            |

| 2019-01-09   | 840          | 120            |

| 2019-01-10   | 1000         | 142.86         |

+--------------+--------------+----------------+

1st moving average from 2019-01-01 to 2019-01-07 has an average_amount of (100 + 110 + 120 + 130 + 110 + 140 + 150)/7 = 122.86

2nd moving average from 2019-01-02 to 2019-01-08 has an average_amount of (110 + 120 + 130 + 110 + 140 + 150 + 80)/7 = 120

3rd moving average from 2019-01-03 to 2019-01-09 has an average_amount of (120 + 130 + 110 + 140 + 150 + 80 + 110)/7 = 120

4th moving average from 2019-01-04 to 2019-01-10 has an average_amount of (130 + 110 + 140 + 150 + 80 + 110 + 130 + 150)/7 = 142.86
```

### Solution

```sql
SELECT visited_on, SUM(amount) OVER(ORDER BY visited_on ROWS 6 PRECEDING),

round(avg(amount) OVER(ORDER BY visited_on ROWS 6 PRECEDING),2)

SELECT visited_on, SUM(amount) AS amount

ORDER BY visited_on offset 6 ROWS

    SUM(t2.amount) AS amount,

    round(avg(t2.amount), 2) AS average_amount

    SELECT visited_on, SUM(amount) AS amount

    GROUP BY visited_on) AS t1

    SELECT visited_on, SUM(amount) AS amount

    GROUP BY visited_on) AS t2

ON t2.visited_on BETWEEN DATE_SUB(t1.visited_on, INTERVAL 6 DAY) and t1.visited_on
```

## 1322\. Ads Performance | Easy | 🔒 [LeetCode](https://leetcode.com/problems/ads-performance)

Table: `Ads`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(ad_id, user_id) is the primary key for this table.

Each row of this table contains the ID of an Ad, the ID of a user and the action taken by this user regarding this Ad.

The action column is an ENUM type of ('Clicked', 'Viewed', 'Ignored').
```

A company is running Ads and wants to calculate the performance of each Ad.

![](https://www.dsfaisal.com/_next/image?url=%2Fstatic%2Fimages%2Farticles%2Fsql-questions%2Fleetcode-sql-1322.png&w=1920&q=75)

**Round** `ctr` to 2 decimal points. **Order** the result table by `ctr` in descending order and by `ad_id` in ascending order in case of a tie.

The query result format is in the following example:

```undefined
+-------+---------+---------+

| ad_id | user_id | action  |

+-------+---------+---------+

+-------+---------+---------+

for ad_id = 1, ctr = (2/(2+1)) * 100 = 66.67

for ad_id = 2, ctr = (1/(1+2)) * 100 = 33.33

for ad_id = 3, ctr = (1/(1+1)) * 100 = 50.00

for ad_id = 5, ctr = 0.00, Note that ad_id = 5 has no clicks or views.

Note that we don't care about Ignored Ads.

Result table is ordered by the ctr. in case of a tie we order them by ad_id
```

### Solution

```sql
    (CASE WHEN clicks+views = 0 THEN 0 ELSE ROUND(clicks/(clicks+views)*100, 2) END) AS ctr

        SUM(CASE WHEN action='Clicked' THEN 1 ELSE 0 END) AS clicks,

        SUM(CASE WHEN action='Viewed' THEN 1 ELSE 0 END) AS views

ORDER BY ctr DESC, ad_id ASC

SELECT ad_id, SUM(CASE WHEN action in ('Clicked') THEN 1 ELSE 0 END) AS clicked

SELECT ad_id AS ad, SUM(CASE WHEN action in ('Clicked','Viewed') THEN 1 ELSE 0 END) AS total

SELECT a.ad_id, coalesce(round((clicked +0.0)/nullif((total +0.0),0)*100,2),0) AS ctr
```

## 1327\. List the Products Ordered in a Period | Easy | 🔒 [LeetCode](https://leetcode.com/problems/list-the-products-ordered-in-a-period)

Table: `Products`

```undefined
+------------------+---------+

+------------------+---------+

| product_name     | varchar |

| product_category | varchar |

+------------------+---------+

product_id is the primary key for this table.

This table contains data about the company's products.
```

Table: `Orders`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

There is no primary key for this table. It may have duplicate rows.

product_id is a foreign key to Products table.

unit is the number of products ordered in order_date.
```

Write an SQL query to get the names of products with greater than or equal to 100 units ordered in February 2020 and their amount.

Return result table in any order.

The query result format is in the following example:

```undefined
+-------------+-----------------------+------------------+

| product_id  | product_name          | product_category |

+-------------+-----------------------+------------------+

| 1           | Leetcode Solutions    | Book             |

| 2           | Jewels of Stringology | Book             |

| 5           | Leetcode Kit          | T-shirt          |

+-------------+-----------------------+------------------+

+--------------+--------------+----------+

| product_id   | order_date   | unit     |

+--------------+--------------+----------+

+--------------+--------------+----------+

+--------------------+---------+

+--------------------+---------+

| Leetcode Solutions | 130     |

+--------------------+---------+

Products with product_id = 1 is ordered in February a total of (60 + 70) = 130.

Products with product_id = 2 is ordered in February a total of 80.

Products with product_id = 3 is ordered in February a total of (2 + 3) = 5.

Products with product_id = 4 was not ordered in February 2020.

Products with product_id = 5 is ordered in February a total of (50 + 50) = 100.
```

### Solution

```sql
SELECT a.product_name, a.unit

(SELECT p.product_name, SUM(unit) AS unit

ON o.product_id = p.product_id

WHERE MONTH(order_date)=2 and YEAR(order_date) = 2020

SELECT product_name, SUM(unit) AS unit

FROM Products JOIN Orders

ON Products.product_id = Orders.product_id

WHERE left(order_date, 7) = "2020-02"

GROUP BY Products.product_id
```

## 1336\. Number of Transactions per Visit | Hard | 🔒 [LeetCode](https://leetcode.com/problems/number-of-transactions-per-visit)

Table: `Visits`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(user_id, visit_date) is the primary key for this table.

Each row of this table indicates that user_id has visited the bank in visit_date.
```

Table: `Transactions`

```undefined
+------------------+---------+

+------------------+---------+

| transaction_date | date    |

+------------------+---------+

There is no primary key for this table, it may contain duplicates.

Each row of this table indicates that user_id has done a transaction of amount in transaction_date.

It is guaranteed that the user has visited the bank in the transaction_date.(i.e The Visits table contains (user_id, transaction_date) in one row)
```

A bank wants to draw a chart of the number of transactions bank visitors did in one visit to the bank and the corresponding number of visitors who have done this number of transaction in one visit.

Write an SQL query to find how many users visited the bank and didn't do any transactions, how many visited the bank and did one transaction and so on.

The result table will contain two columns:

-   `transactions_count` which is the number of transactions done in one visit.
-   `visits_count` which is the corresponding number of users who did transactions\_count in one visit to the bank.  
    `transactions_count` should take all values from `0` to `max(transactions_count)` done by one or more users.

Order the result table by `transactions_count`.

The query result format is in the following example:

```undefined
+---------+------------------+--------+

| user_id | transaction_date | amount |

+---------+------------------+--------+

+---------+------------------+--------+

+--------------------+--------------+

| transactions_count | visits_count |

+--------------------+--------------+

+--------------------+--------------+

* For transactions_count = 0, The visits (1, "2020-01-01"), (2, "2020-01-02"), (12, "2020-01-01") and (19, "2020-01-03") did no transactions so visits_count = 4.

* For transactions_count = 1, The visits (2, "2020-01-03"), (7, "2020-01-11"), (8, "2020-01-28"), (1, "2020-01-02") and (1, "2020-01-04") did one transaction so visits_count = 5.

* For transactions_count = 2, No customers visited the bank and did two transactions so visits_count = 0.

* For transactions_count = 3, The visit (9, "2020-01-25") did three transactions so visits_count = 1.

* For transactions_count >= 4, No customers visited the bank and did more than three transactions so we will stop at transactions_count = 3
```

The chart drawn for this example is as follows:

![](https://www.dsfaisal.com/_next/image?url=%2Fstatic%2Fimages%2Farticles%2Fsql-questions%2Fleetcode-sql-1336.png&w=3840&q=75)

### Solution

```sql
                           COALESCE(num_visits,0) as num_visits,

                           COALESCE(num_trans,0) as num_trans

                          SELECT visit_date, user_id, COUNT(*) as num_visits

                         ON a.visit_date = b.transaction_date and a.user_id = b.user_id)

                      SELECT MAX(num_trans) as trans

SELECT trans as transactions_count,

       COALESCE(visits_count,0) as visits_count

                    SELECT num_trans as transactions_count, COALESCE(COUNT(*),0) as visits_count

ON a.transactions_count = t2.trans
```

## 1341\. Movie Rating | Medium | 🔒 [LeetCode](https://leetcode.com/problems/movie-rating)

Table: `Movies`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

movie_id is the primary key for this table.

title is the name of the movie.
```

Table: `Users`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

user_id is the primary key for this table.
```

Table: `Movie_Rating`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(movie_id, user_id) is the primary key for this table.

This table contains the rating of a movie by a user in their review.

created_at is the user's review date.
```

Write the following SQL query:

-   Find the name of the user who has rated the greatest number of the movies.  
    In case of a tie, return lexicographically smaller user name.
    
-   Find the movie name with the highest average rating in February 2020.  
    In case of a tie, return lexicographically smaller movie name..
    

Query is returned in 2 rows, the query result format is in the following example:

```undefined
+-------------+--------------+

+-------------+--------------+

+-------------+--------------+

+-------------+--------------+

+-------------+--------------+

+-------------+--------------+

+-------------+--------------+--------------+-------------+

| movie_id    | user_id      | rating       | created_at  |

+-------------+--------------+--------------+-------------+

| 1           | 1            | 3            | 2020-01-12  |

| 1           | 2            | 4            | 2020-02-11  |

| 1           | 3            | 2            | 2020-02-12  |

| 1           | 4            | 1            | 2020-01-01  |

| 2           | 1            | 5            | 2020-02-17  |

| 2           | 2            | 2            | 2020-02-01  |

| 2           | 3            | 2            | 2020-03-01  |

| 3           | 1            | 3            | 2020-02-22  |

| 3           | 2            | 4            | 2020-02-25  |

+-------------+--------------+--------------+-------------+

Daniel and Maria have rated 3 movies ("Avengers", "Frozen 2" and "Joker") but Daniel is smaller lexicographically.

Frozen 2 and Joker have a rating average of 3.5 in February but Frozen 2 is smaller lexicographically.
```

### Solution

```sql
FROM Movie_Rating JOIN Users

ON Movie_Rating.user_id = Users.user_id

GROUP BY Movie_Rating.user_id

ORDER BY count(1) DESC, name

FROM Movie_Rating JOIN Movies

ON Movie_Rating.movie_id = Movies.movie_id

WHERE left(created_at, 7) = "2020-02"

GROUP BY Movie_Rating.movie_id

ORDER BY avg(rating) DESC, title

rank() OVER(ORDER BY count(*) DESC) AS rk

SELECT title, round(avg(rating),1) AS rnd

on m.movie_id = u.movie_id

WHERE month(created_at) = 2

ORDER BY rnd DESC, title) b
```

## 1350\. Students With Invalid Departments | Easy | 🔒 [LeetCode](https://leetcode.com/problems/students-with-invalid-departments)

Table: `Departments`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

id is the primary key of this table.

The table has information about the id of each department of a university.
```

Table: `Students`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

id is the primary key of this table.

The table has information about the id of each student at a university and the id of the department he/she studies at.
```

Write an SQL query to find the id and the name of all students who are enrolled in departments that no longer exists.

Return the result table in any order.

The query result format is in the following example:

```undefined
+------+--------------------------+

+------+--------------------------+

| 1    | Electrical Engineering   |

| 7    | Computer Engineering     |

| 13   | Bussiness Administration |

+------+--------------------------+

+------+----------+---------------+

| id   | name     | department_id |

+------+----------+---------------+

+------+----------+---------------+

John, Daiana, Steve and Jasmine are enrolled in departments 14, 33, 74 and 77 respectively. department 14, 33, 74 and 77 doesn't exist in the Departments table.
```

### Solution

```sql
FROM students s LEFT JOIN

ON s.department_id = d.id

WHERE department_id NOT IN

    (SELECT id FROM Departments)
```

## 1355\. Activity Participants | Medium | 🔒 [LeetCode](https://leetcode.com/problems/activity-participants)

Table: `Friends`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

id is the id of the friend and primary key for this table.

name is the name of the friend.

activity is the name of the activity which the friend takes part in.
```

Table: `Activities`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

id is the primary key for this table.

name is the name of the activity.
```

Write an SQL query to find the names of all the activities with neither maximum, nor minimum number of participants.

Return the result table in any order. Each activity in table Activities is performed by any person in the table Friends.

The query result format is in the following example:

```undefined
+------+--------------+---------------+

+------+--------------+---------------+

| 1    | Jonathan D.  | Eating        |

| 2    | Jade W.      | Singing       |

| 3    | Victor J.    | Singing       |

| 4    | Elvis Q.     | Eating        |

| 5    | Daniel A.    | Eating        |

| 6    | Bob B.       | Horse Riding  |

+------+--------------+---------------+

Eating activity is performed by 3 friends, maximum number of participants, (Jonathan D. , Elvis Q. and Daniel A.)

Horse Riding activity is performed by 1 friend, minimum number of participants, (Bob B.)

Singing is performed by 2 friends (Victor J. and Jade W.)
```

### Solution

```sql
(SELECT COUNT(*) AS cnt, activity FROM Friends GROUP BY activity)

    (SELECT MAX(cnt) FROM CTE

    SELECT MIN(cnt) FROM CTE)

SELECT MAX(a.total) AS total

    SELECT activity, COUNT(*) AS total

SELECT MIN(b.total) AS low

    SELECT activity, COUNT(*) AS total

    SELECT activity, COUNT(*) AS total
```

## 1364\. Number of Trusted Contacts of a Customer | Medium | 🔒 [LeetCode](https://leetcode.com/problems/number-of-trusted-contacts-of-a-customer)

Table: `Customers`

```undefined
+---------------+---------+

+---------------+---------+

| customer_name | varchar |

+---------------+---------+

customer_id is the primary key for this table.

Each row of this table contains the name and the email of a customer of an online shop.
```

Table: `Contacts`

```undefined
+---------------+---------+

+---------------+---------+

| contact_name  | varchar |

| contact_email | varchar |

+---------------+---------+

(user_id, contact_email) is the primary key for this table.

Each row of this table contains the name and email of one contact of customer with user_id.

This table contains information about people each customer trust. The contact may or may not exist in the Customers table.
```

Table: `Invoices`

```undefined
+--------------+---------+

+--------------+---------+

+--------------+---------+

invoice_id is the primary key for this table.

Each row of this table indicates that user_id has an invoice with invoice_id and a price.
```

Write an SQL query to find the following for each invoice\_id:

-   customer\_name: The name of the customer the invoice is related to.
-   price: The price of the invoice.
-   contacts\_cnt: The number of contacts related to the customer.
-   trusted\_contacts\_cnt: The number of contacts related to the customer and at the same time they are customers to the shop. (i.e His/Her email exists in the Customers table.) Order the result table by invoice\_id.

The query result format is in the following example:

```undefined
+-------------+---------------+--------------------+

| customer_id | customer_name | email              |

+-------------+---------------+--------------------+

| 1           | Alice         | alice@leetcode.com |

| 2           | Bob           | bob@leetcode.com   |

| 13          | John          | john@leetcode.com  |

| 6           | Alex          | alex@leetcode.com  |

+-------------+---------------+--------------------+

+-------------+--------------+--------------------+

| user_id     | contact_name | contact_email      |

+-------------+--------------+--------------------+

| 1           | Bob          | bob@leetcode.com   |

| 1           | John         | john@leetcode.com  |

| 1           | Jal          | jal@leetcode.com   |

| 2           | Omar         | omar@leetcode.com  |

| 2           | Meir         | meir@leetcode.com  |

| 6           | Alice        | alice@leetcode.com |

+-------------+--------------+--------------------+

+------------+-------+---------+

| invoice_id | price | user_id |

+------------+-------+---------+

+------------+-------+---------+

+------------+---------------+-------+--------------+----------------------+

| invoice_id | customer_name | price | contacts_cnt | trusted_contacts_cnt |

+------------+---------------+-------+--------------+----------------------+

| 44         | Alex          | 60    | 1            | 1                    |

| 55         | John          | 500   | 0            | 0                    |

| 66         | Bob           | 400   | 2            | 0                    |

| 77         | Alice         | 100   | 3            | 2                    |

| 88         | Alice         | 200   | 3            | 2                    |

| 99         | Bob           | 300   | 2            | 0                    |

+------------+---------------+-------+--------------+----------------------+

Alice has three contacts, two of them are trusted contacts (Bob and John).

Bob has two contacts, none of them is a trusted contact.

Alex has one contact and it is a trusted contact (Alice).

John doesn't have any contacts.
```

### Solution

```sql
SELECT invoice_id, customer_name, price,

 COUNT(Contacts.user_id) AS contacts_cnt,

 SUM(CASE WHEN Contacts.contact_name IN

    (SELECT customer_name FROM Customers)

    THEN 1 ELSE 0 END) AS trusted_contacts_cnt

FROM Invoices INNER JOIN Customers ON Invoices.user_id = Customers.customer_id

LEFT JOIN Contacts ON Customers.customer_id = Contacts.user_id

GROUP BY Invoices.invoice_id, customer_name

ORDER BY Invoices.invoice_id
```

## 1369\. Get the Second Most Recent Activity | Hard | 🔒 [LeetCode](https://leetcode.com/problems/get-the-second-most-recent-activity)

Table: `UserActivity`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

This table does not contain primary key.

This table contain information about the activity performed of each user in a period of time.

A person with username performed a activity from startDate to endDate.
```

Write an SQL query to show the second most recent activity of each user.

If the user only has one activity, return that one.

A user can't perform more than one activity at the same time. Return the result table in any order.

The query result format is in the following example:

```undefined
+------------+--------------+-------------+-------------+

| username   | activity     | startDate   | endDate     |

+------------+--------------+-------------+-------------+

| Alice      | Travel       | 2020-02-12  | 2020-02-20  |

| Alice      | Dancing      | 2020-02-21  | 2020-02-23  |

| Alice      | Travel       | 2020-02-24  | 2020-02-28  |

| Bob        | Travel       | 2020-02-11  | 2020-02-18  |

+------------+--------------+-------------+-------------+

+------------+--------------+-------------+-------------+

| username   | activity     | startDate   | endDate     |

+------------+--------------+-------------+-------------+

| Alice      | Dancing      | 2020-02-21  | 2020-02-23  |

| Bob        | Travel       | 2020-02-11  | 2020-02-18  |

+------------+--------------+-------------+-------------+

The most recent activity of Alice is Travel from 2020-02-24 to 2020-02-28, before that she was dancing from 2020-02-21 to 2020-02-23.

Bob only has one record, we just take that one.
```

### Solution

```sql
FROM UserActivity AS a LEFT JOIN UserActivity AS b

on a.username = b.username AND a.endDate<b.endDate

GROUP BY a.username, a.endDate

HAVING count(b.endDate) = 1)
```

## 1378\. Replace Employee ID With The Unique Identifier | Easy | 🔒 [LeetCode](https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier)

Table: `Employees`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

id is the primary key for this table.

Each row of this table contains the id and the name of an employee in a company.
```

Table: `EmployeeUNI`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(id, unique_id) is the primary key for this table.

Each row of this table contains the id and the corresponding unique id of an employee in the company.
```

Write an SQL query to show the unique ID of each user, If a user doesn't have a unique ID replace just show null.

Return the result table in any order.

The query result format is in the following example:

```undefined
Alice and Bob don't have a unique ID, We will show null instead.

The unique ID of Meir is 2.

The unique ID of Winston is 3.

The unique ID of Jonathan is 1.
```

### Solution

```sql
ON Employees.id = EmployeeUNI.id
```

## 1384\. Total Sales Amount by Year | Hard | 🔒 [LeetCode](https://leetcode.com/problems/total-sales-amount-by-year)

Table: `Product`

+---------------+---------+ | Column Name | Type | +---------------+---------+ | product\_id | int | | product\_name | varchar | +---------------+---------+ product\_id is the primary key for this table. product\_name is the name of the product.

Table: `Sales`

```undefined
+---------------------+---------+

+---------------------+---------+

| period_start        | varchar |

| average_daily_sales | int     |

+---------------------+---------+

product_id is the primary key for this table.

period_start and period_end indicates the start and end date for sales period, both dates are inclusive.

The average_daily_sales column holds the average daily sales amount of the items for the period.
```

Write an SQL query to report the Total sales amount of each item for each year, with corresponding product name, product\_id, product\_name and report\_year.

Dates of the sales years are between 2018 to 2020. Return the result table **ordered** by product\_id and report\_year.

The query result format is in the following example:

```undefined
+------------+--------------+

| product_id | product_name |

+------------+--------------+

+------------+--------------+

+------------+--------------+-------------+---------------------+

| product_id | period_start | period_end  | average_daily_sales |

+------------+--------------+-------------+---------------------+

| 1          | 2019-01-25   | 2019-02-28  | 100                 |

| 2          | 2018-12-01   | 2020-01-01  | 10                  |

| 3          | 2019-12-01   | 2020-01-31  | 1                   |

+------------+--------------+-------------+---------------------+

+------------+--------------+-------------+--------------+

| product_id | product_name | report_year | total_amount |

+------------+--------------+-------------+--------------+

| 1          | LC Phone     |    2019     | 3500         |

| 2          | LC T-Shirt   |    2018     | 310          |

| 2          | LC T-Shirt   |    2019     | 3650         |

| 2          | LC T-Shirt   |    2020     | 10           |

| 3          | LC Keychain  |    2019     | 31           |

| 3          | LC Keychain  |    2020     | 31           |

+------------+--------------+-------------+--------------+

LC Phone was sold for the period of 2019-01-25 to 2019-02-28, and there are 35 days for this period. Total amount 35*100 = 3500.

LC T-shirt was sold for the period of 2018-12-01 to 2020-01-01, and there are 31, 365, 1 days for years 2018, 2019 and 2020 respectively.

LC Keychain was sold for the period of 2019-12-01 to 2020-01-31, and there are 31, 31 days for years 2019 and 2020 respectively.
```

### Solution

```sql
        WHEN YEAR(b.period_start)=YEAR(b.period_end) AND a.yr=YEAR(b.period_start) THEN DATEDIFF(b.period_end,b.period_start)+1

        WHEN a.yr=YEAR(b.period_start) THEN DATEDIFF(DATE_FORMAT(b.period_start,'%Y-12-31'),b.period_start)+1

        WHEN a.yr=YEAR(b.period_end) THEN DAYOFYEAR(b.period_end)

        WHEN a.yr>YEAR(b.period_start) AND a.yr<YEAR(b.period_end) THEN 365

    END * average_daily_sales AS total_amount

    (SELECT product_id,product_name,'2018' AS yr FROM Product

    SELECT product_id,product_name,'2019' AS yr FROM Product

    SELECT product_id,product_name,'2020' AS yr FROM Product) a

    ON a.product_id=b.product_id

ORDER BY b.product_id,a.yr
```

## 1393\. Capital Gain/Loss | Medium | 🔒 [LeetCode](https://leetcode.com/problems/capital-gainloss)

Table: `Stocks`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(stock_name, day) is the primary key for this table.

The operation column is an ENUM of type ('Sell', 'Buy')

Each row of this table indicates that the stock which has stock_name had an operation on the day operation_day with the price.

It is guaranteed that each 'Sell' operation for a stock has a corresponding 'Buy' operation in a previous day.
```

Write an SQL query to report the Capital gain/loss for each stock.

The capital gain/loss of a stock is total gain or loss after buying and selling the stock one or many times.

Return the result table in any order.

The query result format is in the following example:

```undefined
+---------------+-----------+---------------+--------+

| stock_name    | operation | operation_day | price  |

+---------------+-----------+---------------+--------+

| Leetcode      | Buy       | 1             | 1000   |

| Corona Masks  | Buy       | 2             | 10     |

| Leetcode      | Sell      | 5             | 9000   |

| Handbags      | Buy       | 17            | 30000  |

| Corona Masks  | Sell      | 3             | 1010   |

| Corona Masks  | Buy       | 4             | 1000   |

| Corona Masks  | Sell      | 5             | 500    |

| Corona Masks  | Buy       | 6             | 1000   |

| Handbags      | Sell      | 29            | 7000   |

| Corona Masks  | Sell      | 10            | 10000  |

+---------------+-----------+---------------+--------+

+---------------+-------------------+

| stock_name    | capital_gain_loss |

+---------------+-------------------+

+---------------+-------------------+

Leetcode stock was bought at day 1 for 1000$ and was sold at day 5 for 9000$. Capital gain = 9000 - 1000 = 8000$.

Handbags stock was bought at day 17 for 30000$ and was sold at day 29 for 7000$. Capital loss = 7000 - 30000 = -23000$.

Corona Masks stock was bought at day 1 for 10$ and was sold at day 3 for 1010$. It was bought again at day 4 for 1000$ and was sold at day 5 for 500$. At last, it was bought at day 6 for 1000$ and was sold at day 10 for 10000$. Capital gain/loss is the sum of capital gains/losses for each ('Buy' --> 'Sell') operation = (1010 - 10) + (500 - 1000) + (10000 - 1000) = 1000 - 500 + 9000 = 9500$.
```

### Solution

```sql
       SUM(CASE WHEN operation = 'Buy' THEN -price ELSE price END) AS capital_gain_loss

SELECT stock_name, (one-two) AS capital_gain_loss

(SELECT stock_name, sum(price) AS one

(SELECT stock_name AS name, sum(price) AS two

ON b.stock_name = c.name)

ORDER BY capital_gain_loss DESC;
```

## 1398\. Customers Who Bought Products A and B but Not C | Medium | 🔒 [LeetCode](https://leetcode.com/problems/customers-who-bought-products-a-and-b-but-not-c)

Table: `Customers`

```undefined
+---------------------+---------+

+---------------------+---------+

| customer_name       | varchar |

+---------------------+---------+

customer_id is the primary key for this table.

customer_name is the name of the customer.
```

Table: `Orders`

```undefined
+---------------+---------+

+---------------+---------+

| product_name  | varchar |

+---------------+---------+

order_id is the primary key for this table.

customer_id is the id of the customer who bought the product "product_name".
```

Write an SQL query to report the customer\_id and customer\_name of customers who bought products "A", "B" but did not buy the product "C" since we want to recommend them buy this product.

Return the result table ordered by customer\_id.

The query result format is in the following example.

```undefined
+-------------+---------------+

| customer_id | customer_name |

+-------------+---------------+

+-------------+---------------+

+------------+--------------+---------------+

| order_id   | customer_id  | product_name  |

+------------+--------------+---------------+

+------------+--------------+---------------+

+-------------+---------------+

| customer_id | customer_name |

+-------------+---------------+

+-------------+---------------+

Only the customer_id with id 3 bought the product A and B but not the product C.
```

### Solution

```sql
WHERE product_name = 'B' AND

customer_id IN (SELECT customer_id

WHERE product_name = 'A'))

SELECT t1.customer_id, c.customer_name

ON t1.customer_id = c.customer_id

WHERE t1.customer_id != all(SELECT customer_id

WHERE product_name = 'C')

    (SELECT DISTINCT customer_id

    (SELECT DISTINCT customer_id

    (SELECT DISTINCT customer_id

     sum(CASE WHEN product_name = 'A' THEN 1 ELSE 0 END) AS product_a,

     sum(CASE WHEN product_name = 'B' THEN 1 ELSE 0 END) AS product_b

    GROUP BY customer_id) AS t JOIN Customers

ON t.customer_id = Customers.customer_id

WHERE t.product_a>0 AND product_b >0 AND Customers.customer_id NOT IN (

    SELECT DISTINCT customer_id

    WHERE product_name = 'C')

ORDER BY Customers.customer_id
```

## 1407\. Top Travellers | Easy | 🔒 [LeetCode](https://leetcode.com/problems/top-travellers)

Table: `Users`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

id is the primary key for this table.

name is the name of the user.
```

Table: `Rides`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

id is the primary key for this table.

city_id is the id of the city who bought the product "product_name".
```

Write an SQL query to report the distance travelled by each user.

Return the result table ordered by `travelled_distance` in descending order, if two or more users travelled the same distance, order them by their `name` in ascending order.

The query result format is in the following example.

```undefined
+------+----------+----------+

| id   | user_id  | distance |

+------+----------+----------+

+------+----------+----------+

+----------+--------------------+

| name     | travelled_distance |

+----------+--------------------+

+----------+--------------------+

Elvis and Lee travelled 450 miles, Elvis is the top traveller as his name is alphabetically smaller than Lee.

Bob, Jonathan, Alex and Alice have only one ride and we just order them by the total distances of the ride.

Donald didn't have any rides, the distance travelled by him is 0.
```

### Solution

```sql
SELECT U.name AS name, COALESCE(SUM(R.distance),0) AS travelled_distance

FROM Users U LEFT JOIN Rides R

ORDER BY travelled_distance DESC, name

SELECT name, IFNULL(SUM(distance), 0) AS travelled_distance

FROM Users LEFT JOIN Rides

ON Users.id = Rides.user_id

ORDER BY travelled_distance DESC, name

SELECT name, SUM(IF(ISNULL(distance), 0, distance)) AS travelled_distance

FROM Users LEFT JOIN Rides

ON Users.id = Rides.user_id

ORDER BY travelled_distance DESC, name
```

## 1412\. Find the Quiet Students in All Exams | Hard | 🔒 [LeetCode](https://leetcode.com/problems/find-the-quiet-students-in-all-exams)

Table: `Student`

```undefined
+---------------------+---------+

+---------------------+---------+

| student_name        | varchar |

+---------------------+---------+

student_id is the primary key for this table.

student_name is the name of the student.
```

Table: `Exam`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(exam_id, student_id) is the primary key for this table.

Student with student_id got score points in exam with id exam_id.
```

A "quite" student is the one who took at least one exam and didn't score neither the high score nor the low score.

Write an SQL query to report the students (student\_id, student\_name) being "quiet" in **ALL** exams.

Don't return the student who has never taken any exam. Return the result table ordered by student\_id.

The query result format is in the following example.

```undefined
+-------------+---------------+

| student_id  | student_name  |

+-------------+---------------+

+-------------+---------------+

+------------+--------------+-----------+

| exam_id    | student_id   | score     |

+------------+--------------+-----------+

+------------+--------------+-----------+

+-------------+---------------+

| student_id  | student_name  |

+-------------+---------------+

+-------------+---------------+

For exam 1: Student 1 and 3 hold the lowest and high score respectively.

For exam 2: Student 1 hold both highest and lowest score.

For exam 3 and 4: Studnet 1 and 4 hold the lowest and high score respectively.

Student 2 and 5 have never got the highest or lowest in any of the exam.

Since student 5 is not taking any exam, he is excluded from the result.

So, we only return the information of Student 2.
```

### Solution

```sql
MIN(score) OVER(PARTITION BY exam_id) AS least,

MAX(score) OVER(PARTITION BY exam_id) AS most

WHERE least = score OR most = score)

SELECT DISTINCT student_id, student_name

WHERE student_id != all(SELECT student_id FROM t1)

SELECT DISTINCT Student.*

FROM Student INNER JOIN Exam

ON Student.student_id = Exam.student_id

WHERE student.student_id NOT IN

    FROM Exam AS e1 INNER JOIN

        (SELECT exam_id, MIN(score) AS min_score, MAX(score) AS max_score

    ON e1.exam_id = e2.exam_id

    WHERE e1.score = e2.min_score OR e1.score = e2.max_score)
```

## 1421\. NPV Queries | Medium | 🔒 [LeetCode](https://leetcode.com/problems/npv-queries)

Table: `NPV`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(id, year) is the primary key of this table.

The table has information about the id and the year of each inventory and the corresponding net present value.
```

Table: `Queries`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(id, year) is the primary key of this table.

The table has information about the id and the year of each inventory query.
```

Write an SQL query to find the npv of all each query of queries table.

Return the result table in any order.

The query result format is in the following example:

```undefined
+------+--------+--------+

+------+--------+--------+

+------+--------+--------+

+------+--------+--------+

+------+--------+--------+

+------+--------+--------+

The npv value of (7, 2018) is not present in the NPV table, we consider it 0.

The npv values of all other queries can be found in the NPV table.
```

### Solution

```sql
SELECT q.id, q.year, COALESCE(n.npv,0) AS npv

ON q.id = n.id AND q.year=n.year

SELECT Queries.*, IF(ISNULL(npv), 0, npv) AS npv

FROM Queries LEFT JOIN NPV

ON Queries.id = NPV.id AND Queries.year = NPV.year
```

## 1435\. Create a Session Bar Chart | Easy | 🔒 [LeetCode](https://leetcode.com/problems/create-a-session-bar-chart)

Table: `Sessions`

```undefined
+---------------------+---------+

+---------------------+---------+

+---------------------+---------+

session_id is the primary key for this table.

duration is the time in seconds that a user has visited the application.
```

You want to know how long a user visits your application. You decided to create bins of "\[0-5>", "\[5-10>", "\[10-15>" and "15 minutes or more" and count the number of sessions on it.

Write an SQL query to report the (bin, total) in **any** order.

```undefined
The query result format is in the following example.

+-------------+---------------+

| session_id  | duration      |

+-------------+---------------+

+-------------+---------------+

+--------------+--------------+

+--------------+--------------+

+--------------+--------------+

For session_id 1, 2 and 3 have a duration greater or equal than 0 minutes and less than 5 minutes.

For session_id 4 has a duration greater or equal than 5 minutes and less than 10 minutes.

There are no session with a duration greater or equial than 10 minutes and less than 15 minutes.

For session_id 5 has a duration greater or equal than 15 minutes.
```

### Solution

```sql
 SUM(CASE WHEN duration/60 < 5 THEN 1 ELSE 0 END) AS total FROM Sessions)

 SUM(CASE WHEN ((duration/60 >= 5) AND (duration/60 < 10)) THEN 1 ELSE 0 END) AS total FROM Sessions)

(SELECT '[10-15>' AS bin,

 SUM(CASE WHEN ((duration/60 >= 10) AND (duration/60 < 15)) THEN 1 ELSE 0 END) AS total FROM Sessions)

(SELECT '15 or more' AS bin,

 SUM(CASE WHEN duration/60 >= 15 THEN 1 ELSE 0 END) AS total FROM Sessions)

SELECT '[0-5>' AS bin, count(1) AS total

WHERE duration>=0 AND duration < 300

SELECT '[5-10>' AS bin, count(1) AS total

WHERE duration>=300 AND duration < 600

SELECT '[10-15>' AS bin, count(1) AS total

WHERE duration>=600 AND duration < 900

SELECT '15 or more' AS bin, count(1) AS total
```

## 1440\. Evaluate Boolean Expression | Medium | 🔒 [LeetCode](https://leetcode.com/problems/evaluate-boolean-expression)

Table `Variables`:

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

name is the primary key for this table.

This table contains the stored variables and their values.
```

Table `Expressions`:

```undefined
+---------------+---------+

+---------------+---------+

| left_operand  | varchar |

| right_operand | varchar |

+---------------+---------+

(left_operand, operator, right_operand) is the primary key for this table.

This table contains a boolean expression that should be evaluated.

operator is an enum that takes one of the values ('<', '>', '=')

The values of left_operand and right_operand are guaranteed to be in the Variables table.
```

Write an SQL query to evaluate the boolean expressions in `Expressions` table.

Return the result table in any order.

The query result format is in the following example.

```undefined
+--------------+----------+---------------+

| left_operand | operator | right_operand |

+--------------+----------+---------------+

+--------------+----------+---------------+

+--------------+----------+---------------+-------+

| left_operand | operator | right_operand | value |

+--------------+----------+---------------+-------+

+--------------+----------+---------------+-------+

As shown, you need find the value of each boolean exprssion in the table using the variables table.
```

### Solution

```sql
SELECT e.left_operand, e.operator, e.right_operand, v.value AS left_val, v_1.value AS right_val

ON v.name = e.left_operand

ON v_1.name = e.right_operand)

SELECT t1.left_operand, t1.operator, t1.right_operand,

CASE WHEN t1.operator = '<' THEN (SELECT t1.left_val< t1.right_val)

WHEN t1.operator = '>' THEN (SELECT t1.left_val > t1.right_val)

WHEN t1.operator = '=' THEN (SELECT t1.left_val = t1.right_val)

# nested INNER JOIN can trim the volume of the intermediate table, which gives us better performance

SELECT t.left_operand, t.operator, t.right_operand,

    (CASE WHEN v1_value>v2.value AND operator = '>' THEN "true"

          WHEN v1_value<v2.value AND operator = '<' THEN "true"

          WHEN v1_value=v2.value AND operator = '=' THEN "true"

   (SELECT e.*, v1.value AS v1_value

    FROM Expressions AS e INNER JOIN Variables AS v1

    ON e.left_operand = v1.name) AS t INNER JOIN Variables AS v2

    ON t.right_operand = v2.name

SELECT t.left_operand, t.operator, t.right_operand,

    (CASE WHEN operator = '>' THEN IF(v1_value>v2.value, "true", "false")

          WHEN operator = '<' THEN IF(v1_value<v2.value, "true", "false")

          WHEN operator = '=' THEN IF(v1_value=v2.value, "true", "false")

   (SELECT e.*, v1.value AS v1_value

    FROM Expressions AS e INNER JOIN Variables AS v1

    ON e.left_operand = v1.name) AS t INNER JOIN Variables AS v2

    ON t.right_operand = v2.name
```

## 1445\. Apples & Oranges | Medium | 🔒 [LeetCode](https://leetcode.com/problems/apples-oranges)

Table: `Sales`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(sale_date,fruit) is the primary key for this table.

This table contains the sales of "apples" and "oranges" sold each day.
```

Write an SQL query to report the difference between number of **apples** and **oranges** sold each day.

Return the result table ordered by sale\_date in format ('YYYY-MM-DD').

The query result format is in the following example:

```undefined
+------------+------------+-------------+

| sale_date  | fruit      | sold_num    |

+------------+------------+-------------+

| 2020-05-01 | apples     | 10          |

| 2020-05-01 | oranges    | 8           |

| 2020-05-02 | apples     | 15          |

| 2020-05-02 | oranges    | 15          |

| 2020-05-03 | apples     | 20          |

| 2020-05-03 | oranges    | 0           |

| 2020-05-04 | apples     | 15          |

| 2020-05-04 | oranges    | 16          |

+------------+------------+-------------+

+------------+--------------+

+------------+--------------+

+------------+--------------+

Day 2020-05-01, 10 apples and 8 oranges were sold (Difference  10 - 8 = 2).

Day 2020-05-02, 15 apples and 15 oranges were sold (Difference 15 - 15 = 0).

Day 2020-05-03, 20 apples and 0 oranges were sold (Difference 20 - 0 = 20).

Day 2020-05-04, 15 apples and 16 oranges were sold (Difference 15 - 16 = -1).
```

### Solution

```sql
SELECT sale_date, sum(CASE WHEN fruit='apples' THEN sold_num ELSE -sold_num END) AS diff

SELECT sale_date, sold_num-sold AS diff

WHERE fruit = 'apples') a

(SELECT sale_date AS sale, fruit, sold_num AS sold

WHERE fruit = 'oranges') b
```

## 1454\. Active Users | Medium | 🔒 [LeetCode](https://leetcode.com/problems/active-users)

Table `Accounts`:

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

the id is the primary key for this table.

This table contains the account id and the user name of each account.
```

Table `Logins`:

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

There is no primary key for this table, it may contain duplicates.

This table contains the account id of the user who logged in and the login date. A user may log in multiple times in the day.
```

Write an SQL query to find the id and the name of active users.

Active users are those who logged in to their accounts for 5 or more consecutive days.

Return the result table **ordered** by the id.

The query result format is in the following example:

```undefined
User Winston with id = 1 logged in 2 times only in 2 different days, so, Winston is not an active user.

User Jonathan with id = 7 logged in 7 times in 6 different days, five of them were consecutive days, so, Jonathan is an active user.
```

Follow up question: Can you write a general solution if the active users are those who logged in to their accounts for n or more consecutive days?

### Solution

```sql
lead(login_date,4) OVER(PARTITION BY id ORDER BY login_date) date_5

FROM (SELECT DISTINCT * FROM Logins) b

SELECT DISTINCT a.id, a.name FROM t1

WHERE DATEDIFF(t1.date_5,login_date) = 4

    FROM Logins AS t1 INNER JOIN Logins AS t2

    ON t1.id = t2.id AND datediff(t1.login_date, t2.login_date) BETWEEN 1 AND 4

    GROUP BY t1.id, t1.login_date

    HAVING count(DISTINCT(t2.login_date)) = 4)
```

## 1459\. Rectangles Area | Medium | 🔒 [LeetCode](https://leetcode.com/problems/rectangles-area)

Table: `Points`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

id is the primary key for this table.

Each point is represented as a 2D Dimensional (x_value, y_value).
```

Write an SQL query to report of all possible rectangles which can be formed by any two points of the table.

Each row in the result contains three columns (p1, p2, area) where:

-   **p1** and **p2** are the id of two opposite corners of a rectangle and p1 < p2.
-   Area of this rectangle is represented by the column **area**. Report the query in descending order by area in case of tie in ascending order by p1 and p2.

```undefined
+----------+-------------+-------------+

| id       | x_value     | y_value     |

+----------+-------------+-------------+

+----------+-------------+-------------+

+----------+-------------+-------------+

+----------+-------------+-------------+

+----------+-------------+-------------+

p1 should be less than p2 and area greater than 0.

p1 = 1 and p2 = 2, has an area equal to |2-4| * |8-7| = 2.

p1 = 2 and p2 = 3, has an area equal to |4-2| * |7-10| = 2.

p1 = 1 and p2 = 3 It's not possible because has an area equal to 0.
```

### Solution

```sql
SELECT t1.id AS p1, t2.id AS p2, ABS(t1.x_value-t2.x_value)*ABS(t1.y_value-t2.y_value) AS area

FROM Points AS t1 INNER JOIN Points AS t2

AND t1.x_value != t2.x_value AND t1.y_value != t2.y_value

ORDER BY area DESC, p1, p2
```

## 1468\. Calculate Salaries | Medium | 🔒 [LeetCode](https://leetcode.com/problems/calculate-salaries)

Table `Salaries`:

```undefined
+---------------+---------+

+---------------+---------+

| employee_name | varchar |

+---------------+---------+

(company_id, employee_id) is the primary key for this table.

This table contains the company id, the id, the name and the salary for an employee.
```

Write an SQL query to find the salaries of the employees after applying taxes.

The tax rate is calculated for each company based on the following criteria:

-   0% If the max salary of any employee in the company is less than 1000$.
-   24% If the max salary of any employee in the company is in the range \[1000, 10000\] inclusive.
-   49% If the max salary of any employee in the company is greater than 10000$.  
    Return the result table **in any order**. Round the salary to the nearest integer.

The query result format is in the following example:

```undefined
+------------+-------------+---------------+--------+

| company_id | employee_id | employee_name | salary |

+------------+-------------+---------------+--------+

| 1          | 2           | Pronub        | 21300  |

| 1          | 3           | Tyrrox        | 10800  |

| 2          | 9           | Hermione      | 700    |

| 3          | 7           | Bocaben       | 100    |

| 3          | 2           | Ognjen        | 2200   |

| 3          | 13          | Nyancat       | 3300   |

| 3          | 15          | Morninngcat   | 1866   |

+------------+-------------+---------------+--------+

+------------+-------------+---------------+--------+

| company_id | employee_id | employee_name | salary |

+------------+-------------+---------------+--------+

| 1          | 2           | Pronub        | 10863  |

| 1          | 3           | Tyrrox        | 5508   |

| 2          | 9           | Hermione      | 700    |

| 3          | 2           | Ognjen        | 1672   |

| 3          | 13          | Nyancat       | 2508   |

| 3          | 15          | Morninngcat   | 5911   |

+------------+-------------+---------------+--------+

For company 1, Max salary is 21300. Employees in company 1 have taxes = 49%

For company 2, Max salary is 700. Employees in company 2 have taxes = 0%

For company 3, Max salary is 7777. Employees in company 3 have taxes = 24%

The salary after taxes = salary - (taxes percentage / 100) * salary

For example, Salary for Morninngcat (3, 15) after taxes = 7777 - 7777 * (24 / 100) = 7777 - 1866.48 = 5910.52, which is rounded to 5911.
```

### Solution

```sql
SELECT company_id, employee_id, employee_name, salary AS sa, MAX(salary) OVER(PARTITION BY company_id) AS maximum

SELECT company_id, employee_id, employee_name,

CASE WHEN t1.maximum<1000 THEN t1.sa

WHEN t1.maximum BETWEEN 1000 AND 10000 THEN ROUND(t1.sa*.76,0)

SELECT Salaries.company_id, Salaries.employee_id, Salaries.employee_name,

    ROUND(CASE WHEN salary_max<1000 THEN Salaries.salary

               WHEN salary_max>=1000 AND salary_max<=10000 THEN Salaries.salary * 0.76

               ELSE Salaries.salary * 0.51 END, 0) AS salary

FROM Salaries INNER JOIN (

    SELECT company_id, MAX(salary) AS salary_max

    GROUP BY company_id) AS t

ON Salaries.company_id = t.company_id
```

## 1479\. Sales by Day of the Week | Hard | 🔒 [LeetCode](https://leetcode.com/problems/sales-by-day-of-the-week)

Table: `Orders`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(ordered_id, item_id) is the primary key for this table.

This table contains information of the orders placed.

order_date is the date when item_id was ordered by the customer with id customer_id.
```

Table: `Items`

```undefined
+---------------------+---------+

+---------------------+---------+

| item_category       | varchar |

+---------------------+---------+

item_id is the primary key for this table.

item_name is the name of the item.

item_category is the category of the item.
```

You are the business owner and would like to obtain a sales report for category items and day of the week.

Write an SQL query to report how many units in each category have been ordered on each **day of the week**.

Return the result table **ordered** by category.

The query result format is in the following example:

```undefined
+------------+--------------+-------------+--------------+-------------+

| order_id   | customer_id  | order_date  | item_id      | quantity    |

+------------+--------------+-------------+--------------+-------------+

| 1          | 1            | 2020-06-01  | 1            | 10          |

| 2          | 1            | 2020-06-08  | 2            | 10          |

| 3          | 2            | 2020-06-02  | 1            | 5           |

| 4          | 3            | 2020-06-03  | 3            | 5           |

| 5          | 4            | 2020-06-04  | 4            | 1           |

| 6          | 4            | 2020-06-05  | 5            | 5           |

| 7          | 5            | 2020-06-05  | 1            | 10          |

| 8          | 5            | 2020-06-14  | 4            | 5           |

| 9          | 5            | 2020-06-21  | 3            | 5           |

+------------+--------------+-------------+--------------+-------------+

+------------+----------------+---------------+

| item_id    | item_name      | item_category |

+------------+----------------+---------------+

| 1          | LC Alg. Book   | Book          |

| 2          | LC DB. Book    | Book          |

| 3          | LC SmarthPhone | Phone         |

| 4          | LC Phone 2020  | Phone         |

| 5          | LC SmartGlass  | Glasses       |

| 6          | LC T-Shirt XL  | T-Shirt       |

+------------+----------------+---------------+

+------------+-----------+-----------+-----------+-----------+-----------+-----------+-----------+

| Category   | Monday    | Tuesday   | Wednesday | Thursday  | Friday    | Saturday  | Sunday    |

+------------+-----------+-----------+-----------+-----------+-----------+-----------+-----------+

| Book       | 20        | 5         | 0         | 0         | 10        | 0         | 0         |

| Glasses    | 0         | 0         | 0         | 0         | 5         | 0         | 0         |

| Phone      | 0         | 0         | 5         | 1         | 0         | 0         | 10        |

| T-Shirt    | 0         | 0         | 0         | 0         | 0         | 0         | 0         |

+------------+-----------+-----------+-----------+-----------+-----------+-----------+-----------+

On Monday (2020-06-01, 2020-06-08) were sold a total of 20 units (10 + 10) in the category Book (ids: 1, 2).

On Tuesday (2020-06-02) were sold a total of 5 units  in the category Book (ids: 1, 2).

On Wednesday (2020-06-03) were sold a total of 5 units in the category Phone (ids: 3, 4).

On Thursday (2020-06-04) were sold a total of 1 unit in the category Phone (ids: 3, 4).

On Friday (2020-06-05) were sold 10 units in the category Book (ids: 1, 2) and 5 units in Glasses (ids: 5).

On Saturday there are no items sold.

On Sunday (2020-06-14, 2020-06-21) were sold a total of 10 units (5 +5) in the category Phone (ids: 3, 4).

There are no sales of T-Shirt.
```

### Solution

```sql
SELECT DISTINCT item_category,

CASE WHEN dayname(order_date)='Monday' THEN SUM(quantity) OVER(PARTITION BY item_category,dayname(order_date)) ELSE 0 END AS Monday,

CASE WHEN dayname(order_date)='Tuesday' THEN SUM(quantity) OVER(PARTITION BY item_category,dayname(order_date)) ELSE 0 END AS Tuesday,

CASE WHEN dayname(order_date)='Wednesday' THEN SUM(quantity) OVER(PARTITION BY item_category,dayname(order_date)) ELSE 0 END AS Wednesday,

CASE WHEN dayname(order_date)='Thursday' THEN SUM(quantity) OVER(PARTITION BY item_category,dayname(order_date)) ELSE 0 END AS Thursday,

CASE WHEN dayname(order_date)='Friday' THEN SUM(quantity) OVER(PARTITION BY item_category,dayname(order_date)) ELSE 0 END AS Friday,

CASE WHEN dayname(order_date)='Saturday' THEN SUM(quantity) OVER(PARTITION BY item_category,dayname(order_date)) ELSE 0 END AS Saturday,

CASE WHEN dayname(order_date)='Sunday' THEN SUM(quantity) OVER(PARTITION BY item_category,dayname(order_date)) ELSE 0 END AS Sunday

SELECT item_category AS category, SUM(Monday) AS Monday, SUM(Tuesday) AS Tuesday, SUM(Wednesday) Wednesday, SUM(Thursday) Thursday,

SUM(Friday) Friday, SUM(Saturday) Saturday, SUM(Sunday) Sunday
```

## 1484\. Group Sold Products By The Date | Easy | 🔒 [LeetCode](https://leetcode.com/problems/group-sold-products-by-the-date)

Table `Activities`:

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

There is no primary key for this table, it may contains duplicates.

Each row of this table contains the product name and the date it was sold in a market.
```

Write an SQL query to find for each date, the number of distinct products sold and their names.

The sold-products names for each date should be sorted lexicographically.

Return the result table ordered by `sell_date`.

The query result format is in the following example.

```undefined
+------------+-------------+

+------------+-------------+

| 2020-05-30 | Headphone   |

| 2020-05-30 | Basketball  |

+------------+-------------+

+------------+----------+------------------------------+

| sell_date  | num_sold | products                     |

+------------+----------+------------------------------+

| 2020-05-30 | 3        | Basketball,Headphone,T-shirt |

| 2020-06-01 | 2        | Bible,Pencil                 |

| 2020-06-02 | 1        | Mask                         |

+------------+----------+------------------------------+

For 2020-05-30, Sold items were (Headphone, Basketball, T-shirt), we sort them lexicographically and separate them by comma.

For 2020-06-01, Sold items were (Pencil, Bible), we sort them lexicographically and separate them by comma.

For 2020-06-02, Sold item is (Masks), we just return it.
```

### Solution

```sql
SELECT sell_date, COUNT(DISTINCT product) AS num_sold, group_concat(DISTINCT product) AS products
```

## 1495\. Friendly Movies Streamed Last Month | Easy | 🔒 [LeetCode](https://leetcode.com/problems/friendly-movies-streamed-last-month)

Table: `TVProgram`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(program_date, content_id) is the primary key for this table.

This table contains information of the programs on the TV.

content_id is the id of the program in some channel on the TV.
```

Table: `Content`

```undefined
+------------------+---------+

+------------------+---------+

| content_type     | varchar |

+------------------+---------+

content_id is the primary key for this table.

Kids_content is an enum that takes one of the values ('Y', 'N') where:

'Y' means is content for kids otherwise 'N' is not content for kids.

content_type is the category of the content as movies, series, etc.
```

Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.

Return the result table in any order.

The query result format is in the following example.

```undefined
+--------------------+--------------+-------------+

| program_date       | content_id   | channel     |

+--------------------+--------------+-------------+

| 2020-06-10 08:00   | 1            | LC-Channel  |

| 2020-05-11 12:00   | 2            | LC-Channel  |

| 2020-05-12 12:00   | 3            | LC-Channel  |

| 2020-05-13 14:00   | 4            | Disney Ch   |

| 2020-06-18 14:00   | 4            | Disney Ch   |

| 2020-07-15 16:00   | 5            | Disney Ch   |

+--------------------+--------------+-------------+

+------------+----------------+---------------+---------------+

| content_id | title          | Kids_content  | content_type  |

+------------+----------------+---------------+---------------+

| 1          | Leetcode Movie | N             | Movies        |

| 2          | Alg. for Kids  | Y             | Series        |

| 3          | Database Sols  | N             | Series        |

| 4          | Aladdin        | Y             | Movies        |

| 5          | Cinderella     | Y             | Movies        |

+------------+----------------+---------------+---------------+

"Leetcode Movie" is not a content for kids.

"Alg. for Kids" is not a movie.

"Database Sols" is not a movie

"Alladin" is a movie, content for kids and was streamed in June 2020.

"Cinderella" was not streamed in June 2020.
```

### Solution

```sql
WHERE kids_content = 'Y' AND content_type = 'Movies') a

tvprogram USING (content_id)

WHERE month(program_date) = 6
```

## 1501\. Countries You Can Safely Invest In | Medium | 🔒 [LeetCode](https://leetcode.com/problems/countries-you-can-safely-invest-in)

Table `Person`:

```undefined
+----------------+---------+

+----------------+---------+

| phone_number   | varchar |

+----------------+---------+

id is the primary key for this table.

Each row of this table contains the name of a person and their phone number.

Phone number will be in the form 'xxx-yyyyyyy' where xxx is the country code (3 characters) and yyyyyyy is the phone number (7 characters) where x and y are digits. Both can contain leading zeros.
```

Table `Country`:

```undefined
+----------------+---------+

+----------------+---------+

| country_code   | varchar |

+----------------+---------+

country_code is the primary key for this table.

Each row of this table contains the country name and its code. country_code will be in the form 'xxx' where x is digits.
```

Table `Calls`:

```undefined
There is no primary key for this table, it may contain duplicates.

Each row of this table contains the caller id, callee id and the duration of the call in minutes. caller_id != callee_id

A telecommunications company wants to invest in new countries. The country intends to invest in the countries where the average call duration of the calls in this country is strictly greater than the global average call duration.
```

Write an SQL query to find the countries where this company can invest.

Return the result table in any order.

The query result format is in the following example.

```undefined
+----+----------+--------------+

| id | name     | phone_number |

+----+----------+--------------+

| 3  | Jonathan | 051-1234567  |

| 12 | Elvis    | 051-7654321  |

| 1  | Moncef   | 212-1234567  |

| 2  | Maroua   | 212-6523651  |

| 7  | Meir     | 972-1234567  |

| 9  | Rachel   | 972-0011100  |

+----+----------+--------------+

+----------+--------------+

+----------+--------------+

+----------+--------------+

+-----------+-----------+----------+

| caller_id | callee_id | duration |

+-----------+-----------+----------+

+-----------+-----------+----------+

The average call duration for Peru is (102 + 102 + 330 + 330 + 5 + 5) / 6 = 145.666667

The average call duration for Israel is (33 + 4 + 13 + 13 + 3 + 1 + 1 + 7) / 8 = 9.37500

The average call duration for Morocco is (33 + 4 + 59 + 59 + 3 + 7) / 6 = 27.5000

Global call duration average = (2 * (33 + 3 + 59 + 102 + 330 + 5 + 13 + 3 + 1 + 7)) / 20 = 55.70000

Since Peru is the only country where average call duration is greater than the global average, it's the only recommended country.
```

### Solution

```sql
SELECT caller_id AS id, duration AS total

(SELECT caller_id, duration

SELECT callee_id, duration

(SELECT distinct avg(total) OVER(PARTITION BY code) AS avg_call, avg(total) OVER() AS global_avg, c.name

((SELECT *, coalesce(total,0) AS duration, SUBSTRING(phone_number FROM 1 for 3) AS code

FROM person RIGHT JOIN t1

ON c.country_code = b.code)) d

WHERE avg_call > global_avg
```

## 1511\. Customer Order Frequency | Easy | 🔒 [LeetCode](https://leetcode.com/problems/customer-order-frequency)

Table: `Customers`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

customer_id is the primary key for this table.

This table contains information of the customers in the company.
```

Table: `Product`

```undefined
+---------------+---------+

+---------------+---------+

| description   | varchar |

+---------------+---------+

product_id is the primary key for this table.

This table contains information of the products in the company.

price is the product cost.
```

Table: `Orders`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

order_id is the primary key for this table.

This table contains information on customer orders.

customer_id is the id of the customer who bought "quantity" products with id "product_id".

Order_date is the date in format ('YYYY-MM-DD') when the order was shipped.
```

Write an SQL query to report the customer\_id and customer\_name of customers who have spent at least $100 in each month of June and July 2020.

Return the result table in any order.

The query result format is in the following example.

```undefined
+--------------+-----------+-------------+

| customer_id  | name      | country     |

+--------------+-----------+-------------+

+--------------+-----------+-------------+

+--------------+-------------+-------------+

| product_id   | description | price       |

+--------------+-------------+-------------+

+--------------+-------------+-------------+

+--------------+-------------+-------------+-------------+-----------+

| order_id     | customer_id | product_id  | order_date  | quantity  |

+--------------+-------------+-------------+-------------+-----------+

| 1            | 1           | 10          | 2020-06-10  | 1         |

| 2            | 1           | 20          | 2020-07-01  | 1         |

| 3            | 1           | 30          | 2020-07-08  | 2         |

| 4            | 2           | 10          | 2020-06-15  | 2         |

| 5            | 2           | 40          | 2020-07-01  | 10        |

| 6            | 3           | 20          | 2020-06-24  | 2         |

| 7            | 3           | 30          | 2020-06-25  | 2         |

| 9            | 3           | 30          | 2020-05-08  | 3         |

+--------------+-------------+-------------+-------------+-----------+

+--------------+------------+

+--------------+------------+

+--------------+------------+

Winston spent $300 (300 * 1) in June and $100 ( 10 * 1 + 45 * 2) in July 2020.

Jonathan spent $600 (300 * 2) in June and $20 ( 2 * 10) in July 2020.

Moustafa spent $110 (10 * 2 + 45 * 2) in June and $0 in July 2020.
```

### Solution

```sql
SELECT o.customer_id, name

ON o.product_id = p.product_id

ON o.customer_id = c.customer_id

HAVING SUM(CASE WHEN date_format(order_date, '%Y-%m')='2020-06'

THEN price*quantity END) >= 100

SUM(CASE WHEN date_format(order_date, '%Y-%m')='2020-07'

THEN price*quantity END) >= 100;

    SELECT o.customer_id, c.name,

        sum(CASE WHEN left(o.order_date,7) = '2020-06' THEN p.price * o.quantity END) AS JuneSpend,

        sum(CASE WHEN left(o.order_date,7) = '2020-07' THEN p.price * o.quantity END) AS JulySpend

    LEFT JOIN Customers c ON o.customer_id = c.customer_id

    lEFT JOIN Product p ON o.product_id = p.product_id

    HAVING JuneSpend >= 100 AND JulySpend >= 100

SELECT o.customer_id, c.name

FROM Customers c, Product p, Orders o

WHERE c.customer_id = o.customer_id AND p.product_id = o.product_id

    SUM(CASE WHEN o.order_date LIKE '2020-06%' THEN o.quantity*p.price ELSE 0 END) >= 100

    SUM(CASE WHEN o.order_date LIKE '2020-07%' THEN o.quantity*p.price ELSE 0 END) >= 100
```

## 1517\. Find Users With Valid E-Mails | Easy | 🔒 [LeetCode](https://leetcode.com/problems/find-users-with-valid-e-mails)

Table: `Users`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

user_id is the primary key for this table.

This table contains information of the users signed up in a website. Some e-mails are invalid.
```

Write an SQL query to find the users who have **valid emails**.

A valid e-mail has a prefix name and a domain where:

-   **The prefix name** is a string that may contain letters (upper or lower case), digits, underscore `'_'`, period `'.'` and/or dash `'-'`. The prefix name **must** start with a letter.
-   The domain is `'@leetcode.com'`.  
    Return the result table in any order.

The query result format is in the following example.

```undefined
+---------+-----------+-------------------------+

| user_id | name      | mail                    |

+---------+-----------+-------------------------+

| 1       | Winston   | winston@leetcode.com    |

| 2       | Jonathan  | jonathanisgreat         |

| 3       | Annabelle | bella-@leetcode.com     |

| 4       | Sally     | sally.come@leetcode.com |

| 5       | Marwan    | quarz#2020@leetcode.com |

| 6       | David     | david69@gmail.com       |

| 7       | Shapiro   | .shapo@leetcode.com     |

+---------+-----------+-------------------------+

+---------+-----------+-------------------------+

| user_id | name      | mail                    |

+---------+-----------+-------------------------+

| 1       | Winston   | winston@leetcode.com    |

| 3       | Annabelle | bella-@leetcode.com     |

| 4       | Sally     | sally.come@leetcode.com |

+---------+-----------+-------------------------+

The mail of user 2 doesn't have a domain.

The mail of user 5 has # sign which is not allowed.

The mail of user 6 doesn't have leetcode domain.

The mail of user 7 starts with a period.
```

### Solution

```sql
SELECT user_id, name, mail

WHERE mail regexp "^[a-zA-Z]+[a-zA-Z0-9_\\./\\-]{0,}@leetcode\\.com$"

WHERE regexp_like(mail, '^[A-Za-z]+[A-Za-z0-9\_\.\-]*@leetcode.com')
```

## 1527\. Patients With a Condition | Easy | 🔒 [LeetCode](https://leetcode.com/problems/patients-with-a-condition)

Table: `Patients`

```undefined
+--------------+---------+

+--------------+---------+

| patient_name | varchar |

+--------------+---------+

patient_id is the primary key for this table.

'conditions' contains 0 or more code separated by spaces.

This table contains information of the patients in the hospital.
```

Write an SQL query to report the patient\_id, patient\_name all conditions of patients who have Type I Diabetes. Type I Diabetes always starts with `DIAB1` prefix

Return the result table in any order.

The query result format is in the following example.

```undefined
+------------+--------------+--------------+

| patient_id | patient_name | conditions   |

+------------+--------------+--------------+

| 1          | Daniel       | YFEV COUGH   |

| 3          | Bob          | DIAB100 MYOP |

| 4          | George       | ACNE DIAB100 |

+------------+--------------+--------------+

+------------+--------------+--------------+

| patient_id | patient_name | conditions   |

+------------+--------------+--------------+

| 3          | Bob          | DIAB100 MYOP |

| 4          | George       | ACNE DIAB100 |

+------------+--------------+--------------+

Bob and George both have a condition that starts with DIAB1.
```

### Solution

```sql
SELECT patient_id, patient_name, conditions

WHERE conditions LIKE '%DIAB1%'
```

## 1532\. The Most Recent Three Orders | Medium | 🔒 [LeetCode](https://leetcode.com/problems/the-most-recent-three-orders)

Table: `Customers`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

customer_id is the primary key for this table.

This table contains information about customers.
```

Table: `Orders`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

order_id is the primary key for this table.

This table contains information about the orders made customer_id.

Each customer has one order per day.
```

Write an SQL query to find the most recent 3 orders of each user. If a user ordered less than 3 orders return all of their orders.

Return the result table sorted by `customer_name` in ascending order and in case of a tie by the `customer_id` in ascending order. If there still a tie, order them by the `order_date` in descending order.

The query result format is in the following example:

```undefined
+-------------+-----------+

+-------------+-----------+

+-------------+-----------+

+----------+------------+-------------+------+

| order_id | order_date | customer_id | cost |

+----------+------------+-------------+------+

| 1        | 2020-07-31 | 1           | 30   |

| 2        | 2020-07-30 | 2           | 40   |

| 3        | 2020-07-31 | 3           | 70   |

| 4        | 2020-07-29 | 4           | 100  |

| 5        | 2020-06-10 | 1           | 1010 |

| 6        | 2020-08-01 | 2           | 102  |

| 7        | 2020-08-01 | 3           | 111  |

| 8        | 2020-08-03 | 1           | 99   |

| 9        | 2020-08-07 | 2           | 32   |

| 10       | 2020-07-15 | 1           | 2    |

+----------+------------+-------------+------+

+---------------+-------------+----------+------------+

| customer_name | customer_id | order_id | order_date |

+---------------+-------------+----------+------------+

| Annabelle     | 3           | 7        | 2020-08-01 |

| Annabelle     | 3           | 3        | 2020-07-31 |

| Jonathan      | 2           | 9        | 2020-08-07 |

| Jonathan      | 2           | 6        | 2020-08-01 |

| Jonathan      | 2           | 2        | 2020-07-30 |

| Marwan        | 4           | 4        | 2020-07-29 |

| Winston       | 1           | 8        | 2020-08-03 |

| Winston       | 1           | 1        | 2020-07-31 |

| Winston       | 1           | 10       | 2020-07-15 |

+---------------+-------------+----------+------------+

Winston has 4 orders, we discard the order of "2020-06-10" because it is the oldest order.

Annabelle has only 2 orders, we return them.

Jonathan has exactly 3 orders.

Marwan ordered only one time.

We sort the result table by customer_name in ascending order, by customer_id in ascending order and by order_date in descending order in case of a tie.

Can you write a general solution for the most recent `n` orders?
```

### Solution

```sql
SELECT a.name, a.customer_id, b.order_id, b.order_date,

ROW_NUMBER() OVER(PARTITION BY a.name, a.customer_id ORDER BY b.order_date DESC) AS rnk

ON a.customer_id = b.customer_id

SELECT name AS customer_name, customer_id, order_id, order_date

ORDER BY customer_name, customer_id, order_date DESC;
```

## 1543\. Fix Product Name Format | Easy | 🔒 [LeetCode](https://leetcode.com/problems/fix-product-name-format)

Table: `Sales`

```undefined
+--------------+---------+

+--------------+---------+

| product_name | varchar |

+--------------+---------+

sale_id is the primary key for this table.

Each row of this table contains the product name and the date it was sold.
```

Since table Sales was filled manually in the year 2000, `product_name` may contain leading and/or trailing white spaces, also they are case-insensitive.

Write an SQL query to report

-   `product_name` in lowercase without leading or trailing white spaces.
-   `sale_date` in the format `('YYYY-MM')`
-   `total` the number of times the product was sold in this month.  
    Return the result table ordered by `product_name` in **ascending order**, in case of a tie order it by `sale_date` in ascending order.

The query result format is in the following example.

```undefined
+------------+------------------+--------------+

| sale_id    | product_name     | sale_date    |

+------------+------------------+--------------+

| 1          |      LCPHONE     | 2000-01-16   |

| 2          |    LCPhone       | 2000-01-17   |

| 3          |     LcPhOnE      | 2000-02-18   |

| 4          |      LCKeyCHAiN  | 2000-02-19   |

| 5          |   LCKeyChain     | 2000-02-28   |

| 6          | Matryoshka       | 2000-03-31   |

+------------+------------------+--------------+

+--------------+--------------+----------+

| product_name | sale_date    | total    |

+--------------+--------------+----------+

| lcphone      | 2000-01      | 2        |

| lckeychain   | 2000-02      | 2        |

| lcphone      | 2000-02      | 1        |

| matryoshka   | 2000-03      | 1        |

+--------------+--------------+----------+

In January, 2 LcPhones were sold, please note that the product names are not case sensitive and may contain spaces.

In Februery, 2 LCKeychains and 1 LCPhone were sold.

In March, 1 matryoshka was sold.
```

### Solution

```sql
SELECT TRIM(LOWER(product_name)) AS product_name,

       DATE_FORMAT(sale_date, '%Y-%m') AS sale_date,

GROUP BY 1, DATE_FORMAT(sale_date, '%Y-%m')
```

## 1549\. The Most Recent Orders for Each Product | Medium | 🔒 [LeetCode](https://leetcode.com/problems/the-most-recent-orders-for-each-product)

Table: `Customers`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

customer_id is the primary key for this table.

This table contains information about the customers.
```

Table: `Orders`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

order_id is the primary key for this table.

This table contains information about the orders made by customer_id.

There will be no product ordered by the same user more than once in one day.
```

Table: `Products`

```undefined
+---------------+---------+

+---------------+---------+

| product_name  | varchar |

+---------------+---------+

product_id is the primary key for this table.

This table contains information about the Products.
```

Write an SQL query to find the most recent order(s) of each product.

Return the result table sorted by `product_name` in **ascending** order and in case of a tie by the `product_id` in **ascending** order. If there still a tie, order them by the `order_id` in **ascending** order.

The query result format is in the following example:

```undefined
+-------------+-----------+

+-------------+-----------+

+-------------+-----------+

+----------+------------+-------------+------------+

| order_id | order_date | customer_id | product_id |

+----------+------------+-------------+------------+

| 1        | 2020-07-31 | 1           | 1          |

| 2        | 2020-07-30 | 2           | 2          |

| 3        | 2020-08-29 | 3           | 3          |

| 4        | 2020-07-29 | 4           | 1          |

| 5        | 2020-06-10 | 1           | 2          |

| 6        | 2020-08-01 | 2           | 1          |

| 7        | 2020-08-01 | 3           | 1          |

| 8        | 2020-08-03 | 1           | 2          |

| 9        | 2020-08-07 | 2           | 3          |

| 10       | 2020-07-15 | 1           | 2          |

+----------+------------+-------------+------------+

+------------+--------------+-------+

| product_id | product_name | price |

+------------+--------------+-------+

+------------+--------------+-------+

+--------------+------------+----------+------------+

| product_name | product_id | order_id | order_date |

+--------------+------------+----------+------------+

| keyboard     | 1          | 6        | 2020-08-01 |

| keyboard     | 1          | 7        | 2020-08-01 |

| mouse        | 2          | 8        | 2020-08-03 |

| screen       | 3          | 3        | 2020-08-29 |

+--------------+------------+----------+------------+

keyboard's most recent order is in 2020-08-01, it was ordered two times this day.

mouse's most recent order is in 2020-08-03, it was ordered only once this day.

screen's most recent order is in 2020-08-29, it was ordered only once this day.

The hard disk was never ordered and we don't include it in the result table.
```

### Solution

```sql
SELECT p.product_name, o.product_id, o.order_id, o.order_date

    SELECT product_id, order_id, order_date,

    RANK() OVER(PARTITION BY product_id ORDER BY order_date DESC) AS seq

    ON o.product_id = p.product_id
```

## 1555\. Bank Account Summary | Medium | 🔒 [LeetCode](https://leetcode.com/problems/bank-account-summary)

Table: `Users`

```undefined
+--------------+---------+

+--------------+---------+

+--------------+---------+

user_id is the primary key for this table.

Each row of this table contains the current credit information for each user.
```

Table: `Transaction`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

trans_id is the primary key for this table.

Each row of this table contains the information about the transaction in the bank.

User with id (paid_by) transfer money to user with id (paid_to).
```

Leetcode Bank (LCB) helps its coders in making virtual payments. Our bank records all transactions in the table Transaction, we want to find out the current balance of all users and check wheter they have breached their credit limit (If their current credit is less than 0).

Write an SQL query to report.

-   `user_id`
-   `user_name`
-   `credit`, current balance after performing transactions.
-   `credit_limit_breached`, check credit\_limit ("Yes" or "No") Return the result table in **any** order.

The query result format is in the following example.

```undefined
+------------+--------------+-------------+

| user_id    | user_name    | credit      |

+------------+--------------+-------------+

+------------+--------------+-------------+

+------------+------------+------------+----------+---------------+

| trans_id   | paid_by    | paid_to    | amount   | transacted_on |

+------------+------------+------------+----------+---------------+

| 1          | 1          | 3          | 400      | 2020-08-01    |

| 2          | 3          | 2          | 500      | 2020-08-02    |

| 3          | 2          | 1          | 200      | 2020-08-03    |

+------------+------------+------------+----------+---------------+

+------------+------------+------------+-----------------------+

| user_id    | user_name  | credit     | credit_limit_breached |

+------------+------------+------------+-----------------------+

| 1          | Moustafa   | -100       | Yes                   |

| 2          | Jonathan   | 500        | No                    |

| 3          | Winston    | 9990       | No                    |

+------------+------------+------------+-----------------------+

Moustafa paid $400 on "2020-08-01" and received $200 on "2020-08-03", credit (100 -400 +200) = -$100

Jonathan received $500 on "2020-08-02" and paid $200 on "2020-08-08", credit (200 +500 -200) = $500

Winston received $400 on "2020-08-01" and paid $500 on "2020-08-03", credit (10000 +400 -500) = $9990

Luis didn't received any transfer, credit = $800
```

### Solution

```sql
SELECT Users.user_id AS user_id

    , Users.user_name AS user_name

    , credit+IFNULL(SUM(trans),0) AS credit

    , CASE WHEN credit+IFNULL(SUM(trans),0)>0 THEN 'No' ELSE 'Yes' END AS credit_limit_breached

    SELECT paid_by AS user_id, -amount AS trans

    SELECT paid_to AS user_id, amount AS trans

) t RIGHT JOIN users ON t.user_id=users.user_id
```

## 1565\. Unique Orders and Customers Per Month | Easy | 🔒 [LeetCode](https://leetcode.com/problems/unique-orders-and-customers-per-month)

Table: `Orders`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

order_id is the primary key for this table.

This table contains information about the orders made by customer_id.
```

Write an SQL query to find the number of **unique orders** and the number of **unique users** with invoices > **$20** for each **different month**.

Return the result table sorted in **any order**.

The query result format is in the following example:

```undefined
+----------+------------+-------------+------------+

| order_id | order_date | customer_id | invoice    |

+----------+------------+-------------+------------+

| 1        | 2020-09-15 | 1           | 30         |

| 2        | 2020-09-17 | 2           | 90         |

| 3        | 2020-10-06 | 3           | 20         |

| 4        | 2020-10-20 | 3           | 21         |

| 5        | 2020-11-10 | 1           | 10         |

| 6        | 2020-11-21 | 2           | 15         |

| 7        | 2020-12-01 | 4           | 55         |

| 8        | 2020-12-03 | 4           | 77         |

| 9        | 2021-01-07 | 3           | 31         |

| 10       | 2021-01-15 | 2           | 20         |

+----------+------------+-------------+------------+

+---------+-------------+----------------+

| month   | order_count | customer_count |

+---------+-------------+----------------+

+---------+-------------+----------------+

In September 2020 we have two orders from 2 different customers with invoices > $20.

In October 2020 we have two orders from 1 customer, and only one of the two orders has invoice > $20.

In November 2020 we have two orders from 2 different customers but invoices < $20, so we don't include that month.

In December 2020 we have two orders from 1 customer both with invoices > $20.

In January 2021 we have two orders from 2 different customers, but only one of them with invoice > $20.
```

### Solution

```sql
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, COUNT(DISTINCT order_id) AS order_count, COUNT(DISTINCT customer_id) AS customer_count

    GROUP BY YEAR(order_date), MONTH(order_date);

SELECT LEFT(order_date, 7) AS month, COUNT(DISTINCT order_id) AS order_count,

COUNT(DISTINCT customer_id) AS customer_count
```

## 1571\. Warehouse Manager | Easy | 🔒 [LeetCode](https://leetcode.com/problems/warehouse-manager)

Table: `Warehouse`

```undefined
+--------------+---------+

+--------------+---------+

+--------------+---------+

(name, product_id) is the primary key for this table.

Each row of this table contains the information of the products in each warehouse.
```

Table: `Products`

```undefined
+---------------+---------+

+---------------+---------+

| product_name  | varchar |

+---------------+---------+

product_id is the primary key for this table.

Each row of this table contains the information about the product dimensions (Width, Lenght and Height) in feets of each product.
```

Write an SQL query to report, How much cubic feet of **volume** does the inventory occupy in each warehouse.

-   warehouse\_name
-   volume  
    Return the result table in **any** order.

The query result format is in the following example.

```undefined
+------------+--------------+-------------+

| name       | product_id   | units       |

+------------+--------------+-------------+

+------------+--------------+-------------+

+------------+--------------+------------+----------+-----------+

| product_id | product_name | Width      | Length   | Height    |

+------------+--------------+------------+----------+-----------+

| 1          | LC-TV        | 5          | 50       | 40        |

| 2          | LC-KeyChain  | 5          | 5        | 5         |

| 3          | LC-Phone     | 2          | 10       | 10        |

| 4          | LC-T-Shirt   | 4          | 10       | 20        |

+------------+--------------+------------+----------+-----------+

+----------------+------------+

| warehouse_name | volume     |

+----------------+------------+

+----------------+------------+

Volume of product_id = 1 (LC-TV), 5x50x40 = 10000

Volume of product_id = 2 (LC-KeyChain), 5x5x5 = 125

Volume of product_id = 3 (LC-Phone), 2x10x10 = 200

Volume of product_id = 4 (LC-T-Shirt), 4x10x20 = 800

LCHouse1: 1 unit of LC-TV + 10 units of LC-KeyChain + 5 units of LC-Phone.

          Total volume: 1*10000 + 10*125  + 5*200 = 12250 cubic feet

LCHouse2: 2 units of LC-TV + 2 units of LC-KeyChain.

          Total volume: 2*10000 + 2*125 = 20250 cubic feet

LCHouse3: 1 unit of LC-T-Shirt.

          Total volume: 1*800 = 800 cubic feet.
```

### Solution

```sql
SELECT a.name AS warehouse_name,

SUM(a.units * b.Width * b.Length * b.Height) AS volume

ON a.product_id = b.product_id
```

## 1581\. Customer Who Visited but Did Not Make Any Transactions | Easy | 🔒 [LeetCode](https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions)

Table: `Visits`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

visit_id is the primary key for this table.

This table contains information about the customers who visited the mall.
```

Table: `Transactions`

```undefined
+----------------+---------+

+----------------+---------+

+----------------+---------+

transaction_id is the primary key for this table.

This table contains information about the customers who visited the mall.
```

Write an SQL query to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

Return the result table sorted in **any orders**.

The query result format is in the following example:

```undefined
+----------+-------------+

| visit_id | customer_id |

+----------+-------------+

+----------+-------------+

+----------------+----------+--------+

| transaction_id | visit_id | amount |

+----------------+----------+--------+

+----------------+----------+--------+

+-------------+----------------+

| customer_id | count_no_trans |

+-------------+----------------+

+-------------+----------------+

Customer with id = 23 visited the mall once and made one transaction during the visit with id = 12.

Customer with id = 9 visited the mall once and made one transaction during the visit with id = 13.

Customer with id = 30 visited the mall once and did not make any transactions.

Customer with id = 54 visited the mall three times. During 2 visits they did not make any transactions, and during one visit they made 3 transactions.

Customer with id = 96 visited the mall once and did not make any transactions.

As we can see, users with IDs 30 and 96 visited the mall one time without making any transactions. Also user 54 visited the mall twice and did not make any transactions.
```

### Solution

```sql
SELECT a.customer_id, COUNT(a.visit_id) AS count_no_trans FROM Visits AS a

LEFT JOIN Transactions AS b

ON a.visit_id = b.visit_id

WHERE b.transaction_id IS NULL

SELECT customer_id, count(visit_id) AS count_no_trans
```

## 1587\. Bank Account Summary II | Easy | 🔒 [LeetCode](https://leetcode.com/problems/bank-account-summary-ii)

Table: `Users`

```undefined
+--------------+---------+

+--------------+---------+

+--------------+---------+

account is the primary key for this table.

Each row of this table contains the account number of each user in the bank.
```

Table: `Transactions`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

trans_id is the primary key for this table.

Each row of this table contains all changes made to all accounts.

amount is positive if the user received money and negative if they transferred money.

All accounts start with a balance 0.
```

Write an SQL query to report the name and balance of users with a balance higher than 10000. The balance of an account is equal to the sum of the amounts of all transactions involving that account.

Return the result table in **any** order.

The query result format is in the following example.

```undefined
+------------+--------------+

+------------+--------------+

+------------+--------------+

+------------+------------+------------+---------------+

| trans_id   | account    | amount     | transacted_on |

+------------+------------+------------+---------------+

| 1          | 900001     | 7000       |  2020-08-01   |

| 2          | 900001     | 7000       |  2020-09-01   |

| 3          | 900001     | -3000      |  2020-09-02   |

| 4          | 900002     | 1000       |  2020-09-12   |

| 5          | 900003     | 6000       |  2020-08-07   |

| 6          | 900003     | 6000       |  2020-09-07   |

| 7          | 900003     | -4000      |  2020-09-11   |

+------------+------------+------------+---------------+

+------------+------------+

+------------+------------+

+------------+------------+

Alice's balance is (7000 + 7000 - 3000) = 11000.

Charlie's balance is (6000 + 6000 - 4000) = 8000.
```

### Solution

```sql
SELECT u.name AS NAME,SUM(t.amount) AS BALANCE

FROM Transactions t LEFT JOIN Users u

HAVING SUM(t.amount)>10000;

SELECT t.account, u.name, SUM(amount) AS balance

LEFT JOIN Users u ON t.account = u.account
```

## 1596\. The Most Frequently Ordered Products for Each Customer | Medium | 🔒 [LeetCode](https://leetcode.com/problems/the-most-frequently-ordered-products-for-each-customer)

Table: `Customers`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

customer_id is the primary key for this table.

This table contains information about the customers.
```

Table: `Orders`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

order_id is the primary key for this table.

This table contains information about the orders made by customer_id.

No customer will order the same product more than once in a single day.
```

Table: `Products`

```undefined
+---------------+---------+

+---------------+---------+

| product_name  | varchar |

+---------------+---------+

product_id is the primary key for this table.

This table contains information about the products.
```

Write an SQL query to find the most frequently ordered product(s) for each customer.

The result table should have the `product_id` and `product_name` for each `customer_id` who ordered at least one order. Return the result table in **any order**.

The query result format is in the following example:

```undefined
+----------+------------+-------------+------------+

| order_id | order_date | customer_id | product_id |

+----------+------------+-------------+------------+

| 1        | 2020-07-31 | 1           | 1          |

| 2        | 2020-07-30 | 2           | 2          |

| 3        | 2020-08-29 | 3           | 3          |

| 4        | 2020-07-29 | 4           | 1          |

| 5        | 2020-06-10 | 1           | 2          |

| 6        | 2020-08-01 | 2           | 1          |

| 7        | 2020-08-01 | 3           | 3          |

| 8        | 2020-08-03 | 1           | 2          |

| 9        | 2020-08-07 | 2           | 3          |

| 10       | 2020-07-15 | 1           | 2          |

+----------+------------+-------------+------------+

+------------+--------------+-------+

| product_id | product_name | price |

+------------+--------------+-------+

+------------+--------------+-------+

+-------------+------------+--------------+

| customer_id | product_id | product_name |

+-------------+------------+--------------+

+-------------+------------+--------------+

Alice (customer 1) ordered the mouse three times and the keyboard one time, so the mouse is the most frquently ordered product for them.

Bob (customer 2) ordered the keyboard, the mouse, and the screen one time, so those are the most frquently ordered products for them.

Tom (customer 3) only ordered the screen (two times), so that is the most frquently ordered product for them.

Jerry (customer 4) only ordered the keyboard (one time), so that is the most frquently ordered product for them.

John (customer 5) did not order anything, so we do not include them in the result table.
```

### Solution

```sql
SELECT customer_id, Products.product_id, Products.product_name FROM

(SELECT customer_id, product_id, order_count, RANK() OVER(PARTITION BY customer_id ORDER BY order_count DESC) r From

(SELECT customer_id, product_id, COUNT(DISTINCT order_id) AS order_count FROM Orders

GROUP BY customer_id, product_id) order_counts) order_counts_ranked

JOIN Products ON order_counts_ranked.product_id = Products.product_id

SELECT customer_id, T.product_id, product_name

    SELECT customer_id, product_id,

    RANK() OVER( PARTITION BY customer_id ORDER BY COUNT(*) DESC ) AS RK

    GROUP BY customer_id, product_id

LEFT JOIN Products p on p.product_id = t.product_id

  SELECT a.customer_id, b.product_id, c.product_name,

  COUNT(b.order_id) OVER(PARTITION BY a.customer_id, b.product_id) AS freq

  ON a.customer_id = b.customer_id

  ON b.product_id = c.product_id

  SELECT customer_id, product_id, product_name, freq,

  DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY freq DESC) AS rnk

SELECT DISTINCT customer_id, product_id, product_name FROM tmp1
```

## 1607\. Sellers With No Sales | Easy | 🔒 [LeetCode](https://leetcode.com/problems/sellers-with-no-sales)

Table: `Customer`

```undefined
+---------------+---------+

+---------------+---------+

| customer_name | varchar |

+---------------+---------+

customer_id is the primary key for this table.

Each row of this table contains the information of each customer in the WebStore.
```

Table: `Orders`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

order_id is the primary key for this table.

Each row of this table contains all orders made in the webstore.

sale_date is the date when the transaction was made between the customer (customer_id) and the seller (seller_id).
```

Table: `Seller`

```undefined
+---------------+---------+

+---------------+---------+

| seller_name   | varchar |

+---------------+---------+

seller_id is the primary key for this table.

Each row of this table contains the information of each seller.
```

Write an SQL query to report the names of all sellers who did not make any sales in 2020.

Return the result table ordered by `seller_name` in ascending order.

The query result format is in the following example.

```undefined
+--------------+---------------+

| customer_id  | customer_name |

+--------------+---------------+

+--------------+---------------+

+-------------+------------+--------------+-------------+-------------+

| order_id    | sale_date  | order_cost   | customer_id | seller_id   |

+-------------+------------+--------------+-------------+-------------+

| 1           | 2020-03-01 | 1500         | 101         | 1           |

| 2           | 2020-05-25 | 2400         | 102         | 2           |

| 3           | 2019-05-25 | 800          | 101         | 3           |

| 4           | 2020-09-13 | 1000         | 103         | 2           |

| 5           | 2019-02-11 | 700          | 101         | 2           |

+-------------+------------+--------------+-------------+-------------+

+-------------+-------------+

| seller_id   | seller_name |

+-------------+-------------+

+-------------+-------------+

Daniel made 1 sale in March 2020.

Elizabeth made 2 sales in 2020 and 1 sale in 2019.

Frank made 1 sale in 2019 but no sales in 2020.
```

### Solution

```sql
SELECT seller_name FROM Seller

SELECT DISTINCT seller_id FROM Orders

WHERE YEAR(sale_date)='2020'
```

## 1613\. Find the Missing IDs | Medium | 🔒 [LeetCode](https://leetcode.com/problems/find-the-missing-ids)

Table: `Customers`

```undefined
+---------------+---------+

+---------------+---------+

| customer_name | varchar |

+---------------+---------+

customer_id is the primary key for this table.

Each row of this table contains the name and the id customer.
```

Write an SQL query to find the missing customer IDs. The missing IDs are ones that are not in the `Customers` table but are in the range between `1` and the **maximum** `customer_id` present in the table.

**Notice** that the maximum `customer_id` will not exceed 100.

Return the result table ordered by **ids** in **_ascending order_**.

The query result format is in the following example.

```undefined
+-------------+---------------+

| customer_id | customer_name |

+-------------+---------------+

+-------------+---------------+

The maximum customer_id present in the table is 5, so in the range [1,5], IDs 2 and 3 are missing from the table.
```

### Solution

```sql
    SELECT 1 AS 'id', MAX(c.customer_id) AS 'Max_Id'

WHERE c.id NOT IN (SELECT customer_id FROM Customers)
```

## 1623\. All Valid Triplets That Can Represent a Country | Easy | 🔒 [LeetCode](https://leetcode.com/problems/all-valid-triplets-that-can-represent-a-country)

Table: `SchoolA`

```undefined
+---------------+---------+

+---------------+---------+

| student_name  | varchar |

+---------------+---------+

student_id is the primary key for this table.

Each row of this table contains the name and the id of a student in school A.

All student_name are distinct.
```

Table: `SchoolB`

```undefined
+---------------+---------+

+---------------+---------+

| student_name  | varchar |

+---------------+---------+

student_id is the primary key for this table.

Each row of this table contains the name and the id of a student in school B.

All student_name are distinct.
```

Table: `SchoolC`

```undefined
+---------------+---------+

+---------------+---------+

| student_name  | varchar |

+---------------+---------+

student_id is the primary key for this table.

Each row of this table contains the name and the id of a student in school C.

All student_name are distinct.
```

There is a country with three schools, where each student is enrolled in **exactly one** school. The country is joining a competition and wants to select one student from each school to represent the country such that:

-   `member_A` is selected from `SchoolA`,
-   `member_B` is selected from `SchoolB`,
-   `member_C` is selected from `SchoolC`, and The selected students' names and IDs are pairwise distinct (i.e. no two students share the same name, and no two students share the same ID). Write an SQL query to find all the possible triplets representing the country under the given constraints.

Return the result table in **any order**.

The query result format is in the following example.

```undefined
+------------+--------------+

| student_id | student_name |

+------------+--------------+

+------------+--------------+

+------------+--------------+

| student_id | student_name |

+------------+--------------+

+------------+--------------+

+------------+--------------+

| student_id | student_name |

+------------+--------------+

+------------+--------------+

+----------+----------+----------+

| member_A | member_B | member_C |

+----------+----------+----------+

+----------+----------+----------+

Let us see all the possible triplets.

- (Alice, Tom, Tom) --> Rejected because member_B and member_C have the same name and the same ID.

- (Alice, Tom, Jerry) --> Valid triplet.

- (Alice, Tom, Alice) --> Rejected because member_A and member_C have the same name.

- (Bob, Tom, Tom) --> Rejected because member_B and member_C have the same name and the same ID.

- (Bob, Tom, Jerry) --> Rejected because member_A and member_C have the same ID.

- (Bob, Tom, Alice) --> Valid triplet.
```

### Solution

```sql
SELECT a.student_name AS 'member_A',

b.student_name AS 'member_B',

c.student_name AS 'member_C'

ON a.student_id <> b.student_id

AND a.student_name <> b.student_name

ON a.student_id <> c.student_id

AND b.student_id <> c.student_id

AND a.student_name <> c.student_name

AND b.student_name <> c.student_name;
```

## 1633\. Percentage of Users Attended a Contest | Easy | 🔒 [LeetCode](https://leetcode.com/problems/percentage-of-users-attended-a-contest)

Table: `Users`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

user_id is the primary key for this table.

Each row of this table contains the name and the id of a user.
```

Table: `Register`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

(contest_id, user_id) is the primary key for this table.

Each row of this table contains the id of a user and the contest they registered into.
```

Write an SQL query to find the percentage of the users registered in each contest rounded to two decimals.

Return the result table ordered by percentage in descending order. In case of a tie, order it by contest\_id in ascending order.

The query result format is in the following example.

```undefined
+------------+------------+

| contest_id | percentage |

+------------+------------+

+------------+------------+

All the users registered in contests 208, 209, and 210. The percentage is 100% and we sort them in the answer table in ascending order.

Alice and Alex registered in contest 215 and the percentage is ((2/3) * 100) = 66.67%

Bob registered in contest 207 and the percentage is ((1/3) * 100) = 33.33%
```

### Solution

```sql
SELECT contest_id, ROUND(COUNT(user_id)*100.00/(SELECT COUNT(*) FROM users),2) as percentage

ORDER BY percentage desc, contest_id
```

## 1635\. Hopper Company Queries I | Hard | 🔒 [LeetCode](https://leetcode.com/problems/hopper-company-queries-i)

Table: `Drivers`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

driver_id is the primary key for this table.

Each row of this table contains the driver's ID and the date they joined the Hopper company.
```

Table: `Rides`

```undefined
+--------------+---------+

+--------------+---------+

+--------------+---------+

ride_id is the primary key for this table.

Each row of this table contains the ID of a ride, the user's ID that requested it, and the day they requested it.

There may be some ride requests in this table that were not accepted.
```

Table: `AcceptedRides`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

ride_id is the primary key for this table.

Each row of this table contains some information about an accepted ride.

It is guaranteed that each accepted ride exists in the Rides table.
```

Write an SQL query to report the following statistics for each month of **2020**:

The number of drivers currently with the Hopper company by the end of the month (**active\_drivers**). The number of accepted rides in that month (**accepted\_rides**). Return the result table ordered by **month** in ascending order, where **month** is the month's number (January is **1**, February is **2**, etc.).

The query result format is in the following example.

```undefined
+-----------+------------+

| driver_id | join_date  |

+-----------+------------+

+-----------+------------+

+---------+---------+--------------+

| ride_id | user_id | requested_at |

+---------+---------+--------------+

+---------+---------+--------------+

+---------+-----------+---------------+---------------+

| ride_id | driver_id | ride_distance | ride_duration |

+---------+-----------+---------------+---------------+

+---------+-----------+---------------+---------------+

+-------+----------------+----------------+

| month | active_drivers | accepted_rides |

+-------+----------------+----------------+

+-------+----------------+----------------+

By the end of January --> two active drivers (10, 8) and no accepted rides.

By the end of February --> three active drivers (10, 8, 5) and no accepted rides.

By the end of March --> four active drivers (10, 8, 5, 7) and one accepted ride (10).

By the end of April --> four active drivers (10, 8, 5, 7) and no accepted rides.

By the end of May --> five active drivers (10, 8, 5, 7, 4) and no accepted rides.

By the end of June --> five active drivers (10, 8, 5, 7, 4) and one accepted ride (13).

By the end of July --> five active drivers (10, 8, 5, 7, 4) and one accepted ride (7).

By the end of August --> five active drivers (10, 8, 5, 7, 4) and one accepted ride (17).

By the end of Septemeber --> five active drivers (10, 8, 5, 7, 4) and no accepted rides.

By the end of October --> six active drivers (10, 8, 5, 7, 4, 1) and no accepted rides.

By the end of November --> six active drivers (10, 8, 5, 7, 4, 1) and two accepted rides (20, 5).

By the end of December --> six active drivers (10, 8, 5, 7, 4, 1) and one accepted ride (2).
```

### Solution

```sql
    COUNT(DISTINCT driver_id) active_drivers,

    COUNT(DISTINCT rides.ride_id) accepted_rides

    UNION (SELECT 2 AS month)

    UNION (SELECT 3 AS month)

    UNION (SELECT 4 AS month)

    UNION (SELECT 5 AS month)

    UNION (SELECT 6 AS month)

    UNION (SELECT 7 AS month)

    UNION (SELECT 8 AS month)

    UNION (SELECT 9 AS month)

    UNION (SELECT 10 AS month)

    UNION (SELECT 11 AS month)

    UNION (SELECT 12 AS month)) t

    (CASE WHEN year(join_date) = 2019 THEN '1' ELSE month(join_date) END) `month`

    WHERE year(join_date) <= 2020) d

    (SELECT month(requested_at) AS `month`, a.ride_id

    WHERE year(requested_at) = 2020) rides
```

## 1645\. Hopper Company Queries II | Hard | 🔒 [LeetCode](https://leetcode.com/problems/hopper-company-queries-ii)

Table: `Drivers`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

driver_id is the primary key for this table.

Each row of this table contains the driver's ID and the date they joined the Hopper company.
```

Table: `Rides`

```undefined
+--------------+---------+

+--------------+---------+

+--------------+---------+

ride_id is the primary key for this table.

Each row of this table contains the ID of a ride, the user's ID that requested it, and the day they requested it.

There may be some ride requests in this table that were not accepted.
```

Table: `AcceptedRides`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

ride_id is the primary key for this table.

Each row of this table contains some information about an accepted ride.

It is guaranteed that each accepted ride exists in the Rides table.
```

Write an SQL query to report the percentage of working drivers (`working_percentage`) for each month of **2020** where:

![](https://www.dsfaisal.com/_next/image?url=%2Fstatic%2Fimages%2Farticles%2Fsql-questions%2Fleetcode-sql-1645.png&w=2048&q=75)

**Note** that if the number of available drivers during a month is zero, we consider the `working_percentage` to be `0`.

Return the result table ordered by `month` in **ascending** order, where **month** is the month's number (January is **1**, February is **2**, etc.). Round **working\_percentage** to the nearest **2 decimal places**.

The query result format is in the following example.

```undefined
+-----------+------------+

| driver_id | join_date  |

+-----------+------------+

+-----------+------------+

+---------+---------+--------------+

| ride_id | user_id | requested_at |

+---------+---------+--------------+

+---------+---------+--------------+

+---------+-----------+---------------+---------------+

| ride_id | driver_id | ride_distance | ride_duration |

+---------+-----------+---------------+---------------+

+---------+-----------+---------------+---------------+

+-------+--------------------+

| month | working_percentage |

+-------+--------------------+

+-------+--------------------+

By the end of January --> two active drivers (10, 8) and no accepted rides. The percentage is 0%.

By the end of February --> three active drivers (10, 8, 5) and no accepted rides. The percentage is 0%.

By the end of March --> four active drivers (10, 8, 5, 7) and one accepted ride by driver (10). The percentage is (1 / 4) * 100 = 25%.

By the end of April --> four active drivers (10, 8, 5, 7) and no accepted rides. The percentage is 0%.

By the end of May --> five active drivers (10, 8, 5, 7, 4) and no accepted rides. The percentage is 0%.

By the end of June --> five active drivers (10, 8, 5, 7, 4) and one accepted ride by driver (10). The percentage is (1 / 5) * 100 = 20%.

By the end of July --> five active drivers (10, 8, 5, 7, 4) and one accepted ride by driver (8). The percentage is (1 / 5) * 100 = 20%.

By the end of August --> five active drivers (10, 8, 5, 7, 4) and one accepted ride by driver (7). The percentage is (1 / 5) * 100 = 20%.

By the end of Septemeber --> five active drivers (10, 8, 5, 7, 4) and no accepted rides. The percentage is 0%.

By the end of October --> six active drivers (10, 8, 5, 7, 4, 1) and no accepted rides. The percentage is 0%.

By the end of November --> six active drivers (10, 8, 5, 7, 4, 1) and two accepted rides by two different drivers (1, 7). The percentage is (2 / 6) * 100 = 33.33%.

By the end of December --> six active drivers (10, 8, 5, 7, 4, 1) and one accepted ride by driver (4). The percentage is (1 / 6) * 100 = 16.67%.
```

### Solution

```sql
SELECT months_drivers.month, ROUND(COALESCE(100 * COALESCE(total_active_drivers, 0) / total_drivers, 0), 2) AS working_percentage

    SELECT month, COUNT(driver_id) AS total_drivers

        SELECT "2020-1-31" AS day, 1 AS month

        UNION SELECT "2020-2-29", 2

        UNION SELECT "2020-3-31", 3

        UNION SELECT "2020-4-30", 4

        UNION SELECT "2020-5-31", 5

        UNION SELECT "2020-6-30", 6

        UNION SELECT "2020-7-31", 7

        UNION SELECT "2020-8-31", 8

        UNION SELECT "2020-9-30", 9

        UNION SELECT "2020-10-31", 10

        UNION SELECT "2020-11-30", 11

        UNION SELECT "2020-12-31", 12

    SELECT month, COUNT(DISTINCT b.driver_id) AS total_active_drivers

        SELECT ride_id, CAST(substr(requested_at, 6, 2) AS unsigned) AS month

        WHERE substr(requested_at, 1, 4) = "2020"

    ON month_rides.ride_id = b.ride_id

ON months_drivers.month = months_active_drivers.month;
```

## 1651\. Hopper Company Queries III | Hard | 🔒 [LeetCode](https://leetcode.com/problems/hopper-company-queries-iii)

Table: `Drivers`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

driver_id is the primary key for this table.

Each row of this table contains the driver's ID and the date they joined the Hopper company.
```

Table: `Rides`

```undefined
+--------------+---------+

+--------------+---------+

+--------------+---------+

ride_id is the primary key for this table.

Each row of this table contains the ID of a ride, the user's ID that requested it, and the day they requested it.

There may be some ride requests in this table that were not accepted.
```

Table: `AcceptedRides`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

ride_id is the primary key for this table.

Each row of this table contains some information about an accepted ride.

It is guaranteed that each accepted ride exists in the Rides table.
```

Write an SQL query to compute the `average_ride_distance` and `average_ride_duration` of every 3-month window starting from **January - March 2020 to October - December 2020**. Round `average_ride_distance` and `average_ride_duration` to the nearest two decimal places.

The `average_ride_distance` is calculated by summing up the total `ride_distance` values from the three months and dividing it by `3`. The `average_ride_duration` is calculated in a similar way.

Return the result table ordered by `month` in ascending order, where `month` is the starting month's number (January is `1`, February is `2`, etc.).

The query result format is in the following example.

```undefined
+-----------+------------+

| driver_id | join_date  |

+-----------+------------+

+-----------+------------+

+---------+---------+--------------+

| ride_id | user_id | requested_at |

+---------+---------+--------------+

+---------+---------+--------------+

+---------+-----------+---------------+---------------+

| ride_id | driver_id | ride_distance | ride_duration |

+---------+-----------+---------------+---------------+

+---------+-----------+---------------+---------------+

+-------+-----------------------+-----------------------+

| month | average_ride_distance | average_ride_duration |

+-------+-----------------------+-----------------------+

+-------+-----------------------+-----------------------+

By the end of January --> average_ride_distance = (0+0+63)/3=21, average_ride_duration = (0+0+38)/3=12.67

By the end of February --> average_ride_distance = (0+63+0)/3=21, average_ride_duration = (0+38+0)/3=12.67

By the end of March --> average_ride_distance = (63+0+0)/3=21, average_ride_duration = (38+0+0)/3=12.67

By the end of April --> average_ride_distance = (0+0+73)/3=24.33, average_ride_duration = (0+0+96)/3=32.00

By the end of May --> average_ride_distance = (0+73+100)/3=57.67, average_ride_duration = (0+96+28)/3=41.33

By the end of June --> average_ride_distance = (73+100+119)/3=97.33, average_ride_duration = (96+28+68)/3=64.00

By the end of July --> average_ride_distance = (100+119+0)/3=73.00, average_ride_duration = (28+68+0)/3=32.00

By the end of August --> average_ride_distance = (119+0+0)/3=39.67, average_ride_duration = (68+0+0)/3=22.67

By the end of Septemeber --> average_ride_distance = (0+0+163)/3=54.33, average_ride_duration = (0+0+193)/3=64.33

By the end of October --> average_ride_distance = (0+163+6)/3=56.33, average_ride_duration = (0+193+38)/3=77.00
```

### Solution

```sql
    COALESCE(ROUND(SUM(ride_distance)/3,2),0) AS average_ride_distance,

    COALESCE(ROUND(SUM(ride_duration)/3,2),0) AS average_ride_duration

    SELECT months.month, ride_id

        SELECT "2020-1-1" AS start, "2020-3-31" AS last, 1 AS month

        UNION SELECT "2020-2-1", "2020-4-30", 2

        UNION SELECT "2020-3-1", "2020-5-31", 3

        UNION SELECT "2020-4-1", "2020-6-30", 4

        UNION SELECT "2020-5-1", "2020-7-31", 5

        UNION SELECT "2020-6-1", "2020-8-31", 6

        UNION SELECT "2020-7-1", "2020-9-30", 7

        UNION SELECT "2020-8-1", "2020-10-31", 8

        UNION SELECT "2020-9-1", "2020-11-30", 9

        UNION SELECT "2020-10-1", "2020-12-31", 10

    ON months.start <= requested_at AND months.last >= requested_at

LEFT JOIN AcceptedRides AS a

ON total.ride_id=a.ride_id
```

## 1661\. Average Time of Process per Machine | Easy | 🔒 [LeetCode](https://leetcode.com/problems/average-time-of-process-per-machine)

Table: `Activity`

```undefined
+----------------+---------+

+----------------+---------+

+----------------+---------+

The table shows the user activities for a factory website.

(machine_id, process_id, activity_type) is the primary key of this table.

machine_id is the ID of a machine.

process_id is the ID of a process running on the machine with ID machine_id.

activity_type is an ENUM of type ('start', 'end').

timestamp is a float representing the current time in seconds.

'start' means the machine starts the process at the given timestamp and 'end' means the machine ends the process at the given timestamp.

The 'start' timestamp will always be before the 'end' timestamp for every (machine_id, process_id) pair.
```

There is a factory website that has several machines each running the **same number of processes**. Write an SQL query to find the **average time** each machine takes to complete a process.

The time to complete a process is the `'end' timestamp` minus the `'start' timestamp`. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.

The resulting table should have the `machine_id` along with the **average time** as `processing_time`, which should be **rounded to 3 decimal places**.

The query result format is in the following example:

```undefined
+------------+------------+---------------+-----------+

| machine_id | process_id | activity_type | timestamp |

+------------+------------+---------------+-----------+

| 0          | 0          | start         | 0.712     |

| 0          | 1          | start         | 3.140     |

| 1          | 0          | start         | 0.550     |

| 1          | 1          | start         | 0.430     |

| 2          | 0          | start         | 4.100     |

| 2          | 1          | start         | 2.500     |

+------------+------------+---------------+-----------+

+------------+-----------------+

| machine_id | processing_time |

+------------+-----------------+

+------------+-----------------+

There are 3 machines running 2 processes each.

Machine 0's average time is ((1.520 - 0.712) + (4.120 - 3.140)) / 2 = 0.894

Machine 1's average time is ((1.550 - 0.550) + (1.420 - 0.430)) / 2 = 0.995

Machine 2's average time is ((4.512 - 4.100) + (5.000 - 2.500)) / 2 = 1.456
```

### Solution

```sql
ROUND(SUM(IF(activity_type='start', -timestamp, timestamp)) / COUNT(DISTINCT process_id), 3) AS processing_time
```

## 1667\. Fix Names in a Table | Easy | 🔒 [LeetCode](https://leetcode.com/problems/fix-names-in-a-table)

Table: `Users`

```undefined
+----------------+---------+

+----------------+---------+

+----------------+---------+

user_id is the primary key for this table.

This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.
```

Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by `user_id`.

The query result format is in the following example:

### Solution

```sql
    CONCAT(UPPER(LEFT(name,1)),LOWER(SUBSTRING(name,2))) AS name
```

## 1677\. Product's Worth Over Invoices | Easy | 🔒 [LeetCode](https://leetcode.com/problems/products-worth-over-invoices)

Table: `Product`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

product_id is the primary key for this table.

This table contains the ID and the name of the product. The name consists of only lowercase English letters. No two products have the same name.
```

Table: `Invoice`

```undefined
invoice_id is the primary key for this table and the id of this invoice.

product_id is the id of the product for this invoice.

rest is the amount left to pay for this invoice.

paid is the amount paid for this invoice.

canceled is the amount canceled for this invoice.

refunded is the amount refunded for this invoice.
```

Write an SQL query that will, for all products, return each product name with total amount due, paid, canceled, and refunded across all invoices.

Return the result table ordered by `product_name`.

The query result format is in the following example:

```undefined
+------------+------------+------+------+----------+----------+

| invoice_id | product_id | rest | paid | canceled | refunded |

+------------+------------+------+------+----------+----------+

| 23         | 0          | 2    | 0    | 5        | 0        |

| 12         | 0          | 0    | 4    | 0        | 3        |

| 1          | 1          | 1    | 1    | 0        | 1        |

| 2          | 1          | 1    | 0    | 1        | 1        |

| 3          | 1          | 0    | 1    | 1        | 1        |

| 4          | 1          | 1    | 1    | 1        | 0        |

+------------+------------+------+------+----------+----------+

+-------+------+------+----------+----------+

| name  | rest | paid | canceled | refunded |

+-------+------+------+----------+----------+

| bacon | 3    | 3    | 3        | 3        |

+-------+------+------+----------+----------+

- The amount of money left to pay for bacon is 1 + 1 + 0 + 1 = 3

- The amount of money paid for bacon is 1 + 0 + 1 + 1 = 3

- The amount of money canceled for bacon is 0 + 1 + 1 + 1 = 3

- The amount of money refunded for bacon is 1 + 1 + 1 + 0 = 3

- The amount of money left to pay for ham is 2 + 0 = 2

- The amount of money paid for ham is 0 + 4 = 4

- The amount of money canceled for ham is 5 + 0 = 5

- The amount of money refunded for ham is 0 + 3 = 3
```

### Solution

```sql
    SUM(i.canceled) AS canceled,

    SUM(i.refunded) AS refunded

LEFT JOIN Product p ON p.product_id = i.product_id
```

## 1683\. Invalid Tweets | Easy | 🔒 [LeetCode](https://leetcode.com/problems/invalid-tweets)

Table: `Tweets`

```undefined
+----------------+---------+

+----------------+---------+

+----------------+---------+

tweet_id is the primary key for this table.

This table contains all the tweets in a social media app.
```

Write an SQL query to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is `strictly greater` than `15`.

Return the result table `in any order`.

The query result format is in the following example:

```undefined
+----------+----------------------------------+

+----------+----------------------------------+

| 2        | Let us make America great again! |

+----------+----------------------------------+

Tweet 1 has length = 14. It is a valid tweet.

Tweet 2 has length = 32. It is an invalid tweet.
```

### Solution

```sql
WHERE LENGTH(content) > 15;
```

## 1693\. Daily Leads and Partners | Easy | 🔒 [LeetCode](https://leetcode.com/problems/daily-leads-and-partners)

Table: `DailySales`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

This table does not have a primary key.

This table contains the date and the name of the product sold and the IDs of the lead and partner it was sold to.

The name consists of only lowercase English letters.
```

Write an SQL query that will, for each `date_id` and `make_name`, return the number of distinct `lead_id`'s and distinct `partner_id`'s.

Return the result table in any order.

The query result format is in the following example:

```undefined
+-----------+-----------+---------+------------+

| date_id   | make_name | lead_id | partner_id |

+-----------+-----------+---------+------------+

| 2020-12-8 | toyota    | 0       | 1          |

| 2020-12-8 | toyota    | 1       | 0          |

| 2020-12-8 | toyota    | 1       | 2          |

| 2020-12-7 | toyota    | 0       | 2          |

| 2020-12-7 | toyota    | 0       | 1          |

| 2020-12-8 | honda     | 1       | 2          |

| 2020-12-8 | honda     | 2       | 1          |

| 2020-12-7 | honda     | 0       | 1          |

| 2020-12-7 | honda     | 1       | 2          |

| 2020-12-7 | honda     | 2       | 1          |

+-----------+-----------+---------+------------+

+-----------+-----------+--------------+-----------------+

| date_id   | make_name | unique_leads | unique_partners |

+-----------+-----------+--------------+-----------------+

| 2020-12-8 | toyota    | 2            | 3               |

| 2020-12-7 | toyota    | 1            | 2               |

| 2020-12-8 | honda     | 2            | 2               |

| 2020-12-7 | honda     | 3            | 2               |

+-----------+-----------+--------------+-----------------+

For 2020-12-8, toyota gets leads = [0, 1] and partners = [0, 1, 2] while honda gets leads = [1, 2] and partners = [1, 2].

For 2020-12-7, toyota gets leads = [0] and partners = [1, 2] while honda gets leads = [0, 1, 2] and partners = [1, 2].
```

### Solution

```sql
SELECT date_id, make_name,

    COUNT(DISTINCT lead_id) AS unique_leads,

    COUNT(DISTINCT partner_id) AS unique_partners

GROUP BY date_id, make_name
```

## 1699\. Number of Calls Between Two Persons | Medium | 🔒 [LeetCode](https://leetcode.com/problems/number-of-calls-between-two-persons)

Table: `Calls`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

This table does not have a primary key, it may contain duplicates.

This table contains the duration of a phone call between from_id and to_id.
```

Write an SQL query to report the number of calls and the total call duration between each pair of distinct persons `(person1, person2)` where `person1 < person2`.

Return the result table in any order.

The query result format is in the following example:

```undefined
+---------+-------+----------+

| from_id | to_id | duration |

+---------+-------+----------+

+---------+-------+----------+

+---------+---------+------------+----------------+

| person1 | person2 | call_count | total_duration |

+---------+---------+------------+----------------+

+---------+---------+------------+----------------+

Users 1 and 2 had 2 calls and the total duration is 70 (59 + 11).

Users 1 and 3 had 1 call and the total duration is 20.

Users 3 and 4 had 4 calls and the total duration is 999 (100 + 200 + 200 + 499).
```

### Solution

```sql
SELECT from_id AS person1,to_id AS person2,

    COUNT(duration) AS call_count, SUM(duration) AS total_duration

      SELECT to_id, from_id, duration

GROUP BY person1, person2

    IF(from_id<to_id,from_id,to_id) person1,

    IF(from_id>to_id,from_id,to_id) person2,

    SUM(duration) total_duration

    IF(from_id<to_id,from_id,to_id),

    IF(from_id>to_id,from_id,to_id);
```

## 1709\. Biggest Window Between Visits | Medium | 🔒 [LeetCode](https://leetcode.com/problems/biggest-window-between-visits)

Table: `UserVisits`

```undefined
This table does not have a primary key.

This table contains logs of the dates that users vistied a certain retailer.
```

Assume today's date is `'2021-1-1'`.

Write an SQL query that will, for each `user_id`, find out the largest `window` of days between each visit and the one right after it (or today if you are considering the last visit).

Return the result table ordered by `user_id`.

The query result format is in the following example:

```undefined
+---------+---------------+

| user_id | biggest_window|

+---------+---------------+

+---------+---------------+

For the first user, the windows in question are between dates:

    - 2020-10-20 and 2020-11-28 with a total of 39 days.

    - 2020-11-28 and 2020-12-3 with a total of 5 days.

    - 2020-12-3 and 2021-1-1 with a total of 29 days.

Making the biggest window the one with 39 days.

For the second user, the windows in question are between dates:

    - 2020-10-5 and 2020-12-9 with a total of 65 days.

    - 2020-12-9 and 2021-1-1 with a total of 23 days.

Making the biggest window the one with 65 days.

For the third user, the only window in question is between dates 2020-11-11 and 2021-1-1 with a total of 51 days.
```

### Solution

```sql
SELECT user_id, max(diff) AS biggest_window

       datediff(coalesce(lead(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date), '2021-01-01'), visit_date) AS diff
```

## 1715\. Count Apples and Oranges | Medium | 🔒 [LeetCode](https://leetcode.com/problems/count-apples-and-oranges)

Table: `Boxes`

```undefined
box_id is the primary key for this table.

chest_id is a foreign key of the chests table.

This table contains information about the boxes and the number of oranges and apples they contain. Each box may contain a chest, which also can contain oranges and apples.
```

Table: `Chests`

```undefined
chest_id is the primary key for this table.

This table contains information about the chests we have, and the corresponding number if oranges and apples they contain.
```

Write an SQL query to count the number of apples and oranges in all the boxes. If a box contains a chest, you should also include the number of apples and oranges it has.

Return the result table in **any order**.

The query result format is in the following example:

```undefined
+--------+----------+-------------+--------------+

| box_id | chest_id | apple_count | orange_count |

+--------+----------+-------------+--------------+

+--------+----------+-------------+--------------+

+----------+-------------+--------------+

| chest_id | apple_count | orange_count |

+----------+-------------+--------------+

+----------+-------------+--------------+

+-------------+--------------+

| apple_count | orange_count |

+-------------+--------------+

+-------------+--------------+

box 2 has 6 apples and 15 oranges.

box 18 has 4 + 20 (from the chest) = 24 apples and 15 + 10 (from the chest) = 25 oranges.

box 19 has 8 + 19 (from the chest) = 27 apples and 4 + 4 (from the chest) = 8 oranges.

box 12 has 19 + 8 (from the chest) = 27 apples and 20 + 8 (from the chest) = 28 oranges.

box 20 has 12 + 5 (from the chest) = 17 apples and 9 + 6 (from the chest) = 15 oranges.

box 8 has 9 + 5 (from the chest) = 14 apples and 9 + 6 (from the chest) = 15 oranges.

box 3 has 16 + 20 (from the chest) = 36 apples and 7 + 10 (from the chest) = 17 oranges.

Total number of apples = 6 + 24 + 27 + 27 + 17 + 14 + 36 = 151

Total number of oranges = 15 + 25 + 8 + 28 + 15 + 15 + 17 = 123
```

### Solution

```sql
SELECT sum(IFNULL(box.apple_count, 0) + IFNULL(chest.apple_count, 0)) AS apple_count,

    sum(IFNULL(box.orange_count, 0) + IFNULL(chest.orange_count, 0)) AS orange_count

    LEFT JOIN Chests AS chest

    ON box.chest_id = chest.chest_id;
```

## 1729\. Find Followers Count | Easy | 🔒 [LeetCode](https://leetcode.com/problems/find-followers-count)

Table: `Followers`

```undefined
(user_id, follower_id) is the primary key for this table.

This table contains the IDs of a user and a follower in a social media app where the follower follows the user.
```

Write an SQL query that will, for each user, return the number of followers.

Return the result table ordered by user\_id.

The query result format is in the following example:

```undefined
+---------+-------------+

| user_id | follower_id |

+---------+-------------+

+---------+-------------+

+---------+----------------+

| user_id | followers_count|

+---------+----------------+

+---------+----------------+

The followers of 0 are {1}

The followers of 1 are {0}

The followers of 2 are {0,1}
```

### Solution

```sql
SELECT user_id, COUNT(DISTINCT follower_id) followers_count
```

## 1731\. The Number of Employees Which Report to Each Employee | Easy | 🔒 [LeetCode](https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee)

Table: `Employees`

```undefined
+-------------+----------+

+-------------+----------+

+-------------+----------+

employee_id is the primary key for this table.

This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null).
```

For this problem, we will consider a **manager** an employee who has at least 1 other employee reporting to them.

Write an SQL query to report the ids and the names of all **managers**, the number of employees who report **directly** to them, and the average age of the reports rounded to the nearest integer.

Return the result table ordered by `employee_id`.

The query result format is in the following example:

```undefined
+-------------+---------+------------+-----+

| employee_id | name    | reports_to | age |

+-------------+---------+------------+-----+

| 9           | Hercy   | null       | 43  |

| 2           | Winston | null       | 37  |

+-------------+---------+------------+-----+

+-------------+-------+---------------+-------------+

| employee_id | name  | reports_count | average_age |

+-------------+-------+---------------+-------------+

+-------------+-------+---------------+-------------+

Hercy has 2 people report directly to him, Alice and Bob. Their average age is (41+36)/2 = 38.5, which is 39 after rounding it to the nearest integer.
```

### Solution

```sql
SELECT e1.reports_to AS employee_id,

       COUNT(e1.reports_to) AS reports_count,

       ROUND(AVG(e1.age),0) AS average_age

ON e1.reports_to=e2.employee_id
```

## 1741\. Find Total Time Spent by Each Employee | Easy | 🔒 [LeetCode](https://leetcode.com/problems/find-total-time-spent-by-each-employee)

Table: `Employees`

```undefined
(emp_id, event_day, in_time) is the primary key of this table.

The table shows the employees' entries and exits in an office.

event_day is the day at which this event happened and in_time is the minute at which the employee entered the office and out_time is the time at which he got outnumbered from 1 to 1440.

It's guaranteed that no two events on the same day intersect in time.
```

Write an SQL query to calculate the total time **in minutes** spent by each employee on each day at the office. Note that within one day, an employee can enter and leave more than once.

Return the result table in **any order**.

The query result format is in the following example:

```undefined
+--------+------------+---------+----------+

| emp_id | event_day  | in_time | out_time |

+--------+------------+---------+----------+

| 1      | 2020-11-28 | 4       | 32       |

| 1      | 2020-11-28 | 55      | 200      |

| 1      | 2020-12-03 | 1       | 42       |

| 2      | 2020-11-28 | 3       | 33       |

| 2      | 2020-12-09 | 47      | 74       |

+--------+------------+---------+----------+

+------------+--------+------------+

| day        | emp_id | total_time |

+------------+--------+------------+

+------------+--------+------------+

Employee 1 has three events two on day 2020-11-28 with a total of (32 - 4) + (200-55) = 173 and one on day 2020-12-03 with a total of (42 - 1) = 41.

Employee 2 has two events one on day 2020-11-28 with a total of (33-3) = 30 and one on day 2020-12-09 with a total of (74 - 47) = 27.
```

### Solution

```sql
SELECT event_day AS day, emp_id, SUM(out_time - in_time) AS total_time
```

## 1747\. Leetflex Banned Accounts | Medium | 🔒 [LeetCode](https://leetcode.com/problems/leetflex-banned-accounts)

Table: `LogInfo`

```undefined
+-------------+----------+

+-------------+----------+

+-------------+----------+

There is no primary key for this table, and it may contain duplicates.

The table contains information about the login and logout dates of Leetflex accounts. It also contains the IP address from which the account logged in and out.

It is guaranteed that the logout time is after the login time.
```

Write an SQL query to find the `account_id` of the accounts that should be banned from Leetflex. An account should be banned if it was logged in at some moment from two different IP addresses.

Return the result table in any order.

The query result format is in the following example:

```undefined
+------------+------------+---------------------+---------------------+

| account_id | ip_address | login               | logout              |

+------------+------------+---------------------+---------------------+

| 1          | 1          | 2021-02-01 09:00:00 | 2021-02-01 09:30:00 |

| 1          | 2          | 2021-02-01 08:00:00 | 2021-02-01 11:30:00 |

| 2          | 6          | 2021-02-01 20:30:00 | 2021-02-01 22:00:00 |

| 2          | 7          | 2021-02-02 20:30:00 | 2021-02-02 22:00:00 |

| 3          | 9          | 2021-02-01 16:00:00 | 2021-02-01 16:59:59 |

| 3          | 13         | 2021-02-01 17:00:00 | 2021-02-01 17:59:59 |

| 4          | 10         | 2021-02-01 16:00:00 | 2021-02-01 17:00:00 |

| 4          | 11         | 2021-02-01 17:00:00 | 2021-02-01 17:59:59 |

+------------+------------+---------------------+---------------------+

Account ID 1 --> The account was active from "2021-02-01 09:00:00" to "2021-02-01 09:30:00" with two different IP addresses (1 and 2). It should be banned.

Account ID 2 --> The account was active from two different addresses (6, 7) but in two different times.

Account ID 3 --> The account was active from two different addresses (9, 13) on the same day but they do not intersect at any moment.

Account ID 4 --> The account was active from "2021-02-01 17:00:00" to "2021-02-01 17:00:00" with two different IP addresses (10 and 11). It should be banned.
```

### Solution

```sql
SELECT DISTINCT l1.account_id

ON l1.account_id = l2.account_id AND l1.ip_address != l2.ip_address

WHERE NOT (l1.login > l2.logout OR l1.logout < l2.login)
```

## 1757\. Recyclable and Low Fat Products | Easy | 🔒 [LeetCode](https://leetcode.com/problems/recyclable-and-low-fat-products)

Table: `Products`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

product_id is the primary key for this table.

low_fats is an ENUM of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.

recyclable is an ENUM of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.
```

Write an SQL query to find the ids of products that are both low fat and recyclable.

Return the result table in **any order**.

The query result format is in the following example:

```undefined
+-------------+----------+------------+

| product_id  | low_fats | recyclable |

+-------------+----------+------------+

+-------------+----------+------------+

Only products 1 and 3 are both low fat and recyclable.
```

### Solution

```sql
WHERE low_fats = "Y" AND recyclable = "Y"
```

## 1767\. Find the Subtasks That Did Not Execute | Hard | 🔒 [LeetCode](https://leetcode.com/problems/find-the-subtasks-that-did-not-execute)

Table: `Tasks`

```undefined
+----------------+---------+

+----------------+---------+

+----------------+---------+

task_id is the primary key for this table.

Each row in this table indicates that task_id was divided into subtasks_count subtasks labelled from 1 to subtasks_count.

It is guaranteed that 2 <= subtasks_count <= 20.
```

Table: `Executed`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

(task_id, subtask_id) is the primary key for this table.

Each row in this table indicates that for the task task_id, the subtask with ID subtask_id was executed successfully.

It is guaranteed that subtask_id <= subtasks_count for each task_id.
```

Write an SQL query to report the IDs of the missing subtasks for each `task_id`.

Return the result table in **any order**.

The query result format is in the following example:

```undefined
+---------+----------------+

| task_id | subtasks_count |

+---------+----------------+

+---------+----------------+

Task 1 was divided into 3 subtasks (1, 2, 3). Only subtask 2 was executed successfully, so we include (1, 1) and (1, 3) in the answer.

Task 2 was divided into 2 subtasks (1, 2). No subtask was executed successfully, so we include (2, 1) and (2, 2) in the answer.

Task 3 was divided into 4 subtasks (1, 2, 3, 4). All of the subtasks were executed successfully.
```

### Solution

```sql
   UNION ALL SELECT subtask_id + 1

       (SELECT MAX(subtasks_count)

INNER JOIN Tasks ON CTE.subtask_id <= Tasks.subtasks_count

LEFT JOIN Executed ON Tasks.task_id = Executed.task_id

                      AND CTE.subtask_id = Executed.subtask_id

WHERE Executed.subtask_id IS NULL
```

## 1777\. Product's Price for Each Store | Easy | 🔒 [LeetCode](https://leetcode.com/problems/products-price-for-each-store)

Table: `Products`

```undefined
+-------------+---------+

+-------------+---------+

+-------------+---------+

(product_id,store) is the primary key for this table.

store is an ENUM of type ('store1', 'store2', 'store3') where each represents the store this product is available at.

price is the price of the product at this store.
```

Write an SQL query to find the price of each product in each store.

Return the result table in **any order**.

The query result format is in the following example:

```undefined
+-------------+--------+-------+

| product_id  | store  | price |

+-------------+--------+-------+

+-------------+--------+-------+

+-------------+--------+--------+--------+

| product_id  | store1 | store2 | store3 |

+-------------+--------+--------+--------+

+-------------+--------+--------+--------+

Product 0 price's are 95 for store1, 100 for store2 and, 105 for store3.

Product 1 price's are 70 for store1, 80 for store3 and, it's not sold in store2.
```

### Solution

```sql
       SUM(CASE WHEN store='store1' THEN price END) AS store1,

       SUM(CASE WHEN store='store2' THEN price END) AS store2,

       SUM(CASE WHEN store='store3' THEN price END) AS store3
```

## 1783\. Grand Slam Titles | Medium | 🔒 [LeetCode](https://leetcode.com/problems/grand-slam-titles)

Table: `Players`

```undefined
+----------------+---------+

+----------------+---------+

| player_name    | varchar |

+----------------+---------+

player_id is the primary key for this table.

Each row in this table contains the name and the ID of a tennis player.
```

Table: `Championships`

```undefined
+---------------+---------+

+---------------+---------+

+---------------+---------+

year is the primary key for this table.

Each row of this table containts the IDs of the players who won one each tennis tournament of the grand slam.
```

Write an SQL query to report the number of grand slam tournaments won by each player. Do not include the players who did not win any tournament.

Return the result table in **any order**.

The query result format is in the following example:

```undefined
+-----------+-------------+

| player_id | player_name |

+-----------+-------------+

+-----------+-------------+

+------+-----------+---------+---------+---------+

| year | Wimbledon | Fr_open | US_open | Au_open |

+------+-----------+---------+---------+---------+

+------+-----------+---------+---------+---------+

+-----------+-------------+-------------------+

| player_id | player_name | grand_slams_count |

+-----------+-------------+-------------------+

+-----------+-------------+-------------------+

Player 1 (Nadal) won 7 titles: Wimbledon (2018, 2019), Fr_open (2018, 2019, 2020), US_open (2018), and Au_open (2018).

Player 2 (Federer) won 5 titles: Wimbledon (2020), US_open (2019, 2020), and Au_open (2019, 2020).

Player 3 (Novak) did not win anything, we did not include them in the result table.
```

### Solution

```sql
SELECT player_id, player_name,

SUM((IF(Wimbledon = player_id,1,0) +

IF(Fr_open = player_id,1,0) +

IF(US_open = player_id,1,0) +

IF(Au_open = player_id,1,0))) as grand_slams_count

FROM Players INNER JOIN Championships

ON Wimbledon = player_id OR Fr_open = player_id OR US_open = player_id OR Au_open = player_id

     AS (SELECT wimbledon AS id

       Count(*) AS grand_slams_count

               ON players.player_id = cte.id
```

## 1789\. Primary Department for Each Employee | Easy | 🔒 [LeetCode](https://leetcode.com/problems/primary-department-for-each-employee)

Table: `Employee`

```undefined
+--------------+---------+

+--------------+---------+

| primary_flag | varchar |

+--------------+---------+

(employee_id, department_id) is the primary key for this table.

employee_id is the id of the employee.

department_id is the id of the department to which the employee belongs.

primary_flag is an ENUM of type ('Y', 'N'). If the flag is 'Y', the department is the primary department for the employee. If the flag is 'N', the department is not the primary.
```

Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. Note that when an employee belongs to only one department, their primary column is `'N'`.

Write an SQL query to report all the employees with their primary department. For employees who belong to one department, report their only department.

Return the result table in any order.

The query result format is in the following example.

```undefined
+-------------+---------------+--------------+

| employee_id | department_id | primary_flag |

+-------------+---------------+--------------+

+-------------+---------------+--------------+

+-------------+---------------+

| employee_id | department_id |

+-------------+---------------+

+-------------+---------------+

- The Primary department for employee 1 is 1.

- The Primary department for employee 2 is 1.

- The Primary department for employee 3 is 3.

- The Primary department for employee 4 is 3.
```

### Solution

```sql
SELECT employee_id,department_id

WHERE primary_flag = 'Y' OR employee_id IN

     HAVING COUNT(department_id) = 1)

WHERE primary_flag = 'Y')

HAVING COUNT(employee_id) = 1
```
