select * from dbo.pizza_sales;

// Total Revenue
Select sum(total_price) as Total_Revenue from dbo.pizza_sales;

// Average Total order
select (sum(total_price)/count(DISTINCT(order_id))) as AverageTotalOrder from dbo.pizza_sales;

// total pizz sold
select sum(quantity) as TotalPizzaSold from dbo.pizza_sales;

// total orders
select count(distinct(order_id)) as TotalOrder from dbo.pizza_sales;

//average pizza per orders
select cast(
cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as AveragePizzaPerOrder 
from dbo.pizza_sales;

//total revenue per day
select sum(total_price) as Total_revenue_perDay,order_day from dbo.pizza_sales group by order_day;


// total orders per day
select sum(total_orders) as Total_orders_perDay,order_day,count(distinct(order_id)) as Ttal_Orders  from dbo.pizza_sales group by order_day;

// total odres per date
select order_date,count(distinct(order_id)) as Ttal_Orders  from dbo.pizza_sales group by order_date;

// total orders in time
select order_time,count(distinct(order_id)) as Total_Orders  from dbo.pizza_sales group by order_time;

// total orders by hour
select datepart(HOUR,order_time) as Order_Hours,Count(distinct(order_id)) as Total_Order from dbo.pizza_sales group by datepart(Hour,order_time) order by datepart(HOUR,order_time);

//total pizza category revenue %
select pizza_category,CAST(sum(total_price) as DECIMAL(10,2))as Total_Revenue,
cast(sum(total_price)*100/(select sum(total_price) from dbo.pizza_sales) as decimal(10,2)) as PCT
from dbo.pizza_sales 
group by pizza_category;

// total pizza size revenue %
select pizza_Regularize,CAST(sum(total_price) as DECIMAL(10,2))as Total_Revenue,
cast(sum(total_price)*100/(select sum(total_price) from dbo.pizza_sales) as decimal(10,2)) as PCT
from dbo.pizza_sales 
group by pizza_Regularize
order by pizza_Regularize;

// total pizza category sold
select pizza_category,sum(quantity) as pizza_sold 
from dbo.pizza_sales 
group by pizza_category
order by pizza_sold DESC;

// TOP 5 PIZZA NAME
select TOP 5 (pizza_name),sum(quantity) as pizza_sold 
from dbo.pizza_sales 
group by pizza_name 
order by pizza_sold DESC;

// BOTTOM 5 PIZZA NAME
select TOP 5 (pizza_name),sum(quantity) as pizza_sold 
from dbo.pizza_sales 
group by pizza_name 
order by pizza_sold ASC ;




