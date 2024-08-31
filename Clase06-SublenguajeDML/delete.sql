USE kmart;

-- DELETE (Borrado Hard)
DELETE FROM `kmart`.`products` AS p
	WHERE p.`nombre-cliente` LIKE "Skinte";
-- no ejecutado --

TRUNCATE TABLE `kmart`.`products` ;

SELECT 
	id_producto		
,    nombre_producto	
,    precio 	
,	`nombre-cliente` 
FROM `kmart`.`products` 
-- WHERE status = FALSE
;

-- UPDATE LOGICO
UPDATE `kmart`.`products`
SET status = FALSE
	WHERE id_producto = 100;
