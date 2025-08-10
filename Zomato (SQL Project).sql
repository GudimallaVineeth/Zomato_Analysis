use practice;
select* from departments;
drop table zomato_new;

select * from zomato; #To reterive all Col's & rows 

select  count(*) restaurant_name from zomato; # To know the how many restaurants are there  


RENAME TABLE zomato2 TO zomato; #Changing the table name 

select * from zomato;

select  distinct restaurant_name from zomato; # To know the restaurant_names 
select * from zomato 
where restaurant_name like 'p%'; #restaurant_name starts with 'p' 

SELECT * from zomato
WHERE restaurant_name LIKE 'p%65'; #restaurant_name starts with 'p' and end with 65 

select distinct item_name from zomato
WHERE restaurant_name LIKE 'sh%'; #restaurant_name starts with 'sh' 

#Using Subquery 
select distinct restaurant_name , place_name , city , item_name    from zomato
where item_name in (select item_name like '%chicken%' from zomato);

#To find max orders of  restaurant 
SELECT restaurant_name, COUNT(*) AS order_count
FROM zomato
GROUP BY restaurant_name
ORDER BY order_count DESC
LIMIT 10;

#To find 10 least orders of  restaurant 
SELECT restaurant_name, COUNT(*) AS order_count
FROM zomato
GROUP BY restaurant_name
ORDER BY order_count 
LIMIT 10;

select * from zomato;

#To Find the retauranta in malakpet
select * from zomato 
where place_name = 'malakpet';

select * from zomato 
where dining_votes > 3.2 order by restaurant_name;

# 1. Top Rated Restaurants (Overall) 
SELECT restaurant_name, avg(Dining_Rating) AS average_rating, COUNT(*) AS total_reviews
FROM zomato
WHERE Dining_Rating IS NOT NULL
GROUP BY restaurant_name
ORDER BY average_rating DESC
LIMIT 10;

DESCRIBE zomato; 
select * from zomato; 

# 2. Most Popular Areas (Based on Number of Restaurants) 
select place_name , count(distinct(restaurant_name)) as restaurant_count 
from zomato
group by place_name 
order by restaurant_count desc 
limit 10; 

#  3. Average Cost of cuisine City or Area
SELECT city, ROUND(avg(prices),2) AS avg_cost
FROM zomato
GROUP BY city
ORDER BY avg_cost DESC;

 # 4. Distribution of Restaurants by Cuisine
SELECT cuisine, COUNT(*) AS total_restaurants
FROM zomato
GROUP BY cuisine
ORDER BY total_restaurants DESC; 

#  5. Restaurants with High Ratings but Low Cost 
SELECT restaurant_name, dining_rating, prices
FROM zomato
WHERE dining_rating >= 3.5 AND prices <= 500 and prices > 80
ORDER BY dining_rating desc, prices;

select * from zomato;

# 6. Online Delivery vs Dine-In Preference Rating 
SELECT restaurant_name , delivery_rating, dining_rating, COUNT(*) AS total_restaurants
FROM zomato
GROUP BY restaurant_name, delivery_rating, dining_rating; 

# 7. Restaurants with Highest Votes
select restaurant_name , count(votes) as Highest_votes , count(dining_votes) as Dining_votes , 
count(delivery_votes) as delivery_votes
from zomato
group by restaurant_name 
order by restaurant_name desc;

#  8. Duplicate Restaurants (by Name & Location) 
SELECT restaurant_name, place_name, COUNT(*) AS duplicates
FROM zomato
GROUP BY restaurant_name, place_name
HAVING COUNT(*) > 1;

# 9. Cuisine Trend in Specific Area (e.g., Malakpet) 
select cuisine , count(*) as total 
from zomato 
where place_name = "nallakunta"
group  by cuisine;

select place_name from zomato; 
select * from zomato; 

# 10. List items from restaurants with prices above ₹100 and average rating above 3.0
select restaurant_name , item_name from zomato 
where restaurant_name in ( 
select restaurant_name from zomato where prices >= 100 and average_rating > 3.0); 


