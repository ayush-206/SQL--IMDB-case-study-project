--Question 1: Get all data about movies?
SELECT * from movies m;

--Question 1: Get all data about directors?
SELECT * from directors d;

--Question 3: Checking how many movies are present in iMDB ?
SELECT COUNT(*) from movies m; 

--Question 4: Find these 3 directors: James Cameron ; Luc Besson ; John Woo ?
SELECT * FROM directors d 
WHERE name == 'James Cameron' OR name == 'Luc Besson' OR name == 'John Woo';

--Question 5: Find all directors with name starting with Steven ?
SELECT * FROM directors d 
WHERE name LIKE 'Steven%';

--Question 6: Count female directors ?
SELECT COUNT(*) from directors d 
WHERE gender == 1;

--Question 7: Find the name of the 10th first women directors?
SELECT name from directors d 
WHERE gender == 1
ORDER BY id ASC 
LIMIT 1  offset 10;

--Question 8: What are the top 5 most popular movies?
SELECT original_title from movies m 
ORDER BY popularity DESC
LIMIT 5;

--Question 9: What are the top 7 most bankable movies?
SELECT original_title from movies m 
ORDER BY budget DESC
LIMIT 7;

--Question 10: What is the most awarded average vote since the January 1st, 2000?
SELECT original_title from movies m
WHERE release_date > '2000-01-01'
ORDER BY vote_average DESC 
LIMIT 1;

--Question 11: Which movie(s) were directed by Brenda Chapman?
SELECT original_title from movies m 
JOIN directors d 
ON d.id=m.director_id 
WHERE d.name = 'Brenda Chapman'

--Question 12: Whose director made the most movies?
SELECT name from directors d 
JOIN movies m 
ON d.id=m.director_id 
GROUP BY director_id
ORDER BY COUNT(name) DESC 
LIMIT 1;

--Question 13: Whose director is the most bankable?
SELECT name from directors d 
JOIN movies m 
ON d.id=m.director_id 
GROUP BY director_id
ORDER BY SUM(budget) DESC 
LIMIT 1;
