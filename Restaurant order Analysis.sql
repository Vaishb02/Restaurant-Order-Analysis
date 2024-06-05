#Menu Items
SELECT * FROM menu_items;

# Number of items in Menu
select count(menu_item_id) from menu_items;

#What are the least and most expensive items on the menu?
select * from menu_items
order by price asc;

select * from menu_items
order by price desc;

#How many Italian dishes are on the menu? 
select count(*) from menu_items
where category="Italian";

# What are the least and most expensive Italian dishes on the menu?
select *
from menu_items
where category="Italian"
order by price asc;

#How many dishes are in each category?
select *
from menu_items
where category="Italian"
order by price desc;

#How many dishes are in each category?
select category,count(menu_item_id) as num_dishes
from menu_items
group by category;

# What is the average dish price within each category?
select category,avg(price) as avg_price
from menu_items
group by category;

#order details
select * from order_details;

#What is the date range of the table?
select min(order_date),max(order_date)
from order_details;

#How many orders were made within this date range?
select count(distinct order_id) from order_details;

#How many items were ordered within this date range?
select count(order_id) from order_details;

#Which orders had the most number of items?
select order_id,count(item_id) from order_details
group by order_id
order by  count(item_id) desc;

#How many orders had more than 12 items?
select count(*) from 
( select order_id,count(item_id) as num_items
 from order_details
group by order_id
having num_items>12) as num_orders;

#Combine the menu_items and order_details tables into a single table
select * from order_details as o
left join menu_items as m
on m.menu_item_id=o.item_id;

#What were the least and most ordered items? What categories were they in?
#least ordered items
select item_name,category,count(order_details_id) as num_purchases
from order_details as o
left join menu_items as m
on m.menu_item_id=o.item_id
group by item_name,category
order by num_purchases asc;
#most ordered items
select item_name,category,count(order_details_id) as num_purchases
from order_details as o
left join menu_items as m
on m.menu_item_id=o.item_id
group by item_name,category
order by num_purchases desc;

#What were the top 5 orders that spent the most money?
select order_id,sum(price) as total_spent
from order_details as o
left join menu_items as m
on m.menu_item_id=o.item_id
group by order_id
order by total_spent desc limit 5;

#View the details of the highest spend order. Which specific items were purchased?
select *
from order_details as o
left join menu_items as m
on m.menu_item_id=o.item_id
where order_id=440;







