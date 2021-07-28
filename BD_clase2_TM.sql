--- 1)
SELECT s.title, g.name
FROM series s
JOIN genres g ON (s.genre_id = g.id);

-- 2)
SELECT e.title, group_concat(CONCAT(a.first_name,' ', a.last_name) SEPARATOR ', ')
FROM episodes e
JOIN actor_episode ae ON (e.id = ae.episode_id)
JOIN actors a ON (ae.actor_id = a.id)
GROUP BY e.title;

-- 3)
SELECT * FROM series;
select * from seasons;

SELECT s.title, COUNT(s.title)
FROM series s
JOIN seasons se ON (s.id = se.serie_id)
GROUP BY s.title;

SELECT *
FROM series s
JOIN seasons se ON (s.id = se.serie_id);

SELECT s.title, (SELECT COUNT(*) FROM seasons where serie_id = s.id) as seasons
FROM series s;

-- 4)
SELECT g.name, COUNT(g.name) as movies
FROM genres g
JOIN movies m ON (g.id = m.genre_id)
GROUP BY g.name;

-- 5)
select * from movies;

SELECT DISTINCT CONCAT(a.first_name, ' ', a.last_name)
FROM actors a
JOIN actor_movie am ON (a.id = am.actor_id)
JOIN movies m ON (am.movie_id = m.id)
WHERE LOWER(m.title) LIKE 'la guerra de las galaxias%';