SELECT
    v.id_vuelo AS "Número de Vuelo",
    TO_CHAR(v.fecha_salida, 'HH24:MI') AS "Hora de Salida",
    a1.ciudad AS "Ciudad de Origen",
    a2.ciudad AS "Ciudad de Destino",
    v.aerolinea_oaci AS "Aerolínea"
FROM
    vuelo v
JOIN
    ruta r ON v.id_vuelo = r.vuelo_id_vuelo
JOIN
    aeropuerto a1 ON r.origen = a1.codigo_iata
JOIN
    aeropuerto a2 ON r.destino = a2.codigo_iata
JOIN
    aerolinea al ON v.aerolinea_oaci = al.oaci
WHERE
    TRUNC(v.fecha_salida) = TO_DATE('2024-09-11', 'YYYY-MM-DD') -- Ahora solo compara la fecha, sin la hora
ORDER BY
    v.fecha_salida, v.id_vuelo;


-- 2
SELECT
    p.nombre || ' ' || p.apellido AS "Nombre del Pasajero",
    v.id_vuelo AS "Número de Vuelo",
    v.fecha_salida AS "Fecha de Salida",
    a1.ciudad AS "Ciudad de Origen",
    a2.ciudad AS "Ciudad de Destino",
    v.aerolinea_oaci AS "Aerolínea"
FROM
    pasajeros p
JOIN
    vuelo_y_pasajeros vp ON p.id_pasajero = vp.pasajeros_id_pasajero
JOIN
    vuelo v ON vp.vuelo_id_vuelo = v.id_vuelo
JOIN
    ruta r ON v.id_vuelo = r.vuelo_id_vuelo
JOIN
    aeropuerto a1 ON r.origen = a1.codigo_iata
JOIN
    aeropuerto a2 ON r.destino = a2.codigo_iata
JOIN
    aerolinea al ON v.aerolinea_oaci = al.oaci
WHERE
    -- p.id_pasajero = 1 -- Reemplazar con el ID del pasajero que buscas
    p.nombre = 'Ana'
    AND EXTRACT(YEAR FROM v.fecha_salida) = '2024' -- Reemplazar con el año deseado
ORDER BY
    v.fecha_salida;



-- 3
SELECT  hv.vuelo_id_vuelo AS vuelo, e.nombres, e.apellidos, p.nombre AS cargo
FROM empleados e
JOIN puesto p ON e.puesto_id_puesto = p.id_puesto
JOIN historial_vuelo hv ON e.id_empleado = hv.empleados_id_empleado
WHERE hv.vuelo_id_vuelo = 2;


-- 4
SELECT id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva
FROM reserva
WHERE fecha_cancelada_reserva IS NOT NULL
AND fecha_cancelada_reserva >= ADD_MONTHS(SYSDATE, -3);


-- 5
SELECT v.id_vuelo, v.fecha_salida, v.fecha_llegada, v.duracion_aproximada_hrs, 
       a_origen.ciudad AS origen, a_destino.ciudad AS destino
FROM historial_vuelo hv
JOIN vuelo v ON hv.vuelo_id_vuelo = v.id_vuelo
JOIN ruta r ON r.vuelo_id_vuelo = v.id_vuelo
JOIN aeropuerto a_origen ON a_origen.codigo_iata = r.origen
JOIN aeropuerto a_destino ON a_destino.codigo_iata = r.destino
JOIN empleados e ON hv.empleados_id_empleado = e.id_empleado
WHERE e.nombres = 'Sofia' AND e.apellidos = 'Castillo';

-- 6
SELECT v.id_vuelo, a.modelo, a.capacidad, COUNT(vyp.pasajeros_id_pasajero) AS num_pasajeros,
       (COUNT(vyp.pasajeros_id_pasajero) / a.capacidad) * 100 AS porcentaje_ocupacion
FROM vuelo v
JOIN avion a ON v.avion_matricula = a.matricula
LEFT JOIN vuelo_y_pasajeros vyp ON v.id_vuelo = vyp.vuelo_id_vuelo
GROUP BY v.id_vuelo, a.modelo, a.capacidad
HAVING (COUNT(vyp.pasajeros_id_pasajero) / a.capacidad) > 0.90;

-- 7
SELECT a.matricula, a.modelo, COUNT(v.id_vuelo) AS num_vuelos
FROM vuelo v
JOIN avion a ON v.avion_matricula = a.matricula
WHERE EXTRACT(MONTH FROM v.fecha_salida) = 09
  AND EXTRACT(YEAR FROM v.fecha_salida) = 2024
GROUP BY a.matricula, a.modelo
ORDER BY num_vuelos DESC
FETCH FIRST 3 ROWS ONLY;


-- 8
SELECT v.id_vuelo, p.nombre, p.apellido, b.no_asiento_vuelo, COUNT(b.id_boleto) OVER (PARTITION BY v.id_vuelo) AS total_pasajeros
FROM vuelo v
JOIN vuelo_y_pasajeros vyp ON v.id_vuelo = vyp.vuelo_id_vuelo
JOIN pasajeros p ON vyp.pasajeros_id_pasajero = p.id_pasajero
JOIN boleto b ON p.id_pasajero = b.pasajeros_id_pasajero
WHERE v.id_vuelo = 2;


-- 9
SELECT vuelo_id_vuelo AS vuelo, SUM(precio_boleto) AS total_ingresos
FROM boleto
WHERE vuelo_id_vuelo = 1
GROUP BY vuelo_id_vuelo;

--10
SELECT a.matricula, a.modelo, a.capacidad, a.alcance
FROM avion a
WHERE a.matricula NOT IN (
    SELECT v.avion_matricula
    FROM vuelo v
);
