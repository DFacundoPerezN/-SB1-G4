-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-10-30 00:46:41 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE aerolinea (
    id_aerolinea     INTEGER NOT NULL,
    codigooaci       VARCHAR2(25) NOT NULL,
    nombre           VARCHAR2(35) NOT NULL,
    ciudad_id_ciudad INTEGER NOT NULL
);

ALTER TABLE aerolinea ADD CONSTRAINT aerolinea_pk PRIMARY KEY ( id_aerolinea );

CREATE TABLE aeropuerto (
    id_aeropuerto     INTEGER NOT NULL,
    codigo_iata       VARCHAR2(35) NOT NULL,
    nombre            VARCHAR2(30) NOT NULL,
    direccion         VARCHAR2(35) NOT NULL,
    pista_extendida   CHAR(1) NOT NULL,
    servicio_aduanero CHAR(1) NOT NULL,
    ciudad_id_ciudad  INTEGER NOT NULL
);

ALTER TABLE aeropuerto ADD CONSTRAINT aeropuerto_pk PRIMARY KEY ( id_aeropuerto );

CREATE TABLE asientos (
    id_asientos INTEGER NOT NULL,
    no_asientos INTEGER NOT NULL,
    clase       VARCHAR2(35) NOT NULL
);

ALTER TABLE asientos ADD CONSTRAINT asientos_pk PRIMARY KEY ( id_asientos );

CREATE TABLE avion (
    id_avion               INTEGER NOT NULL,
    matricula              VARCHAR2(25) NOT NULL,
    modelo                 VARCHAR2(25) NOT NULL,
    estado                 CHAR(1) NOT NULL,
    alcance                INTEGER NOT NULL,
    asientos_id_asientos   INTEGER NOT NULL,
    aerolinea_id_aerolinea INTEGER NOT NULL
);

ALTER TABLE avion ADD CONSTRAINT avion_pk PRIMARY KEY ( matricula );

CREATE TABLE boleto (
    id_boleto                 INTEGER NOT NULL,
    estado                    VARCHAR2(25) NOT NULL,
    asientos_id_asientos      INTEGER NOT NULL,
    vuelo_no_vuelo            INTEGER NOT NULL,
    empleado_id_empleado      INTEGER NOT NULL,
    pasajero_codigo_pasaporte INTEGER NOT NULL,
    reserva_id_reserva        INTEGER NOT NULL,
    pago_id_pago              INTEGER NOT NULL
);

ALTER TABLE boleto ADD CONSTRAINT boleto_pk PRIMARY KEY ( id_boleto );

CREATE TABLE can_reserva (
    id_cancelacion     INTEGER NOT NULL,
    reserva_id_reserva INTEGER NOT NULL
);

ALTER TABLE can_reserva ADD CONSTRAINT can_reserva_pk PRIMARY KEY ( id_cancelacion );

CREATE TABLE cargo (
    id_cargo INTEGER NOT NULL,
    cargo    VARCHAR2(30) NOT NULL
);

ALTER TABLE cargo ADD CONSTRAINT cargo_pk PRIMARY KEY ( id_cargo );

CREATE TABLE ciudad (
    id_ciudad INTEGER NOT NULL,
    nombre    VARCHAR2(30) NOT NULL,
    pais      VARCHAR2(30) NOT NULL
);

ALTER TABLE ciudad ADD CONSTRAINT ciudad_pk PRIMARY KEY ( id_ciudad );

