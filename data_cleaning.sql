USE supermarket;

-- Checking for any NULL or values that make no sense for the purchase_info table. 

SELECT 
    *
FROM
    purchase_info;
DESC purchase_info;

SELECT 
    *
FROM
    purchase_info
WHERE
    order_id = NULL OR sales = NULL
        OR discount = NULL
        OR profit = NULL;

SELECT 
    MIN(sales), MAX(sales), MIN(discount), MAX(profit)
FROM
    purchase_info;

SELECT 
    sales, COUNT(*) AS s_count
FROM
    purchase_info
GROUP BY sales
ORDER BY s_count DESC;

SELECT DISTINCT
    sales
FROM
    purchase_info
ORDER BY sales DESC;
SELECT DISTINCT
    sales
FROM
    purchase_info
ORDER BY sales ASC;

SELECT 
    discount, COUNT(*) AS d_count
FROM
    purchase_info
GROUP BY discount
ORDER BY d_count DESC;

SELECT DISTINCT
    discount
FROM
    purchase_info
ORDER BY discount DESC;
SELECT DISTINCT
    discount
FROM
    purchase_info
ORDER BY discount ASC;

SELECT 
    profit, COUNT(*) AS p_count
FROM
    purchase_info
GROUP BY profit
ORDER BY p_count DESC;

SELECT DISTINCT
    profit
FROM
    purchase_info
ORDER BY profit DESC;
SELECT DISTINCT
    profit
FROM
    purchase_info
ORDER BY profit ASC;

-- We want to add a column representing the money lost due to discount. 

SELECT 
    sales,
    discount,
    ROUND(sales / (1 - discount), 2) AS discount_loss
FROM
    purchase_info;

ALTER TABLE purchase_info 
ADD COLUMN discount_loss FLOAT
AFTER profit;

SET SQL_SAFE_UPDATES = 0;
UPDATE purchase_info 
SET 
    discount_loss = ROUND(sales / (1 - discount), 2);

-- Checking for any NULL or values that make no sense for purchase_info table. 
SELECT 
    *
FROM
    purchased_items;
DESC purchased_items;

SELECT 
    category, sub_category
FROM
    purchased_items
WHERE
    category = NULL OR sub_category = NULL;

SELECT 
    category, sub_category, COUNT(*) AS cnts
FROM
    purchased_items
GROUP BY 1 , 2
ORDER BY cnts DESC;

SELECT 
    MAX(CHAR_LENGTH(category)), MAX(CHAR_LENGTH(sub_category))
FROM
    purchased_items;

-- changing text to varchar 

ALTER TABLE purchased_items
MODIFY category VARCHAR(20);

ALTER TABLE purchased_items
MODIFY sub_category VARCHAR(20);

-- Checking for any NULL or values that make no sense for customer_info table. 

SELECT 
    *
FROM
    customer_info; 
DESC customer_info;

SELECT 
    *
FROM
    customer_info
WHERE
    order_id = NULL OR customer_name = NULL
        OR purchase_date = NULL
        OR region = NULL
        OR state = NULL
        OR city = NULL;



SELECT 
    customer_name, COUNT(*) AS c
FROM
    customer_info
GROUP BY 1
ORDER BY 2 DESC;
SELECT 
    purchase_date, COUNT(*) AS c
FROM
    customer_info
GROUP BY 1
ORDER BY 2 DESC;
SELECT 
    region, COUNT(*) AS c
FROM
    customer_info
GROUP BY 1
ORDER BY 2 DESC;
SELECT 
    state, COUNT(*) AS c
FROM
    customer_info
GROUP BY 1
ORDER BY 2 DESC;
SELECT 
    city, COUNT(*) AS c
FROM
    customer_info
GROUP BY 1
ORDER BY 2 DESC;

-- There is only one purchase where region is north. Going to remove this value.
DELETE FROM customer_info 
WHERE
    region = 'North';

-- We want to add columns for months and years. 

SELECT 
    purchase_date, RIGHT(purchase_date, 4)
FROM
    customer_info;

SELECT DISTINCT
    RIGHT(purchase_date, 4)
FROM
    customer_info;


SELECT 
    purchase_date, LEFT(purchase_date, 2)
FROM
    customer_info;

SELECT DISTINCT
    LEFT(purchase_date, 2)
FROM
    customer_info
ORDER BY 1;


SELECT 
    *
FROM
    customer_info;

ALTER TABLE customer_info 
ADD COLUMN purchase_month TEXT
AFTER purchase_date;

ALTER TABLE customer_info 
ADD COLUMN purchase_year TEXT
AFTER purchase_month;

SET SQL_SAFE_UPDATES = 0;
UPDATE customer_info 
SET 
    purchase_month = LEFT(purchase_date, 2);

SET SQL_SAFE_UPDATES = 0;
UPDATE customer_info 
SET 
    purchase_year = RIGHT(purchase_date, 4);

SELECT 
    *
FROM
    customer_info;
    
-- There are zeros and hyphens added to each month number. Need to fix this.

SELECT 
    purchase_month, REPLACE(purchase_month, '0', '')
FROM
    customer_info
WHERE
    purchase_month LIKE '0%'
