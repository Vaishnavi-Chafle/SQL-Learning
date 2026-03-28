-- ------- INSERT -------------
-- Populate a already created loyal_customer table with records of only those customers who have ordered
-- food more than 3 times 

-- NOTE : while inserting the multiple values in the table we do not need to write the VALUES keword bcz values insert one row at a time

CREATE TABLE subquery.loyal_users(
user_id INT PRIMARY KEY,
name VARCHAR(255),
money int);

INSERT INTO subquery.loyal_users(user_id,name)
SELECT t1.user_id, t2.name
FROM subquery.orders t1
JOIN subquery.users t2
ON t1.user_id = t2.user_id
GROUP BY user_id ,name
HAVING COUNT(*) > 3;
                                 
-- ---------------- UPDATE ------------
-- Populate the money colm of loyal_customer table using the order table. provide a 10% app money to all customer 
-- based on the order value
USE subquery;

UPDATE loyal_users t1
set money = (SELECT SUM(amount)*0.1
			FROM orders t2
            WHERE t2.user_id = t1.user_id);

-- --------------- DELETE ---------------
-- Delete all the customer records who have never ordered

DELETE FROM subquery.users
WHERE user_id IN (SELECT user_id FROM (SELECT user_id FROM subquery.users
										WHERE user_id NOT IN 
                                        (SELECT DISTINCT(user_id) 
											FROM subquery.orders)) AS temp)



