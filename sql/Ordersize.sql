--Revenue Per Ordersize--
 SELECT order_size,
    count(DISTINCT order_id) AS total_orders,
    sum(price) AS total_revenue
   FROM ( SELECT od.order_id,
            menu.price,
            count(*) OVER (PARTITION BY od.order_id) AS items_per_order,
                CASE
                    WHEN count(*) OVER (PARTITION BY od.order_id) < 2 THEN 'Small'::text
                    WHEN count(*) OVER (PARTITION BY od.order_id) < 5 THEN 'Medium'::text
                    ELSE 'Large'::text
                END AS order_size
           FROM order_details od
             JOIN menu_items menu ON menu.menu_item_id = od.item_id) t
  GROUP BY order_size;

--Items Per Order--
 SELECT order_id,
    count(item_id) AS items_per_order
   FROM order_details
  GROUP BY order_id;