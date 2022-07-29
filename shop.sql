drop database if exists shop;
create database shop;
use shop;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(255) COMMENT 'Название раздела',
                          UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

-- SERIAL это псевдотип для BIGINT
-- SERIAL == BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
-- UNSIGNED поле хранит только положительные значения

INSERT INTO catalogs VALUES
  (DEFAULT, 'Процессоры'),
  (DEFAULT, 'Мат.платы'),
  (DEFAULT, 'Видеокарты');

DROP TABLE IF EXISTS cat;
CREATE TABLE cat (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

INSERT INTO cat SELECT * FROM catalogs;
SELECT * FROM cat;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  desription TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)  # объявление индекса
) COMMENT = 'Товарные позиции';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id)
) COMMENT = 'Заказы';

DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
  id SERIAL PRIMARY KEY,
  order_id INT UNSIGNED,
  product_id INT UNSIGNED,
  total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Состав заказа';

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
  user_id INT UNSIGNED,
  product_id INT UNSIGNED,
  discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
  started_at DATETIME,
  finished_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_user_id(user_id),
  KEY index_of_product_id(product_id)
) COMMENT = 'Скидки';

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Склады';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';


/* 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users,
catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы,
идентификатор первичного ключа и содержимое поля name. */

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  id SERIAL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  item_id BIGINT,
  table_name VARCHAR(50),
  name VARCHAR(255)
) COMMENT = 'Журнал' ENGINE=Archive;


DROP TRIGGER IF EXISTS check_users;
DELIMITER //
CREATE TRIGGER check_users AFTER INSERT ON users
    FOR EACH ROW
    BEGIN
        DECLARE table_name VARCHAR(50) DEFAULT 'users';
        SELECT id, name INTO @item_id, @name FROM users ORDER BY id DESC LIMIT 1;
        INSERT INTO logs (`table_name`, `item_id`, `name`)
        VALUES (table_name, @item_id, @name);
    END//


DROP TRIGGER IF EXISTS check_catalogs;
DELIMITER //
CREATE TRIGGER check_catalogs AFTER INSERT ON catalogs
    FOR EACH ROW
    BEGIN
        SELECT id, name INTO @item_id, @name FROM catalogs ORDER BY id DESC LIMIT 1;
        SET @table_name = 'catalogs';
        INSERT INTO logs (`table_name`, `item_id`, `name`)
        VALUES (@table_name, @item_id, @name);
    END//


DROP TRIGGER IF EXISTS check_products;
DELIMITER //
CREATE TRIGGER check_products AFTER INSERT ON products
    FOR EACH ROW
    BEGIN
        SELECT id, name INTO @item_id, @name FROM products ORDER BY id DESC LIMIT 1;
        SET @table_name = 'products';
        INSERT INTO logs (`table_name`, `item_id`, `name`)
        VALUES (@table_name, @item_id, @name);
    END//


INSERT INTO users (name, birthday_at) VALUES ('Максим', '1991-01-11');
INSERT INTO users (name, birthday_at) VALUES ('Федор', '1991-01-11');
INSERT INTO users (name, birthday_at) VALUES ('Василий', '1991-01-11');
INSERT INTO catalogs (name) VALUES ('Мебель');
INSERT INTO catalogs (name) VALUES ('Сантехника');
INSERT INTO catalogs (name) VALUES ('Посуда');
INSERT INTO products (name, desription, price, catalog_id) VALUES ('Intel', 'мощный процессор', 20000, 1);
INSERT INTO products (name, desription, price, catalog_id) VALUES ('AMD', 'быстрый процессор', 15000, 1);


/* 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей. */
DROP TABLE IF EXISTS million;
CREATE TABLE million (
  title CHAR(5) NOT NULL
);

DROP TABLE IF EXISTS fill_table;
CREATE TABLE fill_table (
  title CHAR(5) NOT NULL
);

DROP PROCEDURE IF EXISTS create_100;
DELIMITER //
CREATE PROCEDURE create_100()
BEGIN
  DECLARE n INT DEFAULT 0;
  WHILE n < 100 DO
    INSERT INTO fill_table VALUES ('abcde');
    SET n = n + 1;
  END WHILE;
END//
DELIMITER ;

CALL create_100();

INSERT INTO million
SELECT t.title FROM fill_table AS t, fill_table AS e, fill_table AS s;

DROP TABLE IF EXISTS fill_table;
SELECT * FROM `million`;

SELECT p.name, p.price, c.name FROM catalogs AS c JOIN products AS p ON c.id = p.catalog_id;

SELECT * FROM products JOIN catalogs c on products.catalog_id = c.id;

SELECT p.name, p.price, c.name FROM catalogs AS c JOIN products AS p ON c.id = p.catalog_id;