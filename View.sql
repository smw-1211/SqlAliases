create database view_;
use view_;

#view

create table dept(dept_id int primary key, instructor_name varchar(20), dept_name varchar(20), salary int);
insert into dept values(76766, 'Crick', 'Biology', 72000);
insert into dept values(45565, 'Katz', 'Comp.Sci', 75000),(98345, 'Kim', 'Electrical engg', 80000),(32343,'El Said', 'History', 60000),(15151, 'Mozart', 'Music',40000),(10101, 'Srinivasan', 'Comp.Sci',65000);
insert into dept values(58583,'Califieri', 'History', 60000),(22222, 'Einstein', 'Physics', 95000),(76543,'Singh','Finance', 80000),(83821, 'Brandt', 'Comp.Sci', 92000),(33456,'Gold','Physics', 87000);	

# creating View

create view faculty as select dept_id, instructor_name, dept_name from dept;
desc faculty;
drop view faculty;

select * from faculty; 
select * from dept;

insert into faculty values(133,'XYZ','Chemistry');  #insert record in view

update faculty
set dept_name='Physics'
where dept_id=133;                                 # update record in view

select instructor_name from faculty where dept_name='physics';     # display data from view

create view dept_total_sal as select dept_name, sum(salary) from dept group by dept_name;  # create view

select * from dept_total_sal; # display view data
desc dept_total_sal;
drop view dept_total_sal;


#index

drop table person;
create table person(pid int primary key, pname varchar(10));
insert into person values(1,'abc'), (2,'xyz'), (3,'pqr');
select * from person;

create index id1 on person(pname);

alter table person drop index id1;

insert into person values(5,'xyz');
delete from person where pid=4 and pname='xyz';

create unique index id3 on person(pid,pname);
alter table person drop index id1;  # to drop the index