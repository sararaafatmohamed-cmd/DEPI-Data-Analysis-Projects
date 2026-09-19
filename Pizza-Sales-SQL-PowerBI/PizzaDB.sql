Select * from pizza_sales

Select SUM(total_price) AS Total_Revenue from pizza_sales

Select SUM(total_price) / COUNT(Distinct order_id)AS Avg_Order_Value from pizza_sales

Select SUM(quantity) AS Total_Pizza_Sold from pizza_sales

Select COUNT(Distinct order_id) AS Total_Orders from pizza_sales


Select CAST(CAST(SUM(quantity) AS decimal(10,2))/ CAST(COUNT(Distinct order_id)
AS decimal(10,2))AS decimal(10,2)) AS Avg_Pizzas_Per_Order from pizza_sales


Select DATENAME(DW, order_date) as order_day, COUNT(Distinct order_id) AS Total_Orders
from pizza_sales
GROUP BY DATENAME(DW, order_date) 


SELECT DATENAME(MONTH,order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales 
GROUP BY DATENAME(MONTH,order_date)
Order by Total_Orders DESC


SELECT pizza_category, sum(total_price) AS Total_Sales,sum(total_price)*100/
(SELECT SUM(total_price)from pizza_sales 
where Month(order_date)=1) AS PCT from pizza_sales
where Month(order_date)=1
GROUP By pizza_category


SELECT pizza_size, CAST(sum(total_price)AS decimal(10,2)) AS Total_Sales,CAST(sum(total_price)*100/
(SELECT SUM(total_price)from pizza_sales where DATEPART(quarter, order_date)=1) AS decimal(10,2)) AS PCT
from pizza_sales
where DATEPART(quarter, order_date)=1
GROUP By pizza_size
ORDER BY PCT DESC


SELECT TOP 5 pizza_name, sum(total_price) AS Total_Revenue from pizza_sales 
group by pizza_Name
ORDER BY Total_Revenue DESC


SELECT TOP 5 pizza_name, sum(total_price) AS Total_Revenue from pizza_sales 
group by pizza_Name
ORDER BY Total_Revenue --BOTTOM--


SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales 
group by pizza_Name
ORDER BY Total_Orders DESC


SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders from pizza_sales 
group by pizza_Name
ORDER BY Total_Orders ASC --Bottom--

