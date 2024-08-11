use gamers;
#SUBCONSULTAS
-- Trae el max id_user_type de la tabla user_type
SELECT max(id_user_type) FROM user_type; -- 500

-- Trae el id y lastname del usuario que contenga el máximo id de user_type
SELECT id_system_user, last_name
FROM system_user
WHERE id_user_type = (SELECT max(id_user_type) FROM user_type);

-- Busquemos los usuarios que votaron con un puntaje superior al promedio
SELECT FLOOR(AVG(value)) FROM vote; -- 4

SELECT id_system_user
FROM vote 
WHERE value > (SELECT FLOOR(AVG(value)) FROM vote);

-- GROUPBY en subconsultas
#Obtener la suma de votos por juego, solo de aquellos juegos de nivel 1.
SELECT id_game, SUM(value) AS votos
FROM vote 
WHERE id_game IN (SELECT id_game 
				FROM game WHERE id_level = 1)
GROUP BY id_game;

-- HAVING en subconsultas
#Seleccionaremos los juegos, pero sólo aquellos que hayan tenido más de un voto.
SELECT id_game, name
FROM game
WHERE id_level = 1 AND
id_game IN (SELECT id_game
		FROM vote
		GROUP BY id_game
		HAVING count(*) > 1);



