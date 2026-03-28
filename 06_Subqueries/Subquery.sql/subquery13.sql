-- find the favourite food of each customer
WITH fav_food AS (SELECT t1.user_id,t1.name,t4.f_name,COUNT(*) AS "frequency" FROM subquery.users t1
					JOIN subquery.orders t2 ON t1.user_id = t2.user_id
					JOIN subquery.order_details t3 ON t2.order_id = t3.order_id
					JOIN subquery.food t4 ON t3.f_id = t4.f_id
					GROUP BY t1.name,t1.user_id,t4.f_id,t4.f_name)
 SELECT name,f_name,frequency FROM fav_food f1
 WHERE frequency = (SELECT MAX(frequency) 
                    FROM fav_food f2 
                    WHERE f2.user_id = f1.user_id)          
     

