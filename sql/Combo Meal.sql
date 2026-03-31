--Combo Performance--
 SELECT (LEAST(m1.item_name, m2.item_name)::text || ' & '::text) || GREATEST(m1.item_name, m2.item_name)::text AS combo_name,
    count(*) AS times_ordered_together,
    round(sum(m1.price + m2.price)::numeric, 2) AS total_combo_revenue
   FROM order_details od1
     JOIN order_details od2 ON od1.order_id = od2.order_id AND od1.item_id < od2.item_id
     JOIN menu_items m1 ON od1.item_id = m1.menu_item_id
     JOIN menu_items m2 ON od2.item_id = m2.menu_item_id
  GROUP BY ((LEAST(m1.item_name, m2.item_name)::text || ' & '::text) || GREATEST(m1.item_name, m2.item_name)::text);