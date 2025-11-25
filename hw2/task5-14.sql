-- 5 task
SELECT art.*
FROM artists art
WHERE NOT EXISTS(SELECT 1
                 FROM tracks tr
                          JOIN track_genre tg ON tg.track_id = tr.id
                          JOIN genres g ON g.id = tg.genre_id
                 WHERE tr.artist_id = art.id
                   AND g.name = 'Pop');

-- 6 task
SELECT tr.*
FROM tracks tr
WHERE tr.listens_count > 30000;

-- 7 task
SELECT art.id,
       art.name,
       ROUND(AVG(t.listens_count)) AS avg_listens
FROM artists art
         JOIN tracks t ON art.id = t.artist_id
         JOIN track_genre tg ON t.id = tg.track_id
         JOIN genres g ON tg.genre_id = g.id
WHERE g.name = 'Disco'
GROUP BY art.id, art.name
HAVING AVG(t.listens_count) > 20000000
ORDER BY avg_listens DESC;

-- 8 task
SELECT g.name,
       SUM(t.listens_count) AS total_listens
FROM tracks t
         JOIN track_genre tg ON t.id = tg.track_id
         JOIN genres g ON tg.genre_id = g.id
WHERE g.name = 'Pop'
GROUP BY g.name;

-- 9 task
SELECT g.name,
       SUM(t.listens_count) AS total_listens
FROM genres g
         JOIN track_genre tg ON g.id = tg.genre_id
         JOIN tracks t ON tg.track_id = t.id
GROUP BY g.id, g.name
ORDER BY total_listens;

-- 10 task
SELECT art.name,
       ROUND(AVG(t.listens_count)) AS avg_listens
FROM artists art
         JOIN tracks t ON art.id = t.artist_id
GROUP BY art.name
ORDER BY avg_listens DESC;

-- 11 task
SELECT art.name,
       SUM(t.listens_count) AS total_listens
FROM artists art
         JOIN tracks t ON art.id = t.artist_id
GROUP BY art.name
ORDER BY total_listens;

-- 12 task
SELECT art.name,
       COUNT(t.id) AS tracks_count
FROM artists art
         LEFT JOIN tracks t ON art.id = t.artist_id
GROUP BY art.name
ORDER BY tracks_count DESC;


-- 13 task
INSERT INTO artists(name)
VALUES ('Eminem');

-- все исполнители, даже у которых нет песен
SELECT *
FROM artists art
         LEFT JOIN tracks t on art.id = t.artist_id;

-- все песни, даже у которых нет исполнителя
SELECT *
FROM artists art
         RIGHT JOIN tracks t on art.id = t.artist_id;

-- все исполнители и все треки (даже если нет связи)
SELECT *
FROM artists art
         FULL JOIN tracks t on art.id = t.artist_id;

-- 14 task
INSERT INTO genres(name)
VALUES ('Rap');

SELECT g.id,
       g.name
FROM genres g
WHERE NOT EXISTS (SELECT 1
                  FROM track_genre tg
                  WHERE tg.genre_id = g.id);

