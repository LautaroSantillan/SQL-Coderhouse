USE kmart;

SELECT *
FROM `kmart`.`products` AS p
WHERE p.precio <= 10
ORDER BY p.precio;

-- UPDATE
UPDATE `kmart`.`products` AS p
	SET p.precio = 15
    WHERE p.precio <= 10;

-- VARIABLE DE SETEO DE OFF DE LA ACTUALIZACION MASIVA
SET SQL_SAFE_UPDATES = 0;

UPDATE `kmart`.`products` AS p
	SET p.precio = 15
    WHERE p.precio <= 10;
    
SELECT * 
FROM `kmart`.`products` AS p
ORDER BY p.precio;

-- Quiero que un cliente con sus compras se actualice sumandole un 10%
-- Update por medio de subqueries
SELECT 
	p.`nombre-cliente`,
    COUNT(1) AS 'Total de productos'
FROM `kmart`.`products` AS p
GROUP BY p.`nombre-cliente`
ORDER BY COUNT(1) DESC;

UPDATE `kmart`.`products` AS p
	SET p.precio = p.precio + (p.precio * 0.10)
    WHERE p.`nombre-cliente` LIKE "Skinte";
    
SELECT *
FROM `kmart`.`products` AS p
WHERE p.`nombre-cliente` LIKE "Skinte";
