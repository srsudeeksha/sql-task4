USE ecommerce;

-- 1. Total number of products in each category
SELECT c.CategoryName, COUNT(p.ProductID) AS TotalProducts
FROM Categories c
LEFT JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;

-- 2. Average product price in each category
SELECT c.CategoryName, AVG(p.Price) AS AveragePrice
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;

-- 3. Total amount spent by each customer
SELECT c.Name AS CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

-- 4. Number of orders per customer
SELECT c.Name AS CustomerName, COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

-- 5. Total quantity of each product sold
SELECT p.Name AS ProductName, SUM(oi.Quantity) AS TotalQuantitySold
FROM Products p
JOIN OrderItems oi ON p.ProductID = oi.ProductID
GROUP BY p.ProductID;

-- 6. Customers who spent more than ₹10,000
SELECT c.Name AS CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
HAVING TotalSpent > 10000;

-- 7. Categories with more than 1 product
SELECT c.CategoryName, COUNT(p.ProductID) AS ProductCount
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID
HAVING ProductCount > 1;

-- 8. Average quantity per order
SELECT OrderID, AVG(Quantity) AS AvgQuantity
FROM OrderItems
GROUP BY OrderID;
