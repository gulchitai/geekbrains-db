SHOW TABLES;
DESC like_types;
SELECT * FROM like_types;
INSERT INTO like_types VALUES (1, 'media');

INSERT INTO like_types (name) VALUES ('media');

-- ключевое слово DEFAULT
INSERT INTO like_types VALUES (DEFAULT, 'media');
INSERT INTO like_types (name) VALUES ('newsline'), ('user');
SELECT * FROM like_types;

-- игнорирует ошибки
INSERT IGNORE INTO like_types (name) VALUES ('media');
-- просмотреть предупреждения
SHOW WARNINGS;

-- SET указывает на имена столбцов явно
INSERT INTO like_types SET name = 'community';

-- REPLACE копия INSERT IGNORE но работает немного по другому
REPLACE INTO like_types (name) VALUES ('community');

-- вывести всё
SELECT * FROM like_types;
SELECT ALL * FROM like_types;

-- вывести только уникальные строки
SELECT DISTINCT * FROM like_types;

-- использование LIMIT
SELECT ALL * FROM like_types LIMIT 1;

-- обновление данных
UPDATE like_types SET id = id * 10;

-- обновление по условию
UPDATE like_types SET name = 'group' WHERE name = 'community';

-- применение с IGNORE
UPDATE like_types SET name = 'group' WHERE name = 'user';
UPDATE IGNORE like_types SET name = 'group' WHERE name = 'user';
SHOW WARNINGS;

-- удаление по условию
DELETE FROM like_types WHERE name = 'group';

-- удаление слимитом LIMIT
DELETE FROM like_types LIMIT 1;

-- удалить все записи
DELETE FROM like_types;
-- и смотрим счётчик
INSERT INTO like_types VALUES (DEFAULT, 'media');

-- более быстый способ
TRUNCATE like_types;
-- сбрасывает счётчики, проверим
INSERT INTO like_types VALUES (DEFAULT, 'media');