# Retail_Sales_Analysis - SQL

A SQL-based project utilizing a retail sales dataset, aimed at uncovering insights from sales transactions, customer demographics, product categories, and purchase patterns. This project was created in MySQL, analyzing key metrics to assist in data-driven decision-making for the retail sector.

Dataset Source

Dataset acquired from the YouTube channel “Zero Analyst”

Database and Table Structure

Database Creation
```sql
CREATE DATABASE Retail_Sales_Analysis_Project;
```

Table Creation
```sql 
CREATE TABLE Retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(20),
    age INT,
    category VARCHAR(20),
    quantity INT,
    price_per_unit INT,
    cogs FLOAT,
    total_sale FLOAT
);
```

Data Cleaning
```sql
select * from Retail_sales
where gender IS NULL
or 	  age	is null
or	  category is null
or 	  quantiy is null
or    price_per_unit is null
or	  cogs is null
or 	  total_sale is null;
```

Exploratory Data Analysis (EDA)

-- 1) How many Sales are there?

```sql
select count(transactions_id) as 'Total Sales'
from Retail_sales;
```
-- 2) How many total Customers we have?

```sql
select count(Distinct customer_id) as 'Total Customer'
from Retail_sales;
```

-- Q.3 How many Unique Customers we have?

```sql
select count(distinct category) as 'Unique Category'
from Retail_sales;
```
-- Q.4 How many  nique Category?

```sql
select distinct category as "Total Category"
from Retail_sales;
```

Descriptive Analysis

The following SQL queries helped derive deeper insights from the data:

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

```sql
select *
from Retail_sales
where sale_date = '2022-11-05';
```
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022

```sql
select *
from Retail_sales
where category = "Clothing" and
	  quantiy >= 4 and
      month(sale_date) = 11 and 
      year(sale_date) = 2022;
```

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

```sql
select 
		category, sum(total_sale) as 'Sale by category'
from Retail_sales
group by category;
```
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

```sql
select 
category, 
cast(avg(age) as decimal(10,0)) as 'Avg Age'
from Retail_sales
where category = 'Beauty'
group by category;
```
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

```sql
select *
from Retail_sales
where total_sale > 1000;
```
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
```sql
select 
		category,
        gender,
        count(transactions_id) as 'No. of Transactions'
from Retail_sales
group by category, gender;
```
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

```sql
select month(sale_date) as 'Month',
	   year(sale_date) as 'Year',
	   Round(avg(total_sale),2) as 'Avg SALE'
from Retail_sales
group by month(sale_date),year(sale_date)
order by avg(total_sale) desc limit 2;
```
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

```sql
select customer_id, sum(total_sale) as 'Max Sale'
from Retail_sales
group by 1
order by sum(total_sale) desc limit 5;
```
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

```sql
select  category,
		count(distinct customer_id) as 'Unique Customers'
from 	Retail_sales
group by 1;
```
---Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

```sql
select 
				CASE
						WHEN HOUR(sale_time) < 12 THEN 'Morning'
                        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
				ELSE 'Evening'
				END as 'Shift',
		count(*) as 'Orders'
from Retail_sales
group by 1;
```

Exploratory Data Analysis (EDA)

Several queries are run to gain initial insights into the dataset, such as:

	1.	Total Sales - Count of all transactions.
	2.	Unique Customers - Count of unique customer IDs.
	3.	Unique Categories - Count and list of product categories.

Descriptive Analysis

The following SQL queries helped derive deeper insights from the data:

	1.	Sales on Specific Dates: Transactions on November 5, 2022.
	2.	High Quantity Clothing Sales: Transactions in the Clothing category with quantities greater than 4 in November 2022.
	3.	Sales by Category: Aggregates total sales for each product category.
	4.	Average Age of Beauty Category Customers: Determines the average age of customers purchasing from the Beauty category.
	5.	High-value Transactions: Transactions with a total_sale value above 1000.
	6.	Transactions by Gender and Category: Number of transactions per gender for each product category.
	7.	Monthly Sales Analysis: Average sales per month to identify the best-selling month of each year.
	8.	Top Customers: Identifies top 5 customers based on total purchase amount.
	9.	Unique Customers per Category: Counts unique customers for each category.
	10.	Orders by Shift: Categorizes orders by shift (Morning, Afternoon, Evening) based on sale time.

Key Findings

	1.	Sales Performance: Highest sales volume identified in specific months, indicating peak seasons.
	2.	Customer Demographics: Average customer age varies across categories, e.g., the Beauty category has younger customers.
	3.	Top Products: Specific categories like Clothing show high purchase volume.
	4.	Gender-based Insights: Purchasing patterns vary by gender within each product category.
	5.	High-value Transactions: Certain transactions exceed 1000, pointing to high-value customers and products.

Conclusion

This Retail Sales Analysis project highlights valuable trends, such as seasonal demand patterns, customer demographics, and high-value product categories. These findings can guide retail strategy adjustments, optimize stock management, and target marketing efforts effectively.
