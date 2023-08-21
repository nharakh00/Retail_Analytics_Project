/*
QUESTIONS

1) How have sales and profits changed over the years? What are the best and worst months in terms of sales and profits?

2) For each year, what are the best performing products?

3)	Which products are losing the most money due to discounts?

4)	Which cities and or regions generate the most sales and profits? 

5)	Which cities have the most customers? Which regions have the most customers?
*/

-- 1) How have sales and profits changed over the years? What are the best and worst months in terms of sales and profits?

-- a) How have sales and profits changed over the years?
SELECT 
customer_info.purchase_year, 
ROUND(SUM(purchase_info.sales), 0) AS sales, 
ROUND(SUM(purchase_info.profit), 0) AS profit
FROM customer_info
INNER JOIN purchase_info 
ON purchase_info.order_id = customer_info.order_id
GROUP BY 1
ORDER BY 3 DESC;

-- We can see that there was slight growth in sales and profits from 2015 and 2016 
-- There was rapid growth in sales and profits from 2016 to 2018 

-- What are the best and worst months in terms of sales and profits?

DELIMITER //

CREATE PROCEDURE monthly_sales(IN y INT)
BEGIN

SELECT 
customer_info.purchase_month, 
ROUND(SUM(purchase_info.sales), 0) AS sales, 
ROUND(SUM(purchase_info.profit), 0) AS profit
FROM customer_info
INNER JOIN purchase_info 
ON purchase_info.order_id = customer_info.order_id
WHERE customer_info.purchase_year = y
GROUP BY 1
ORDER BY 3 DESC;

END //

DELIMITER ;

-- 2015
CALL monthly_sales(2015);
/*
Top 5 profitble months from most profits to least profits 1) Nov 2) Dec 3) Sept 4) Mar  5) Oct 
Bottom 5 profitable months from least profits to most profits 1) Feb 2) Jan 3) May 4) Jun 5) Apr 
*/

-- 2016
CALL monthly_sales(2016);
/*
Top 5 profitble months from most profits to least profits 1) Nov 2) Dec 3) Sept 4) Oct 5) Apr 
Bottom 5 profitable months from least profits to most profits 1) Jan 2) Feb 3) Jun 4) May 5) Jul 
*/

-- 2017
CALL monthly_sales(2017);
/*
Top 5 profitble months from most profits to least profits 1) Sep 2) Dec 3) Nov 4) May 5) Jul 
Bottom 5 profitable months from least profits to most profits 1) Jan 2) Feb 3) Apr 4) Mar 5) Aug 
*/

-- 2018
CALL monthly_sales(2018);
/*
Top 5 profitble months from most profits to least profits 1) Sep 2) Nov 3) Dec 4) Oct 5) May 
Bottom 5 profitable months from least profits to most profits 1) Feb 2) Jan 3) Apr 4) Aug 5) Mar 
*/


-- 2) For each year, what are the best performing products?


DELIMITER //

CREATE PROCEDURE top_ten_products(IN y INT)
BEGIN

SELECT purchased_items.category, 
	purchased_items.sub_category, 
     ROUND(SUM(purchase_info.sales),2) AS sales,
    ROUND(SUM(purchase_info.profit),2) AS profit
FROM purchased_items 
INNER JOIN purchase_info 
ON purchased_items.id = purchase_info.order_id
INNER JOIN customer_info 
ON purchased_items.id = customer_info.order_id
WHERE customer_info.purchase_year = y
GROUP BY 1,2
ORDER BY 4 DESC, 3 DESC
LIMIT 10;

END //

DELIMITER ;

CALL top_ten_products(2015);
-- Top 10 best performing products 1) Health Drinks 2) Soft Drinks 3) Breads and Buns 4) Noodles 5) Chocolates 
-- 6) Cookies 7) Fish 8) Masalas 9) Cakes 10) Edible Oil Ghee

CALL top_ten_products(2016);
-- Top 10 best performing products 1) Soft Drinks 2) Health Drinks 3) Biscuits 4)  Cakes 5) Cookies 
-- 6) Breads and Buns 7) Chocolates 8) Masalas 9) Noodles 10) Edible Oil Ghee

CALL top_ten_products(2017);
-- Top 10 best performing products 1) Soft Drinks 2) Health Drinks 3) Noodles 4) Cookies 5) spices 
-- 6) Edible Oil and Ghee 7) Masalas 8) Cakes 9) Chocolates 10) Breads & Buns 

