USE `celulares`;
DROP procedure IF EXISTS `insert_pro`;

DELIMITER $$
USE `celulares`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE insert_pro(
    IN nom VARCHAR(100),
    IN precio DOUBLE,
    IN codigo_fabricante INT
)
BEGIN
    INSERT INTO producto (nombre, precio, codigo_fabricante)
    VALUES (nom, precio, codigo_fabricante);
END;$$

DELIMITER ;

USE `celulares`;
DROP procedure IF EXISTS `insert_fab`;

USE `celulares`;
DROP procedure IF EXISTS `celulares`.`insert_fab`;
;

DELIMITER $$
USE `celulares`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE insert_fab(
    IN nombre_fabricante VARCHAR(100)
)
BEGIN
    INSERT INTO fabricantes (nombre) VALUES (nombre_fabricante);
END;$$

DELIMITER ;
;

