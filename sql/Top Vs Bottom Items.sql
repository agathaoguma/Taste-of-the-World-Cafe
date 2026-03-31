--Top Items Vs Bottom Items--
 WITH item_performance AS (
         SELECT menu.item_name,
            count(od.item_id) AS qty_sold,
            COALESCE(sum(menu.price), 0::double precision) AS revenue
           FROM menu_items menu
             LEFT JOIN order_details od ON menu.menu_item_id = od.item_id
          GROUP BY menu.item_name
        )
 SELECT item_name,
    qty_sold,
    revenue,
    avg(revenue) OVER () AS avg_revenue,
        CASE
            WHEN revenue < avg(revenue) OVER () THEN 'Under Performer'::text
            ELSE 'High Contributor'::text
        END AS performance_flag
   FROM item_performance ip
  ORDER BY revenue;