USE streamvault;

SELECT title,type,language 
FROM content;

SELECT title,language FROM content
WHERE type = 'Movie';

SELECT title,type FROM content
WHERE language = 'English';

SELECT title,type,language FROM content
WHERE country = 'India';

SELECT title,country FROM content
WHERE type = 'TV Show' AND language = 'English';

SELECT title,language,type FROM content
WHERE  language IN ('Hindi','Korean');

SELECT title,duration_min FROM content
WHERE  duration_min > 100;

SELECT title, duration_min FROM content
WHERE duration_min < 115;

SELECT title, duration_min FROM content
WHERE duration_min < 100;

SELECT title,rel_date FROM content
WHERE  rel_date > '2020-01-01';

SELECT title FROM content
ORDER BY title ASC;

SELECT title,rel_date FROM content
ORDER BY rel_date DESC;

SELECT title, duration_min
FROM content
WHERE type = 'Movie'
ORDER BY duration_min DESC;

SELECT title, duration_min
FROM content
WHERE type = 'Movie'
ORDER BY duration_min DESC
LIMIT 3;

SELECT title,rel_date FROM content
ORDER BY rel_date DESC LIMIT 5;

SELECT DISTINCT language FROM content;
SELECT DISTINCT type FROM content;

SELECT title,duration_min FROM content
WHERE duration_min IS NULL;

SELECT title,duration_min FROM content
WHERE duration_min IS NOT NULL;

SELECT title FROM content
WHERE title LIKE 'The%';

SELECT title FROM content
WHERE type IN ('Movie','TV Show');

SELECT title FROM content
WHERE language NOT IN ('English','Hindi');

