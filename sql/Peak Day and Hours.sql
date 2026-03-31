--Orders Per Day--
 SELECT order_date,
    count(DISTINCT order_id) AS no_of_transactions
   FROM order_details
  GROUP BY order_date;

--Revenue Per Day of the Week--
 SELECT EXTRACT(dow FROM od.order_date) AS day_of_week,
    TRIM(BOTH FROM to_char(od.order_date::timestamp with time zone, 'Day'::text)) AS day_name,
    count(DISTINCT od.order_id) AS orders_per_day,
    sum(menu.price) AS revenue
   FROM order_details od
     JOIN menu_items menu ON menu.menu_item_id = od.item_id
  GROUP BY (EXTRACT(dow FROM od.order_date)), (TRIM(BOTH FROM to_char(od.order_date::timestamp with time zone, 'Day'::text)))
  ORDER BY (EXTRACT(dow FROM od.order_date));

--Revenue Per Hour of Day--
 SELECT to_char(od.order_time::interval, 'HH12 AM'::text) AS hour_12,
    EXTRACT(hour FROM od.order_time) AS hour_24,
    count(DISTINCT od.order_id) AS orders_per_hour,
    round(sum(menu.price)::numeric, 2) AS revenue_per_hour
   FROM order_details od
     JOIN menu_items menu ON od.item_id = menu.menu_item_id
  GROUP BY (to_char(od.order_time::interval, 'HH12 AM'::text)), (EXTRACT(hour FROM od.order_time))
  ORDER BY (EXTRACT(hour FROM od.order_time));