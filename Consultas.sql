--1
SELECT c.id_cliente,
       c.nombre || ' ' || c.apellido AS nombre_completo,
       c.pais,
       c.edad,
       c.genero,
       c.telefono
FROM clientes c
WHERE c.id_cliente NOT IN (
    SELECT lo.id_cliente
    FROM linea_orden lo
    WHERE lo.fecha_orden >= ADD_MONTHS(SYSDATE, -12)
);


--2
SELECT p.id_producto,
       p.nombre AS nombre_producto,
       c.categoria,
       SUM(lo.cantidad) AS total_unidades_vendidas,
       SUM(lo.cantidad * p.precio) AS monto_vendido
FROM linea_orden lo
JOIN productos p ON lo.id_producto = p.id_producto
JOIN categoria c ON p.id_categoria = c.id_categoria
GROUP BY p.id_producto, p.nombre, c.categoria
ORDER BY total_unidades_vendidas DESC
FETCH FIRST 10 ROWS ONLY;


--3
-- Creación de la Vista
CREATE OR REPLACE VIEW ventas_por_vendedor AS
SELECT 
    v.id_vendedor,
    v.nombre_vendedor,
    v.pais_vendedor,
    SUM(lo.cantidad * p.precio) AS monto_vendido
FROM 
    vendedor v
JOIN 
    linea_orden lo ON v.id_vendedor = lo.id_vendedor
JOIN 
    productos p ON lo.id_producto = p.id_producto
GROUP BY 
    v.id_vendedor, 
    v.nombre_vendedor, 
    v.pais_vendedor;


-- Cosulta
(
    SELECT 
        id_vendedor, 
        nombre_vendedor, 
        monto_vendido,
        'Mayor vendedor' AS tipo
    FROM 
        ventas_por_vendedor
    ORDER BY 
        monto_vendido DESC
    FETCH FIRST 1 ROWS ONLY
)
UNION ALL
(
    SELECT 
        id_vendedor, 
        nombre_vendedor, 
        monto_vendido,
        'Menor vendedor' AS tipo
    FROM 
        ventas_por_vendedor
    ORDER BY 
        monto_vendido ASC
    FETCH FIRST 1 ROWS ONLY
);



--4
SELECT c.id_cliente,
       c.nombre || ' ' || c.apellido AS nombre_completo,
       c.edad,
       c.pais,
       SUM(lo.cantidad * p.precio) AS monto_total_gastado
FROM linea_orden lo
JOIN clientes c ON lo.id_cliente = c.id_cliente
JOIN productos p ON lo.id_producto = p.id_producto
GROUP BY c.id_cliente, c.nombre, c.apellido, c.edad, c.pais
ORDER BY monto_total_gastado DESC
FETCH FIRST 1 ROWS ONLY;

--5
-- Vista
CREATE OR REPLACE VIEW compras_por_pais_cliente AS
SELECT 
    c.pais AS nombre_pais,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    SUM(lo.cantidad * p.precio) AS monto_compras
FROM 
    clientes c
JOIN 
    linea_orden lo ON c.id_cliente = lo.id_cliente
JOIN 
    productos p ON lo.id_producto = p.id_producto
GROUP BY 
    c.pais, c.id_cliente, c.nombre;


-- Consulta
SELECT 
    nombre_pais AS pais,
    SUM(monto_compras) AS monto_total
FROM 
    compras_por_pais_cliente
GROUP BY 
    nombre_pais
ORDER BY 
    monto_total DESC
FETCH FIRST 5 ROWS ONLY;



--6
WITH CategoriasCompradas AS (
    SELECT p.id_categoria,
           c.categoria,
           SUM(lo.cantidad) AS total_unidades
    FROM linea_orden lo
    JOIN productos p ON lo.id_producto = p.id_producto
    JOIN categoria c ON p.id_categoria = c.id_categoria
    GROUP BY p.id_categoria, c.categoria
),
MasCompradas AS (
    SELECT id_categoria, categoria, total_unidades
    FROM CategoriasCompradas
    ORDER BY total_unidades DESC
    FETCH FIRST 3 ROWS ONLY
),
MenosCompradas AS (
    SELECT id_categoria, categoria, total_unidades
    FROM CategoriasCompradas
    ORDER BY total_unidades ASC
    FETCH FIRST 3 ROWS ONLY
)

SELECT * FROM MasCompradas
UNION ALL
SELECT * FROM MenosCompradas;

--7
 SELECT
    TO_CHAR(lo.fecha_orden, 'YYYY-MM') AS mes,
    SUM(CAST(p.precio AS DECIMAL(10, 2)) * lo.cantidad) AS monto_vendido
FROM
    linea_orden lo
JOIN
    orden o ON lo.id_orden = o.id_orden
JOIN
    productos p ON lo.id_producto = p.id_producto
JOIN
    vendedor v ON lo.id_vendedor = v.id_vendedor
WHERE
    v.pais_vendedor = 'Inglaterra'
GROUP BY
    TO_CHAR(lo.fecha_orden, 'YYYY-MM')
ORDER BY
    mes;

--8
--Vista
CREATE OR REPLACE VIEW ventas_por_producto_pais AS
SELECT 
    c.pais AS nombre_pais,
    p.id_producto,
    p.nombre AS nombre_producto,
    p.id_categoria,
    cat.categoria AS nombre_categoria,
    SUM(lo.cantidad) AS cantidad_vendida
FROM 
    clientes c
JOIN 
    linea_orden lo ON c.id_cliente = lo.id_cliente
JOIN 
    productos p ON lo.id_producto = p.id_producto
JOIN 
    categoria cat ON p.id_categoria = cat.id_categoria
GROUP BY 
    c.pais, p.id_producto, p.nombre, p.id_categoria, cat.categoria;



-- Consulta
WITH ventas_agrupadas AS (
    SELECT 
        nombre_pais,
        nombre_categoria,
        SUM(cantidad_vendida) AS cantidad_total,
        ROW_NUMBER() OVER (PARTITION BY nombre_pais ORDER BY SUM(cantidad_vendida) DESC) AS rank_categoria
    FROM 
        ventas_por_producto_pais
    GROUP BY 
        nombre_pais, nombre_categoria
)
SELECT 
    nombre_pais,
    nombre_categoria,
    cantidad_total AS cantidad_unidades
FROM 
    ventas_agrupadas
WHERE 
    rank_categoria = 1;



--9
SELECT p.id_producto,
       p.nombre,
       SUM(lo.cantidad) AS cantidad_vendida,
       SUM(lo.cantidad * p.precio) AS monto_vendido
FROM productos p
JOIN categoria c ON p.id_categoria = c.id_categoria
JOIN linea_orden lo ON lo.id_producto = p.id_producto
WHERE c.categoria = 'Familiar'
GROUP BY p.id_producto, p.nombre
ORDER BY p.id_producto;

--10
SELECT TO_CHAR(lo.fecha_orden, 'YYYY-MM') AS mes,
       SUM(lo.cantidad * p.precio) AS monto_vendido
FROM linea_orden lo
JOIN productos p ON lo.id_producto = p.id_producto
GROUP BY TO_CHAR(lo.fecha_orden, 'YYYY-MM')
ORDER BY monto_vendido DESC
FETCH FIRST 3 ROWS ONLY;
