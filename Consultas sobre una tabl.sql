USE celulares;
-- 1. Lista el nombre de todos los productos
SELECT nombre FROM producto;

-- 2. Lista los nombres y los precios de todos los productos
SELECT nombre, precio FROM producto;

-- 3. Lista todas las columnas de la tabla producto
SELECT * FROM producto;

-- 4. Lista el nombre, precio en euros y en dólares (1€ = 1.10 USD por ejemplo)
SELECT nombre, precio, precio * 1.10 AS precio_usd FROM producto;

-- 5. Igual que la anterior, pero con alias personalizados
SELECT nombre AS 'nombre de producto', precio AS euros, precio * 1.10 AS dólares FROM producto;

-- 6. Nombres en mayúscula
SELECT UPPER(nombre) AS nombre_mayuscula, precio FROM producto;

-- 7. Nombres en minúscula
SELECT LOWER(nombre) AS nombre_minuscula, precio FROM producto;

-- 8. Nombre de fabricantes y los 2 primeros caracteres en mayúscula
SELECT nombre, UPPER(LEFT(nombre, 2)) AS iniciales FROM fabricantes;

-- 9. Precios redondeados
SELECT nombre, ROUND(precio) AS precio_redondeado FROM producto;

-- 10. Precios truncados sin decimales
SELECT nombre, TRUNCATE(precio, 0) AS precio_truncado FROM producto;

-- 11. IDs de fabricantes con productos
SELECT codigo_fabricante FROM producto;

-- 12. IDs únicos de fabricantes con productos
SELECT DISTINCT codigo_fabricante FROM producto;

-- 13. Nombres de fabricantes en orden ascendente
SELECT nombre FROM fabricantes ORDER BY nombre ASC;

-- 14. Nombres de fabricantes en orden descendente
SELECT nombre FROM fabricantes ORDER BY nombre DESC;

-- 15. Productos ordenados por nombre asc y precio desc
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16. Las 5 primeras filas de fabricante
SELECT * FROM fabricantes LIMIT 5;

-- 17. Dos filas desde la cuarta fila (inicia en 3 porque empieza desde 0)
SELECT * FROM fabricantes LIMIT 3, 2;

-- 18. Producto más barato
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19. Producto más caro
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20. Productos del fabricante con ID 2
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21. Productos con precio <= 120
SELECT nombre FROM producto WHERE precio <= 120;

-- 22. Productos con precio >= 400
SELECT nombre FROM producto WHERE precio >= 400;

-- 23. Productos que NO tienen precio >= 400
SELECT nombre FROM producto WHERE NOT (precio >= 400);

-- 24. Productos con precio entre 80 y 300 (sin BETWEEN)
SELECT * FROM producto WHERE precio >= 80 AND precio <= 300;

-- 25. Productos con precio entre 60 y 200 (usando BETWEEN)
SELECT * FROM producto WHERE precio BETWEEN 60 AND 200;

-- 26. Productos con precio > 200 y fabricante = 6
SELECT * FROM producto WHERE precio > 200 AND codigo_fabricante = 6;

-- 27. Productos con fabricante 1, 3 o 5 (sin IN)
SELECT * FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

-- 28. Productos con fabricante 1, 3 o 5 (con IN)
SELECT * FROM producto WHERE codigo_fabricante IN (1, 3, 5);

-- 29. Precio en céntimos (alias: céntimos)
SELECT nombre, precio * 100 AS céntimos FROM producto;

-- 30. Fabricantes cuyo nombre empieza con 'S'
SELECT nombre FROM fabricantes WHERE nombre LIKE 'S%';

-- 31. Fabricantes cuyo nombre termina en 'e'
SELECT nombre FROM fabricantes WHERE nombre LIKE '%e';

-- 32. Fabricantes con 'w' en su nombre
SELECT nombre FROM fabricantes WHERE nombre LIKE '%w%';

-- 33. Fabricantes con nombres de 4 caracteres
SELECT nombre FROM fabricantes WHERE LENGTH(nombre) = 4;

-- 34. Productos que contienen 'Portátil'
SELECT nombre FROM producto WHERE nombre LIKE '%Portátil%';

-- 35. Productos que contienen 'Monitor' y precio < 215
SELECT nombre FROM producto WHERE nombre LIKE '%Monitor%' AND precio < 215;

-- 36. Productos con precio >= 180, ordenado por precio desc y nombre asc
SELECT nombre, precio FROM producto WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;

-- 1. Nombre del producto, precio y nombre del fabricante
SELECT p.nombre, p.precio, f.nombre
FROM producto p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo;

-- 2. Igual que la anterior, ordenado por nombre del fabricante
SELECT p.nombre, p.precio, f.nombre
FROM producto p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre ASC;

-- 3. ID producto, nombre producto, ID fabricante, nombre fabricante
SELECT p.codigo, p.nombre, f.codigo, f.nombre
FROM producto p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo;