CALL top_ten_products(2018);
-- Top 10 best performing products 1) Health Drinks 2) Soft Drinks 3) Breads & Buns 4) Noodles 5) Chocolates 
-- 6) Cookies 7) Fish 8) Masalas 9) Cakes 10) Edible Oil & Ghee 

-- 3)	Which products are losing the most money due to discounts?

DELIMITER //

CREATE PROCEDURE top_ten_discount(IN y INT)
BEGIN

SELECT purchased_items.category, 
	purchased_items.sub_category, 
     ROUND(SUM(purchase_info.discount_loss),2) AS money_lost_discount
FROM purchased_items 
INNER JOIN purchase_info 
ON purchased_items.id = purchase_info.order_id
INNER JOIN customer_info 
ON purchased_items.id = customer_info.order_id
WHERE customer_info.purchase_year = y
GROUP BY 1,2
ORDER BY  3 DESC
LIMIT 10;

END //

DELIMITER ;

CALL top_ten_discount(2015);
-- Top 10 products that lost the most money due to discounts 1) Health Drinks 2) Soft Drinks 3) Cookies 4) Chocolates 5) Breads and Buns 
-- 6) Spices 7) Cakes 8) Noodles 9) Edible Oil and Ghee 10) Mutton

CALL top_ten_discount(2016);
-- Top 10 products that lost the most money due to discounts 1) Soft Drinks 2) Health Drinks 3) Biscuits 4) Cookies 5) Cakes 
-- 6) Chocolates 7) Masalas 8) Breads & Buns 9) Fresh Fruits 10) Edible Oil and Ghee

CALL top_ten_discount(2017);
-- Top 10 products that lost the most money due to discounts 1) Soft Drinks 2) Health Drinks 3) Noodles 4) Cookies 5) Edible Oil & Ghee 
-- 6) Spices 7) Masalas 8) Breads & Buns 9) Chocolates 10) Biscuits 

CALL top_ten_discount(2018);
-- Top 10 products that lost the most money due to discounts 1) Health Drinks 2) Soft Drinks 3) Breads & Buns 4) Chocolates 5) Noodles 
-- 6) Cookies 7) Masalas 8) Cakes 9) Fish 10) Edible Oil & Ghee 

-- 4) Which cities and or regions generate the most sales and profits? 

DELIMITER //

CREATE PROCEDURE top_5_cities(IN y INT)
BEGIN

SELECT customer_info.region, 
	customer_info.city, 
     ROUND(SUM(purchase_info.sales),2) AS sales,
    ROUND(SUM(purchase_info.profit),2) AS profit
FROM purchased_items 
INNER JOIN purchase_info 
ON purchased_items.id = purchase_info.order_id
INNER JOIN customer_info 
ON purchased_items.id = customer_info.order_id
WHERE customer_info.purchase_year = y
GROUP BY 1,2
ORDER BY 4 DESC, 3 DESC
LIMIT 5;

END //

DELIMITER ;

CALL top_5_cities(2015);
-- Top 5 cities 1) Bodi 2) Virudhangar 3) Tirunelveli 4) Salem 5) Dharmapuri

CALL top_5_cities(2016);
-- Top 5 cities 1) Perambalur 2) Ramanadhapuram 3) Perambalur 4) Kanyakumari 5) Vellore

CALL top_5_cities(2017);
-- Top 5 cities 1)Bodi 2) Salem  3) Karur 4) Dharmapuri 5) Cumbum

CALL top_5_cities(2018);
-- Top 5 cities 1)Bodi 2) Namakkai 3) Chennai 4) Madurai 5) Vellore

-- 5) Which cities have the most customers? Which regions have the most customers?

-- region and city 
SELECT region, city, COUNT(DISTINCT customer_name) AS counts
FROM customer_info 
GROUP BY 1, 2
ORDER BY 2 DESC;

-- Based on the above query cities in the eastern and western region had the most customers 

-- region only 
SELECT region, SUM(counts) AS num_customers
FROM
(SELECT region, city, COUNT(DISTINCT customer_name) AS counts
FROM customer_info 
GROUP BY 1, 2
ORDER BY 2 DESC) AS t1
GROUP BY 1 ORDER BY 2 DESC;

-- It seems as though West region has the most customers bu the east region has almost as many customers.
