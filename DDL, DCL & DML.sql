SHOW DATABASES;
CREATE DATABASE student_db;
USE student_db;
SHOW TABLES;

DESC student;

####DDL Commands ###Data Defination Language
#create
CREATE TABLE student(id int primary key, name varchar(20), address varchar(50));

#alter
ALTER TABLE student DROP PRIMARY KEY;
ALTER TABLE student ADD CONSTRAINT pk_student primary key(id, name);
ALTER TABLE student ADD PRIMARY KEY(id);
ALTER TABLE student MODIFY id int not null;
ALTER TABLE student ADD staff varchar(20);
ALTER TABLE student DROP COLUMN staff;

#drop
DROP TABLE student;

#truncate
TRUNCATE student;

#rename
RENAME TABLE student1 TO student;

####DML Commands ###Data Manipulation Language
#select
SELECT * FROM student;

#insert
INSERT INTO student(id, name, address) VALUES(1,'Somesh','Navi Mumbai');
INSERT INTO student(id, name, address) VALUES(2,'Ram','Delhi');
INSERT INTO student(id, name, address) VALUES(3,'Rakesh','Chennai');

#update
UPDATE student SET address='Pune' WHERE id=3;

#delete
DELETE FROM student WHERE address='Pune';


####DCL Commands ###Data Control Language

CREATE USER 'ram'@'localhost' IDENTIFIED BY 'pass';

#grant
GRANT UPDATE,DELETE ON student TO 'ram'@'localhost';
GRANT ALL ON *.* TO 'Ram'@'localhost';

#show
SHOW GRANTS FOR 'ram'@'localhost';

#revoke
REVOKE UPDATE,DELETE ON student FROM 'ram'@'localhost';