CREATE TABLE empleado (
    id_empleado            INTEGER NOT NULL,
    nombre                 VARCHAR2(35) NOT NULL,
    apellido               VARCHAR2(35) NOT NULL,
    correo                 VARCHAR2(40) NOT NULL,
    telefono               INTEGER NOT NULL,
    direccion              VARCHAR2(30) NOT NULL,
    fecha_nacimiento       DATE NOT NULL,
    cargo_id_cargo         INTEGER NOT NULL,
    salario                INTEGER NOT NULL,
    aerolinea_id_aerolinea INTEGER NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( id_empleado );

CREATE TABLE equipaje (
    id_equipaje               INTEGER NOT NULL,
    peso                      INTEGER NOT NULL,
    largo                     INTEGER NOT NULL,
    ancho                     INTEGER NOT NULL,
    alto                      INTEGER NOT NULL,
    estado                    VARCHAR2(20) NOT NULL,
    pasajero_codigo_pasaporte INTEGER NOT NULL,
    boleto_id_boleto          INTEGER NOT NULL
);

ALTER TABLE equipaje ADD CONSTRAINT equipaje_pk PRIMARY KEY ( id_equipaje );

CREATE TABLE mantenimiento (
    id_mantenimiento INTEGER NOT NULL,
    fecha_inicio     DATE NOT NULL,
    fecha_salida     DATE NOT NULL,
    observaciones    VARCHAR2(50),
    avion_matricula  VARCHAR2(25) NOT NULL
);

ALTER TABLE mantenimiento ADD CONSTRAINT mantenimiento_pk PRIMARY KEY ( id_mantenimiento );

CREATE TABLE pago (
    id_pago INTEGER NOT NULL,
    fecha   DATE NOT NULL,
    metodo  VARCHAR2(30) NOT NULL
);

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( id_pago );

CREATE TABLE pasajero (
    codigo_pasaporte INTEGER NOT NULL,
    nombre           VARCHAR2(50) NOT NULL,
    apellido         VARCHAR2(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    correo           VARCHAR2(35) NOT NULL,
    telefono         INTEGER NOT NULL
);

ALTER TABLE pasajero ADD CONSTRAINT pasajero_pk PRIMARY KEY ( codigo_pasaporte );

CREATE TABLE puerta_embarque (
    id_puerta            INTEGER NOT NULL,
    puerta               VARCHAR2(30) NOT NULL,
    terminal_id_terminal INTEGER NOT NULL
);

ALTER TABLE puerta_embarque ADD CONSTRAINT puerta_embarque_pk PRIMARY KEY ( id_puerta );

CREATE TABLE reserva (
    id_reserva INTEGER NOT NULL,
    fecha      DATE NOT NULL
);

ALTER TABLE reserva ADD CONSTRAINT reserva_pk PRIMARY KEY ( id_reserva );

CREATE TABLE ruta (
    id_ruta                   INTEGER NOT NULL,
    tiempo_vuelo              INTEGER NOT NULL,
    distancia                 INTEGER NOT NULL,
    aeropuerto_id_aeropuerto  INTEGER NOT NULL,
    aeropuerto_id_aeropuerto1 INTEGER NOT NULL
);

ALTER TABLE ruta ADD CONSTRAINT ruta_pk PRIMARY KEY ( id_ruta );

CREATE TABLE tarifa (
    id_tarifa      INTEGER NOT NULL,
    clase          VARCHAR2(50) NOT NULL,
    precio         NUMBER NOT NULL,
    vuelo_no_vuelo INTEGER NOT NULL
);

ALTER TABLE tarifa ADD CONSTRAINT tarifa_pk PRIMARY KEY ( id_tarifa );

CREATE TABLE terminal (
    id_terminal              INTEGER NOT NULL,
    aeropuerto_id_aeropuerto INTEGER NOT NULL
);

ALTER TABLE terminal ADD CONSTRAINT terminal_pk PRIMARY KEY ( id_terminal );

CREATE TABLE tripulacion (
    id_tripulacion       INTEGER NOT NULL,
    vuelo_no_vuelo       INTEGER NOT NULL,
    empleado_id_empleado INTEGER NOT NULL
);

ALTER TABLE tripulacion ADD CONSTRAINT tripulacion_pk PRIMARY KEY ( id_tripulacion );

CREATE TABLE vuelo (
    no_vuelo                  INTEGER NOT NULL,
    fecha_salida              DATE NOT NULL,
    vuelo_llegada             DATE NOT NULL,
    estado                    VARCHAR2(50) NOT NULL,
    avion_matricula           VARCHAR2(25) NOT NULL,
    ruta_id_ruta              INTEGER NOT NULL,
    puerta_embarque_id_puerta INTEGER NOT NULL,
    aerolinea_id_aerolinea    INTEGER NOT NULL
);

ALTER TABLE vuelo ADD CONSTRAINT vuelo_pk PRIMARY KEY ( no_vuelo );

ALTER TABLE aerolinea
    ADD CONSTRAINT aerolinea_ciudad_fk FOREIGN KEY ( ciudad_id_ciudad )
        REFERENCES ciudad ( id_ciudad );

ALTER TABLE aeropuerto
    ADD CONSTRAINT aeropuerto_ciudad_fk FOREIGN KEY ( ciudad_id_ciudad )
        REFERENCES ciudad ( id_ciudad );

ALTER TABLE avion
    ADD CONSTRAINT avion_aerolinea_fk FOREIGN KEY ( aerolinea_id_aerolinea )
        REFERENCES aerolinea ( id_aerolinea );

ALTER TABLE avion
    ADD CONSTRAINT avion_asientos_fk FOREIGN KEY ( asientos_id_asientos )
        REFERENCES asientos ( id_asientos );

ALTER TABLE boleto
    ADD CONSTRAINT boleto_asientos_fk FOREIGN KEY ( asientos_id_asientos )
        REFERENCES asientos ( id_asientos );

ALTER TABLE boleto
    ADD CONSTRAINT boleto_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE boleto
    ADD CONSTRAINT boleto_pago_fk FOREIGN KEY ( pago_id_pago )
        REFERENCES pago ( id_pago );

ALTER TABLE boleto
    ADD CONSTRAINT boleto_pasajero_fk FOREIGN KEY ( pasajero_codigo_pasaporte )
        REFERENCES pasajero ( codigo_pasaporte );

ALTER TABLE boleto
    ADD CONSTRAINT boleto_reserva_fk FOREIGN KEY ( reserva_id_reserva )
        REFERENCES reserva ( id_reserva );

ALTER TABLE boleto
    ADD CONSTRAINT boleto_vuelo_fk FOREIGN KEY ( vuelo_no_vuelo )
        REFERENCES vuelo ( no_vuelo );

ALTER TABLE can_reserva
    ADD CONSTRAINT can_reserva_reserva_fk FOREIGN KEY ( reserva_id_reserva )
        REFERENCES reserva ( id_reserva );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_aerolinea_fk FOREIGN KEY ( aerolinea_id_aerolinea )
        REFERENCES aerolinea ( id_aerolinea );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_cargo_fk FOREIGN KEY ( cargo_id_cargo )
        REFERENCES cargo ( id_cargo );

ALTER TABLE equipaje
    ADD CONSTRAINT equipaje_boleto_fk FOREIGN KEY ( boleto_id_boleto )
        REFERENCES boleto ( id_boleto );

ALTER TABLE equipaje
    ADD CONSTRAINT equipaje_pasajero_fk FOREIGN KEY ( pasajero_codigo_pasaporte )
        REFERENCES pasajero ( codigo_pasaporte );

ALTER TABLE mantenimiento
    ADD CONSTRAINT mantenimiento_avion_fk FOREIGN KEY ( avion_matricula )
        REFERENCES avion ( matricula );

ALTER TABLE puerta_embarque
    ADD CONSTRAINT puerta_embarque_terminal_fk FOREIGN KEY ( terminal_id_terminal )
        REFERENCES terminal ( id_terminal );

ALTER TABLE ruta
    ADD CONSTRAINT ruta_aeropuerto_fk FOREIGN KEY ( aeropuerto_id_aeropuerto )
        REFERENCES aeropuerto ( id_aeropuerto );

ALTER TABLE ruta
    ADD CONSTRAINT ruta_aeropuerto_fkv1 FOREIGN KEY ( aeropuerto_id_aeropuerto1 )
        REFERENCES aeropuerto ( id_aeropuerto );

ALTER TABLE tarifa
    ADD CONSTRAINT tarifa_vuelo_fk FOREIGN KEY ( vuelo_no_vuelo )
        REFERENCES vuelo ( no_vuelo );

ALTER TABLE terminal
    ADD CONSTRAINT terminal_aeropuerto_fk FOREIGN KEY ( aeropuerto_id_aeropuerto )
        REFERENCES aeropuerto ( id_aeropuerto );

ALTER TABLE tripulacion
    ADD CONSTRAINT tripulacion_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE tripulacion
    ADD CONSTRAINT tripulacion_vuelo_fk FOREIGN KEY ( vuelo_no_vuelo )
        REFERENCES vuelo ( no_vuelo );

ALTER TABLE vuelo
    ADD CONSTRAINT vuelo_aerolinea_fk FOREIGN KEY ( aerolinea_id_aerolinea )
        REFERENCES aerolinea ( id_aerolinea );

ALTER TABLE vuelo
    ADD CONSTRAINT vuelo_avion_fk FOREIGN KEY ( avion_matricula )
        REFERENCES avion ( matricula );

ALTER TABLE vuelo
    ADD CONSTRAINT vuelo_puerta_embarque_fk FOREIGN KEY ( puerta_embarque_id_puerta )
        REFERENCES puerta_embarque ( id_puerta );

ALTER TABLE vuelo
    ADD CONSTRAINT vuelo_ruta_fk FOREIGN KEY ( ruta_id_ruta )
        REFERENCES ruta ( id_ruta );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            20
-- CREATE INDEX                             0
-- ALTER TABLE                             47
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
