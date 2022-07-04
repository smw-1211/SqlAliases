create database join_;
use join_;
show tables;

create table movies(Movie_id int primary key, title varchar(20), Category varchar(30));
create table artist(Id int, First_name varchar(20), Last_name varchar(20), Movie_id int);
insert into movies values(1, 'Assassins creed', 'Animations'),(2, 'Real Steel', 'Animations');
insert into artist values(1,'Adam', 'Smith', 1),(2,'Ravi', 'Kumar',2);

select * from artist;

#cross join
select * from movies cross join artist;
select * from movies, artist;

select * from movies inner join artist on movies.movie_id=artist.movie_id;   #intersection
SELECT * FROM movies, Artist WHERE movies.movie_id = Artist.movie_id;

select * from movies inner join artist on movies.movie_id=artist.movie_id;   #using(movie_id);   # inner join is intersection
select * from movies, artist where movies.movie_id=artist.movie_id;   # another method for inner join

insert into movies values(3, 'Jurassic Park', 'Animations');
select * from movies left outer join artist on movies.movie_id=artist.movie_id;  #tuples from left table(table 1)

insert into artist values(3,'Manoj', 'Sharma', 4);
select * from movies A right outer join artist B on A.movie_id=B.movie_id; 

# Full outer join
select * from movies left outer join artist on movies.movie_id= artist.movie_id union all select * from movies A right outer join artist B on A.movie_id=B.movie_id;

# Difference between inner join and natural join (1) condition is compulsory in inner join 2) common attribute is displayed only once in natural join) 
select * from movies A inner join artist B on A.movie_id=B.movie_id;
select * from movies natural join artist;



        