use gamers;
#Crando tabla con llave primaria 
CREATE TABLE troops (
	id INT auto_increment PRIMARY KEY,
    description VARCHAR(45)
);
#Crando tabla con llave foranea 
CREATE TABLE friends(
	id_friend INT auto_increment PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    id_troop INT,
    FOREIGN KEY (id_troop) REFERENCES troops(id)
);
#Insertando datos
insert into troops (description) values
('Vermillon'),
('Skull');

INSERT INTO friends (first_name, last_name, id_troop)
VALUES
	('Rick', 'Hunter', 2),
	('Roy', 'Folker', 2),
	('Max', 'Sterling', 2),
	('Kramer', 'Key', 2),
	('Mriya', 'Sterling', 2),
	('Ben', 'Dixon', 1);
    
DELETE FROM friends WHERE id_friend = 6;