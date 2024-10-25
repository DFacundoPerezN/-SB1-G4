--Procedimientos

--Procedimiento para Registrar Aerolineas
create or replace procedure RegistrarAerolinea( coaci aerolinea.codigooaci%TYPE, nom aerolinea.nombre%TYPE, ciu aerolinea.ciudad_id_ciudad%TYPE )
as
begin
INSERT INTO aerolinea( codigooaci, nombre, ciudad_id_ciudad ) values ( coaci, nom, ciu );
end;


--Procedimiento para Registrar Aeropuertos
CREATE OR REPLACE PROCEDURE RegistroAeropuerto(
ciata    aeropuerto.codigo_iata%TYPE,
nom      aeropuerto.nombre%TYPE,
direc    aeropuerto.direccion%TYPE,
pistaext aeropuerto.pista_extendida%TYPE,
servadu  aeropuerto.servicio_aduanero%TYPE,
idciu    aeropuerto.ciudad_id_ciudad%TYPE
)
as 
begin 

IF pistaext NOT IN ('0','1') THEN
    RAISE_APPLICATION_ERROR(-20001,'El parametro de Pista Extendida debe de ser 0 o 1');
END IF;

IF servadu NOT IN ('0','1') THEN
    RAISE_APPLICATION_ERROR(-20001,'El parametro de Servicio Aduanero debe de ser 0 o 1');
END IF;

INSERT INTO aeropuerto( codigo_iata, nombre, direccion, pista_extendida, servicio_aduanero, ciudad_id_ciudad  )
VALUES ( ciata, nom, direc, pistaext, servadu, idciu );
end;


--Procedimiento para Registrar Puerto de Embarque( codigo_iata, terminal, listaPE ):
create or replace NONEDITIONABLE PROCEDURE PuertaEmbarque(
ciata VARCHAR,
termi VARCHAR,
listpe VARCHAR
) AS
    strpe VARCHAR(100);
    indice INTEGER := 1;
    intpe INTEGER;
    e_count INTEGER;
    inttermi INTEGER := TO_NUMBER(termi);
BEGIN
    LOOP
        strpe := REGEXP_SUBSTR(listpe, '[^,]+',1,indice);
        EXIT WHEN strpe IS NULL;

        SELECT COUNT(*) INTO e_count FROM aeropuerto WHERE codigo_iata = ciata;

        IF ( e_count = 0 ) THEN
            RAISE_APPLICATION_ERROR(-20001,'Error no existe la Aeropuerto');
        END IF;
        e_count :=  0;

        SELECT COUNT(*) INTO e_count FROM terminal WHERE id_terminal = inttermi ;
        IF ( e_count = 0 ) THEN
            INSERT INTO terminal(id_terminal, aeropuerto_id_aeropuerto) VALUES (  inttermi, (SELECT id_aeropuerto FROM aeropuerto WHERE codigo_iata = ciata) );
        END IF;
        e_count := 0;

        INSERT INTO puerta_embarque( puerta, terminal_id_terminal ) values ( strpe, inttermi);

        indice := indice + 1;
    END LOOP;
END;


