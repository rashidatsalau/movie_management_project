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

