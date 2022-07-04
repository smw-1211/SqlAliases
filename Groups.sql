CREATE DATABASE group_;
use group_;

#group

create table dept(dept_id int primary key, instructor_name varchar(20), dept_name varchar(20), salary int);
insert into dept values(76766, 'Crick', 'Biology', 72000);
insert into dept values(45565, 'Katz', 'Comp.Sci', 75000),(98345, 'Kim', 'Electrical engg', 80000),(32343,'El Said', 'History', 60000),(15151, 'Mozart', 'Music',40000),(10101, 'Srinivasan', 'Comp.Sci',65000);
insert into dept values(58583,'Califieri', 'History', 60000),(22222, 'Einstein', 'Physics', 95000),(76543,'Singh','Finance', 80000),(83821, 'Brandt', 'Comp.Sci', 92000),(33456,'Gold','Physics', 87000);	

select * from dept;
select dept_name, avg(salary) from dept group by dept_name;  # group by

select dept_name, avg(salary) from dept group by dept_name having avg(salary)>70000;  #group by with having clause

select dept_name, avg_salary from (select dept_name, avg (salary) from dept group by dept_name) 
as dept_avg(dept_name,avg_salary)
    where avg_salary > 42000;
    
select dept_name, avg_salary from (select dept_name, avg(salary) as avg_salary from dept group by dept_name) as dept_avg(dept_name, avg_salary) where avg_salary > 42000; 

select * from dept_avg;
    
    
insert into dept values(11111,'Jenny','Physics',NULL);
select count(*) from dept;