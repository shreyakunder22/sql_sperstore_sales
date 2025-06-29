CREATE DATABASE SalesDB;

-- CREATE TABLE
CREATE TABLE orders (
    Row_ID INT PRIMARY KEY,
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2)
);

-- Data cleaning 

-- 1.Find NULL Values
SELECT * FROM orders
WHERE 
    Customer_ID IS NULL OR
    Customer_Name IS NULL OR
    Product_ID IS NULL OR
    Product_Name IS NULL OR
    Sales IS NULL;

-- 2.Delete All Rows with Any NULL or Empty Value
DELETE FROM orders
WHERE 
    Customer_ID IS NULL OR
    Customer_Name IS NULL OR
    Product_ID IS NULL OR
    Product_Name IS NULL OR
    Sales IS NULL;

-- DATA ANALYSIS
-- Q.1 Write a SQL query to find the total Sales

SELECT SUM(Sales) AS Total_Sales
FROM orders;

-- Q.2 Write a SQL query to find sales by Category

SELECT Category, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Q.3 Write a SQL query to find sales by Region

SELECT Region, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Q.4 Write a SQL query to find Top 10 customers by Sales

SELECT customer_id, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY customer_id
ORDER BY Total_Sales DESC
LIMIT 10;

-- Q.5 Write a SQL query to find average sales overall

SELECT AVG(Sales) AS Avg_Sales
FROM orders;

-- Q.6 Write a SQL query to find sales by Ship Mode

SELECT Ship_Mode, SUM(Sales) AS Total_Sales
FROM orders
WHERE Ship_Mode = 'Second Class'
GROUP BY Ship_Mode;

-- Q.7 Write a SQL query to find most Popular Product (by Number of Orders)

SELECT Product_Name, COUNT(*) AS Order_Count
FROM orders
WHERE Product_Name = 'Newell 322'
GROUP BY Product_Name;

-- Q.8 Write a SQL query to find top 5 Cities by Sales

SELECT City, SUM(Sales) AS Total_Sales
FROM orders
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;



