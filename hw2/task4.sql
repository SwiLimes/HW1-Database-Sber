INSERT INTO genres(name)
VALUES ('Pop'),
       ('R&B'),
       ('Disco'),
       ('Rock');


INSERT INTO track_genre(track_id, genre_id)
VALUES ((SELECT id FROM tracks WHERE track_title = 'Blinding Lights'), (SELECT id FROM genres WHERE name = 'Pop')),
       ((SELECT id FROM tracks WHERE track_title = 'Blinding Lights'), (SELECT id FROM genres WHERE name = 'R&B')),
       ((SELECT id FROM tracks WHERE track_title = 'Dont Start Now'), (SELECT id FROM genres WHERE name = 'Pop')),
       ((SELECT id FROM tracks WHERE track_title = 'Dont Start Now'), (SELECT id FROM genres WHERE name = 'Disco')),
       ((SELECT id FROM tracks WHERE track_title = 'Do I Wanna Know?'), (SELECT id FROM genres WHERE name = 'Rock'));

SELECT art.* FROM artists art
JOIN tracks tr ON tr.artist_id = art.id
JOIN track_genre tg ON tg.track_id = tr.id
JOIN genres g ON g.id = tg.genre_id
WHERE g.name = 'Pop';
