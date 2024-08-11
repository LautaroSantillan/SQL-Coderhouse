CREATE OR REPLACE VIEW vw_friends AS 
SELECT * FROM gamers.friends;
#Llamando a una vista
SELECT * FROM vw_friends;