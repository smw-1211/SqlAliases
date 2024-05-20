CREATE DATABASE prod;
use prod;
show tables;

##Aggregation Functions

## Creating a table and inserting dummy records
create table products( prod_id int primary key, prod_name varchar(20), price int);
insert into products values (1,'DVD player', 2000);
insert into products values(2,'video game', 1000);
insert into products values(3, 'Lawn chair',500);
insert into products values(4,'Toy',300);
insert into products values(5,'Cadbury',50);
insert into products values(6,'Chocolate',30);
insert into products values (7,'Coffee Table',3000);

select * from products;

----------------------------------------------------------------------------------

##Aggregation Functions - Count

SELECT COUNT(*) FROM products;

## COUNT() with WHERE
SELECT COUNT(*) FROM products; WHERE price>=20;
SELECT COUNT(DISTINCT prod_id) FROM products;

## COUNT() with GROUP BY
SELECT prod_id, COUNT(*) FROM products GROUP BY prod_id;
SELECT prod_id, COUNT(*) FROM products GROUP BY prod_id
HAVING COUNT(*)>2;

--------------------------------------------------------------------------------

##Aggregation Functions - SUM

SELECT SUM(price) FROM products;

## SUM() with WHERE
SELECT SUM(price) FROM products WHERE prod_id>3;

## SUM() with GROUP BY
SELECT SUM(price) FROM products WHERE prod_id>3
GROUP BY prod_id;

## SUM() with HAVING
SELECT prod_id, SUM(price) FROM products GROUP BY prod_id HAVING SUM(price)>=170;

-----------------------------------------------------------------------------------------

##Aggregation Functions - AVG

SELECT AVG(price) FROM products;

------------------------------------------------------------------------------------------

##Aggregation Functions - MAX and MIN

SELECT MAX(price) FROM products;

SELECT MIN(price) FROM products;