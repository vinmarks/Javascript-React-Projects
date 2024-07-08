CREATE TABLE Box_Office (
title VARCHAR(100) NOT NULL,
director_name VARCHAR(100) NOT NULL,
publisher VARCHAR(100) NOT NULL,
earnings INT,
PRIMARY KEY (title, director_name, publisher),
FOREIGN KEY (title) REFERENCES Movie (title),
FOREIGN KEY (director_name) REFERENCES Director (director_name),
FOREIGN KEY (publisher) REFERENCES Publisher (publisher_name)
); 

INSERT INTO Box_Office
VALUES ('Forgetting Sarah Marshall', 'Nicholas Stoller', 'Universal Pictures', '105800000'),
('Adventureland', 'Greg Mottola', 'Miramax', '17200000'),
('Whiplash', 'Damien Chazelle', 'Sony Pictures', '49000000'),
('Edge of Tomorrow', 'Doug Liman', 'Warner Bros', '370500000');

SELECT * FROM Box_office;

CREATE TABLE Movie (
title VARCHAR(100) NOT NULL,
release_year INT NOT NULL,
genre VARCHAR(100),
mpaa_rating VARCHAR(5),
PRIMARY KEY (title, release_year)
);

SELECT * FROM Movie;

ALTER TABLE Movie 
ADD CONSTRAINT genre_check
CHECK (genre in('Action', 'Comedy', 'Drama', 'Romance', 'Sci-Fi', 'Horror', 'Western', 'Mystery', 'Thriller'));

ALTER TABLE Movie 
ADD CONSTRAINT rating_check
CHECK (mpaa_rating in('G', 'PG', 'PG-13', 'R', 'NR', 'NC-17'));

#test the Rating Check Constraint
INSERT INTO Movie
VALUES('The Nice Guys', '2016', 'Comedy', 'MA');

#test the Genre Check Constraint
INSERT INTO Movie
VALUES('The Nice Guys', '2016', 'Buddy Cop', 'R');

INSERT INTO Movie
VALUES ('Forgetting Sarah Marshall', '2008', 'Comedy', 'R'),
('Adventureland', '2009', 'Comedy', 'R'),
('Whiplash', '2014', 'Drama', 'R'),
('Edge of Tomorrow', '2014', 'Action', 'PG-13');

CREATE TABLE Director (
director_name VARCHAR(100) NOT NULL,
DOB date NOT NULL,
number_of_movies INT,
PRIMARY KEY (director_name, DOB)
);

SELECT * FROM Director;

INSERT INTO Director
VALUES ('Nicholas Stoller', '1976-03-19', '20'),
('Greg Mottola', '1964-07-11', '10'),
('Damien Chazelle', '1985-01-19', '9'),
('Doug Liman', '1965-07-24', '20');

CREATE TABLE Publisher (
publisher_name VARCHAR(100) NOT NULL,
location VARCHAR(100),
contact VARCHAR(100),
PRIMARY KEY (publisher_name)
);

INSERT INTO Publisher
VALUES ('Universal Pictures', 'Universal City', 'universalrep@universal.com'),
('Miramax', 'Los Angeles', 'none'),
('Sony Pictures', 'Culver City', 'sonypicturesrep@sony.com'),
('Warner Bros', 'Burbank', 'warnerbrosrep@warnerbros.com');

SELECT * FROM Publisher;

#Queries

#1.
SELECT title FROM Movie WHERE mpaa_rating = 'R';

#2.
CREATE VIEW Blockbuster_Directors AS 
SELECT Director.director_name 
FROM Director
JOIN Box_Office ON Box_Office.director_name = Director.director_name
WHERE earnings > 100000000;

SELECT * FROM Blockbuster_Directors;

#3.
Select title FROM Movie WHERE release_year > '2010';




