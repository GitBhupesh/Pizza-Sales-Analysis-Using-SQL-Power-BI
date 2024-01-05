create database pizza_sales;
use pizza_sales;
select * from pizza_sales;

 # Q1. Total Revenue.

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

# Q2. Average Order Value.

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;

# Q3. Total Pizzas Sold.

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;


# Q4. Total Orders.

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;


# Q5. Average Pizzas Per Order.

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;

-- OR

SELECT ROUND((SUM(quantity) / COUNT(DISTINCT order_id)),2)
AS Avg_Pizzas_per_order
FROM pizza_sales;


# Q6. Daily Trend for Total Orders.

SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY 1;


# Q7. Monthly Trend for Orders.

select MONTHNAME(order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY 1;


# Q8. % of Sales by Pizza Category.

SELECT pizza_category, ROUND(SUM(total_price),2) as total_revenue,
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales),2) AS PCT
FROM pizza_sales
GROUP BY pizza_category;


# Q9. % of Sales by Pizza Size.

SELECT pizza_size, ROUND(SUM(total_price),2) as total_revenue,
ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales),2) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;


# Q10. Total Pizzas Sold by Pizza Category.

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;  


# Q11. Top 5 Pizzas by Revenue.

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC LIMIT 5;


# Q12. Bottom 5 Pizzas by Revenue.

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC LIMIT 5;


# Q13. Top 5 Pizzas by Quantity.

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC LIMIT 5;


# Q14. Bottom 5 Pizzas by Quantity.

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC LIMIT 5;


# Q15. Top 5 Pizzas by Total Orders

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC LIMIT 5;


# Q16. Borrom 5 Pizzas by Total Orders.

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC LIMIT 5;


