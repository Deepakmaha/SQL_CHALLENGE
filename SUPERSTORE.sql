----------------------------SUPER MARKET SALES ANALYSIS-----------------------------------
---DISPLAY S SUPERSTORE SALES DETAILS
select * from s_superstore
---DISPLAY TOTAL UNIQUE ORDER FROM S STORE
SELECT count (DISTINCT (ORDER_ID) )  from s_Superstore
---DISPLAY MOST SEELING CATEGORY 
SELECT  category ,SUM(sales) as Total_sales from s_Superstore 
group by Category order by Total_sales desc ;
---DISPLAY YEAR WISE SALES
SELECT YEAR(order_date) as year ,SUM(sales) as Total_sales
from s_Superstore group by YEAR(Order_Date) 
order by year (Order_Date) desc
---DISPLAY UNIQUE CUSTOMER
SELECT DISTINCT(CUSTOMER_NAME) FROM s_Superstore
 /*DISPLAY EACH QUATER BY TOTAL SALES AND Total sales by
Highest to lowest*/

SELECT 'Quarter' + CAST (DATEPART (QUARTER,ORDER_DATE) 
AS varchar) as quarter ,SUM(sales) as 
Total_sale FROM s_Superstore group by DATEPART (
QUARTER,ORDER_DATE) 
---DISPLAY TOTAL SALES ,MAXIMUM SALES & MINIMUM SALES IN SAME ROW

select
 (SELECT SUM(sales) from  s_Superstore ) 
 as Total_sales,
(select MAX(sales) from s_Superstore ) 
Max_sales,
(select min(sales) from s_Superstore) 
Min_sales;
---DISPLAY WHICH MODE IS SALES IS HIGHEST 
select top 1 ship_mode,SUM(sales) 
 as Total_sales from s_superstore group by ship_mode 
order by Total_sales desc 
---DISPLAY  TOP 5 HIGHEST CATEGORY AND SUB-CATEGORY BY TOTAL SALES 
select TOP 5 category ,Sub_Category , SUM(profit) AS Total_profit
from s_Superstore group by
Category,Sub_Category ORDER BY Total_profit desc
---DISPLAY SUPERSTORE DETAILS CUSTOMER NAME WHERE END WITH VOWEL
SELECT * FROM s_Superstore WHERE Customer_Name 
like '%[a,e,i,o,u]'

---DISPLAY STATE WISE SALES  AND SORT BY LOWEST TO HIGHEST
SELECT STATE , SUM(sales)As Total_sales,SUM(profit) as Total_profit
from s_Superstore group by 
State order by Total_sales ASC
--------DISPLAY ORDER_DATE AND SHIP_DATE BOTH ARE DONE IN SAME DATE

Select * from s_Superstore where order_date = ship_date
--- DISPLAY HOW MANY ORDER WAS DONE EACH QUATER & also display highest to lowest
select  DATEPART(quarter,Order_Date ) as QUARTER ,
COUNT(order_id) AS Total_order
from s_Superstore group by DATEPART(quarter,Order_Date ) 
order by Total_order desc

---DISPLAY HIGHEST TO LOWEST REGION SALES & PROFIT
SELECT Region , SUM(sales) as Total_sales, 
SUM(profit) as Total_profit 
from s_Superstore group by Region order by Total_sales desc
---DISPLAY  3RD HIGHEST SELLIMG RECORD
select top 1 *  from 
(select top 3 *  from 
s_Superstore order by sales desc)
as category SS
order by Category
---DISPLAY MONTHNAME WISE TOTAL SALES AND ALSO DISPLAY LOWEST TO HIGHEST SALES
select DATENAME(MM,Order_Date) AS MONTH ,SUM(sales)
AS TOTAL_SALES 
from s_Superstore GROUP BY DATENAME(MM,Order_Date)
ORDER BY TOTAL_SALES ASC
DISPALY  TOP 10 THOSE PRODUCT IS HIGHEST SELLING GIVEN 10 % DISCOUNT

/*DISPLAY TOP 5 HIGHEST SELLING SUB CATEGORY AND ALSO 
DISPLAY 10 DISCOUNT GIVEN AT NEW COLUMN*/
SELECT TOP 5 SUB_CATEGORY , SUM(SALES) AS TOTAL_SALES ,
sum (sales) * 0.10 as [10% Dis amount]
FROM s_Superstore GROUP BY Sub_Category
ORDER BY TOTAL_SALES DESC 














