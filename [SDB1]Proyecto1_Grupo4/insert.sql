-- Insertar datos en la tabla aerolinea
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('AAL', 'Estados Unidos', 'Dallas');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('BAW', 'Reino Unido', 'Londres');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('DLH', 'Alemania', 'Frankfurt');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('AFR', 'Francia', 'Paris');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('AIC', 'India', 'Nueva Delhi');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('JAL', 'Japon', 'Tokio');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('QFA', 'Australia', 'Sidney');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('SAS', 'Suecia', 'Estocolmo');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('KLM', 'Paises Bajos', 'Amsterdam');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('LAT', 'Chile', 'Santiago');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('LAN', 'Peru', 'Lima');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('BRU', 'Belgica', 'Bruselas');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('CAY', 'Colombia', 'Bogota');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('ACD', 'Argentina', 'Buenos Aires');
INSERT INTO aerolinea (oaci, pais, ciudad) VALUES ('CX', 'Hong Kong', 'Hong Kong');

-- Insertar datos en la tabla aerolinea
INSERT INTO aeropuerto  (codigo_iata, pais, ciudad) VALUES ('AAL', 'Estados Unidos', 'Dallas');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('BAW', 'Reino Unido', 'Londres');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('DLH', 'Alemania', 'Frankfurt');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('AFR', 'Francia', 'Paris');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('AIC', 'India', 'Nueva Delhi');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('JAL', 'Japon', 'Tokio');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('QFA', 'Australia', 'Sidney');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('SAS', 'Suecia', 'Estocolmo');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('KLM', 'Paises Bajos', 'Amsterdam');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('LAT', 'Chile', 'Santiago');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('LAN', 'Peru', 'Lima');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('BRU', 'Belgica', 'Bruselas');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('CAY', 'Colombia', 'Bogota');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('ACD', 'Argentina', 'Buenos Aires');
INSERT INTO aeropuerto (codigo_iata, pais, ciudad) VALUES ('CX', 'Hong Kong', 'Hong Kong');

