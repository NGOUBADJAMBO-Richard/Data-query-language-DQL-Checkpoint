--1: Display all the data of customers :
SELECT *
FROM customer;


--2 Display the product_name and category for products which their price is between 5000 and 10000
SELECT Product_Name,
    Category
FROM Product
WHERE Price BETWEEN 5000 AND 10000;


--3 Display all the data of products sorted in descending order of price :
SELECT *
FROM Product
ORDER BY Price DESC;


--4 Display the total number of orders, the average amount, the highest total amount and the lower total amountFor each product_id, display the number of orders :
SELECT Product_id,
    COUNT(*) AS TotalOrders,
    AVG(total_amount) AS AverageAmount,
    MAX(total_amount) AS HighestTotalAmount,
    MIN(total_amount) AS LowestTotalAmount
FROM Orders
GROUP BY Product_id;


--5 Display the customer_id which has more than 2 orders :
SELECT Customer_id
FROM Orders
GROUP BY Customer_id
HAVING COUNT(*) > 2;


--6 For each month of the 2020 year, display the number of orders :
SELECT EXTRACT(
        MONTH
        FROM OrderDate
    ) AS Month,
    COUNT(*) AS NumberOfOrders
FROM Orders
WHERE EXTRACT(
        YEAR
        FROM OrderDate
    ) = 2020
GROUP BY EXTRACT(
        MONTH
        FROM OrderDate
    )
ORDER BY Month;


--7 For each order, display the product_name, the customer_name and the date of the order :
SELECT p.Product_Name,
    c.Customer_Name,
    o.OrderDate
FROM Orders o
    JOIN Product p ON o.Product_id = p.Product_id
    JOIN Customer c ON o.Customer_id = c.Customer_id;


--8 Display all the orders made three months ago 
SELECT *
FROM Orders
WHERE OrderDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH)
    AND OrderDate < CURRENT_DATE();


--9 Display customers (customer_id) who have never ordered a product
SELECT c.Customer_id
FROM Customer c
    LEFT JOIN Orders o ON c.Customer_id = o.Customer_id
WHERE o.Customer_id IS NULL;