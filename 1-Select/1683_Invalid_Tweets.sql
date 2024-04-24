-- Source: https://leetcode.com/problems/invalid-tweets/description/?envType=study-plan-v2&envId=top-sql-50

-- Table: Tweets

-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | tweet_id       | int     |
-- | content        | varchar |
-- +----------------+---------+
-- tweet_id is the primary key (column with unique values) for this table.
-- This table contains all the tweets in a social media app.

-- Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

-- Return the result table in any order.

------------------------------------------------------------------------------

-- SQL Schema

CREATE TABLE IF NOT EXISTS Tweets(tweet_id int, content varchar(50))
TRUNCATE TABLE Tweets
INSERT INTO Tweets (tweet_id, content) VALUES ('1', 'Vote for Biden')
INSERT INTO Tweets (tweet_id, content) VALUES ('2', 'Let us make America great again!')

-- MS SQL Server Code

SELECT tweet_id
FROM Tweets
WHERE LEN(content) > 15
