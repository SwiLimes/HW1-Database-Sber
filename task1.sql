-- Таблица исполнителей (родительская)
CREATE TABLE artists
(
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name       VARCHAR(255) NOT NULL,
    created_at TIMESTAMP        DEFAULT CURRENT_TIMESTAMP
);

-- Таблица жанров (родительская)
CREATE TABLE genres
(
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name       VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP        DEFAULT CURRENT_TIMESTAMP
);

-- Таблица альбомов
CREATE TABLE albums
(
    id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    album_title  VARCHAR(255) NOT NULL,
    release_year INT2,
    artist_id    INT          NOT NULL,
    created_at   TIMESTAMP        DEFAULT CURRENT_TIMESTAMP,

    -- Внешний ключ на исполнителя
    FOREIGN KEY (artist_id) REFERENCES artists (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Таблица треков
CREATE TABLE tracks
(
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    track_title   VARCHAR(255) NOT NULL,
    duration      INT          NOT NULL,
    listens_count INT              DEFAULT 0,
    release_year  INT2,
    album_id      INT          NULL,
    artist_id     INT          NOT NULL,
    created_at    TIMESTAMP        DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (album_id) REFERENCES albums (id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (artist_id) REFERENCES artists (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Многие-ко-многим между треками и жанрами
CREATE TABLE track_genre
(
    track_id INT NOT NULL,
    genre_id INT NOT NULL,

    -- Составной первичный ключ
    PRIMARY KEY (track_id, genre_id),

    -- Внешние ключи
    FOREIGN KEY (track_id) REFERENCES tracks (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres (id) ON DELETE CASCADE ON UPDATE CASCADE
);