-- 4. Producto más barato (nombre, precio, fabricante)
SELECT p.nombre, p.precio, f.nombre
FROM producto p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC
LIMIT 1;

-- 5. Producto más caro (nombre, precio, fabricante)
SELECT p.nombre, p.precio, f.nombre
FROM producto p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC
LIMIT 1;

-- 6. Todos los productos del fabricante Lenovo
SELECT p.*
FROM producto p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

-- 7. Productos de Crucial con precio > 200€
SELECT p.*
FROM producto p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- 8. Productos de Asus, Hewlett-Packard y Seagate (sin IN)
SELECT p.*
FROM producto p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

-- 9. Igual que la anterior, pero con IN
SELECT p.*
FROM producto p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 10. Productos de fabricantes cuyo nombre termina en "e"
SELECT p.nombre, p.precio
FROM producto p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%e';

-- 11. Productos donde el fabricante contiene una "w"
SELECT p.nombre, p.precio
FROM producto p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre LIKE '%w%';

-- 12. Productos con precio ≥ 180€, ordenados por precio DESC, nombre ASC
SELECT p.nombre, p.precio, f.nombre
FROM producto p
INNER JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

-- 13. Fabricantes que tienen productos (sin duplicados)
SELECT DISTINCT f.codigo, f.nombre
FROM fabricantes f
INNER JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 1. LEFT JOIN: Todos los fabricantes con sus productos (incluso si no tienen productos)
SELECT f.codigo AS id_fabricante, f.nombre AS nombre_fabricante, p.nombre AS nombre_producto
FROM fabricantes f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 2. Fabricantes que NO tienen productos asociados (usamos LEFT JOIN + condición NULL)
SELECT f.codigo AS id_fabricante, f.nombre AS nombre_fabricante
FROM fabricantes f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.codigo IS NULL;

-- 1. Número total de productos
SELECT COUNT(*) AS total_productos FROM producto;

-- 2. Número total de fabricantes
SELECT COUNT(*) AS total_fabricantes FROM fabricantes;

-- 3. Número de valores distintos de código de fabricante en productos
SELECT COUNT(DISTINCT codigo_fabricante) AS fabricantes_diferentes FROM producto;

-- 4. Media del precio de todos los productos
SELECT AVG(precio) AS precio_medio FROM producto;

-- 5. Precio más barato
SELECT MIN(precio) AS precio_minimo FROM producto;

-- 6. Precio más caro
SELECT MAX(precio) AS precio_maximo FROM producto;

-- 7. Nombre y precio del producto más barato
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 8. Nombre y precio del producto más caro
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 9. Suma de los precios de todos los productos
SELECT SUM(precio) AS suma_precios FROM producto;

-- 10. Número de productos de Asus
SELECT COUNT(*) AS productos_asus
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 11. Media de precio de productos de Asus
SELECT AVG(p.precio) AS media_asus
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 12. Precio más barato de Asus
SELECT MIN(p.precio) AS minimo_asus
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 13. Precio más caro de Asus
SELECT MAX(p.precio) AS maximo_asus
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 14. Suma de precios de Asus
SELECT SUM(p.precio) AS suma_asus
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 15. Estadísticas de Crucial
SELECT 
    MAX(p.precio) AS maximo,
    MIN(p.precio) AS minimo,
    AVG(p.precio) AS media,
    COUNT(*) AS total
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial';

-- 16. Número total de productos por fabricante (incluye los que no tienen productos)
SELECT f.nombre, COUNT(p.codigo) AS total_productos
FROM fabricantes f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
ORDER BY total_productos DESC;

-- 17. Estadísticas por fabricante
SELECT f.nombre,
       MAX(p.precio) AS maximo,
       MIN(p.precio) AS minimo,
       AVG(p.precio) AS media
FROM fabricantes f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

-- 18. Estadísticas de fabricantes con precio medio > 200 (mostrar ID)
SELECT p.codigo_fabricante,
       MAX(p.precio) AS maximo,
       MIN(p.precio) AS minimo,
       AVG(p.precio) AS media,
       COUNT(*) AS total
FROM producto p
GROUP BY p.codigo_fabricante
HAVING AVG(p.precio) > 200;

-- 19. Igual que anterior, pero con nombre del fabricante
SELECT f.nombre,
       MAX(p.precio) AS maximo,
       MIN(p.precio) AS minimo,
       AVG(p.precio) AS media,
       COUNT(*) AS total
FROM fabricantes f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio) > 200;

-- 20. Número de productos con precio ≥ 180€
SELECT COUNT(*) AS total_mayor_180 FROM producto WHERE precio >= 180;

-- 21. Número de productos por fabricante con precio ≥ 180€
SELECT f.nombre, COUNT(*) AS total
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180
GROUP BY f.nombre;

