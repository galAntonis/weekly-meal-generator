CREATE DATABASE meals;

USE meals;

CREATE TABLE meal_items (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE breakfast_items (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10,2) NOT NULL
);


CREATE TABLE ingredients (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  item_id INT NOT NULL,
  item_type VARCHAR(10) NOT NULL,
  ingredient VARCHAR(255) NOT NULL,
  FOREIGN KEY (item_id) REFERENCES meal_items(id),
  FOREIGN KEY (item_id) REFERENCES breakfast_items(id)
);

CREATE TABLE nutrition (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  item_id INT NOT NULL,
  item_type VARCHAR(10) NOT NULL,
  kcal DECIMAL(10,2) NOT NULL,
  fat DECIMAL(10,2) NOT NULL,
  saturates DECIMAL(10,2) NOT NULL,
  carbs DECIMAL(10,2) NOT NULL,
  sugars DECIMAL(10,2) NOT NULL,
  fibre DECIMAL(10,2) NOT NULL,
  protein DECIMAL(10,2) NOT NULL,
  salt DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (item_id) REFERENCES meal_items(id),
  FOREIGN KEY (item_id) REFERENCES breakfast_items(id)
);

CREATE TABLE instructions (
  item_id INT NOT NULL,
  item_type VARCHAR(10) NOT NULL,
  step INT NOT NULL,
  instruction VARCHAR(255) NOT NULL,
  PRIMARY KEY(item_id, step),
  FOREIGN KEY (item_id) REFERENCES meal_items(id),
  FOREIGN KEY (item_id) REFERENCES breakfast_items(id)
);