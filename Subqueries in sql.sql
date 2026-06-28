USE swiggy ;

-- Those resturants which have higher rating than the average rating

SELECT name, rating
FROM restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM restaurants
);

-- 1.Which restaurant of Delhi is visited by least number of people
SELECT city, rating_count, name
FROM restaurants
WHERE city = 'Delhi'
AND rating_count = (SELECT MIN(rating_count)
                    FROM restaurants
					WHERE city = 'Delhi') ;
				    
                    
-- 2.Which restaurant has generated	mazimum revenue all over India
SELECT name, cost*rating_count AS revenue 
FROM restaurants 
WHERE cost*rating_count = (SELECT MAX(cost*rating_count)
                 FROM restaurants		
 ) ;       
 
 -- Using CTE(COMMON TABLE EXPRESSION) - temporary stores
WITH t1 AS(
SELECT name, cost*rating_count AS revenue
FROM restaurants)
SELECT name, revenue
FROM t1
WHERE revenue = (SELECT MAX(revenue) FROM t1) ;

-- 3.How many restaurants are having rating more than the average rating 
SELECT  COUNT(*) AS better_rest
FROM restaurants
WHERE rating > (SELECT AVG(rating) FROM restaurants) ;

-- 4. Which  restaurant of Delhi has generated most revenue
WITH t2 AS(
SELECT name, cost*rating_count AS revenue)
FROM restaurants
SELECT name, revenue, city
FROM t2
WHERE city = 'Delhi'
AND
revenue = (SELECT MAX(revenue) FROM t2) 

-- 5. Which restaurant chain has maximum number of restaurants?
SELECT name, COUNT(*) AS num_of_rest_outlets
FROM restaurants
GROUP BY name
ORDER BY COUNT(*) DESC
LIMIT 5 ;

-- 6.Which restaurant chain has generated maximum revenue?
WITH t3 AS(
SELECT name, SUM(cost*rating_count) AS revenue
FROM restaurants
GROUP BY name)
SELECT name, revenue
FROM t3
WHERE revenue = (SELECT MAX(revenue) FROM t3) ;

-- 7.Which city has maximum number of restaurants ?
WITH t4 AS(
SELECT city, COUNT(*) AS c_rest
FROM restaurants
GROUP BY city
)
SELECT city, c_rest FROM t4
WHERE c_rest = (SELECT MAX(c_rest) FROM t4) ;

-- order -group by
SELECT city, COUNT(*) AS rest_per_city
FROM restaurants
GROUP BY city
ORDER BY COUNT(*) DESC
LIMIT 5 ;

-- 8. WHich city has generated maximum revenue all over India?
WITH t5 AS(
SELECT city, SUM(cost*rating_count) AS revenue, COUNT(*) AS C_rest
FROM restaurants
GROUP BY city
)
SELECT city, revenue, C_rest
FROM t5
WHERE revenue = (SELECT MAX(revenue) FROM t5) ;

-- 9.List 10 least expensive cuisines?
SELECT  cuisine, MIN(cost) AS least_exp
FROM restaurants
GROUP BY  cuisine
ORDER BY least_exp ASC
LIMIT 5 ;

-- 10. List 10 most expensive cuisines?
SELECT cuisine, MAX(cost) AS exp
FROM restaurants
GROUP BY cuisine
ORDER BY exp DESC
LIMIT 45 ;

-- 11.What is the city is having chinese as most popular cuisine 
SELECT city, cuisine, SUM(rating_count) AS popularity
FROM restaurants
WHERE cuisine = "Chinese"
GROUP BY city ,cuisine
ORDER BY popularity DESC
LIMIT 5 ;

 -- 12.List top 10 unique restaurants with unique name only throughout the dataset as
 -- per generate maximum revenue (Single restaurant with that name)
SELECT name, SUM(cost*rating_count) AS revenue
FROM restaurants
GROUP BY name
ORDER BY revenue DESC
LIMIT 10 ;

-- Having names as single count
SELECT name,
       (cost * rating_count) AS revenue
FROM restaurants
GROUP BY name, cost, rating_count
HAVING COUNT(name) = 1
ORDER BY revenue DESC
LIMIT 10;