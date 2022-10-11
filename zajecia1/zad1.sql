Use cwiczenia1;

-- zadanie 1

with cte as(
SELECT od.order_details_id
	  ,od.order_id
	  ,p.price * od.quantity summarized_amount
	  ,o.date as order_date
  FROM [cwiczenia1].[dbo].[order_details] as od
  JOIN pizzas as p on p.pizza_id = od.pizza_id
  JOIN orders as o on o.order_id = od.order_id
  WHERE o.date = '2015-02-18'
  )

select avg(summarized_amount) as mean_order_amout
from cte




-- zadanie 2


SELECT order_details_id
FROM order_details AS od
JOIN orders AS o ON od.order_id = o.order_id
WHERE o.date like '2015-03-%' and od.pizza_id like 'hawaiian%'




-- zadanie 3


with cte as(
	select order_details_id
		  ,quantity * price AS total_price
	from order_details AS od
	join pizzas AS p ON od.pizza_id = p.pizza_id
	join orders AS o ON od.order_id = o.order_id
	where o.date like '2015-02-%'
)

select top(10) order_details_id
		,total_price
		,rank() over (order by total_price desc) 
from cte






-- zadanie 4

with res4 as(
	select od.order_id,
		sum(p.price*od.quantity) AS order_amount, 
		month(o.date) AS month_amount, 
		o.date
	from order_details od
	join pizzas p on p.pizza_id = od.pizza_id
	join orders o on o.order_id = od.order_id
	group by od.order_id, o.date
)

avg_res4 as(
	select avg(order_amount) AS average_month_amount, 
	month_amount
	from res4
	group by month_amount
)

select order_id, 
	order_amount, 
	average_month_amount, 
	date 
from res4
join avg_res4 on avg_res4.month_amount = res4.month_amount





-- zadanie 5

with res5 as(
	select od.quantity, o.time, o.date
	from order_details od
	join orders o on o.order_id=od.order_id
	where o.date = '2015-01-01'
	group by od.quantity,o.time, o.date)

select count(quantity) order_count, date, left(time,2) hour 
from res5
group by date, left(time,2)






-- zadanie 6

with res6 as (
	select od.quantity, p.pizza_type_id, pt.name, pt.category
	from order_details od
	join orders o on o.order_id = od.order_id
	join pizzas p on p.pizza_id = od.pizza_id
	join pizza_types pt on pt.pizza_type_id = p.pizza_type_id
	where o.date like '2015-01-%')

select count(quantity) AS pizzas_count, 
	name, 
	category 
from res6
group by name, category
order by pizzas_count desc








-- zadanie 7

with res7 as(
	select od.quantity, 
		od.pizza_id, 
		o.date
	from order_details od
	join orders o on o.order_id = od.order_id
	where o.date like '2015-02-%' 
		or o.date like '2015-03-%'
)

select right(pizza_id,1) AS size, count(quantity) AS count
from res7
group by right(pizza_id,1)