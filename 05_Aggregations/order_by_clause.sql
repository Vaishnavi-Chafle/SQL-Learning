-------- SORTING DATA (ORDER BY) ----------------

-- find top 5 samsung phones with the biggest screen size
SELECT * FROM campusx.smartphones
WHERE brand_name = "samsung"
ORDER BY screen_size DESC LIMIT 5;

-- 2) sort all the phone with in descending order of number of total cameras
SELECT brand_name,model,num_rear_cameras+num_front_cameras AS "total_cameras" 
FROM campusx.smartphones
ORDER BY total_cameras DESC ;

-- 3)sort data on the bases of ppi in decreasing order

SELECT model, 
ROUND(SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size,2)
AS "ppi"
FROM campusx.smartphones
ORDER BY ppi DESC ;

-- 4)phone with 2nd largest battery capacity

SELECT model,battery_capacity 
FROM campusx.smartphones
ORDER BY battery_capacity DESC LIMIT 2,1;

-- 5) find the name and rating of the worst rated apple phone
SELECT model,rating FROM campusx.smartphones
WHERE brand_name = "apple"
ORDER BY rating ASC;

-- 6) Sort phones alphabetically and then on the basis of price in desc order
SELECT brand_name , model,price FROM campusx.smartphones
ORDER BY brand_name ASC , price DESC;

-- 7) Sort the phones alphabetically and then on the basis of  rating in desc order
SELECT model, brand_name,rating FROM campusx.smartphones 
ORDER BY brand_name ASC  , rating DESC






