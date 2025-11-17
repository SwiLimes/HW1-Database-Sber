-- Задание 2
-- Спроектируйте БД для сервиса покупки электронных книг
-- Спроектированная БД должна быть в 3НФ (если это не так, проведите ее нормализацию).
-- Какие вы использовали типы связи (один-ко-многим/один-к-одному/многие-ко-многим)?  Какие поля в таблицах являются первичными ключами? Какие являются внешними ключами?
-- Какие таблицы являются родительскими?

-- Информация об авторах
CREATE TABLE t_author
(
    id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL UNIQUE
);

-- Информация о книгах
CREATE TABLE t_book
(
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title       TEXT           NOT NULL,
    author_id   UUID           NOT NULL REFERENCES t_author (id),
    price       NUMERIC(10, 2) NOT NULL CHECK (price >= 0),
    year        INT2,
    file_format text             DEFAULT 'epub'
);

-- Информация о пользователях
CREATE TABLE t_user
(
    id    UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email TEXT NOT NULL UNIQUE,
    name  TEXT
);

-- Информация о покупках
CREATE TABLE t_purchase
(
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id    UUID           NOT NULL REFERENCES t_user (id) ON DELETE CASCADE,
    book_id    UUID           NOT NULL REFERENCES t_book (id) ON DELETE RESTRICT,
    bought_at  TIMESTAMP        DEFAULT now(),
    price_paid NUMERIC(10, 2) NOT NULL
);

-- Связи: 1-to-M и M-to-M (t_purchase)

-- Первичные ключи: t_author.id, t_book.id, t_user.id, t_purchase.id

-- Внешние ключи: t_book.author_id, t_purchase.user_id, t_purchase.book_id

-- Родительские таблицы: t_author, t_user, t_book