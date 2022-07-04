CREATE DATABASE subquery;
use subquery;
show tables;
##Subquery

create table products( prod_id int primary key, prod_name varchar(20), price int);
insert into products values (1,'DVD player', 2000);
insert into products values(2,'video game', 1000);
insert into products values(3, 'Lawn chair',500);
insert into products values(4,'Toy',300);
insert into products values(5,'Cadbury',50);
insert into products values(6,'Chocolate',30);
insert into products values (7,'Coffee Table',3000);

select * from products;

SELECT * FROM Products WHERE Price > any(SELECT Price FROM Products WHERE Price > 500);  #output 2000,3000   excluding minimum from the output
SELECT Price FROM Products WHERE Price > 500;
SELECT * FROM Products WHERE Price < ANY(SELECT Price FROM Products WHERE Price > 50);  # excluding maximum from the output
SELECT Price FROM Products WHERE Price > 50;
SELECT * FROM Products WHERE Price > ALL (SELECT Price FROM Products WHERE Price > 500);
SELECT Price FROM Products WHERE Price > 500;
SELECT * FROM Products WHERE Price > ALL (SELECT Price FROM Products WHERE Price > 500 and price < 3000);
SELECT Price FROM Products WHERE Price > 500 and price < 3000;
SELECT * FROM Products WHERE EXISTS (SELECT Price FROM Products WHERE Price > 50);
SELECT Price FROM Products WHERE Price > 50;
select * FROM Products WHERE prod_name='DVD player' and prod_id=1 and price=2000; 
select * from products where price in(30,500,1000);
select * from products where prod_name like '%e';
select * from products where prod_name not like 'c%';
select * from products where price>some(select price from products where price >500); 
select price from products where price >500;

#order by clause
select * from products order by prod_name;


create table customers(cust_id int, name varchar(20), salary int, age int);
alter table customers add primary key(cust_id);

insert into customers values(101,"Jenny",50000,35),(102,"Wendy",60000,23),(103,"Smith",70000,30);
insert into customers values(104,"John",40000,28);

select * from customers;

select * from customers where cust_id in(select cust_id from customers where salary > 45000);

create table customers_BKP(cust_id int, name varchar(20), salary int, age int);
INSERT INTO CUSTOMERS_BKP SELECT * FROM CUSTOMERS WHERE cust_id IN (SELECT cust_ID FROM CUSTOMERS where salary>45000);

select * from customers_bkp;
select * from customers;


UPDATE CUSTOMERS SET SALARY = SALARY + (salary * 0.25) WHERE AGE IN (SELECT AGE FROM CUSTOMERS_BKP WHERE AGE >= 27 );
select * from customers;


DELETE FROM CUSTOMERS WHERE AGE IN (SELECT AGE FROM CUSTOMERS_BKP WHERE AGE >= 27);


truncate customers;
truncate customers_bkp;


# set operations

create table student(rno int, name varchar(20));
create table student1(rno int, name varchar(20));

insert into student values(1,'Abhi'),(2,'sameer'),(3,'sameer');
insert into student1 values(3,'sameer'),(4,'javed');
select * from student1;

select * from student union all select * from student1;