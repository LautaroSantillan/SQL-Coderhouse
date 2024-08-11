create database gamers;
use gamers;

SELECT id_class, description FROM class;

SELECT * FROM system_user;
SELECT first_name, last_name FROM system_user;
SELECT first_name, last_name, email FROM system_user;
SELECT id_system_user, first_name, last_name FROM system_user;

-- DISTINCT
SELECT distinct first_name 
FROM system_user; 

-- Where 
SELECT * FROM system_user WHERE first_name = "Gillie";
SELECT id_system_user, id_user_type, first_name, last_name FROM system_user WHERE id_user_type = 334;
SELECT first_name, last_name FROM system_user WHERE id_system_user = 56;
SELECT * FROM system_user WHERE first_name = "Reinaldos";
