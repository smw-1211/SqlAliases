-- GROUPBY Demo

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);

-- ## Examples of GROUP BY

-- ## 1

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;


-- ## 2

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

GROUP BY WITH JOIN

-- ## 3

SELECT Acc.AccName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Acc ON Orders.AccID = Acc.AccID
GROUP BY AccName;


---------------------------------------------------------------------------------------------

-- HAVING Demo

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);


-- ## 1

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;

-- ## 2

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;

-- ## 3

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;