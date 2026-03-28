-- subquery in DELETE
-- Delete all the customer records who never ordered

DELETE FROM subquery.users
WHERE user_id IN (SELECT user_id FROM (SELECT user_id 
										FROM subquery.users
										WHERE user_id NOT IN (SELECT DISTINCT(user_id) 
															  FROM subquery.orders)) AS temp)
                                                              
                                                         


