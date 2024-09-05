Create Database Movie;

use Movie;

-- Create the movies table
CREATE TABLE Movies (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    director VARCHAR(255),
    year_of_release INT
);

-- Insert records into the movies table
INSERT INTO Movies (id, title, director, year_of_release) VALUES
(1, 'Toy Story', 'John Lasseter', 1995),
(2, 'A Bug''s Life', 'John Lasseter', 1998),
(3, 'Toy Story 2', 'John Lasseter', 1999),
(4, 'Monsters, Inc.', 'Pete Docter', 2001),
(5, 'Finding Nemo', 'Andrew Stanton', 2003),
(6, 'The Incredibles', 'Brad Bird', 2004),
(7, 'Cars', 'John Lasseter', 2006),
(8, 'Ratatouille', 'Brad Bird', 2007),
(9, 'WALL-E', 'Andrew Stanton', 2008),
(10, 'Up', 'Pete Docter', 2009); 


-- List all directors of Pixar movies (alphabetically), without duplicates

SELECT DISTINCT director FROM Movies
ORDER BY director ASC;

-- List all directors of Pixar movies (reverse), without duplicates

SELECT DISTINCT director FROM Movies
ORDER BY director DESC;

-- List distinct movies released from 1990 to 2000

SELECT * FROM Movies DISTINCT WHERE year_of_release between 1990 and 2000;
