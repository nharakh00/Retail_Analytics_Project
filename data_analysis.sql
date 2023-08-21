/*
QUESTIONS

1) How have sales and profits changed over the years? What are the best and worst months in terms of sales and profits?

2) For each year and for each subcategory, how much profit is generated and how much money is lost due to discounts? 

3) For each year and for each category, how much profit is generated and how much money is lost due to discounts? 

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

/*
We can see that there was slight growth in sales and profits from 2015 and 2016 There was rapid growth in sales and profits from 2016 to 2018. 
Its important to note that there is a large gap between sales and profits
 */

-- b) What are the best and worst months in terms of sales and profits?

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

CALL monthly_sales(2015);
CALL monthly_sales(2016);
CALL monthly_sales(2017);
CALL monthly_sales(2018);


/* 
For each year, the best performing months in terms of sales and profits are Sept, Nov, and Dec. Overall Sales and profits are increasing and have almost doubled from 2015 to 2018. 
One problematic thing is that each year there is a large gap between sales and profits. Furthermore the best 
performing months have the most significant gap.
*/

-- 2) For each year and for each subcategory, how much profit is generated and how much money is lost due to discounts? 

DELIMITER //

CREATE PROCEDURE p_l_sub_category(IN y INT)
BEGIN

SELECT 
	purchased_items.sub_category, 
     ROUND(SUM(purchase_info.discount_loss),2) AS discount_loss,
    ROUND(SUM(purchase_info.profit),2) AS profit
FROM purchased_items 
INNER JOIN purchase_info 
ON purchased_items.id = purchase_info.order_id
INNER JOIN customer_info 
ON purchased_items.id = customer_info.order_id
WHERE customer_info.purchase_year = y
GROUP BY 1
ORDER BY 3 DESC;

END //

DELIMITER ;

CALL p_l_sub_category(2015);
CALL p_l_sub_category(2016);
CALL p_l_sub_category(2017);
CALL p_l_sub_category(2018);

/*
For each year, we can see that health and soft drinks are the most profitable subcategories of items. However, 
these items also incur the most significant loss. After these two, the highest subcategories are bakery items, 
snacks, oils, and masalas. Grain, Produce, and meat subcategories rank the lowest in profits. However, there are 
more subcategories for these products. 
*/

DELIMITER //

CREATE PROCEDURE p_l_category(IN y INT)
BEGIN

SELECT 
	purchased_items.category, 
     ROUND(SUM(purchase_info.discount_loss),2) AS discount_loss,
    ROUND(SUM(purchase_info.profit),2) AS profit
FROM purchased_items 
INNER JOIN purchase_info 
ON purchased_items.id = purchase_info.order_id
INNER JOIN customer_info 
ON purchased_items.id = customer_info.order_id
WHERE customer_info.purchase_year = y
GROUP BY 1
ORDER BY 3 DESC;

END //

DELIMITER ;

CALL p_l_category(2015);
CALL p_l_category(2016);
CALL p_l_category(2017);
CALL p_l_category(2018);

/*
Profits are relatively even for the most part. The categories consistently ranking the highest are Meat products, Produce items and Snacks. 
It's important to note that discount loss corresponds with profit. 
*/
