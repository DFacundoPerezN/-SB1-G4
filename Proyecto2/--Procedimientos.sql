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

-- REGISTRAR VUELOS Y TARIFAS
CREATE OR REPLACE PROCEDURE registrar_vuelo (
    p_no_vuelo                  IN INTEGER,
    p_fecha_salida              IN DATE,
    p_fecha_llegada             IN DATE,
    p_estado                    IN VARCHAR2,
    p_avion_matricula           IN VARCHAR2,
    p_puerta_embarque_id_puerta IN INTEGER,
    p_ruta_id_ruta              IN INTEGER,
    p_aerolinea_id_aerolinea    IN INTEGER,
    p_tarifa_primera_clase      IN NUMBER,
    p_tarifa_clase_ejecutiva    IN NUMBER,
    p_tarifa_clase_economica     IN NUMBER
) AS
    v_existe_avion          INTEGER;
    v_existe_puerta         INTEGER;
    v_existe_ruta           INTEGER;
    v_existe_aerolinea      INTEGER;
    v_tarifa_valida         BOOLEAN := TRUE;

BEGIN
    -- Validar que el vuelo no existe
    SELECT COUNT(*) INTO v_existe_avion 
    FROM avion 
    WHERE matricula = p_avion_matricula AND estado = 'Disponible';

    IF v_existe_avion = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El avión no existe o no está disponible.');
    END IF;

    -- Validar que la puerta de embarque exista
    SELECT COUNT(*) INTO v_existe_puerta 
    FROM puerta_embarque 
    WHERE id_puerta = p_puerta_embarque_id_puerta;

    IF v_existe_puerta = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'La puerta de embarque no existe.');
    END IF;

    -- Validar que la ruta exista
    SELECT COUNT(*) INTO v_existe_ruta 
    FROM ruta 
    WHERE id_ruta = p_ruta_id_ruta;

    IF v_existe_ruta = 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'La ruta no existe.');
    END IF;

    -- Validar que la aerolínea exista
    SELECT COUNT(*) INTO v_existe_aerolinea 
    FROM aerolinea 
    WHERE id_aerolinea = p_aerolinea_id_aerolinea;

    IF v_existe_aerolinea = 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'La aerolínea no existe.');
    END IF;

    -- Validar precios lógicos
    IF p_tarifa_primera_clase < 0 OR p_tarifa_clase_ejecutiva < 0 OR p_tarifa_clase_economica < 0 THEN
        v_tarifa_valida := FALSE;
    END IF;

    IF NOT v_tarifa_valida THEN
        RAISE_APPLICATION_ERROR(-20005, 'Las tarifas deben ser mayores o iguales a cero.');
    END IF;

    -- Validar que la fecha de llegada sea posterior a la fecha de salida
    IF p_fecha_llegada <= p_fecha_salida THEN
        RAISE_APPLICATION_ERROR(-20006, 'La fecha de llegada debe ser posterior a la fecha de salida.');
    END IF;

    -- Insertar el nuevo vuelo en la tabla vuelo
    INSERT INTO vuelo (
        no_vuelo,
        fecha_salida,
        vuelo_llegada,
        estado,
        avion_matricula,
        ruta_id_ruta,
        puerta_embarque_id_puerta,
        aerolinea_id_aerolinea
    ) VALUES (
        p_no_vuelo,
        p_fecha_salida,
        p_fecha_llegada,
        p_estado,
        p_avion_matricula,
        p_ruta_id_ruta,
        p_puerta_embarque_id_puerta,
        p_aerolinea_id_aerolinea
    );

    -- Insertar las tarifas correspondientes en la tabla tarifa
    INSERT INTO tarifa (
        vuelo_no_vuelo,
        clase,
        precio
    ) VALUES (p_no_vuelo, 'Primera Clase', p_tarifa_primera_clase);
    
    INSERT INTO tarifa (
        vuelo_no_vuelo,
        clase,
        precio
    ) VALUES (p_no_vuelo, 'Clase Ejecutiva', p_tarifa_clase_ejecutiva);
    
    INSERT INTO tarifa (
        vuelo_no_vuelo,
        clase,
        precio
    ) VALUES (p_no_vuelo, 'Clase Económica', p_tarifa_clase_economica);

    COMMIT; -- Confirmar la transacción

    -- Mensaje de éxito
    DBMS_OUTPUT.PUT_LINE('El vuelo ' || p_no_vuelo || ' se ha registrado exitosamente.');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; -- Revertir cambios en caso de error
        RAISE; -- Propagar el error
