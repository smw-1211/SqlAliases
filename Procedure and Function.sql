create database procedure_;
use procudure_;

create table product(prod_id int, prod_name varchar(20), qty_on_hand int);
create table orders(cust_id int, prod_id int, order_date date, qty_ordered int);
create table customers(cust_id int, cust_name varchar(20), phone bigint, address varchar(28));

insert into product values (11, 'Pen', 300),(12, 'Pencil', 100), (13, 'Eraser', 200);
select * from product;

insert into orders values (1,11,curdate(), 50),(2,12,curdate(), 30);
select * from orders;

insert into customers values(1, 'Antima',7706950753, 'Mumbai' );
insert into customers values(2, 'Rashi',6394687957, 'Pune');
select * from customers;

delimiter $$
create procedure check_qty(cid int, pid int, qty integer)
begin
declare q int;
select qty_on_hand into q from product where prod_id=pid;
if(qty<q) then
insert into orders values (cid,pid,curdate(),qty);
update product set qty_on_hand = qty_on_hand-qty where prod_id=pid;
else
select concat('Order can not be fulfilled because of limited stock') as msg;
end if;
end$$

call check_qty(1,11,100);
select * from product;

delimiter $
create function qty_ordered(cid int,pid int) returns integer
deterministic
begin
declare total int;
select sum(qty_ordered) into total from orders where cust_id=cid;
return total;
end$

select qty_ordered(1,11);