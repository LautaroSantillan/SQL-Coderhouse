USE ecommerce_coderhouse; 
DROP VIEW IF EXISTS vw_cliente_nombre;
CREATE VIEW vw_cliente_nombre
	AS 
		SELECT nombre
		FROM cliente;

# CLIENTE QUE EMPIECEN CON LA 'M' Y CREARLES UN EMAIL
CREATE
	OR REPLACE VIEW vw_cliente_nombre
AS
	SELECT
		nombre, -- 2
		CONCAT(LOWER(nombre), '@coderhouse-sql.com.ar') AS email -- 2
	FROM cliente -- 1
	WHERE nombre LIKE 'm%'; -- 3
    
# --------------------------------------------------------
/* Ventas de cada uno de los clientes totales y ordenarlo
	por mayor cantidad de ventas */
CREATE OR REPLACE VIEW vw_ventas_ecommerce
AS
	SELECT 
	c.ID_Cliente ,
		LOWER(c.nombre) AS CLIENTE,
		COUNT(1) AS CANT_VENTAS -- COUNT(*) VS COUNT (1)
	FROM cliente AS c
		LEFT JOIN pedido as co
			ON c.ID_Cliente = co.ID_Cliente
		GROUP BY c.ID_Cliente
		ORDER BY CANT_VENTAS DESC
;

SELECT * FROM vw_ventas_ecommerce LIMIT 3;