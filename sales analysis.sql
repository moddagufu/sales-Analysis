create database company;
use company;
select * from sales;

-- find all orders shipped via economy mode with a total amount greater than 25000--
select * from sales where Ship_Mode='Economy' and Total_Amount>1000;

-- retrieve all sales data for technology category in ireland made after 2020-01-01 --
select * from sales where Category ='Office Supplies' AND Country ='Sweden' and Order_Date='01-01-2017';

-- List the top 10 most profitable sales transactions in descending order --
select * from sales order by Unit_profit desc limit 10 ;
select distinct Unit_Profit from sales order by Unit_profit desc limit 10 offset 0;

-- Find all customers whose name starts with 'j' and ends with 'n' --

select Order_ID ,Customer_Name FROM sales Where Customer_Name like 'D%N';

-- Retrieve all product names that contain 'acco' anywhere in the name --
select * from sales where Product_Name  like 'Acco%';
select Order_ID,Product_Name from sales where Product_Name like 'Acco%';

-- Get the top 5 cities with the highest total sales amount --

select City,Total_Amount from sales order by Total_Amount Desc Limit 10;

select City,sum(Total_Amount) AS Total_sales
From sales
group by City 
order by Total_Sales Desc
Limit 5;

-- display the second set of 10 records for customer name and total amount in decereasing order --
select Customer_Name ,Total_Amount from sales
order by Total_Amount desc
Limit 10,10;

-- Find the total revenue ,average unit cost and total number of orders --
select sum(Total_Amount) as 'Total Revenue',
	avg(Unit_Cost) as 'average unit cost',
    count(Order_ID) as 'total no of orders'
    from sales;
    
-- Count unique number of regions --
select count(distinct(Region)) as 'unique region' from sales;

-- find the number of orders placed by each customer --
select Customer_Name,count(Order_ID) as Order_Count
from sales
group by Customer_Name
order by Order_Count desc;

-- Rank 5 products based on total sales using Rank --

select Product_Name,sum(Total_Amount) as Total_Sales,
rank() over (Order by sum(Total_Amount) desc) as sales_Rank
from sales
group by Product_Name
limit 5;





