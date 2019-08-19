-- Создаём БД vk 
CREATE DATABASE IF NOT EXISTS vk; 
-- Переходим в неё 
USE vk; 

-- Создаём таблицу пользователей 
CREATE TABLE IF NOT EXISTS users (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(100) NOT NULL,
	lastname VARCHAR(100) NOT NULL,
	email VARCHAR(120) NOT NULL UNIQUE,
	phone VARCHAR(120) NOT NULL UNIQUE,
	created_at DATETIME DEFAULT NOW(),
	updated_at DATETIME DEFAULT NOW() ON UPDATE NOW() ); 

-- Таблица профилей
CREATE TABLE IF NOT EXISTS profiles (
  user_id INT UNSIGNED NOT NULL PRIMARY KEY,
  sex CHAR(1) NOT NULL,
  birthday DATE,
  hometown VARCHAR(100),
  photo_id INT UNSIGNED NOT NULL ); 

-- Таблица сообщений 
CREATE TABLE IF NOT EXISTS messages (
  from_user_id INT UNSIGNED NOT NULL,
  to_user_id INT UNSIGNED NOT NULL,
  body TEXT NOT NULL,
  important BOOLEAN,
  delivered BOOLEAN,
  created_at DATETIME DEFAULT NOW(),
  PRIMARY KEY (from_user_id, created_at) ); 

CREATE TABLE IF NOT EXISTS friendship (
  user_id INT UNSIGNED NOT NULL,
  friend_id INT UNSIGNED NOT NULL,
  status VARCHAR(20) NOT NULL,
  requested_at DATETIME DEFAULT NOW(),
  confirmed_at DATETIME,
  PRIMARY KEY (user_id, friend_id) ); 

-- Таблица групп 
CREATE TABLE IF NOT EXISTS communities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE ); 

-- Таблица связи пользователей и групп 
CREATE TABLE IF NOT EXISTS communities_users (
  community_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (community_id, user_id) ); 

-- Таблица медиафайлов 
CREATE TABLE IF NOT EXISTS media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  media_type_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  filename VARCHAR(255) NOT NULL,
  size INT NOT NULL,
  metadata JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP ); 

-- Таблица типов медиафайлов 
CREATE TABLE IF NOT EXISTS media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);

-- Таблица "лайков"
CREATE TABLE IF NOT EXISTS likes_content (
	user_id INT UNSIGNED NOT NULL,
	media_id INT UNSIGNED NOT NULL,
	PRIMARY KEY (user_id, media_id));

