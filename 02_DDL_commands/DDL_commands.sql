
-- for database

-- 1) CREATE
CREATE DATABASE flipkart;
-- or
CREATE DATABASE IF NOT EXISTS flipkart;

-- 2)  DROP 
DROP DATABASE IF EXISTS flipkart;

-- For Tables

-- 1) CREATE 
-- ----- Creating the table users-------

CREATE TABLE users(
user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(90) NOT NULL,
email VARCHAR(90) NOT NULL UNIQUE,
password VARCHAR(90) NOT NULL
 );
 
-- 2) TRUNCATE
TRUNCATE TABLE users;

-- 3) DROP
DROP TABLE IF EXISTS users;

-- 4) ALTER TABLE COMMAND

-- add columns
ALTER TABLE users ADD COLUMN 
surname  VARCHAR(255) NOT NULL 
AFTER name;

-- delete column
ALTER TABLE users DROP COLUMN
email;

-- modify column
ALTER TABLE users MODIFY
COLUMN user_id VARCHAR(255)

