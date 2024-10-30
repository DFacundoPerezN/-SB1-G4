-- 1. Consulta de vuelos

SELECT
    v.no_vuelo AS codigo_vuelo,
    a.modelo AS modelo_avion,
    e.nombre || ' ' || e.apellido AS piloto,
    SUM(t.precio) AS monto_ganado,
    COUNT(CASE WHEN b.id_boleto IS NOT NULL THEN 1 END) AS asientos_ocupados,
    s.no_asientos - COUNT(CASE WHEN b.id_boleto IS NOT NULL THEN 1 END) AS asientos_disponibles,
    s.clase AS clase_asiento
FROM
    vuelo v
JOIN avion a ON v.no_vuelo = a.id_avion
JOIN asientos s ON a.id_avion = s.avion_id_avion
JOIN tripulacion tr ON v.no_vuelo = tr.vuelo_no_vuelo
JOIN empleado e ON tr.empleado_id_empleado = e.id_empleado
JOIN cargo c ON e.cargo_id_cargo = c.id_cargo AND c.cargo = 'Piloto'
JOIN boleto b ON v.no_vuelo = b.vuelo_no_vuelo
JOIN tarifa t ON v.no_vuelo = t.vuelo_no_vuelo AND t.clase = s.clase
WHERE
    v.no_vuelo = 1 -- Reemplazar :codigo_vuelo con el código del vuelo que deseas consultar
GROUP BY
    v.no_vuelo, a.modelo, e.nombre, e.apellido, s.no_asientos, s.clase
ORDER BY
    s.clase;



-- 2. Consulta de aviones
SELECT 
    av.modelo AS modelo_avion,
    av.matricula AS matricula_avion,
    a.nombre AS aerolinea,
    CASE 
        WHEN av.estado = 1 THEN 'No Disponible'
        WHEN av.estado = 0 THEN 'Disponible'
        ELSE 'Estado Desconocido'
    END AS estado_avion
FROM 
    avion av
JOIN 
    aerolinea a ON av.aerolinea_id_aerolinea = a.id_aerolinea;


-- 3. Consulta de los empleados
DECLARE 
    v_codigo_aerolinea INTEGER := 3;
    v_count INTEGER;

BEGIN
    SELECT COUNT(*) INTO v_count 
    FROM aerolinea 
    WHERE id_aerolinea = v_codigo_aerolinea;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: La aerolínea con el código ' || v_codigo_aerolinea || ' no existe.');
    ELSE
        FOR emp_record IN (
            SELECT 
                e.id_empleado AS codigo,
                e.nombre || ' ' || e.apellido AS nombre_completo,
                e.fecha_nacimiento,
                e.correo,
                e.telefono,
                e.direccion,
                CASE 
                    WHEN e.salario > 0 THEN 'Activo'
                    ELSE 'Inactivo'
                END AS estado
            FROM 
                empleado e
            WHERE 
                e.aerolinea_id_aerolinea = v_codigo_aerolinea
        ) LOOP
            DBMS_OUTPUT.PUT_LINE('Código: ' || emp_record.codigo);
            DBMS_OUTPUT.PUT_LINE('Nombre Completo: ' || emp_record.nombre_completo);
            DBMS_OUTPUT.PUT_LINE('Fecha de Nacimiento: ' || TO_CHAR(emp_record.fecha_nacimiento, 'YYYY-MM-DD'));
            DBMS_OUTPUT.PUT_LINE('Correo: ' || emp_record.correo);
            DBMS_OUTPUT.PUT_LINE('Teléfono: ' || emp_record.telefono);
            DBMS_OUTPUT.PUT_LINE('Dirección: ' || emp_record.direccion);
            DBMS_OUTPUT.PUT_LINE('Estado: ' || emp_record.estado);
            DBMS_OUTPUT.PUT_LINE('----------------------------------');
        END LOOP;
    END IF;
END;
/

-- OPCION 2
SELECT 
    e.id_empleado AS codigo,
    e.nombre || ' ' || e.apellido AS nombre_completo,
    e.fecha_nacimiento,
    e.correo,
    e.telefono,
    e.direccion,
    CASE 
        WHEN e.salario > 0 THEN 'Activo'
        ELSE 'Inactivo'
    END AS estado
FROM 
    empleado e
JOIN 
    aerolinea a ON e.aerolinea_id_aerolinea = a.id_aerolinea
WHERE 
    a.id_aerolinea = 3;


-- 4. Consulta de las rutas
SELECT 
    r.id_ruta AS id_ruta,
    a1.nombre AS origen,
    a2.nombre AS destino,
    COUNT(v.no_vuelo) AS total_vuelos
FROM 
    ruta r
JOIN 
    aeropuerto a1 ON r.aeropuerto_id_aeropuerto = a1.id_aeropuerto
JOIN 
    aeropuerto a2 ON r.aeropuerto_id_aeropuerto2 = a2.id_aeropuerto
JOIN 
    vuelo v ON v.ruta_id_ruta = r.id_ruta
GROUP BY 
    r.id_ruta, a1.nombre, a2.nombre
ORDER BY 
    total_vuelos DESC
FETCH FIRST 5 ROWS ONLY;


-- 5. Consulta de las cancelaciones de reservas
SELECT 
    b.id_boleto AS "Id Boleto",
    v.no_vuelo AS "Vuelo",
    a.id_asientos AS "Asiento",
    p.nombre || ' ' || p.apellido AS "Pasajero"
FROM 
    boleto b
JOIN 
    vuelo v ON b.vuelo_no_vuelo = v.no_vuelo
JOIN 
    asientos a ON b.asientos_id_asientos = a.id_asientos
JOIN 
    pasajero p ON b.pasajero_codigo_pasaporte = p.codigo_pasaporte
WHERE 
    b.estado = 'no disponible';