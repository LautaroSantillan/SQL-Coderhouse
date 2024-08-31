DROP DATABASE IF EXISTS kmart;

CREATE DATABASE kmart;
USE kmart;

CREATE TABLE `products`(
	id_producto INT NOT NULL AUTO_INCREMENT ,
	nombre_producto VARCHAR(100) DEFAULT 'producto x',
	precio FLOAT(10,2) DEFAULT 100.00,
	`nombre-cliente` VARCHAR(200) DEFAULT 'cliente x',
	PRIMARY KEY (id_producto)
);