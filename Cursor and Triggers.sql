create database cursors;
use cursors;

create table Stud_Marks(student_id int primary key,marks1 int,marks2 int,marks3 int);
create table Report(student_id int,total int,average float,foreign key(student_id) references Stud_Marks(student_id));

#trigger

DELIMITER //
CREATE TRIGGER AI
AFTER INSERT on Stud_Marks
FOR EACH ROW
BEGIN
DECLARE Total int;
DECLARE average float;
set total=new.marks1+new.marks2+new.marks3;
set average= total/3;
INSERT into Report VALUES(new.student_id,total,average);
END //

insert into Stud_Marks values(101,20,30,40);
insert into Stud_Marks values(102,20,30,40);
insert into Stud_Marks values(106,50,90,70);
insert into Stud_Marks values(105,50,40,60);
insert into Stud_Marks values(104,60,80,90);

select * from Stud_Marks;
select * from Report;

#cursor

DELIMITER //
create procedure p_results4()
BEGIN
DECLARE percentage double;
DECLARE ID int;
DECLARE m1 int;
DECLARE m2 int;
DECLARE m3 int;
DECLARE result varchar(100);
DECLARE done int default 0;
DECLARE c1 cursor for select student_id,marks1,marks2,marks3 from Stud_Marks;
DECLARE continue handler for NOT FOUND set done=1;
open c1;
g: LOOP
	fetch c1 into ID,m1,m2,m3;
	set percentage = (m1+m2+m3)/3;
    IF done=1 then
		LEAVE g;
	ELSEIF percentage>60 then
    set result = concat(ID ,'  ', percentage,'  First class');
	select result;
    
	ELSEIF 	percentage > 50 and percentage < 60 then
        set result = concat(ID,'  ',  percentage,'  Second class');
        select result;
	ELSEIF percentage < 50 then
		set result = concat(ID ,'  ',  percentage,'  Fail');
        select result;
	end if;
END LOOP g;
close c1;
END //

call  p_results4()