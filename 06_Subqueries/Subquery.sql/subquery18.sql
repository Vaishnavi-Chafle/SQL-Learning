-- Usage of INSERT
-- 1. Populate a aready created loyal_customers table with records of onlu those customers 
-- who have ordered food more than 3 times
INSERT INTO subquery.loyal_users
(user_id,name,money)
SELECT t1.user_id ,name
FROM subquery.orders t1
JOIN subquery.users t2
ON t1.user_id = t2.user_id
GROUP BY user_id,name
HAVING COUNT(*) > 3