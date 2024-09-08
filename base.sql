-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-05 20:21:20 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE aerolinea (
    oaci   VARCHAR2(10) NOT NULL,
    pais   VARCHAR2(150) NOT NULL,
    ciudad VARCHAR2(150) NOT NULL
);

ALTER TABLE aerolinea ADD CONSTRAINT aerolinea_pk PRIMARY KEY ( oaci );

CREATE TABLE aeropuerto (
    codigo_iata VARCHAR2(3) NOT NULL,
    pais        VARCHAR2(150) NOT NULL,
    ciudad      VARCHAR2(150) NOT NULL
);

ALTER TABLE aeropuerto ADD CONSTRAINT aeropuerto_pk PRIMARY KEY ( codigo_iata );

CREATE TABLE avion (
    matricula VARCHAR2(15) NOT NULL,
    modelo    VARCHAR2(100) NOT NULL,
    capacidad INTEGER NOT NULL,
    alcance   NUMBER NOT NULL
);

ALTER TABLE avion ADD CONSTRAINT avion_pk PRIMARY KEY ( matricula );

CREATE TABLE boleto (
    id_boleto             INTEGER NOT NULL,
    precio_boleto         NUMBER NOT NULL,
    fecha_vuelo           DATE NOT NULL,
    no_asiento_vuelo      INTEGER NOT NULL,
    metodo_pago_boleto    VARCHAR2(150) NOT NULL,
    reserva_id_reserva    INTEGER NOT NULL,
    pasajeros_id_pasajero INTEGER NOT NULL,
    vuelo_id_vuelo        INTEGER NOT NULL
);

CREATE UNIQUE INDEX boleto__idx ON
    boleto (
        reserva_id_reserva
    ASC );

ALTER TABLE boleto ADD CONSTRAINT boleto_pk PRIMARY KEY ( id_boleto );

CREATE TABLE empleados (
    id_empleado      INTEGER NOT NULL,
    nombres          VARCHAR2(150) NOT NULL,
    apellidos        VARCHAR2(150) NOT NULL,
    email            VARCHAR2(150),
    telefono         INTEGER,
    puesto_id_puesto INTEGER NOT NULL
);

ALTER TABLE empleados ADD CONSTRAINT empleados_pk PRIMARY KEY ( id_empleado );

CREATE TABLE historial_vuelo (
    id_historial_vuelo    INTEGER NOT NULL,
    empleados_id_empleado INTEGER NOT NULL,
    vuelo_id_vuelo        INTEGER NOT NULL
);

ALTER TABLE historial_vuelo ADD CONSTRAINT historial_vuelo_pk PRIMARY KEY ( id_historial_vuelo );

CREATE TABLE pasajeros (
    id_pasajero        INTEGER NOT NULL,
    nombre             VARCHAR2(200) NOT NULL,
    apellido           VARCHAR2(150) NOT NULL,
    telefono           INTEGER,
    email              VARCHAR2(200),
    pasaporte_y_o_visa VARCHAR2(200),
    reserva_id_reserva INTEGER NOT NULL
);

CREATE UNIQUE INDEX pasajeros__idx ON
    pasajeros (
        reserva_id_reserva
    ASC );

ALTER TABLE pasajeros ADD CONSTRAINT pasajeros_pk PRIMARY KEY ( id_pasajero );

CREATE TABLE puesto (
    id_puesto INTEGER NOT NULL,
    nombre    VARCHAR2(150) NOT NULL
);

ALTER TABLE puesto ADD CONSTRAINT puesto_pk PRIMARY KEY ( id_puesto );

CREATE TABLE reserva (
    id_reserva              INTEGER NOT NULL,
    tipo_reserva            VARCHAR2(1) NOT NULL,
    estado_reserva          VARCHAR2(1) NOT NULL,
    fecha_de_reserva        DATE NOT NULL,
    fecha_cancelada_reserva DATE
);

ALTER TABLE reserva ADD CONSTRAINT reserva_pk PRIMARY KEY ( id_reserva );

