-- Join
SELECT 
g.id_game as id_g_game, 
c.id_game as ig_g_commentary,
g.name as nombre,
g.description as descripcion_del_juego,
c.commentary as comentario_del_juego
from game as g
inner join commentary as c
on c.id_game=g.id_game;

-- Ver y practicar
SELECT id_system_user as user, g.id_game as game, name, 
       id_level as level
FROM play p INNER JOIN game g ON (p.id_game = g.id_game);

SELECT id_system_user as user, g.id_game as game, 
name, id_level as level
FROM game g LEFT JOIN play p
ON (p.id_game = g.id_game);

SELECT id_system_user as user, g.id_game as game, 
name, id_level as level
FROM play p RIGHT JOIN game g
ON (p.id_game = g.id_game);

SELECT s.id_system_user AS user, g.id_game AS game, 
       g.name, g.id_level AS level
FROM system_user s
LEFT JOIN play p ON s.id_system_user = p.id_system_user
LEFT JOIN game g ON p.id_game = g.id_game

UNION

SELECT s.id_system_user AS user, g.id_game AS game, 
       g.name, g.id_level AS level
FROM system_user s
RIGHT JOIN play p ON s.id_system_user = p.id_system_user
RIGHT JOIN game g ON p.id_game = g.id_game
WHERE s.id_system_user IS NULL OR g.id_game IS NULL;