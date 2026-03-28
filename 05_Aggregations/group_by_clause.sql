-- GROUPING DATA --

-- 1)group the smartphones by brand and get the count, avg price, max rating , avg screen size and avg battery capacity
SELECT brand_name, COUNT(*) AS "total_phone",
FLOOR(AVG(rating)) AS "avg_rating",
MAX(rating) AS "max_rating", 
ROUND(AVG(screen_size),2) AS  "avg_screen_size"
FROM campusx.smartphones
GROUP BY brand_name
ORDER BY total_phone DESC;

-- 2) Group the smartphones by whether they have an NFC and get the avg price and rating
SELECT has_nfc, AVG(price) AS "avg_price", AVG(rating) AS "avg_rationg" 
FROM campusx.smartphones
GROUP BY has_nfc;

-- 3) Group the  smartphones by the extended memory available and get the avg price
SELECT extended_memory_available, avg(price) AS "avg_price"
FROM campusx.smartphones
GROUP BY extended_memory_available;

-- 4) Group smartphones by the brand and processor brand and get the count of models and the average primary camera resolution rear
SELECT brand_name, processor_brand,
COUNT(*) AS "number_of_models",
AVG(primary_camera_rear) AS "avg_primary_camear"
FROM campusx.smartphones
GROUP BY brand_name, processor_brand
ORDER BY brand_name ASC, processor_brand ASC;

-- 5) Find top 5 most costly phone brands
SELECT brand_name,
AVG(price)  AS "avg_price"
FROM campusx.smartphones
GROUP BY brand_name
ORDER BY avg_price DESC LIMIT 5;

-- 6) which brand makes the smallest screen smartphones 
SELECT brand_name,
AVG(screen_size) AS "avg_screen_size"
FROM campusx.smartphones
GROUP BY brand_name
HAVING COUNT(*) > 10
ORDER BY avg_screen_size ASC LIMIT 1;

-- 7) AVG price Of 5g phones vs avg price of non 5g phones 
SELECT has_5g, AVG(price) AS "avg_price"
FROM campusx.smartphones
GROUP BY has_5g;

-- 8) .Group smartphones by the brand , and find the brand with the highest number of models that have both NFC and an IR blaster
SELECT brand_name,COUNT(model) AS "num_model"
FROM campusx.smartphones
WHERE has_nfc = "True" AND has_ir_blaster = "True"
GROUP BY brand_name 
ORDER  BY COUNT(model) DESC LIMIT 1;

-- 9) find all samsung 5g enabled smartphones and find out the average price for NFC and non NFC phones
SELECT has_nfc, AVG(price)
FROM campusx.smartphones
WHERE brand_name = "samsung"
GROUP BY has_nfc;

-- 10) find the phone name and price of the costliest phone
SELECT model,price
FROM campusx.smartphones
ORDER BY price DESC LIMIT 1





