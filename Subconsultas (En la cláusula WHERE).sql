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