--PROCEDIMIENTO PARA REGISTRAR AVION(matricula, modelo, capacidad, estado, alcance, aerolinea, A.Primera_clase, A.clase_ejecutaiva, A.clase_economica )
create or replace NONEDITIONABLE PROCEDURE RegistraAvion(  
matri     VARCHAR,
modeloa   VARCHAR,
capa      INTEGER,
esta      CHAR,
alcan     INTEGER,
aerolin   INTEGER,
apriclase INTEGER,
aclasejec INTEGER,
aclaseco  INTEGER
)
AS
    e_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO e_count FROM avion WHERE matricula = matri;
    IF ( e_count = 1 ) THEN
        RAISE_APPLICATION_ERROR(-20001,'Ya existe un avión con la matricual');
    END IF;
    e_count := 0; 
    
    SELECT COUNT(*) INTO e_count FROM avion WHERE modelo = modeloa;
    IF ( e_count = 1 ) THEN
        RAISE_APPLICATION_ERROR(-20001,'Ya existe el modelo ingresado');
    END IF;
    e_count := 0; 
    
    IF( capa <= 1 ) THEN
        RAISE_APPLICATION_ERROR(-20001,'La capidad debe mayor a 0 ');
    END IF;
    
    IF( alcan <= 1 ) THEN
        RAISE_APPLICATION_ERROR(-20001,'El alcance debe ser un numero positivo');
    END IF;

    SELECT COUNT(*) INTO e_count FROM aerolinea WHERE id_aerolinea = aerolin;
    IF( e_count = 0 ) THEN
        RAISE_APPLICATION_ERROR(-20001,'No existe la Aerolinea ingresada');
    END IF;
    e_count := 0;

    e_count := apriclase + aclasejec + aclaseco;
    IF ( e_count != capa ) THEN
        RAISE_APPLICATION_ERROR(-20001,'Error la capacidad debe de ser igual a la suma de sus asientos');
    END IF;
    e_count := 0;

    IF esta NOT IN ('0','1') THEN
        RAISE_APPLICATION_ERROR(-20001,'Estado solo permite valores 1 o 0');
    END IF;

    IF( apriclase <= 0 ) THEN
        RAISE_APPLICATION_ERROR(-20001,'Los asientos de primera clase debe de ser mayor a 0');
    END IF;
    IF( aclasejec <= 0 ) THEN
        RAISE_APPLICATION_ERROR(-20001,'Los asientos de clase ejecutivo debe de ser mayor a 0');
    END IF;
    IF( aclaseco <= 0 ) THEN
        RAISE_APPLICATION_ERROR(-20001,'Los asientos de clase economica debe de ser mayor a 0');
    END IF;

    INSERT INTO avion( matricula, modelo, estado, alcance, aerolinea_id_aerolinea, capacidad) VALUES ( matri, modeloa, esta, alcan, aerolin, capa);

    INSERT INTO asientos( no_asientos,clase,avion_id_avion) VALUES ( apriclase, 'Primera Clase', (SELECT id_avion FROM avion WHERE matricula=matri) );
    INSERT INTO asientos( no_asientos,clase,avion_id_avion) VALUES ( apriclase, 'Clase Ejecutivo', (SELECT id_avion FROM avion WHERE matricula=matri) );
    INSERT INTO asientos( no_asientos,clase,avion_id_avion) VALUES ( apriclase, 'Clase Economica', (SELECT id_avion FROM avion WHERE matricula=matri) );
END;

--PROCEDIMIENTO PARA REGISTRA LAS RUTAS ( tiempovuelo, distancia, origen, destino )
CREATE OR REPLACE PROCEDURE RegistrarRutas(
tiempov INTEGER,
dista   INTEGER,
orig    INTEGER,
desti   INTEGER
)AS
    aux INTEGER :=0;
    v_entero INTEGER;
BEGIN
    BEGIN
        v_entero := TO_NUMBER(dista);

	IF ( orig = desti ) THEN
            RAISE_APPLICATION_ERROR(-20001,'El Origen no puede ser la misma que destino');
        END IF;
    
        SELECT COUNT(*) INTO aux FROM aeropuerto WHERE id_aeropuerto = orig;
        IF ( aux = 0 ) THEN
            RAISE_APPLICATION_ERROR(-20001,'No existe aeropuerto de origen');
        END IF;
        aux := 0;

        SELECT COUNT(*) INTO aux FROM aeropuerto WHERE id_aeropuerto = desti;
        IF ( aux = 0 ) THEN
            RAISE_APPLICATION_ERROR(-20001,'No existe aeropuerto de destino');
        END IF;
        aux := 0;
    
        INSERT INTO ruta(tiempo_vuelo,distancia,AEROPUERTO_ID_AEROPUERTO,AEROPUERTO_ID_AEROPUERTO2) VALUES (tiempov, dista, orig, desti);
    EXCEPTION
        WHEN VALUE_ERROR THEN
            RAISE_APPLICATION_ERROR(-20001, 'La distancia debe de ser entero');
    END;
