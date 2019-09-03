/* курсовой проект по модели хранения данных популярного веб-сайта https://www.ivi.ru/ */
CREATE DATABASE IF NOT EXISTS ivi;
USE ivi;

/* Таблица Актеров и режиссеров */
CREATE TABLE IF NOT EXISTS people (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

/* Таблица киножанров */
CREATE TABLE IF NOT EXISTS genres (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

/* Таблица фильмов */
CREATE TABLE IF NOT EXISTS movies (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT NOT NULL, /*описание*/
    rating FLOAT, /* рейтинг */
    age_limit TINYINT NOT NULL ,/* ограничение по возрасту*/
    filename VARCHAR(255) NOT NULL UNIQUE,  /* путь к фильму на диске*/
    duration TIME NOT NULL, /* продолжительность */
    created_at DATE NOT NULL /* дата выхода в прокат */
);

/* Таблица Действующие лица фильмов */
CREATE TABLE IF NOT EXISTS people_movies (
    movie_id INT NOT NULL,
    person_id INT NOT NULL,
    is_actor TINYINT(1), /* в фильме был актером*/
    is_producer TINYINT(1),  /* в фильме был режиссером*/
    PRIMARY KEY (movie_id, person_id)
);

/* Таблица пользователей */
CREATE TABLE IF NOT EXISTS users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(100) NOT NULL,
	lastname VARCHAR(100) NOT NULL,
	email VARCHAR(120) NOT NULL UNIQUE,
	phone VARCHAR(120) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW() );

/* Таблица комментариев */
CREATE TABLE IF NOT EXISTS comments (
    user_id INT UNSIGNED NOT NULL,
    movie_id INT UNSIGNED NOT NULL,
    body TEXT NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    PRIMARY KEY (user_id, created_at) );

/* Таблица "лайков" комментариев */
CREATE TABLE IF NOT EXISTS likes_comment (
	user_id INT UNSIGNED NOT NULL,
	comment_id INT UNSIGNED NOT NULL,
	PRIMARY KEY (user_id, comment_id));

/* Таблица подписки */
CREATE TABLE IF NOT EXISTS subscriptions (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    count_of_month INT NOT NULL UNIQUE, /* количество месяцев действия подписки*/
    price FLOAT NOT NULL /* цена подписки */
);

/* Таблица покупок */
CREATE TABLE purchases (
    user_id INT UNSIGNED NOT NULL,
    movie_id INT UNSIGNED NOT NULL,
    payment TINYINT, /* способ оплаты */
    PRIMARY KEY (user_id, movie_id));

/* Таблица цен на фильмы */
CREATE TABLE prices (
    movie_id INT UNSIGNED NOT NULL,
    open_date DATETIME DEFAULT CURRENT_TIMESTAMP, /* дата вступления в силу новой цены*/
    price FLOAT NOT NULL,
    available_by_subscription TINYINT, /* доступен по подписке*/
    PRIMARY KEY (movie_id, open_date));

/* Таблица пользовательских подписок */
CREATE TABLE users_subscriptions (
    user_id INT UNSIGNED NOT NULL,
    subscription_id INT UNSIGNED NOT NULL,
    begin_date DATETIME DEFAULT CURRENT_TIMESTAMP, /* дата начала действия подписки*/
    end_date DATETIME NOT NULL, /* дата окончания действия подписки */
    PRIMARY KEY (user_id, subscription_id)
);



