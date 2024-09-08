-- Insertar datos en la tabla aerolinea
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('AAL', 'Estados Unidos', 'Dallas');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('BAW', 'Reino Unido', 'Londres');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('DLH', 'Alemania', 'Frankfurt');

-- Insertar datos en la tabla aeropuerto
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('DFW', 'Estados Unidos', 'Dallas');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('LHR', 'Reino Unido', 'Londres');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('FRA', 'Alemania', 'Frankfurt');

-- Reserva
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (1, 'B', 'A', TO_DATE('2024-09-11', 'YYYY-MM-DD'), NULL);
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (2, 'B', 'A', TO_DATE('2024-09-11', 'YYYY-MM-DD'), NULL);

--Mas Reservas
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (3, 'B', 'C', TO_DATE('2024-09-11', 'YYYY-MM-DD'), TO_DATE('2024-07-11', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (4, 'B', 'C', TO_DATE('2024-09-11', 'YYYY-MM-DD'), NULL);
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (5, 'B', 'C', TO_DATE('2024-09-11', 'YYYY-MM-DD'), NULL);
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (6, 'B', 'C', TO_DATE('2024-09-11', 'YYYY-MM-DD'), TO_DATE('2024-05-18', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (7, 'B', 'C', TO_DATE('2024-09-11', 'YYYY-MM-DD'), TO_DATE('2024-01-19', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (8, 'B', 'C', TO_DATE('2024-09-11', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (9, 'B', 'C', TO_DATE('2024-09-11', 'YYYY-MM-DD'), NULL);
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (10, 'B', 'C', TO_DATE('2024-09-11', 'YYYY-MM-DD'), TO_DATE('2024-12-12', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (11, 'B', 'C', TO_DATE('2024-09-11', 'YYYY-MM-DD'), TO_DATE('2024-09-20', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (12, 'B', 'C', TO_DATE('2024-09-11', 'YYYY-MM-DD'), TO_DATE('2024-05-19', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (13, 'B', 'C', TO_DATE('2024-09-11', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (14, 'B', 'C', TO_DATE('2024-09-11', 'YYYY-MM-DD'), TO_DATE('2024-08-29', 'YYYY-MM-DD'));

-- Insertar datos en la tabla pasajeros
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (1, 'Juan', 'Pérez', 1234567890, 'juan.perez@email.com', 'X1234567', 1);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (2, 'Ana', 'García', 2345678901, 'ana.garcia@email.com', 'X7654321', 2);

--mas pasajeros
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (3, 'Pedro', 'Castillo', 2345678901, 'ana.garcia@email.com', 'X7654321', 3);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (4, 'Wendy', 'Martinez', 2345678901, 'ana.garcia@email.com', 'X7654321', 4);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (5, 'Jorge', 'Orlando', 2345678901, 'ana.garcia@email.com', 'X7654321', 5);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (6, 'Diego', 'Aguilar', 2345678901, 'ana.garcia@email.com', 'X7654321', 6);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (7, 'Jenny', 'Pineda', 2345678901, 'ana.garcia@email.com', 'X7654321', 7);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (8, 'Lucia', 'Paredes', 2345678901, 'ana.garcia@email.com', 'X7654321', 8);


-- Aviones
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XA-ABC', 'Boeing 737', 5, 5000);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XB-123', 'Airbus A320', 6, 6100);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XC-456', 'Embraer E190', 110, 4500);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XD-789', 'Boeing 787', 250, 10000);


-- Insertar datos en la tabla vuelo
--INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci) 
    --VALUES (1, TO_DATE('2024-09-10 14:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-10 18:30', 'YYYY-MM-DD HH24:MI'), 4, 'AAL');
--INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci) 
        --VALUES (2, TO_DATE('2024-09-11 09:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-11 17:00', 'YYYY-MM-DD HH24:MI'), 8, 'BAW');

-- Insertar el vuelo 1 con la matrícula del avión 'XA-ABC'
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (1, TO_DATE('2024-09-10 14:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-10 18:30', 'YYYY-MM-DD HH24:MI'), 4, 'AAL', 'XA-ABC');

-- Insertar el vuelo 2 con la matrícula del avión 'XB-123'
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (2, TO_DATE('2024-09-11 09:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-11 17:00', 'YYYY-MM-DD HH24:MI'), 8, 'BAW', 'XB-123');




-- Insertar datos en la tabla ruta
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (1, 1500, 'DFW', 'LHR', 1);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (2, 1000, 'LHR', 'FRA', 2);


-- Insertar datos en la tabla vuelo_y_pasajeros
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (1, 1, 1);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (2, 2, 1);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (3, 3, 1);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (4, 4, 2);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (5, 5, 1);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (6, 6, 2);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (7, 7, 2);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (8, 8, 1);

-- Puesto
INSERT INTO puesto (id_puesto, nombre) VALUES (1, 'Piloto');
INSERT INTO puesto (id_puesto, nombre) VALUES (2, 'Copiloto');
INSERT INTO puesto (id_puesto, nombre) VALUES (3, 'Asistente');

-- Empleados
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (1, 'Sofia', 'Castillo', 'sofia@castillo.com', 44114477, 1);
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (2, 'Karen', 'Barrios', 'karen@barrios.com', 4514487, 2);
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (3, 'Maria', 'Gonzalez', 'maria@gonzalez.com', 6678945, 3);
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (4, 'Carlos', 'Ramirez', 'carlos@ramirez.com', 7892345, 3);

-- Historia Vuelo
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (1, 1, 2);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (2, 3, 2);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (3, 4, 2);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (4, 1, 1);


-- Boleto
INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (1, 222.00, TO_DATE('2024-09-11', 'YYYY-MM-DD'), 12, 'Tarjeta de crédito', 1, 1, 1);

INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (2, 150.00, TO_DATE('2024-09-11', 'YYYY-MM-DD'), 12, 'Tarjeta de crédito', 2, 2, 1);

--Mas Boletos
INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (3, 100.00, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 30, 'Tarjeta de crédito', 3, 3, 1);

INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (4, 304.30, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 41, 'Tarjeta de crédito', 4, 4, 2);

INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (5, 391.99, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 33, 'Tarjeta de crédito', 5, 5, 1);

INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (6, 400.05, TO_DATE('2024-12-25', 'YYYY-MM-DD'), 61, 'Tarjeta de crédito', 6, 6, 2);

INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (7, 105.55, TO_DATE('2024-06-11', 'YYYY-MM-DD'), 09, 'Tarjeta de crédito', 7, 7, 2);

INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (8, 902.60, TO_DATE('2024-02-29', 'YYYY-MM-DD'), 25, 'Tarjeta de crédito', 8, 8, 1);






