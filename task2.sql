#Создадим базу данных 
CREATE DATABASE example; 
USE example; 
#Таблица пользователи 
CREATE TABLE users (
  id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  name VARCHAR(150) UNIQUE
);
