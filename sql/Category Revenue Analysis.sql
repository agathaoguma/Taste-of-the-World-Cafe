--Total Revenue--
 SELECT sum(menu.price) AS total_revenue
   FROM menu_items menu
     JOIN order_details od ON menu.menu_item_id = od.item_id;

--Total Orders--
 SELECT count(DISTINCT order_id) AS total_orders
   FROM order_details;

--Average Order Value--
 WITH revenue_cte AS (
         SELECT sum(menu.price) AS total_revenue
           FROM menu_items menu
             JOIN order_details od ON menu.menu_item_id = od.item_id
        ), orders_cte AS (
         SELECT count(DISTINCT order_details.order_id) AS total_orders
           FROM order_details
        )
 SELECT revenue_cte.total_revenue / orders_cte.total_orders::double precision AS avg_order_value
   FROM revenue_cte,
    orders_cte;
	
--Daily Category Metrics--
SELECT od.order_date,
    menu.category,
    count(DISTINCT od.order_id) AS no_of_orders,
    count(menu.menu_item_id) AS no_of_items,
    avg(menu.price) AS avg_price,
    sum(menu.price) AS revenue
   FROM order_details od
     JOIN menu_items menu ON menu.menu_item_id = od.item_id
  GROUP BY od.order_date, menu.category;
