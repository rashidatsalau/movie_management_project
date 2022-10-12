
# movie_management_project


### Question 1
List all the actors born before 1980

```sql
SELECT name
FROM main_actors_tbl
WHERE year_of_birth < 1980;

+-----------------------+
| name                  |
+-----------------------+
| Arnold Schwarzenegger |
| Sigourney Weaver      |
| Christian Bale        |
| Leonardo DiCaprio     |
| Angelina Jolie        |
| Zoe Saldaña           |
+-----------------------+
```

### Qusetion 2
How many movies did Nolan direct

```sql
SELECT count(*)
FROM movie_tbl
WHERE director_id = 2;

SELECT COUNT(*)
FROM directors_tbl
JOIN movie_tbl
ON directors_tbl.id = movie_tbl.director_id
WHERE directors_tbl.name LIKE "%Christopher Nolan%";

+----------+
| count(*) |
+----------+
|        2 |
+----------+
```

### Question 3 
Among all the movies of James Cameron, how many were female actors?

```sql 
SELECT main_actors_tbl.name, sex, directors_tbl.name
FROM directors_tbl
CROSS JOIN main_actors_tbl
ORDER BY sex ASC
LIMIT 5;

SELECT COUNT(*)
FROM directors_tbl
JOIN movie_tbl
ON directors_tbl.id = movie_tbl.director_id
JOIN movie_actors_tbl
ON movie_tbl.id = movie_actors_tbl.movie_id
JOIN main_actors_tbl
ON main_actors_tbl.id = movie_actors_tbl.main_actor_id
WHERE directors_tbl.name LIKE "%James Cameron%"
AND main_actors_tbl.sex LIKE "F";


+------------------+------+---------------+
| name             | sex  | name          |
+------------------+------+---------------+
| Gemma Chan       | F    | James Cameron |
| Zoe Saldaña      | F    | James Cameron |
| Angelina Jolie   | F    | James Cameron |
| Gal Gadot        | F    | James Cameron |
| Sigourney Weaver | F    | James Cameron |
+------------------+------+---------------+
```

### Question 4
How many directors did Leonardo DiCaprio worked with ?

```sql
SELECT directors_tbl.name, main_actors_tbl.name
FROM directors_tbl
CROSS JOIN main_actors_tbl
WHERE main_actors_tbl.name = "Leonardo DiCaprio";

SELECT COUNT(*)
FROM directors_tbl
JOIN movie_tbl
ON directors_tbl.id = movie_tbl.director_id
JOIN movie_actors_tbl
ON movie_tbl.id = movie_actors_tbl.movie_id
JOIN main_actors_tbl
ON main_actors_tbl.id = movie_actors_tbl.main_actor_id
WHERE directors_tbl.id
AND main_actors_tbl.name LIKE "%Leonardo DiCaprio%";

+-------------------+-------------------+
| name              | name              |
+-------------------+-------------------+
| Chloe Zhaos       | Leonardo DiCaprio |
| Christopher Nolan | Leonardo DiCaprio |
| James Cameron     | Leonardo DiCaprio |
| Patty Jenkins     | Leonardo DiCaprio |
+-------------------+-------------------+
```

### Question 5
Who is the oldest director?

```sql 
SELECT name, year_of_birth
FROM directors_tbl
ORDER BY year_of_birth ASC
LIMIT 1;

+---------------+---------------+
| name          | year_of_birth |
+---------------+---------------+
| James Cameron |          1954 |
+---------------+---------------+
```

### Question 6
What is the earliest movie of the oldest director?

```sql
SELECT name, year_of_birth, release_year, title
FROM movie_tbl
CROSS JOIN directors_tbl
ORDER BY year_of_birth ASC, release_year ASC
LIMIT 1;

SELECT title
FROM movie_tbl
JOIN directors_tbl
ON directors_tbl.id = movie_tbl.director_id
ORDER BY directors_tbl.id ASC, movie_tbl.release_year ASC
LIMIT 1;

+---------------+---------------+--------------+------------+
| name          | year_of_birth | release_year | title      |
+---------------+---------------+--------------+------------+
| James Cameron |          1954 |         1984 | Terminator |
+---------------+---------------+--------------+------------+

```

### Question 7
What is the latest movie of the youngest actor ?

```sql
SELECT name, year_of_birth, release_year, title
FROM movie_tbl
CROSS JOIN main_actors_tbl
ORDER BY year_of_birth DESC, release_year DESC
LIMIT 1;

SELECT title
FROM movie_tbl
JOIN movie_actors_tbl
ON movie_actors_tbl.movie_id = movie_tbl.id
JOIN directors_tbl
ON directors_tbl.id = movie_tbl.director_id
JOIN main_actors_tbl
ON main_actors_tbl.id = movie_actors_tbl.main_actor_id
ORDER BY main_actors_tbl.year_of_birth DESC, movie_tbl.release_year DESC
LIMIT 1;


+-----------+---------------+--------------+-----------+
| name      | year_of_birth | release_year | title     |
+-----------+---------------+--------------+-----------+
| Gal Gadot |          1985 |         2023 | Cleopatra |
+-----------+---------------+--------------+-----------+

```


### TABLES

```sql
mysql> SELECT * FROM directors_tbl;
+----+-------------------+---------------+
| id | name              | year_of_birth |
+----+-------------------+---------------+
|  1 | James Cameron     |          1954 |
|  2 | Christopher Nolan |          1970 |
|  3 | Patty Jenkins     |          1971 |
|  4 | Chloe Zhaos       |          1982 |
+----+-------------------+---------------+


mysql> SELECT * FROM main_actors_tbl;
+----+-----------------------+---------------+------+
| id | name                  | year_of_birth | sex  |
+----+-----------------------+---------------+------+
|  1 | Arnold Schwarzenegger |          1947 | M    |
|  2 | Gal Gadot             |          1985 | F    |
|  3 | Sigourney Weaver      |          1949 | F    |
|  4 | Christian Bale        |          1974 | M    |
|  5 | Leonardo DiCaprio     |          1974 | M    |
|  6 | Angelina Jolie        |          1975 | F    |
|  7 | Zoe Saldaña           |          1978 | F    |
|  8 | Gemma Chan            |          1982 | F    |
+----+-----------------------+---------------+------+

Movie_table
+----+-----------------+--------------+-------------+
| id | title           | release_year | director_id |
+----+-----------------+--------------+-------------+
|  1 | Titanic         |         1997 |           1 |
|  2 | Wonder Woman    |         2017 |           3 |
|  3 | Avatar          |         2009 |           1 |
|  4 | Aliens          |         1986 |           1 |
|  6 | Inception       |         2010 |           2 |
|  7 | Terminator      |         1984 |           1 |
|  8 | Cleopatra       |         2023 |           3 |
|  9 | Eternals        |         2021 |           4 |
| 10 | The Dark Knight |         2008 |           2 |
+----+-----------------+--------------+-------------+
```
