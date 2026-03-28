-- subquery in UPDATE
-- Populate the money colm of loyal_customer table using the orders table. Provide a 10% app money 
-- to all Customers based on their order value
UPDATE  subquery.loyal_users t1
SET money = (SELECT (10 * SUM(amount) /100) AS "discount"
			 FROM subquery.orders t2
             WHERE t2.user_id = t1.user_id)

