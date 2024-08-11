use gamers;
/*Buscaremos usuarios (SYSTEM_USER) utilizando el operador LIKE, y combinando el mismo con las diferentes variantes 
vistas hasta aquí.*/

# Aquellos usuarios cuyo nombre comience con la letra ‘J’
SELECT first_name as name
FROM system_user
WHERE first_name LIKE 'J%';
#Aquellos usuarios cuyo apellido contenga la letra ‘W’
SELECT last_name as lastName
FROM system_user
WHERE last_name LIKE '%w%';
#Aquellos usuarios cuyo nombre contenga la letra ‘i’ en segundo lugar
SELECT *
FROM system_user
WHERE first_name LIKE '_i%';
#Aquellos usuarios cuyo nombre finalice con la letra ‘k’
SELECT *
FROM system_user
WHERE first_name LIKE '%k';
#Aquellos usuarios cuyo nombre no incluya las letras ‘ch’
SELECT *
FROM system_user
WHERE first_name not LIKE '%ch%';
#Aquellos usuarios cuyo nombre solo incluya las letras ‘ch’
SELECT *
FROM system_user
WHERE first_name LIKE 'ch';