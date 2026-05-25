Section A: Concept Application 

1. What is the functional difference between SELECT * and specifying column 
names, and when is each preferred?
ans: 🔹 1. SELECT * (All Columns)
Retrieves all columns from a table.
🔹 2. Specifying Column Names
Retrieves only selected columns.
SELECT FirstName, LastName, Salary FROM Employees;

que 2: Which keyword renames a column in the output, and does this alias change 
the actual table structure in the database? 
ans: 
The keyword used to rename a column in the output is AS
SELECT FirstName AS Employee_Name
FROM Employees;

que 3)  Why does wrapping a numeric value in quotes (e.g., '5000') in a WHERE clause 
create a data type conflict in SQL? 
ans : Wrapping a numeric value in quotes turns it into a string (text) instead of a number, which can cause a data type mismatch in SQL.

🔹 What happens internally?
5000 → treated as a number (INT/DECIMAL)
'5000' → treated as a string (VARCHAR/CHAR)
Different Data Types
Salary column is numeric
'5000' is a string
→ SQL must convert one type to another
Implicit Conversion Issues
Some databases try to convert '5000' → 5000
But this:
Slows down performance
Can fail if the value is not purely numeric (e.g., '5000a')
Index Usage Problems
If conversion happens, indexes on numeric columns may not be used efficiently
Strict SQL Modes
Some systems (like strict MySQL settings) may throw an error instead of converting

que 4) Contrast the results of ORDER BY Profit DESC versus ASC when the goal is to 
identify the top 10 most profitable orders. 
ans : When identifying the top 10 most profitable orders, the choice between DESC and ASC in ORDER BY completely changes the result.

SELECT * 
FROM Orders
ORDER BY Profit DESC
LIMIT 10;

SELECT * 
FROM Orders
ORDER BY Profit ASC

que 5) What is the T-SQL equivalent of the LIMIT clause in MS SQL Server, and why 
does syntax vary across SQL engines? 
ans : 🔹 T-SQL equivalent of LIMIT in MS SQL Server

In Microsoft SQL Server (T-SQL), the equivalent of LIMIT is:
🔹 T-SQL equivalent of LIMIT in MS SQL Server

In Microsoft SQL Server (T-SQL), the equivalent of LIMIT is:

que 6)  Explain the logical execution order of a query containing SELECT, WHERE, ORDER 
BY, and LIMIT clauses
ans : SELECT column
FROM table
WHERE condition
ORDER BY column
LIMIT n;

Section B: Practical Task

1) . Execute a query to retrieve the first 20 records from the orders table to verify 
data ingestion. 
ans: 
LIMIT 10;
ans : SELECT *
FROM Orders
LIMIT 20;

2) . Select Order ID, Order Date, Sales, and Profit, applying a column alias to 
display Sales as Total_Sales.
ans : SELECT 
    Order_ID, 
    Order_Date, 
    Sales AS Total_Sales, 
    Profit
FROM Orders;

3) 3. Filter the dataset to isolate all high-value transactions where the Sales figure 
exceeds 5000. 
ans : SELECT *
FROM Orders
WHERE Sales > 5000;

4) 4. Generate a report of the top 10 most profitable orders by sorting the records 
by Profit in descending order. 
ans : SELECT *
FROM Orders
ORDER BY Profit DESC
LIMIT 10;

Section C: Mini Project 

1) 1. 
Title: Retail Profitability & Market Segment Analysis 
ans : 
-- Create Database
CREATE DATABASE SuperstoreDB;
USE SuperstoreDB;

-- Create Orders Table
CREATE TABLE Orders (
    Row_ID INT,
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);
 2. Sample Data Load (if CSV is used)
LOAD DATA INFILE 'SampleSuperstore.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

3)
SELECT *
FROM Orders
WHERE Discount > 0.20 AND Profit < 0;

4) 4. Required Deliverables: SQL script for database schema creation, 
multi-condition filtering queries, aggregated performance report by region, 
and a summary of loss-making transactions.  
ans : SELECT 
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Discount) AS Avg_Discount
FROM Orders
GROUP BY Region
ORDER BY Total_Profit DESC;