END registrar_vuelo;


-- ASIGNAR TRIPULACION
CREATE OR REPLACE PROCEDURE AsignarTripulacion(
    codigo_empleado IN NUMBER,
    codigo_vuelo IN NUMBER
) AS
    v_aerolinea_vuelo NUMBER;
    v_aerolinea_empleado NUMBER;
    v_cargo VARCHAR2(50);
    v_count NUMBER;
    v_fecha_hora_salida DATE;
    v_fecha_hora_llegada DATE;
    v_pilotos NUMBER;
    v_servidores NUMBER;
BEGIN
    -- Obtener la aerolínea del vuelo
    SELECT aerolinea_id, fecha_hora_salida, fecha_hora_llegada 
    INTO v_aerolinea_vuelo, v_fecha_hora_salida, v_fecha_hora_llegada
    FROM vuelo 
    WHERE no_vuelo = codigo_vuelo;

    -- Obtener la aerolínea y cargo del empleado
    SELECT aerolinea_id, cargo 
    INTO v_aerolinea_empleado, v_cargo
    FROM empleado 
    WHERE id_empleado = codigo_empleado;

    -- Validar que el empleado pertenece a la misma aerolínea que el vuelo
    IF v_aerolinea_vuelo != v_aerolinea_empleado THEN
        RAISE_APPLICATION_ERROR(-20001, 'El empleado no pertenece a la misma aerolínea que el vuelo.');
    END IF;

    -- Validar que el empleado no esté asignado a otro vuelo en el mismo horario
    SELECT COUNT(*) INTO v_count
    FROM vuelo_empleado ve
    JOIN vuelo v ON ve.codigo_vuelo = v.no_vuelo
    WHERE ve.codigo_empleado = codigo_empleado
      AND ((v.fecha_hora_salida BETWEEN v_fecha_hora_salida AND v_fecha_hora_llegada)
           OR (v.fecha_hora_llegada BETWEEN v_fecha_hora_salida AND v_fecha_hora_llegada));

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'El empleado ya está asignado a otro vuelo en el mismo horario.');
    END IF;

    -- Validar que no se puedan asignar empleados de ventanilla a los vuelos
    IF v_cargo = 'ventanilla' THEN
        RAISE_APPLICATION_ERROR(-20003, 'Los empleados de ventanilla no pueden ser asignados a vuelos.');
    END IF;

    -- Contar cuántos pilotos y servidores ya están asignados al vuelo
    SELECT COUNT(CASE WHEN cargo = 'piloto' OR cargo = 'copiloto' THEN 1 END),
           COUNT(CASE WHEN cargo = 'servidor' THEN 1 END)
    INTO v_pilotos, v_servidores
    FROM vuelo_empleado ve
    JOIN empleado e ON ve.codigo_empleado = e.id_empleado
    WHERE ve.codigo_vuelo = codigo_vuelo;

    -- Validar que haya un mínimo de 2 pilotos (piloto y copiloto)
    IF v_cargo IN ('piloto', 'copiloto') AND v_pilotos >= 2 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Ya hay suficientes pilotos asignados a este vuelo.');
    END IF;

    -- Validar que haya un mínimo de 3 empleados como servidores
    IF v_cargo = 'servidor' AND v_servidores >= 3 THEN
        RAISE_APPLICATION_ERROR(-20005, 'Ya hay suficientes servidores asignados a este vuelo.');
    END IF;

    -- Asignar el empleado al vuelo
    INSERT INTO vuelo_empleado(codigo_empleado, codigo_vuelo)
    VALUES (codigo_empleado, codigo_vuelo);

    DBMS_OUTPUT.PUT_LINE('Empleado asignado correctamente al vuelo.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20006, 'El vuelo o el empleado no existen.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20007, 'Error al asignar el empleado al vuelo: ' || SQLERRM);
END;
/


-- COMPRA DE BOLETOS
-- nota: No se si el valor 0 es del empleado o de la reserva
CREATE OR REPLACE PROCEDURE CompraBoleto(
    p_fecha IN DATE,
    p_vuelo IN NUMBER,
    p_asiento IN NUMBER,
    p_empleado IN NUMBER,
    p_pasajero IN NUMBER,
    p_reserva IN NUMBER
) AS
    v_fecha_salida DATE;
    v_disponible NUMBER;
    v_empleado_existente NUMBER;
    v_pasajero_existente NUMBER;
    v_reserva_existente NUMBER;
