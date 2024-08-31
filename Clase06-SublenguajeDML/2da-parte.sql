--  SEGUNDA PARTE DE DML 
-- Hernan => recategorizar por 5 rangos 
-- -> productos oferta 0 - 15
-- -> productos estandar 16 - 70
-- -> productos intermedio 71 - 120
-- -> productos premium 121 - 500
-- -> productos cuidados  >= 501

CREATE DATABASE IF NOT EXISTS hernan_team;

CREATE TABLE hernan_team.rango_productos (
	id INT NOT NULL,
    nombre VARCHAR(100),
    rango VARCHAR(100)
);

INSERT INTO hernan_team.rango_productos
	SELECT 
		p.id_producto
	,	p.nombre_producto
	,	CASE 
			WHEN p.precio IS NULL THEN 'no encontrado'
			WHEN p.precio BETWEEN 0 AND 15 THEN 'oferta'
			WHEN p.precio BETWEEN 16 AND 70 THEN 'estandar'
			WHEN p.precio BETWEEN 71 AND 120 THEN 'intermedio'
			WHEN p.precio BETWEEN 121 AND 500 THEN 'premium'
			ELSE 'cuidado'
		END AS rango
	FROM `kmart`.`products` AS p ;

SELECT 
	rango
,	COUNT(1) total_productos
 FROM hernan_team.rango_productos
 GROUP BY rango
 ORDER BY COUNT(1)
 ;
 
 -- UPDATE USANDO SUBQUERIES

UPDATE `kmart`.`products` AS p
	SET p.precio = (p.precio * 0.50)
	WHERE `nombre-cliente` = (
		-- RECURSIVIDAD ERROR!
    
			SELECT 
				`nombre-cliente` 
			FROM `kmart`.`products`
			GROUP BY `nombre-cliente` 
			ORDER BY COUNT(1) DESC 
			LIMIT 1
        ); 

CREATE TEMPORARY TABLE temp_clientes AS 
	SELECT 
		`nombre-cliente` 
	FROM `kmart`.`products`
	GROUP BY `nombre-cliente` 
	ORDER BY COUNT(1) DESC 
	LIMIT 1 ;

UPDATE `kmart`.`products` AS p
	SET p.precio = (p.precio * 0.50)
	WHERE p.`nombre-cliente` 
		LIKE (SELECT `nombre-cliente` FROM temp_clientes)
;

-- DELETE CON SUBQUERIES

DELETE FROM `kmart`.`products` -- AS  kp
	WHERE EXISTS (
		SELECT 
		 -- 	hr.id
		 -- 	1
         NULL
        FROM hernan_team.rango_productos -- AS hr
        WHERE  -- LO QUE IMPORTA MASS!!!!
			-- hr.
            rango LIKE 'cuidado'
			-- AND hr.id = kp.id_producto
            AND id = id_producto
    );

SELECT * 
FROM `kmart`.`products`
WHERE id_producto
IN (
'107'
,'108'
,'139'
,'165'
);