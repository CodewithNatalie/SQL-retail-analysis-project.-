# RETAIL SALES ANALYSIS WITH SQL.
## PROJECT OVERVIEW

**PROJECT TITLE**: RETAIL-SALES-ANALYSIS
** LEVEL**: BEGINNER
**DATABASE**: MYSQL

## OBJECTIVES

### 1. Set up a retail sales database: Create and populate a retail sales database with the provided sales data.

### 2. Data Cleaning: Identify and remove any records with missing or null values.

### 3. Exploratory Data Analysis (EDA): Perform basic exploratory data analysis to understand the dataset.

### 4. Business Analysis: Use SQL to answer specific business questions and derive insights from the sales data.

   
## PROJECT STRUCTURE

### This project focuses on analyzing retail sales data using SQL queries.
### The goal is to perform data cleaning, exploratory analysis, and business insights extraction from a sales dataset.

## 🔑 Features / SQL Queries

## DATA EXPLORATION AND CLEANING
```sql

SELECT * 
FROM retail_sales_analysis
WHERE transaction_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;


```
**1. What are the total sales?**:
```sql
  
   
SELECT
COUNT(*) 
FROM retail_sales_analysis;
```
**2. How many customers do we have?**:
 ```sql 
  
   
SELECT
COUNT(customer_id)
FROM retail_sales_analysis; 
```

**3. How many unique customers do we have?**:
```sql
     
SELECT
COUNT(DISTINCT customer_id )
FROM retail_sales_analysis; 
```
**4. How mant categories of items exist in the dataset below?**:
```sql     
     
     SELECT DISTINCT category FROM retail_sales_analysis; 
```

## DATA ANALYSIS FOR KEY BUSINESS PROBLEMS.

**5.  Retieve all sales made on 2022-11-05?**:
```sql     

SELECT 
*
from retail_sales_analysis
WHERE sale_date = '2022-11-05';
```

 **6. Retrieve all transactions where the category is 'clothing' and quantity sold is more than 10 in the month os november 2022 ?**:
```sql      
   
SELECT *
FROM retail_sales_analysis
WHERE upper(category) like 'clothing%'
  AND quantity < 10
  AND sale_date >= '2022-11-01'
  AND sale_date < '2022-12-01'; 
```

 
**7. Culculate the total sales for each category?**:
```sql     

SELECT
category,
SUM(total_sale),
COUNT(*) AS toral_orders
FROM retail_sales_analysis
GROUP BY
category;
```

**8. Find the avarage of all customers who purchased items from the beauty category?**
```sql     

SELECT
gender,
ROUND(AVG(age) , 2)
FROM retail_sales_analysis
WHERE category = 'Beauty'
GROUP BY gender;

```

**9. Find aLL transactions where the total sale > 1000?**
```sql      

SELECT * 
FROM retail_sales_analysis
WHERE total_sale > 1000;
```
**10 Find the total number of transactions made by each gender in each category?**
```sql  


SELECT
category,
gender,
COUNT(transactions_id)
FROM retail_sales_analysis
GROUP BY gender, category
ORDER BY 
category;
```

**11. Culculate the avarage sale for each month. Find the best selling month in each year?**
```sql  


SELECT
YEAR(sale_date) AS year,
MONTH(sale_date) AS month,
AVG(total_sale) AS avg_monthly_sale
FROM retail_sales_analysis
GROUP BY YEAR(sale_date) ,
MONTH(sale_date)
order by
year,
month;
```

**12. Find the top 5 customers based on the highest total sale?**
```sql  
    

SELECT 
customer_id,
COUNT(transactions_id),
SUM(total_sale)
FROM retail_sales_analysis
GROUP BY customer_id;
```

**13. Find the number of unique customers who purchased items from each category?**
```sql

SELECT 
category,
COUNT(DISTINCT customer_id)
FROM retail_sales_analysis
GROUP BY category;
```

**14. Create each shift and number of orders( Example morning <=12, Afternoon btwn 12 & 17, Evening > 17 )?**
  
```sql

SELECT 
COUNT(transactions_id), 
CASE
WHEN HOUR(sale_time) <= 12 THEN 'Morning'
WHEN HOUR(sale_time) BETWEEN 13 AND 17 THEN  'Afternoon'
WHEN HOUR(sale_time) BETWEEN 18  AND 21 THEN 'Evening'
 ELSE
 'Night'
END shift
FROM retail_sales_analysis
GROUP BY shift
ORDER BY 
CASE
WHEN shift = 'Morning' THEN 1
WHEN shift = 'Afternoon' THEN 2
WHEN shift = 'Evening' THEN 3
WHEN shift = 'Night' THEN 4
END;
```
##FINDINGS

###Customer Demographics: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.

###High-Value Transactions: Several transactions had a total sale amount greater than 1000, indicating premium purchases.

###Sales Trends: Monthly analysis shows variations in sales, helping identify peak seasons.

###Customer Insights: The analysis identifies the top-spending customers and the most popular product categories.

##REPORT

###Sales Summary: A detailed report summarizing total sales, customer demographics, and category performance.

###Trend Analyses: Insights into sales trends across different months and shifts.

###Customer Insights: Reports on top customers and unique customer counts per category.

##CONCLUSION

###This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.