ORDER BY 1 DESC;


SELECT DISTINCT
    purchase_month
FROM
    customer_info
WHERE
    purchase_month LIKE '0%'
ORDER BY 1 DESC;

SELECT DISTINCT
    REPLACE(purchase_month, '0', '')
FROM
    customer_info
WHERE
    purchase_month LIKE '0%'
ORDER BY 1 DESC;


SELECT 
    purchase_month, REPLACE(purchase_month, '-', '')
FROM
    customer_info
WHERE
    purchase_month LIKE '%-%';


SET SQL_SAFE_UPDATES = 0;
UPDATE customer_info 
SET 
    purchase_month = REPLACE(purchase_month, '0', '')
WHERE
    purchase_month LIKE '0%';

SET SQL_SAFE_UPDATES = 0;
UPDATE customer_info 
SET 
    purchase_month = REPLACE(purchase_month, '-', '')
WHERE
    purchase_month LIKE '%-%';


SELECT DISTINCT
    purchase_month
FROM
    customer_info
ORDER BY 1;

SELECT DISTINCT
    purchase_year
FROM
    customer_info; 


ALTER TABLE customer_info
MODIFY purchase_month INT;

ALTER TABLE customer_info
MODIFY purchase_year INT;

-- Now we want to change months from integers to varchar.

DESC customer_info;

ALTER TABLE customer_info 
RENAME COLUMN purchase_month TO p_month;

SELECT 
    *
FROM
    customer_info;



SELECT 
    p_month,
    CASE
        WHEN p_month = 1 THEN 'Jan'
        WHEN p_month = 2 THEN 'Feb'
        WHEN p_month = 3 THEN 'Mar'
        WHEN p_month = 4 THEN 'Apr'
        WHEN p_month = 5 THEN 'May'
        WHEN p_month = 6 THEN 'Jun'
        WHEN p_month = 7 THEN 'Jul'
        WHEN p_month = 8 THEN 'Aug'
        WHEN p_month = 9 THEN 'Sept'
        WHEN p_month = 10 THEN 'Oct'
        WHEN p_month = 11 THEN 'Nov'
        WHEN p_month = 12 THEN 'Dec'
    END AS purchase_month,
    COUNT(*)
FROM
    customer_info
    GROUP BY 1, 2
ORDER BY p_month;

ALTER TABLE customer_info 
ADD COLUMN purchase_month VARCHAR(5)
AFTER p_month;

SELECT 
    *
FROM
    customer_info;

SET SQL_SAFE_UPDATES = 0;
UPDATE customer_info 
SET 
    purchase_month = CASE
        WHEN p_month = 1 THEN 'Jan'
        WHEN p_month = 2 THEN 'Feb'
        WHEN p_month = 3 THEN 'Mar'
        WHEN p_month = 4 THEN 'Apr'
        WHEN p_month = 5 THEN 'May'
        WHEN p_month = 6 THEN 'Jun'
        WHEN p_month = 7 THEN 'Jul'
        WHEN p_month = 8 THEN 'Aug'
        WHEN p_month = 9 THEN 'Sept'
        WHEN p_month = 10 THEN 'Oct'
        WHEN p_month = 11 THEN 'Nov'
        WHEN p_month = 12 THEN 'Dec'
    END;

DESC customer_info;

-- Now changing the data types of the remaining columns that we will use from text to varchar. 

SELECT 
    MAX(CHAR_LENGTH(customer_name)),
    MAX(CHAR_LENGTH(region)),
    MAX(CHAR_LENGTH(city))
FROM
    customer_info;

ALTER TABLE customer_info
MODIFY customer_name VARCHAR(10);

ALTER TABLE customer_info
MODIFY region VARCHAR(10);

ALTER TABLE customer_info
MODIFY city VARCHAR(20);

-- Dropping columns that wont be used now or in the future.

SHOW TABLES;
DESC customer_info;
SELECT 
    *
FROM
    customer_info;

ALTER TABLE customer_info 
DROP COLUMN purchase_date;

ALTER TABLE customer_info 
DROP COLUMN p_month;

ALTER TABLE customer_info 
DROP COLUMN state;

SELECT 
    *
FROM
    purchase_info;

ALTER TABLE purchase_info 
DROP COLUMN discount;

-- Checking for duplicates.
WITH customer_info_CTE AS(
SELECT *, 
ROW_NUMBER() OVER( PARTITION BY order_id, customer_name, purchase_month, purchase_year, region, city ORDER BY order_id)
AS row_num
FROM customer_info)

SELECT * FROM customer_info_CTE
WHERE row_num > 1;

WITH purchase_info_CTE AS(
SELECT *, 
ROW_NUMBER() OVER( PARTITION BY order_id, sales, profit, discount_loss ORDER BY order_id)
AS row_num
FROM purchase_info)

SELECT * FROM purchase_info_CTE
WHERE row_num > 1;

WITH purchased_items_CTE AS(
SELECT *, 
ROW_NUMBER() OVER( PARTITION BY id, category, sub_category ORDER BY id)
AS row_num
FROM purchased_items)

SELECT * FROM purchased_items_CTE
WHERE row_num > 1;

















