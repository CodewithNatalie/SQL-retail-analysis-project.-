/*DATA CLEANIN */
SELECT * 
FROM retail_sales_analysis
WHERE
transactions_id IS NULL
OR
sale_date IS NULL
or
sale_date IS NULL
OR
sale_time IS NULL
or
customer_id IS NULL
or
gender IS NULL
or
age IS NULL
or
category IS NULL
or
quantiy IS NULL
OR
price_per_unit IS NULL
OR 
cogs IS NULL
or
total_sale IS NULL; 

/* TOTAL SALES */
SELECT
COUNT(*) 
FROM retail_sales_analysis; 

/*HOW MANY COSTOMERS DO WE HAVE */
SELECT
COUNT(customer_id)
FROM retail_sales_analysis; 

/* How many unique cuctomesrs do we have? */
SELECT
COUNT(DISTINCT customer_id )
FROM retail_sales_analysis; 

/*how many categories of items do we have */
SELECT DISTINCT category FROM retail_sales_analysis; 

/* Data analysis form key busines problems */

/* Write a query to retieve all sales made on 2022-11-05  */

SELECT 
*
from retail_sales_analysis
WHERE sale_date = '2022-11-05'; 

/* Write a query to retrieve all transactions where the category is 'clothing' and quantity sold is more than 10 in the month os november 2022 */
SELECT *
FROM retail_sales_analysis
WHERE upper(category) like 'clothing%'
  AND quantity < 10
  AND sale_date >= '2022-11-01'
  AND sale_date < '2022-12-01'; 

 
/* Write an SQL query to culculate the total sales for each category */

SELECT
category,
SUM(total_sale),
COUNT(*) AS toral_orders
FROM retail_sales_analysis
GROUP BY
category;

/* Write a SQL Query to fing the avarage of all customers who purchased items from the beauty category */

SELECT
gender,
ROUND(AVG(age) , 2)
FROM retail_sales_analysis
WHERE category = 'Beauty'
GROUP BY gender;


/* Write an SQL Query to find aLL transactions where the total sale > 1000 */

SELECT * 
FROM retail_sales_analysis
WHERE total_sale > 1000;

/* Find the total number of transactions made by each gender in each category */

SELECT
category,
gender,
COUNT(transactions_id)
FROM retail_sales_analysis
GROUP BY gender, category
ORDER BY 
category;

/* Write an SQL query to culculate the avarage sale for each month. Finf the best selling month in each year */

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

/* Write an SQL Query to find the top 5 customers based on the highest total sale */

SELECT 
customer_id,
COUNT(transactions_id),
SUM(total_sale)
FROM retail_sales_analysis
GROUP BY customer_id;

/* Write an SQL query to find the number of unique customers who purchased items from each category */

SELECT 
category,
COUNT(DISTINCT customer_id)
FROM retail_sales_analysis
GROUP BY category;

/* Write an SQL Query to create each shift and number of orders( Example morning <=12, Afternoon btwn 12 & 17, Evening > 17 ) */


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



/*END OF PROJECT */