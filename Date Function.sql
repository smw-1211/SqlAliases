CREATE DATABASE date;
use date;

##Date Functions

CREATE TABLE Orders
(
OrderId int NOT NULL,
ProductName varchar(50) NOT NULL,
OrderDate datetime NOT NULL DEFAULT NOW(),
PRIMARY KEY (OrderId)
);
SELECT NOW(),CURDATE(),CURTIME();

INSERT INTO Orders (orderid, ProductName) VALUES (1,'Jarlsberg Cheese');
select * from Orders;

SELECT OrderId, DATE_ADD(OrderDate,INTERVAL 30 DAY) AS OrderPayDate FROM Orders;
SELECT OrderId,DATE_SUB(OrderDate,INTERVAL 5 DAY) AS SubtractDate FROM Orders;
SELECT DATEDIFF('2020-09-21','2020-09-12') AS DiffDate;
SELECT DAY('2014-11-30');
SELECT DAYNAME('2014-11-30');
SELECT SYSDATE();