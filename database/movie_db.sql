#Create a new database
CREATE DATABASE movie_db;

#show all databases
SHOW DATABASES;

#Use our new database
USE movie_db;

#Show existing tables
SHOW TABLES;

#create table directors
CREATE TABLE directors_tbl (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    year_of_birth int,
    PRIMARY KEY (id)
);

#get information about the table
#Describe (table name)
DESCRIBE directors_tbl;


#add a new entry to the table
INSERT INTO directors_tbl VALUES(
    null,
    "James Cameron",
    1954
);

INSERT INTO directors_tbl VALUES
(null, "Christopher Nolan", 1970),
(null, "Patty Jenkins", 1971),
(null,"Chloe Zhaos", 1982);


#Show all data from table
#SELECT
#from
#WHERE

SELECT * FROM directors_tbl;

#Create movie table
CREATE TABLE movie_tbl (
    id int NOT NULL AUTO_INCREMENT,
    title varchar(255),
    release_year int,
    director_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (director_id) REFERENCES directors_tbl(id)
);

#Add new movie in table
INSERT INTO movie_tbl VALUES(
    null,
    "Titanic",
    1997,
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);


INSERT INTO movie_tbl VALUES(
    null,
    "Wonder Woman",
     2017, 
     (SELECT id FROM directors_tbl WHERE name like "Patty Jenkins")
);

INSERT INTO movie_tbl VALUES(
    null,
    "Avatar", 
    2009, 
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);

INSERT INTO movie_tbl VALUES(
    null,
    "Aliens",
    1986,
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);


INSERT INTO movie_tbl VALUES(
    null,
    "Inception",
    2010, 
    (SELECT id FROM directors_tbl WHERE name like "Christopher Nolan")
);

INSERT INTO movie_tbl VALUES(
    null,
    "Terminator",
    1984, 
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);


INSERT INTO movie_tbl VALUES(
    null,
    "Cleopatra",
    2023, 
    (SELECT id FROM directors_tbl WHERE name like "Patty Jenkins")
);


INSERT INTO movie_tbl VALUES(
    null,
    "Eternals",
    2021, 
    (SELECT id FROM directors_tbl WHERE name like "Chloe Zhaos")
);

INSERT INTO movie_tbl VALUES(
    null,
    "The Dark Knight",
    2008, 
    (SELECT id FROM directors_tbl WHERE name like "Christopher Nolan")
);


#Update an existing data in the table
UPDATE directors_tbl
SET name = 'James Cameron'
WHERE id = 1;


# Create your Actors table
CREATE TABLE main_actors_tbl(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    year_of_birth int,
    sex varchar(1),
    PRIMARY KEY (ID)
);

INSERT INTO main_actors_tbl VALUES
(null, "Arnold Schwarzenegger", 1947, "M"),
(null, "Gal Gadot", 1985, "F"),
(null, "Sigourney Weaver", 1949, "F"),
(null, "Christian Bale", 1974, "M"),
(null, "Leonardo DiCaprio", 1974, "M"),
(null, "Angelina Jolie", 1975, "F"),
(null, "Zoe Saldaña", 1978, "F"),
(null, "Gemma Chan", 1982, "F");





CREATE TABLE movie_actors_tbl(
    movie_id int NOT NULL,
    main_actor_id int NOT NULL,
    PRIMARY KEY (movie_id, main_actor_id),
    FOREIGN KEY (movie_id) REFERENCES movie_tbl(id),
    FOREIGN KEY (main_actor_id) REFERENCES main_actors_tbl(id)
);



INSERT INTO movie_actors_tbl VALUES
(
    (SELECT id FROM movie_tbl WHERE title LIKE "Avatar"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Zoe Saldaña%")
);


INSERT INTO movie_actors_tbl VALUES
(
    (SELECT id FROM movie_tbl WHERE title LIKE "The Dark Knight"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Christian Bale%")
);

INSERT INTO movie_actors_tbl VALUES
(
    (SELECT id FROM movie_tbl WHERE title LIKE "Inception"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Leonardo DiCaprio%")
);

INSERT INTO movie_actors_tbl VALUES
(
    (SELECT id FROM movie_tbl WHERE title LIKE "Eternals"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Angelina Jolie%")
);


INSERT INTO movie_actors_tbl VALUES
(
    (SELECT id FROM movie_tbl WHERE title LIKE "Aliens"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Sigourney Weaver%")
);

INSERT INTO movie_actors_tbl VALUES
(
    (SELECT id FROM movie_tbl WHERE title LIKE "Cleopatra"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Gal Gadot%")
);

INSERT INTO movie_actors_tbl VALUES
(
    (SELECT id FROM movie_tbl WHERE title LIKE "Eternals"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Gemma Chan%")
);

INSERT INTO movie_actors_tbl VALUES
(
    (SELECT id FROM movie_tbl WHERE title LIKE "Titanic"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Leonardo DiCaprio%")
);

INSERT INTO movie_actors_tbl VALUES
(
    (SELECT id FROM movie_tbl WHERE title LIKE "Wonder Woman"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Gal Gadot%")
);

INSERT INTO movie_actors_tbl VALUES
(
    (SELECT id FROM movie_tbl WHERE title LIKE "Terminator"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Arnold Schwarzenegger%")
);

INSERT INTO movie_actors_tbl VALUES
(
    (SELECT id FROM movie_tbl WHERE title LIKE "Avatar"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "%Sigourney Weaver%")
);



SELECT *
FROM movie_tbl
    JOIN movie_actors_tbl ON movie_tbl.id = movie_actors_tbl.movie_id
    JOIN main_actors_tbl ON main_actors_tbl.id = movie_actors_tbl.main_actor_id
WHERE movie_tbl.title LIKE "Avatar";

SELECT movie_tbl.title, main_actors_tbl.name
FROM movie_tbl
    JOIN movie_actors_tbl ON movie_tbl.id = movie_actors_tbl.movie_id
    JOIN main_actors_tbl ON main_actors_tbl.id = movie_actors_tbl.main_actor_id
WHERE movie_tbl.title LIKE "Avatar";


SELECT count(*)
FROM movie_tbl
WHERE title LIKE "T%";

SELECT *
FROM movie_tbl
ORDER BY id ASC;


SELECT title, release_year
FROM
movie_tbl;


SELECT movie_tbl.title, directors_tbl.name
FROM movie_tbl JOIN directors_tbl ON movie_tbl.director_id = directors_tbl.id
WHERE movie_tbl.title LIKE "Inception";



SELECT name
FROM main_actors_tbl
WHERE year_of_birth < 1980;


SELECT *
FROM directors_tbl
ORDER BY year_of_birth DESC;


SELECT movie_tbl.title FROM movie_tbl WHERE 


SELECT *
FROM directors_tbl
WHERE directors_tbl.name LIKE "Nolan";

SELECT movie_tbl.title, directors_t
FROM 

SELECT count(*)
FROM movie_tbl
WHERE director_id = 2;



SELECT main_actors_tbl.sex, movie_tbl.title
FROM movie_tbl
JOIN main_actors_tbl
WHERE sex = "F" AND director_id = 1;

SELECT main_actors_tbl.sex, movie_tbl.title
FROM movie_tbl
JOIN main_actors_tbl
WHERE sex = "F" AND director_id = 1;


SELECT main_actors_tbl.name, sex, directors_tbl.name
FROM directors_tbl
CROSS JOIN main_actors_tbl;

SELECT main_actors_tbl.name, sex, directors_tbl.name
FROM directors_tbl
CROSS JOIN main_actors_tbl
ORDER BY sex ASC
LIMIT 5;



How many directors did Leonardo DiCaprio worked with ?