-- 22. Precio medio por fabricante (mostrar ID)
SELECT codigo_fabricante, AVG(precio) AS precio_medio
FROM producto
GROUP BY codigo_fabricante;

-- 23. Precio medio por fabricante (mostrar nombre)
SELECT f.nombre, AVG(p.precio) AS precio_medio
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre;

-- 24. Nombres de fabricantes con precio medio ≥ 150€
SELECT f.nombre
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
HAVING AVG(p.precio) >= 150;

-- 25. Fabricantes que tienen 2 o más productos
SELECT f.nombre
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
HAVING COUNT(*) >= 2;

-- 26. Fabricantes y cantidad de productos con precio ≥ 220€
SELECT f.nombre, COUNT(*) AS total
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 220
GROUP BY f.nombre;

-- 26. Listado de fabricantes con productos ≥ 220€, solo los que sí tienen
SELECT f.nombre, COUNT(*) AS total
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 220
GROUP BY f.nombre;

-- 27. Listado de todos los fabricantes, incluyendo los que tienen 0 productos ≥ 220€
SELECT f.nombre, COUNT(p.codigo) AS total
FROM fabricantes f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante AND p.precio >= 220
GROUP BY f.nombre;

-- 28. Fabricantes donde la suma de precios de sus productos > 1000€
SELECT f.nombre, SUM(p.precio) AS suma_total
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
GROUP BY f.nombre
HAVING SUM(p.precio) > 1000;

-- 29. Producto más caro de cada fabricante (nombre producto, precio, nombre fabricante)
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM producto p
JOIN fabricantes f ON p.codigo_fabricante = f.codigo
WHERE (p.codigo, p.precio) IN (
    SELECT p2.codigo, MAX(p2.precio)
    FROM producto p2
    GROUP BY p2.codigo_fabricante
);

-- 1. Devuelve todos los productos del fabricante Lenovo (sin utilizar INNER JOIN)
SELECT *
FROM producto
WHERE codigo_fabricante IN (
    SELECT codigo
    FROM fabricantes
    WHERE nombre = 'Lenovo'
);

-- 2. Devuelve todos los datos de los productos que tienen el mismo precio 
-- que el producto más caro del fabricante Lenovo (sin utilizar INNER JOIN)
SELECT *
FROM producto
WHERE precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante IN (
        SELECT codigo
        FROM fabricantes
        WHERE nombre = 'Lenovo'
    )
);

-- 3. Lista el nombre del producto más caro del fabricante Lenovo
SELECT nombre
FROM producto
WHERE precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante IN (
        SELECT codigo
        FROM fabricantes
        WHERE nombre = 'Lenovo'
    )
)
AND codigo_fabricante IN (
    SELECT codigo
    FROM fabricantes
    WHERE nombre = 'Lenovo'
);

-- 4. Lista el nombre del producto más barato del fabricante Hewlett-Packard
SELECT nombre
FROM producto
WHERE precio = (
    SELECT MIN(precio)
    FROM producto
    WHERE codigo_fabricante IN (
        SELECT codigo
        FROM fabricantes
        WHERE nombre = 'Hewlett-Packard'
    )
)
AND codigo_fabricante IN (
    SELECT codigo
    FROM fabricantes
    WHERE nombre = 'Hewlett-Packard'
);

-- 5. Devuelve todos los productos que tienen un precio mayor o igual 
-- al producto más caro del fabricante Lenovo
SELECT *
FROM producto
WHERE precio >= (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante IN (
        SELECT codigo
        FROM fabricantes
        WHERE nombre = 'Lenovo'
    )
);

-- 6. Lista todos los productos del fabricante Asus que tienen un precio superior 
-- al precio medio de todos sus productos
SELECT *
FROM producto
WHERE codigo_fabricante IN (
    SELECT codigo
    FROM fabricantes
    WHERE nombre = 'Asus'
)
AND precio > (
    SELECT AVG(precio)
    FROM producto
    WHERE codigo_fabricante IN (
        SELECT codigo
        FROM fabricantes
        WHERE nombre = 'Asus'
    )
);

-- 7. Producto más caro sin MAX, ORDER BY ni LIMIT
SELECT *
FROM producto
WHERE precio >= ALL (
    SELECT precio FROM producto
);

-- 8. Producto más barato sin MIN, ORDER BY ni LIMIT
SELECT *
FROM producto
WHERE precio <= ALL (
    SELECT precio FROM producto
);

-- 9. Nombres de los fabricantes que tienen productos asociados (con ANY)
SELECT nombre
FROM fabricantes
WHERE codigo = ANY (
    SELECT codigo_fabricante FROM producto
);

-- 10. Nombres de los fabricantes que NO tienen productos asociados (con ALL)
SELECT nombre
FROM fabricantes
WHERE codigo <> ALL (
    SELECT codigo_fabricante FROM producto
);