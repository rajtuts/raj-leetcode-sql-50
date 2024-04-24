-- Source: https://leetcode.com/problems/recyclable-and-low-fat-products/description/?envType=study-plan-v2&envId=top-sql-50

-- Table: Products

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_id  | int     |
-- | low_fats    | enum    |
-- | recyclable  | enum    |
-- +-------------+---------+
-- product_id is the primary key (column with unique values) for this table.
-- low_fats is an ENUM (category) of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
-- recyclable is an ENUM (category) of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.

-- Write a solution to find the ids of products that are both low fat and recyclable.

-- Return the result table in any order.

------------------------------------------------------------------------------

-- SQL Schema

CREATE TABLE IF NOT EXISTS Products (product_id int, low_fats ENUM('Y', 'N'), recyclable ENUM('Y','N'))
TRUNCATE TABLE Products
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('0', 'Y', 'N')
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('1', 'Y', 'Y')
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('2', 'N', 'Y')
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('3', 'Y', 'Y')
INSERT INTO Products (product_id, low_fats, recyclable) VALUES ('4', 'N', 'N')

-- MS SQL Server Code

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y'
