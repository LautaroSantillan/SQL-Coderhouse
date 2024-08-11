SELECT * FROM commentary ORDER BY id_system_user desc;

SELECT * FROM commentary ORDER BY id_system_user LIMIT 3;

SELECT COUNT(id_system_user) AS comments, id_system_user 
FROM commentary GROUP BY id_system_user;

SELECT COUNT(id_system_user) AS comments, id_system_user 
FROM commentary 
GROUP BY id_system_user 
HAVING comments > 2;