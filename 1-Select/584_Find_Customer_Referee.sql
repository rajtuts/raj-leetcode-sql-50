-- Source: https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan-v2&envId=top-sql-50

-- Table: Customer

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | referee_id  | int     |
-- +-------------+---------+
-- In SQL, id is the primary key column for this table.
-- Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.


-- Find the names of the customer that are not referred by the customer with id = 2.

-- Return the result table in any order.

-- The result format is in the following example.

------------------------------------------------------------------------------

-- SQL Schema

CREATE TABLE IF NOT EXISTS Customer (id int, name varchar(25), referee_id int)
TRUNCATE TABLE Customer
INSERT INTO Customer (id, name, referee_id) VALUES ('1', 'Will', 'None')
INSERT INTO Customer (id, name, referee_id) VALUES ('2', 'Jane', 'None')
INSERT INTO Customer (id, name, referee_id) VALUES ('3', 'Alex', '2')
INSERT INTO Customer (id, name, referee_id) VALUES ('4', 'Bill', 'None')
INSERT INTO Customer (id, name, referee_id) VALUES ('5', 'Zack', '1')
INSERT INTO Customer (id, name, referee_id) VALUES ('6', 'Mark', '2')

-- MS SQL Server Code

SELECT name
FROM Customer
WHERE referee_id <> 2 OR referee_id IS NULL
