USE `celulares`;
DROP procedure IF EXISTS `insert_fab`;

DELIMITER $$
USE `celulares`$$
CREATE PROCEDURE insert_fab (
IN nom varchar(100)
)
BEGIN
	insert into fabricantes (nombre) values(nom);
END$$

DELIMITER ;

USE `celulares`;
DROP procedure IF EXISTS `insert_pro`;

USE `celulares`;
DROP procedure IF EXISTS `insert_pro`;

USE `celulares`;
DROP procedure IF EXISTS `celulares`.`insert_pro`;
;

USE `celulares`;
DROP procedure IF EXISTS `insert_pro`;

USE `celulares`;
DROP procedure IF EXISTS `celulares`.`insert_pro`;
;

USE `celulares`;
DROP procedure IF EXISTS `insert_pro`;

USE `celulares`;
DROP procedure IF EXISTS `celulares`.`insert_pro`;
;

USE `celulares`;
DROP procedure IF EXISTS `insert_pro`;

USE `celulares`;
DROP procedure IF EXISTS `celulares`.`insert_pro`;
;

USE `celulares`;
DROP procedure IF EXISTS `insert_pro`;

USE `celulares`;
DROP procedure IF EXISTS `celulares`.`insert_pro`;
;

USE `celulares`;
DROP procedure IF EXISTS `insert_pro`;

USE `celulares`;
DROP procedure IF EXISTS `celulares`.`insert_pro`;
;

USE `celulares`;
DROP procedure IF EXISTS `insert_pro`;

USE `celulares`;
DROP procedure IF EXISTS `celulares`.`insert_pro`;
;

DELIMITER $$
USE `celulares`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_pro`(
    IN nom VARCHAR(100),
    IN precio DOUBLE,
    IN codigo_fabricante INT
)
BEGIN
    INSERT INTO producto (nombre, precio, codigo_fabricante)
    VALUES (nom, precio, codigo_fabricante);
END;$$

DELIMITER ;
;