-- Reserva
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (1, 'B', 'A', TO_DATE('2024-09-11', 'YYYY-MM-DD'), NULL);
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (2, 'B', 'A', TO_DATE('2024-10-09', 'YYYY-MM-DD'), NULL);
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (3, 'B', 'C', TO_DATE('2024-06-01', 'YYYY-MM-DD'), TO_DATE('2024-07-11', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (4, 'B', 'C', TO_DATE('2023-08-14', 'YYYY-MM-DD'), NULL);
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (5, 'B', 'C', TO_DATE('2024-01-20', 'YYYY-MM-DD'), NULL);
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (6, 'B', 'C', TO_DATE('2024-02-29', 'YYYY-MM-DD'), TO_DATE('2024-05-18', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (7, 'B', 'C', TO_DATE('2024-01-05', 'YYYY-MM-DD'), TO_DATE('2024-01-19', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (8, 'B', 'C', TO_DATE('2024-02-14', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (9, 'B', 'C', TO_DATE('2022-04-25', 'YYYY-MM-DD'), NULL);
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (10, 'B', 'C', TO_DATE('2024-05-15', 'YYYY-MM-DD'), TO_DATE('2024-12-12', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (11, 'B', 'C', TO_DATE('2024-08-20', 'YYYY-MM-DD'), TO_DATE('2024-09-20', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (12, 'B', 'C', TO_DATE('2024-03-30', 'YYYY-MM-DD'), TO_DATE('2024-05-19', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (13, 'B', 'C', TO_DATE('2024-01-04', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'));
INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (14, 'B', 'C', TO_DATE('2024-07-07', 'YYYY-MM-DD'), TO_DATE('2024-08-29', 'YYYY-MM-DD'));
 INSERT INTO reserva (id_reserva, tipo_reserva, estado_reserva, fecha_de_reserva, fecha_cancelada_reserva)
    VALUES (15, 'B', 'A', TO_DATE('2024-03-27', 'YYYY-MM-DD'), TO_DATE('2024-08-29', 'YYYY-MM-DD'));   

-- Insertar datos en la tabla pasajeros
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (1, 'Juan', 'Pérez', 1234567890, 'juan.perez@email.com', 'X1234567', 1);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (2, 'Ana', 'García', 2345678901, 'ana.garcia@email.com', 'X7654321', 2);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (3, 'Pedro', 'Castillo', 5728391047, 'pedrocas@email.com', 'X7654321', 3);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (4, 'Wendy', 'Martinez', 6492837501, 'W0101Mar@email.com', 'X7654321', 4);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (5, 'Jorge', 'Orlando', 9183746205, 'JorOrl90@email.com', 'X7654321', 5);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (6, 'Diego', 'Aguilar', 2047593816, 'Daguilar999@email.com', 'X7654321', 6);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (7, 'Jenny', 'Pineda', 3764918520, 'JennyPineda00@email.com', 'X7654321', 7);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (8, 'Lucia', 'Paredes', 4912837650, 'LuciaP922@email.com', 'X7654321', 8);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (9, 'Diego', 'Osvaldo', 8523071694, 'Osvaldo9913@email.com', 'X7654321', 9);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (10, 'Jessica', 'Rodas', 7392048165, 'JessRo9122@email.com', 'X7654321', 10);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (11, 'Mario', 'Acevedo', 4862751930, 'MAvecedo11@email.com', 'X7654321', 11);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (12, 'Julio', 'Castalleda', 1029384756, 'J.Castillo@email.com', 'X7654321', 12);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (13, 'Sandra', 'Montenegro', 5678294130, 'MontenegroSan004@email.com', 'X7654321', 13);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (14, 'Judit', 'Chan', 2847563901, 'JudChan922@email.com', 'X7654321', 14);
INSERT INTO pasajeros (id_pasajero, nombre, apellido, telefono, email, pasaporte_y_o_visa, reserva_id_reserva) 
VALUES (15, 'Kevin', 'Toledo', 9736248105, 'TolKev444@email.com', 'X7654321', 15);


-- Aviones
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XA-ABC', 'Boeing 737', 5, 5000);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XB-123', 'Airbus A320', 6, 6100);

INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XC-456', 'Embraer E190', 110, 4500);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XD-789', 'Boeing 787', 250, 10000);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XI-555', 'Fokker 100', 100, 2500);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XJ-666', 'Airbus A321', 220, 6000);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XK-777', 'Boeing 767', 220, 7500);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XL-888', 'Embraer E175', 88, 3300);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XM-999', 'Bombardier Q400', 78, 2600);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XN-139', 'Airbus A330', 250, 10000);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XO-111', 'Boeing 737 MAX 8', 210, 6500);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XP-222', 'McDonnell Douglas DC-9', 100, 3000);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XQ-333', 'Airbus A340', 300, 9000);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XR-444', 'Boeing 757', 200, 7000);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XS-555', 'Embraer E195', 120, 3700);

INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XT-666', 'Airbus A380', 555, 15000);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XU-777', 'Boeing 737-800', 189, 5000);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XV-888', 'Fokker 50', 50, 1500);
INSERT INTO avion (matricula, modelo, capacidad, alcance)
VALUES ('XW-999', 'Bombardier Challenger 600', 12, 4000);

-- Insertar datos en la tabla vuelo
--INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci) 
    --VALUES (1, TO_DATE('2024-09-10 14:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-10 18:30', 'YYYY-MM-DD HH24:MI'), 4, 'AAL');
--INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci) 
        --VALUES (2, TO_DATE('2024-09-11 09:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-11 17:00', 'YYYY-MM-DD HH24:MI'), 8, 'BAW');

-- Insertar el vuelo 1 con la matrícula del avión 'XA-ABC'
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (1, TO_DATE('2024-09-10 14:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-10 18:30', 'YYYY-MM-DD HH24:MI'), 4, 'AAL', 'XA-ABC');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (2, TO_DATE('2024-09-11 09:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-11 17:00', 'YYYY-MM-DD HH24:MI'), 8, 'BAW', 'XB-123');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (3, TO_DATE('2024-09-10 14:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-10 22:30', 'YYYY-MM-DD HH24:MI'), 8, 'DLH', 'XC-456');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (4, TO_DATE('2024-09-11 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-11 14:00', 'YYYY-MM-DD HH24:MI'), 4, 'AFR', 'XD-789');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (5, TO_DATE('2024-09-12 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-12 17:00', 'YYYY-MM-DD HH24:MI'), 9, 'AIC', 'XI-555');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (6, TO_DATE('2024-09-13 15:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-13 21:00', 'YYYY-MM-DD HH24:MI'), 5.5, 'JAL', 'XJ-666');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (7, TO_DATE('2024-09-14 13:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-14 23:00', 'YYYY-MM-DD HH24:MI'), 10, 'QFA', 'XK-777');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (8, TO_DATE('2024-09-15 11:45', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-15 19:30', 'YYYY-MM-DD HH24:MI'), 7.75, 'SAS', 'XL-888');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (9, TO_DATE('2024-09-16 16:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-16 20:00', 'YYYY-MM-DD HH24:MI'), 4, 'KLM', 'XM-999');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (10, TO_DATE('2024-09-17 18:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-17 23:00', 'YYYY-MM-DD HH24:MI'), 4.5, 'LAT', 'XN-139');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (11, TO_DATE('2024-09-18 14:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-18 19:30', 'YYYY-MM-DD HH24:MI'), 5.5, 'LAN', 'XO-111');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (12, TO_DATE('2024-09-19 12:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-19 20:00', 'YYYY-MM-DD HH24:MI'), 8, 'BRU', 'XP-222');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (13, TO_DATE('2024-09-20 07:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-20 13:30', 'YYYY-MM-DD HH24:MI'), 6.5, 'CAY', 'XQ-333');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (14, TO_DATE('2024-09-21 09:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-21 15:00', 'YYYY-MM-DD HH24:MI'), 6, 'ACD', 'XV-888');
INSERT INTO vuelo (id_vuelo, fecha_salida, fecha_llegada, duracion_aproximada_hrs, aerolinea_oaci, avion_matricula) 
    VALUES (15, TO_DATE('2024-09-22 20:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-09-23 04:00', 'YYYY-MM-DD HH24:MI'), 8, 'CX', 'XW-999');


-- Insertar datos en la tabla ruta
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo)
    VALUES (1, 1500, 'AAL', 'BAW',1);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (2, 1000, 'BAW', 'DLH',2);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (3, 5000, 'AIC', 'JAL',3);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (4, 3000, 'JAL', 'QFA',4);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (5, 2500, 'QFA', 'SAS',5);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (6, 3500, 'SAS', 'KLM',6);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (7, 4000, 'KLM', 'LAT',7);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (8, 1500, 'LAT', 'LAN',8);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (9, 2000, 'LAN', 'BRU',9);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (10, 3000, 'BRU', 'CAY',10);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (11, 5000, 'CAY', 'ACD',11);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (12, 3500, 'ACD', 'CX',12);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (13, 4500, 'CX', 'DLH',13);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (14, 5500, 'DLH', 'AFR',14);
INSERT INTO ruta (id_ruta, distancia, origen, destino, vuelo_id_vuelo) 
    VALUES (15, 2500, 'AFR', 'AIC',15);

-- Insertar datos en la tabla vuelo_y_pasajeros
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (1, 1, 1);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (2, 2, 1);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (3, 3, 1);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (4, 4, 2);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (5, 5, 1);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (6, 6, 2);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (7, 7, 2);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (8, 8, 1);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (9, 9, 1);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (10, 10, 2);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (11, 11, 2);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (12, 12, 1);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (13, 13, 2);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (14, 14, 1);
INSERT INTO vuelo_y_pasajeros (id_vue_y_pas, pasajeros_id_pasajero, vuelo_id_vuelo) VALUES (15, 15, 1);

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
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (5, 'Ana', 'Pérez', 'ana@perez.com', 5487321, 1);
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (6, 'Luis', 'Martínez', 'luis@martinez.com', 5678923, 2);
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (7, 'Elena', 'García', 'elena@garcia.com', 6789345, 1);
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (8, 'Javier', 'Hernández', 'javier@hernandez.com', 7894561, 3);
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (9, 'Patricia', 'López', 'patricia@lopez.com', 8912345, 2);
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (10, 'Ricardo', 'Mendoza', 'ricardo@mendoza.com', 9012345, 3);
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (11, 'Gabriela', 'Ríos', 'gabriela@rios.com', 1234567, 1);
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (12, 'Pedro', 'Morales', 'pedro@morales.com', 2345678, 1);
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (13, 'Marta', 'Jiménez', 'marta@jimenez.com', 3456789, 2);
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (14, 'Andrés', 'Vásquez', 'andres@vasquez.com', 4567890, 2);
INSERT INTO empleados (id_empleado, nombres, apellidos, email, telefono, puesto_id_puesto)
    VALUES (15, 'Laura', 'Salazar', 'laura@salazar.com', 5678901, 3);


-- Historia Vuelo
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (1, 1, 2);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (2, 2, 2);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (3, 3, 2);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (4, 4, 1);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (5, 5, 1);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (6, 6, 1);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (7, 7, 1);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (8, 8, 1);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (9, 9, 1);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (10, 10, 1);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (11, 11, 1);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (12, 12, 1);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (13, 13, 1);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (14, 14, 1);
INSERT INTO historial_vuelo (id_historial_vuelo, empleados_id_empleado, vuelo_id_vuelo)
    VALUES (15, 15, 1);



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
INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (9, 902.60, TO_DATE('2024-01-12', 'YYYY-MM-DD'), 25, 'Tarjeta de crédito', 9, 9, 1);
INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (10, 902.60, TO_DATE('2024-09-26', 'YYYY-MM-DD'), 25, 'Tarjeta de crédito', 10, 10, 2);
INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (11, 902.60, TO_DATE('2024-07-14', 'YYYY-MM-DD'), 25, 'Tarjeta de crédito', 11, 11, 2);
INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (12, 902.60, TO_DATE('2024-10-31', 'YYYY-MM-DD'), 25, 'Tarjeta de crédito', 12, 12, 1);
INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (13, 902.60, TO_DATE('2024-07-04', 'YYYY-MM-DD'), 25, 'Tarjeta de crédito', 13, 13, 2);
INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (14, 902.60, TO_DATE('2024-11-20', 'YYYY-MM-DD'), 25, 'Tarjeta de crédito', 14, 14, 1);
INSERT INTO boleto (id_boleto, precio_boleto, fecha_vuelo, no_asiento_vuelo, metodo_pago_boleto, reserva_id_reserva, pasajeros_id_pasajero, vuelo_id_vuelo)
    VALUES (15, 902.60, TO_DATE('2024-05-06', 'YYYY-MM-DD'), 25, 'Tarjeta de crédito', 15, 15, 1);