BEGIN
    -- Validar que el vuelo existe y obtener su fecha de salida
    SELECT fecha_hora_salida
    INTO v_fecha_salida
    FROM vuelo
    WHERE no_vuelo = p_vuelo;

    -- Validar que el vuelo no ha partido
    IF v_fecha_salida < SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'El vuelo ya ha partido.');
    END IF;

    -- Verificar que el asiento esté disponible para ese vuelo
    SELECT COUNT(*) INTO v_disponible
    FROM boleto
    WHERE vuelo_id = p_vuelo AND asiento = p_asiento;

    IF v_disponible > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'El asiento ya está ocupado.');
    END IF;

    -- Validar que el pasajero existe
    SELECT COUNT(*) INTO v_pasajero_existente
    FROM pasajero
    WHERE id_pasajero = p_pasajero;

    IF v_pasajero_existente = 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'El pasajero no existe.');
    END IF;

    -- Validar que la reserva existe
    SELECT COUNT(*) INTO v_reserva_existente
    FROM reserva
    WHERE id_reserva = p_reserva;

    IF v_reserva_existente = 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'La reserva no existe.');
    END IF;

    -- Validar que el empleado existe, si el valor no es 0 (compra desde ventanilla)
    IF p_empleado != 0 THEN
        SELECT COUNT(*) INTO v_empleado_existente
        FROM empleado
        WHERE id_empleado = p_empleado;

        IF v_empleado_existente = 0 THEN
            RAISE_APPLICATION_ERROR(-20005, 'El empleado no existe.');
        END IF;
    END IF;

    -- Insertar el boleto en la tabla boleto
    INSERT INTO boleto (
        fecha_pago,
        vuelo_id,
        asiento,
        empleado_id,
        pasajero_id,
        reserva_id
    ) VALUES (
        p_fecha,
        p_vuelo,
        p_asiento,
        CASE WHEN p_empleado = 0 THEN NULL ELSE p_empleado END,
        p_pasajero,
        p_reserva
    );

    DBMS_OUTPUT.PUT_LINE('Boleto registrado exitosamente.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20006, 'El vuelo no existe.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20007, 'Error al registrar el boleto: ' || SQLERRM);
END;
/


-- AUMENTO DE SALARIO
CREATE OR REPLACE PROCEDURE AumentoSalario(
    p_codigo_empleado IN NUMBER,
    p_nuevo_salario IN NUMBER
) AS
    v_salario_actual NUMBER;
BEGIN
    -- Validar que el empleado existe y obtener su salario actual
    SELECT salario INTO v_salario_actual
    FROM empleado
    WHERE id_empleado = p_codigo_empleado;

    -- Verificar que el nuevo salario es mayor que el actual
    IF p_nuevo_salario <= v_salario_actual THEN
        RAISE_APPLICATION_ERROR(-20001, 'El nuevo salario debe ser mayor que el salario actual.');
    END IF;

    -- Actualizar el salario del empleado
    UPDATE empleado
    SET salario = p_nuevo_salario
    WHERE id_empleado = p_codigo_empleado;

    DBMS_OUTPUT.PUT_LINE('Salario actualizado exitosamente.');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'El empleado no existe.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Error al actualizar el salario: ' || SQLERRM);
END;
/



-- CANCELAR RESERVA
CREATE OR REPLACE PROCEDURE CancelarReservacion(
    p_id_reserva IN NUMBER
) AS
    v_estado_reserva VARCHAR2(50);
BEGIN
    -- Validar que la reserva existe y obtener su estado
    SELECT estado INTO v_estado_reserva
    FROM reserva
    WHERE id_reserva = p_id_reserva;

    -- Verificar que la reserva no haya sido cancelada previamente
    IF v_estado_reserva = 'CANCELADA' THEN
        RAISE_APPLICATION_ERROR(-20001, 'La reserva ya ha sido cancelada previamente.');
    END IF;

    -- Actualizar los boletos y asientos asociados para volverlos disponibles
    UPDATE boleto
    SET estado = 'DISPONIBLE'
    WHERE reserva_id = p_id_reserva;

    UPDATE asiento
    SET estado = 'DISPONIBLE'
    WHERE id_asiento IN (
        SELECT asiento_id
        FROM boleto
        WHERE reserva_id = p_id_reserva
    );

    -- Marcar la reserva como cancelada
    UPDATE reserva
    SET estado = 'CANCELADA'
    WHERE id_reserva = p_id_reserva;

    DBMS_OUTPUT.PUT_LINE('La reservación ha sido cancelada exitosamente.');
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'La reserva no existe.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Error al cancelar la reservación: ' || SQLERRM);
END;
/
