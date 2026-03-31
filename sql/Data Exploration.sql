-- Check total rows in each table
SELECT COUNT(*) AS total_rows FROM menu_items;
SELECT COUNT(*) AS total_rows FROM order_details;

-- Preview data
SELECT * FROM menu_items
LIMIT 10;

SELECT * FROM order_details
LIMIT 10;

-- Column information
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'menu_items';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'order_details';

-- Missing values in menu_items
SELECT 
    COUNT(*) FILTER (WHERE menu_item_id IS NULL) AS missing_id,
    COUNT(*) FILTER (WHERE item_name IS NULL) AS missing_name,
    COUNT(*) FILTER (WHERE category IS NULL) AS missing_category,
    COUNT(*) FILTER (WHERE price IS NULL) AS missing_price
FROM menu_items;

-- Missing values in order_details
SELECT 
    COUNT(*) FILTER (WHERE order_details_id IS NULL) AS missing_order_details_id,
    COUNT(*) FILTER (WHERE order_id IS NULL) AS missing_order_id,
    COUNT(*) FILTER (WHERE order_date IS NULL) AS missing_date,
    COUNT(*) FILTER (WHERE order_time IS NULL) AS missing_time,
    COUNT(*) FILTER (WHERE item_id IS NULL) AS missing_item_id
FROM order_details;

-- Items in order_details that do NOT exist in menu_items
SELECT COUNT(*) AS unmatched_items
FROM order_details od
LEFT JOIN menu_items m
    ON od.item_id = m.menu_item_id
WHERE m.menu_item_id IS NULL;

-- Number of items per category
SELECT 
    category,
    COUNT(*) AS total_items
FROM menu_items
GROUP BY category
ORDER BY total_items DESC;

-- Price statistics
SELECT 
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price
FROM menu_items;

-- Number of unique orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM order_details;

-- Items per order
SELECT 
    order_id,
    COUNT(*) AS items_per_order
FROM order_details
GROUP BY order_id
ORDER BY items_per_order DESC
LIMIT 10;

-- Orders by hour
SELECT 
    EXTRACT(HOUR FROM order_time) AS hour,
    COUNT(DISTINCT order_id) AS total_orders
FROM order_details
GROUP BY hour
ORDER BY hour;