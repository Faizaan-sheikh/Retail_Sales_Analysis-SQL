						-- Retail_Sales_Analysis_Project --  

-- ( DATASET ACQUIRED FROM 'YT = Zero Analyst' )

Create database Retail_Sales_Analysis_Project;

-- Table Creation --

create table Retail_sales(
							transactions_id	INT PRIMARY KEY,
							sale_date	DATE,
							sale_time	TIME,
							customer_id	INT,
							gender		VARCHAR(20),
							age			INT,
							category	VARCHAR(20),
							quantiy	INT,
							price_per_unit	INT,
							cogs	FLOAT,
							total_sale FLOAT
						  );
  
  -- Checkimg NULL Values
  
select * from Retail_sales
where gender IS NULL
or 	  age	is null
or	  category is null
or 	  quantiy is null
or    price_per_unit is null
or	  cogs is null
or 	  total_sale is null;

-- EDA --

-- 1) How many Sales are there?

select count(transactions_id) as 'Total Sales'
from Retail_sales;

-- 2) How Unique Customers we have?

select count(Distinct customer_id) as 'Total Customer'
from Retail_sales;

-- 3) How unique Category we have?

select count(distinct category) as 'Unique Category'
from Retail_sales;

-- 4) How Unique Category?

select distinct category as "Total Category"
from Retail_sales;

-- Descriptive Analysis --

-- 1) Retrieve all columns from sales on '2022-11-05'

select *
from Retail_sales
where sale_date = '2022-11-05';

-- 2) Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

select *
from Retail_sales
where category = "Clothing" and
	  quantiy >= 4 and
      month(sale_date) = 11 and 
      year(sale_date) = 2022;
      
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select 
		category, sum(total_sale) as 'Sale by category'
from Retail_sales
group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

select 
category, 
cast(avg(age) as decimal(10,0)) as 'Avg Age'
from Retail_sales
where category = 'Beauty'
group by category;

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

select *
from Retail_sales
where total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

select 
		category,
        gender,
        count(transactions_id) as 'No. of Transactions'
from Retail_sales
group by category, gender;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select month(sale_date) as 'Month',
	   year(sale_date) as 'Year',
	   Round(avg(total_sale),2) as 'Avg SALE'
from Retail_sales
group by month(sale_date),year(sale_date)
order by avg(total_sale) desc limit 2;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

select customer_id, sum(total_sale) as 'Max Sale'
from Retail_sales
group by 1
order by sum(total_sale) desc limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select  category,
		count(distinct customer_id) as 'Unique Customers'
from 	Retail_sales
group by 1;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

select 
				CASE
						WHEN HOUR(sale_time) < 12 THEN 'Morning'
                        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
				ELSE 'Evening'
				END as 'Shift',
		count(*) as 'Orders'
from Retail_sales
group by 1;
 









