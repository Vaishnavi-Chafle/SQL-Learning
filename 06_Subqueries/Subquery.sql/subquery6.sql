-- Independent subquery -- Row Subquery(One colm Mult Rows)
-- 1.find all users who never ordered 
SELECT * FROM subquery.users
WHERE user_id NOT IN (SELECT DISTINCT(user_id) FROM subquery.orders)

