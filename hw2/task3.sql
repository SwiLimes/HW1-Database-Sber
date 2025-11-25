INSERT INTO artists(name)
VALUES ('The Weeknd'),
       ('Dua Lipa'),
       ('Arctic Monkeys');

INSERT INTO albums(album_title, release_year, artist_id)
VALUES ('After Hours', 2020, (SELECT id
                              FROM artists
                              WHERE name = 'The Weeknd')),
       ('Future Nostalgia', 2020, (SELECT id
                                   FROM artists
                                   WHERE name = 'Dua Lipa')),
       ('AM', 2013, (SELECT id
                     FROM artists
                     WHERE name = 'Arctic Monkeys'));

INSERT INTO tracks(track_title, duration, listens_count, release_year, album_id, artist_id)
VALUES ('Blinding Lights', 200, 350000000, 2019,
        (SELECT id
         FROM albums
         WHERE album_title = 'After Hours'),
        (SELECT id
         FROM artists
         WHERE name = 'The Weeknd')),
       ('Dont Start Now', 183, 280000000, 2019,
        (SELECT id
         FROM albums
         WHERE album_title = 'Future Nostalgia'),
        (SELECT id
         FROM artists
         WHERE name = 'Dua Lipa')),
       ('Do I Wanna Know?', 272, 420000000, 2013,
        (SELECT id
         FROM albums
         WHERE album_title = 'AM'),
        (SELECT id
         FROM artists
         WHERE name = 'Arctic Monkeys'))