CREATE TABLE ruta (
    id_ruta        INTEGER NOT NULL,
    distancia      SMALLINT NOT NULL,
    origen         VARCHAR2(3) NOT NULL,
    destino        VARCHAR2(3) NOT NULL,
    vuelo_id_vuelo INTEGER NOT NULL
);

ALTER TABLE ruta ADD CONSTRAINT ruta_pk PRIMARY KEY ( id_ruta );

CREATE TABLE vuelo (
    id_vuelo                INTEGER NOT NULL,
    fecha_salida            DATE NOT NULL,
    fecha_llegada           DATE NOT NULL,
    duracion_aproximada_hrs SMALLINT NOT NULL,
    aerolinea_oaci          VARCHAR2(10) NOT NULL,
    avion_matricula         VARCHAR2(15) NOT NULL
);

ALTER TABLE vuelo ADD CONSTRAINT vuelo_pk PRIMARY KEY ( id_vuelo );

CREATE TABLE vuelo_y_pasajeros (
    id_vue_y_pas          INTEGER NOT NULL,
    pasajeros_id_pasajero INTEGER NOT NULL,
    vuelo_id_vuelo        INTEGER NOT NULL
);

ALTER TABLE vuelo_y_pasajeros ADD CONSTRAINT vuelo_y_pasajeros_pk PRIMARY KEY ( id_vue_y_pas );

ALTER TABLE boleto
    ADD CONSTRAINT boleto_pasajeros_fk FOREIGN KEY ( pasajeros_id_pasajero )
        REFERENCES pasajeros ( id_pasajero );

ALTER TABLE boleto
    ADD CONSTRAINT boleto_reserva_fk FOREIGN KEY ( reserva_id_reserva )
        REFERENCES reserva ( id_reserva );

ALTER TABLE boleto
    ADD CONSTRAINT boleto_vuelo_fk FOREIGN KEY ( vuelo_id_vuelo )
        REFERENCES vuelo ( id_vuelo );

ALTER TABLE empleados
    ADD CONSTRAINT empleados_puesto_fk FOREIGN KEY ( puesto_id_puesto )
        REFERENCES puesto ( id_puesto );

ALTER TABLE historial_vuelo
    ADD CONSTRAINT historial_vuelo_empleados_fk FOREIGN KEY ( empleados_id_empleado )
        REFERENCES empleados ( id_empleado );

ALTER TABLE historial_vuelo
    ADD CONSTRAINT historial_vuelo_vuelo_fk FOREIGN KEY ( vuelo_id_vuelo )
        REFERENCES vuelo ( id_vuelo );

ALTER TABLE pasajeros
    ADD CONSTRAINT pasajeros_reserva_fk FOREIGN KEY ( reserva_id_reserva )
        REFERENCES reserva ( id_reserva );

ALTER TABLE ruta
    ADD CONSTRAINT ruta_aeropuerto_fk FOREIGN KEY ( origen )
        REFERENCES aeropuerto ( codigo_iata );

ALTER TABLE ruta
    ADD CONSTRAINT ruta_aeropuerto_fkv1 FOREIGN KEY ( destino )
        REFERENCES aeropuerto ( codigo_iata );

ALTER TABLE ruta
    ADD CONSTRAINT ruta_vuelo_fk FOREIGN KEY ( vuelo_id_vuelo )
        REFERENCES vuelo ( id_vuelo );

ALTER TABLE vuelo
    ADD CONSTRAINT vuelo_aerolinea_fk FOREIGN KEY ( aerolinea_oaci )
        REFERENCES aerolinea ( oaci );

ALTER TABLE vuelo
    ADD CONSTRAINT vuelo_avion_fk FOREIGN KEY ( avion_matricula )
        REFERENCES avion ( matricula );

ALTER TABLE vuelo_y_pasajeros
    ADD CONSTRAINT vuelo_y_pasajeros_pasajeros_fk FOREIGN KEY ( pasajeros_id_pasajero )
        REFERENCES pasajeros ( id_pasajero );

ALTER TABLE vuelo_y_pasajeros
    ADD CONSTRAINT vuelo_y_pasajeros_vuelo_fk FOREIGN KEY ( vuelo_id_vuelo )
        REFERENCES vuelo ( id_vuelo );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             2
-- ALTER TABLE                             26
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
