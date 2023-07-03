create database [Data Modeling]

use [Data Modeling]

Select * from [Data Modeling]

--to get the country code from order id starting of 2 digit
--by using function we will find the order code and order number from the order_id that is combined, so we will seperate them 
--Next we will find the order year, order month and order year_month, order day and order quarter month from the order_date column
--We will find the days gap between ordered date and ship date by using datediff
--and we will find the age from DOB same by using function datediff
--After finding age we will put the age into age bucket 30-49, 50-70, Less Then 30
--Customer First_name and Last_name and convert the null values from postal code and update to 0 for null 
--Give Currency Format to sales, Discount to percentage, find discount amount, sales after discount, profit in dollat, 


Select
Row_id,
Order_id,
substring(order_id, 1, 2) as [Country Code],
substring(order_id, 9, 20) as [Order Number],
Order_date,
DATEPART(year, order_date) as Order_Year,
DATEPART(month, order_date) as Order_Month,
(DATEPART(year, order_date)*100 + DATEPART(month, order_date)) as Order_year_month,
DATEPART(day, order_date) as Order_Day,
DATEPART(QUARTER, order_date) as Order_Quarter,
Ship_date,
datediff(day, order_date, ship_date) as Days_Gap,
Ship_mode,
Customer_id,
Customer_name,
substring(customer_name, 1, charindex(' ', customer_name)) as Cx_First_Name,
substring(customer_name, charindex(' ', customer_name), 20) as Cx_Last_Name,
DOB,
datediff(year, DOB, getdate()) as Age,
case
    when datediff(year, DOB, getdate()) between 30 and 49 then '30-49'
	when datediff(year, DOB, getdate()) between 50 and 70 then '50-70'
	else 'Less Then 30'
	end [Age Bucket],
Segment,
City,
State,
Country,
case
    when Postal_Code is null then '0'
	else postal_code
	end U_postal_code,
Market,
Region,
Product_id,
Category,
[Sub-category],
Product_name,
format(sales, 'C0') as Sales_in_Dollar,
Quantity,
format((discount), 'P0') as Discount,
format(sales*discount, 'C0') as [Discount Amount],
format(sales-(Sales*discount), 'C0') as Sales_After_Discount,
format(Profit, 'C0') as Profit,
format(shipping_cost, 'C0') as Shipping_cost,
Order_priority
from [Data Modeling]























































