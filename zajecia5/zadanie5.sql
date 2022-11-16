SELECT date, 
    carrier_id, 
    state_id, 
    order_details.pizza_id, 
    sum(CAST(price as REAL)) as price_sum 
FROM order_details 
JOIN orders on orders.customer_id = order_details.order_id 
JOIN pizzas on order_details.pizza_id = pizzas.pizza_id  																
JOIN FactsOrder on orders.customer_id = FactsOrder.id 
GROUP BY date, order_details.pizza_id, carrier_id, state_id
ORDER BY date, carrier_id, state_id;