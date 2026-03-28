USE sql_cs_live;
--- CROSS join
SELECT * FROM users1 t1
CROSS JOIN sql_cs_live.groups t2;

-- Inner Join
SELECT * FROM sql_cs_live.users1 t1
INNER JOIN sql_cs_live.membership t2
ON t1.user_id = t2.user_id;

-- Left Join
SELECT * FROM sql_cs_live.users1 t1
LEFT JOIN sql_cs_live.membership t2
ON t1.user_id = t2.user_id;

-- RIGHT join
SELECT * FROM sql_cs_live.users1 t1
RIGHT JOIN sql_cs_live.membership t2
ON t1.user_id = t2.user_id;

-- OUTER join
-- in MySQL FULL OUTER JOIN not work  if we  want to do full outer join then we have to use one way
-- SELECT * FROM sql_cs_live.users1 t1
-- OUTER JOIN sql_cs_live.membership t2
-- ON t1.user_id = t2.user_id 
SELECT * FROM sql_cs_live.users1 t1
LEFT JOIN sql_cs_live.membership t2
ON t1.user_id = t2.user_id
UNION 
SELECT * FROM sql_cs_live.users1 t1
RIGHT JOIN sql_cs_live.membership t2
ON t1.user_id = t2.user_id;

-- -- UNION 
SELECT * FROM sql_cs_live.person1
UNION
SELECT * FROM sql_cs_live.person2;

-- UNION ALL
SELECT * FROM sql_cs_live.person1
UNION ALL
SELECT * FROM sql_cs_live.person2;

-- Intersect
SELECT * FROM sql_cs_live.person1
INTERSECT
SELECT * FROM sql_cs_live.person2;

-- EXCEPT
SELECT * FROM sql_cs_live.person1
EXCEPT
SELECT * FROM sql_cs_live.person2;

-- -- joining on more than two table + filtering rows 
SELECT t1.order_id, t1.amount, t1.profit, t1.quantity, t3.name 
FROM flipcart.order_details t1
JOIN flipcart.orders t2
ON t1.order_id = t2.order_id
JOIN flipcart.users t3
ON t2.user_id = t3.user_id;

-- Filtering rows
SELECT t1.order_id,t2.city, t4.vertical FROM flipcart.orders t1
JOIN flipcart.users t2
ON t1.user_id = t2.user_id
JOIN flipcart.order_details t3
ON t1.order_id = t3.order_id
JOIN flipcart.category t4
ON t3.category_id = t4.category_id
WHERE t2.city = "Pune";

-- 
SELECT t1.order_id,t2.city, t4.vertical FROM flipcart.orders t1
JOIN flipcart.users t2
ON t1.user_id = t2.user_id
JOIN flipcart.order_details t3
ON t1.order_id = t3.order_id
JOIN flipcart.category t4
ON t3.category_id = t4.category_id
WHERE t4.vertical = "Chairs";

-- practice question

-- 1. Find all profitable orders
SELECT t1.order_id, SUM(t2.profit) AS "profit" 
FROM flipcart.orders t1
JOIN flipcart.order_details t2
ON t1.order_id = t2.order_id
GROUP BY order_id
HAVING profit > 0
ORDER BY profit DESC;

-- -- Find the customer who have placed max number of orders
SELECT t1.name,COUNT(*) AS "total_orders"
FROM flipcart.users t1
JOIN flipcart.orders t2
ON t1.user_id = t2.user_id
GROUP BY t1.name
ORDER BY total_orders DESC LIMIT 1;

-- -- WHICH IS THE MOST PROFITABLE CATEGORY

SELECT t1.vertical, SUM(profit) AS "profit"
FROM flipcart.category t1
JOIN flipcart.order_details t2
ON t1.category_id = t2.category_id
GROUP BY t1.vertical
ORDER BY profit DESC LIMIT 1;


-- which is the most profitable state
SELECT t1.state,SUM(t3.profit) AS "total_profit"
FROM flipcart.users t1
JOIN flipcart.orders t2
ON t1.user_id = t2.user_id
JOIN flipcart.order_details t3
ON t2.order_id = t3.order_id 
GROUP BY t1.state
ORDER BY total_profit DESC LIMIT 1;

-- Find all the categories with profit higher than 5000
SELECT t1.vertical, SUM(t2.profit) AS "total_profit"
FROM flipcart.category t1
JOIN flipcart.order_details t2
ON t1.category_id = t2.category_id
GROUP BY vertical 
HAVING total_profit > 3000;
