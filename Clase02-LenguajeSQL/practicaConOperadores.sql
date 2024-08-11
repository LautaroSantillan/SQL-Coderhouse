use gamers;
SELECT * FROM game;
#TABLA COMENTARIOS
-- Todos los comentarios sobre juegos desde 2019 en adelante.
SELECT commentary FROM commentary where comment_date >= "2019-01-01"; 
#Todos los comentarios sobre juegos anteriores a 2011.
SELECT commentary FROM commentary where comment_date <= "2011-01-01"; 
-- Los usuarios y texto de aquellos comentarios sobre juegos cuyo código de juego (id_game) sea 73
SELECT id_system_user, commentary FROM commentary where id_game = 73;
-- Los usuarios y texto de aquellos comentarios sobre juegos cuyo id de juego no sea 73.
SELECT id_system_user, commentary FROM commentary where id_game != 73;
#TABLA GAME
-- Aquellos juegos de nivel 1.
SELECT name FROM game where id_level = 1;
-- Aquellos juegos sean de nivel 14, 5 o 9.
SELECT name FROM game where id_level in (14, 5, 9);
-- Aquellos juegos de nombre 'Riders Republic' o 'The Dark Pictures: House Of Ashes'.
SELECT name FROM game where name = "Riders Republic" or name = "The Dark Pictures: House Of Ashes";
SELECT name FROM game where name in ("Riders Republic", "The Dark Pictures: House Of Ashes");
-- Aquellos juegos cuyo nombre empiece con 'Gran'.
SELECT name FROM game where name like "Gran%";
/*Aquellos juegos cuyo nombre contenga 'field'.*/
SELECT name FROM game where name like "%field%";

-- OrderBy
SELECT id_level, name FROM game where id_level < 30 Order By id_level asc; -- por default es "asc" 
SELECT id_level, name FROM game where id_level < 30 Order By id_level desc; 
SELECT id_level, name FROM game where id_level < 30 Order By id_level, name desc; 

-- Limit 
SELECT *
FROM game
ORDER BY id_class
LIMIT 3, 5;

SELECT id_level, name FROM game 
where id_level < 30
order by id_level desc, name
limit 15,5;

-- Alias
SELECT 
     su.id_system_user AS id,
     su.last_name AS l_n,     
     su.password AS pass
FROM system_user su
ORDER BY su.id_system_user;

-- Funciones de agregación 

-- Group By
SELECT id_system_user AS user, COUNT(*) AS games_by_user
FROM play
GROUP BY id_system_user;

-- Having
SELECT id_system_user AS user, COUNT(*) AS games_by_user
FROM play
GROUP BY id_system_user
HAVING COUNT(*) = 5;

