CREATE TABLE categoria (
    id_categoria INTEGER NOT NULL,
    categoria    VARCHAR2(50) NOT NULL
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE clientes (
    id_cliente INTEGER NOT NULL,
    nombre     VARCHAR2(50) NOT NULL,
    apellido   VARCHAR2(50) NOT NULL,
    direccion  VARCHAR2(50) NOT NULL,
    telefono   VARCHAR2(15) NOT NULL,
    tarjeta    VARCHAR2(30),
    edad       INTEGER NOT NULL,
    genero     VARCHAR2(10) NOT NULL,
    pais       VARCHAR2(50) NOT NULL
);

ALTER TABLE clientes ADD CONSTRAINT clientes_pk PRIMARY KEY ( id_cliente );

CREATE TABLE linea_orden (
    linea_orden INTEGER NOT NULL,
    id_orden    INTEGER NOT NULL,
    fecha_orden DATE NOT NULL,
    cantidad    INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    id_vendedor INTEGER NOT NULL,
    id_cliente  INTEGER NOT NULL
);

ALTER TABLE linea_orden ADD CONSTRAINT linea_orden_pk PRIMARY KEY ( linea_orden,
                                                                    id_orden );

CREATE TABLE orden (
    id_orden INTEGER NOT NULL
);

ALTER TABLE orden ADD CONSTRAINT orden_pk PRIMARY KEY ( id_orden );

CREATE TABLE productos (
    id_producto  INTEGER NOT NULL,
    nombre       VARCHAR2(100) NOT NULL,
    precio       NUMBER NOT NULL,
    id_categoria INTEGER NOT NULL
);

ALTER TABLE productos ADD CONSTRAINT productos_pk PRIMARY KEY ( id_producto );

CREATE TABLE vendedor (
    id_vendedor     INTEGER NOT NULL,
    nombre_vendedor VARCHAR2(50) NOT NULL,
    pais_vendedor   VARCHAR2(50) NOT NULL
);

ALTER TABLE vendedor ADD CONSTRAINT vendedor_pk PRIMARY KEY ( id_vendedor );

ALTER TABLE linea_orden
    ADD CONSTRAINT linea_orden_clientes_fk FOREIGN KEY ( id_cliente )
        REFERENCES clientes ( id_cliente );

ALTER TABLE linea_orden
    ADD CONSTRAINT linea_orden_orden_fk FOREIGN KEY ( id_orden )
        REFERENCES orden ( id_orden );

ALTER TABLE linea_orden
    ADD CONSTRAINT linea_orden_productos_fk FOREIGN KEY ( id_producto )
        REFERENCES productos ( id_producto );

ALTER TABLE linea_orden
    ADD CONSTRAINT linea_orden_vendedor_fk FOREIGN KEY ( id_vendedor )
        REFERENCES vendedor ( id_vendedor );

ALTER TABLE productos
    ADD CONSTRAINT productos_categoria_fk FOREIGN KEY ( id_categoria )
        REFERENCES categoria ( id_categoria );
