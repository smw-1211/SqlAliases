CREATE DATABASE string;
use string;

##String Functions

create table person (id int, firstname varchar(20), middlename varchar(20), lastname varchar(20), address varchar(20), salary int);
insert into person values(1,'a','b','c','nasik',10000),(2,'x','y','z','Pune',20000);
select * from person;

select upper(address) as location, lower(firstname) as Lastname from person;

select min(salary) as  minimum, max(salary), sum(salary), avg(salary) , count(salary) from person;
select salary*12 as Annual_salary from person;

select concat(firstname,middlename,lastname) from person;
select instr(address,'p') from person;
select substr(address,2,2) from person;
select char_length(address) from person;
select ltrim('         Hello world');
select trim("          Hello          ");
select lpad(lastname,5,'zzz') from person;
select rpad(lastname,5,'zzz') from person;
select left(address,3) from person;
select strcmp(firstname,lastname) from person;
select locate('n',address) from person;