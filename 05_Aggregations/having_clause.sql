-- HAVING CLAUSE


-- 1)find the avg rating of smartphones brands which have more that 20 phones 
SELECT brand_name, COUNT(*) AS "num_phones",
AVG(rating) AS "avg_rating"
FROM campusx.smartphones
GROUP BY brand_name
HAVING COUNT(*) > 20
ORDER BY avg_rating DESC ;


-- 2) Find the top three brnads with the highest avg ram that have a refresh rate of at least 40 hz and fast charging available and dont consider the brands which have less that 10 phones
SELECT brand_name, AVG(ram_capacity) AS "avg_ram",COUNT(*)
FROM campusx.smartphones
WHERE refresh_rate > 90 AND fast_charging_available = 1
GROUP BY brand_name 
HAVING COUNT(*) > 10
ORDER BY avg_ram DESC LIMIT 3;

-- 3)  find the avg price of all the phone brands with avg rating greater than 70 and num_phones more than 10 among all 5g enabled phones 
SELECT brand_name,
AVG(price) AS "avg_price" ,
AVG(rating) AS "avg_rating",
COUNT(*) AS "num_phones"
FROM campusx.smartphones
WHERE has_5g = "True"
GROUP BY brand_name
HAVING avg_rating > 70 AND num_phones > 10;