END;

--Procedimiento para Registrar Empleado
create or replace procedure RegistrarEmpleado(
codigoem INTEGER,
nomb     VARCHAR,
apell    VARCHAR,
corre    VARCHAR,
tel      INTEGER,
dire     VARCHAR,
carg     INTEGER,
fechan   DATE,
salar    INTEGER
)AS
    vtel INTEGER;
    aux INTEGER;
    vfecha DATE;
BEGIN
    BEGIN
        vtel := TO_NUMBER( tel );
    
        IF NOT REGEXP_LIKE( nomb, '^[A-Za-z]+$' )THEN
            RAISE_APPLICATION_ERROR(-20001, 'El parametro nombre debe contener solo letras');
        END IF;
    
        IF NOT REGEXP_LIKE( apell, '^[A-Za-z]+$' )THEN
            RAISE_APPLICATION_ERROR(-20001, 'El parametro apell debe contener solo letras');
        END IF;

        IF NOT REGEXP_LIKE(corre, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$') THEN
            RAISE_APPLICATION_ERROR(-20001, 'Correo electrónico no válido');
        END IF;
        
        SELECT COUNT(*) INTO aux FROM cargo WHERE id_cargo = carg;
        IF ( aux = 0 ) THEN
            RAISE_APPLICATION_ERROR(-20001, 'No existe el cargo ingresado');
        END IF;
        aux := 0;
        
        BEGIN
            vfecha := TO_DATE(fechan, 'DD/MM/YYYY');
            
            IF( salar <=1 OR salar >= 99000 )THEN
                RAISE_APPLICATION_ERROR(-20001, 'El salario debe de ser mayor a 0 y menor que 99,000');
            END IF;
            
        EXCEPTION
            WHEN VALUE_ERROR THEN
                RAISE_APPLICATION_ERROR(-20001, 'Formato de fecha inválido');
            WHEN OTHERS THEN
                RAISE_APPLICATION_ERROR(-20002, 'Error al convertir la fecha');
        END;
        
    EXCEPTION
        WHEN VALUE_ERROR THEN
            RAISE_APPLICATION_ERROR(-20001, 'El telefono debe de ser solo numeros');
    END;
END;


-- REGISTRAR PASAJEROS
CREATE OR REPLACE PROCEDURE RegistrarPasajeros(
    codigo_pasaporte IN NUMBER,
    nombres IN VARCHAR2,
    apellidos IN VARCHAR2,
    fecha_nacimiento IN DATE,
    correo IN VARCHAR2,
    telefono IN NUMBER
) AS
    v_entero NUMBER;
    v_count NUMBER;
BEGIN
    -- Validar que los nombres solo contengan letras
    IF NOT REGEXP_LIKE(nombres, '^[A-Za-z]+$') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error: Los nombres solo deben contener letras.');
    END IF;

    -- Validar que los apellidos solo contengan letras
    IF NOT REGEXP_LIKE(apellidos, '^[A-Za-z]+$') THEN
        RAISE_APPLICATION_ERROR(-20002, 'Error: Los apellidos solo deben contener letras.');
    END IF;

    -- Validar formato del correo electrónico
    IF NOT REGEXP_LIKE(correo, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') THEN
        RAISE_APPLICATION_ERROR(-20003, 'Error: El formato del correo es inválido.');
    END IF;

    -- Validar que el teléfono tenga exactamente 10 dígitos
    IF LENGTH(TO_CHAR(telefono)) != 8 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Error: El número de teléfono debe tener 10 dígitos.');
    END IF;

    -- Insertar el nuevo pasajero
    INSERT INTO pasajero(codigo_pasaporte, nombres, apellidos, fecha_nacimiento, correo, telefono)
    VALUES (codigo_pasaporte, nombres, apellidos, fecha_nacimiento, correo, telefono);

EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20005, 'Error al registrar el pasajero: ' || SQLERRM);
END;
/
