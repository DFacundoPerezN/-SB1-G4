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
-- REGISTRAR PASAJEROS
CREATE OR REPLACE PROCEDURE registrar_pasajero (
    p_codigo_pasaporte   IN NUMBER,
    p_nombres            IN VARCHAR2,
    p_apellidos          IN VARCHAR2,
    p_fecha_nacimiento   IN DATE,
    p_correo             IN VARCHAR2,
    p_telefono           IN NUMBER
) AS
    v_nombre_valido      BOOLEAN := TRUE;
    v_apellido_valido    BOOLEAN := TRUE;
    v_correo_valido      BOOLEAN := TRUE;
    v_telefono_valido    BOOLEAN := TRUE;

    -- Expresiones regulares para validaciones
    v_regex_nombre       CONSTANT VARCHAR2(100) := '^[A-Za-z]+$'; -- Solo letras
    v_regex_correo       CONSTANT VARCHAR2(100) := '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$'; -- Formato de correo

BEGIN
    -- Validar nombres
    IF REGEXP_LIKE(p_nombres, v_regex_nombre) THEN
        v_nombre_valido := TRUE;
    ELSE
        v_nombre_valido := FALSE;
        RAISE_APPLICATION_ERROR(-20001, 'El nombre debe contener solo letras.');
    END IF;

    -- Validar apellidos
    IF REGEXP_LIKE(p_apellidos, v_regex_nombre) THEN
        v_apellido_valido := TRUE;
    ELSE
        v_apellido_valido := FALSE;
        RAISE_APPLICATION_ERROR(-20002, 'El apellido debe contener solo letras.');
    END IF;

    -- Validar correo
    IF REGEXP_LIKE(p_correo, v_regex_correo) THEN
        v_correo_valido := TRUE;
    ELSE
        v_correo_valido := FALSE;
        RAISE_APPLICATION_ERROR(-20003, 'El correo electrónico no tiene un formato válido.');
    END IF;

    -- Validar teléfono (obviando código de área)
    IF LENGTH(TO_CHAR(p_telefono)) >= 8 THEN
        v_telefono_valido := TRUE; -- Se asume que el número tiene al menos 7 dígitos
    ELSE
        v_telefono_valido := FALSE;
        RAISE_APPLICATION_ERROR(-20004, 'El número de teléfono debe tener al menos 8 dígitos.');
    END IF;

    -- Insertar el nuevo pasajero en la tabla pasajero
    INSERT INTO pasajero (
        codigo_pasaporte,
        nombres,
        apellidos,
        fecha_nacimiento,
        correo,
        telefono
    ) VALUES (
        p_codigo_pasaporte,
        p_nombres,
        p_apellidos,
        p_fecha_nacimiento,
        p_correo,
        p_telefono
    );

    COMMIT; -- Confirmar la transacción

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; -- Revertir cambios en caso de error
        RAISE; -- Propagar el error
END registrar_pasajero;
/

--ejecutar registro de PuertaEmbarque ( codigo_iata, terminal, listaPuertasEmbarque )
-- EXECUTE RegistrarPasajeros( '1234','Mario','Castillo',TO_DATE('2024-12-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'mariocas@gmail.com', 12345678 );

-- REGISTRAR VUELOS Y TARIFAS
create or replace NONEDITIONABLE PROCEDURE registrar_vuelo (
    p_no_vuelo                  IN INTEGER,
    p_fecha_salida              IN DATE,
    p_fecha_llegada             IN DATE,
    p_estado                    IN VARCHAR2,
    p_avion_matricula           IN INTEGER,
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
    -- Validar que el avión exista y esté disponible
    SELECT COUNT(*) INTO v_existe_avion 
    FROM avion 
    WHERE id_avion = p_avion_matricula AND estado = '0';

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
        avion_id_avion,
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
   INSERT INTO tarifa (vuelo_no_vuelo, clase, precio)
    VALUES ( p_no_vuelo, 'Primera Clase', p_tarifa_primera_clase);

INSERT INTO tarifa ( vuelo_no_vuelo, clase, precio)
VALUES ( p_no_vuelo, 'Clase Ejecutiva', p_tarifa_clase_ejecutiva);

INSERT INTO tarifa ( vuelo_no_vuelo, clase, precio)
VALUES ( p_no_vuelo, 'Clase Económica', p_tarifa_clase_economica);

    COMMIT; -- Confirmar la transacción

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK; -- Revertir cambios en caso de error
        RAISE; -- Propagar el error
END registrar_vuelo;




-- ASIGNAR TRIPULACION
CREATE OR REPLACE PROCEDURE asignar_tripulacion (
    p_codigo_vuelo IN NUMBER,
    p_empleado_id IN NUMBER
) AS
    v_count NUMBER;
    v_aerolinea_id NUMBER;
    v_role VARCHAR2(30);
    v_pilotos_count NUMBER;
    v_servicios_count NUMBER;
BEGIN
    -- Obtener el ID de la aerolínea del vuelo
    SELECT aerolinea_id_aerolinea INTO v_aerolinea_id
    FROM vuelo
    WHERE no_vuelo = p_codigo_vuelo;

    -- Verificar si el empleado ya está asignado a otro vuelo
    SELECT COUNT(*)
    INTO v_count
    FROM tripulacion
    WHERE empleado_id_empleado = p_empleado_id;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El empleado ya está asignado a otro vuelo.');
    END IF;

    -- Obtener el rol del empleado
    SELECT cargo.cargo INTO v_role
    FROM empleado
    JOIN cargo ON empleado.cargo_id_cargo = cargo.id_cargo
    WHERE id_empleado = p_empleado_id;

    -- Verificar si el empleado tiene un rol válido
    IF v_role IN ('Piloto', 'Copiloto') OR v_role IN ('Servidor') THEN

        -- Contar los pilotos y servidores ya asignados a este vuelo
        SELECT COUNT(*)
        INTO v_pilotos_count
        FROM tripulacion t
        JOIN empleado e ON t.empleado_id_empleado = e.id_empleado
        WHERE t.vuelo_no_vuelo = p_codigo_vuelo AND e.cargo_id_cargo IN (SELECT id_cargo FROM cargo WHERE cargo IN ('Piloto', 'Copiloto'));

        SELECT COUNT(*)
        INTO v_servicios_count
        FROM tripulacion t
        JOIN empleado e ON t.empleado_id_empleado = e.id_empleado
        WHERE t.vuelo_no_vuelo = p_codigo_vuelo AND e.cargo_id_cargo IN (SELECT id_cargo FROM cargo WHERE cargo = 'Servidor');

        -- Validar las condiciones mínimas para la tripulación
        IF v_role = 'Piloto' OR v_role = 'Copiloto' THEN
            IF v_pilotos_count >= 2 THEN
                RAISE_APPLICATION_ERROR(-20002, 'Ya se han asignado suficientes pilotos para este vuelo.');
            END IF;
        ELSIF v_role = 'Servidor' THEN
            IF v_servicios_count >= 3 THEN
                RAISE_APPLICATION_ERROR(-20003, 'Ya se han asignado suficientes empleados como servidores para este vuelo.');
            END IF;
        END IF;

        -- Asignar el empleado a la tripulación
        INSERT INTO tripulacion (vuelo_no_vuelo, empleado_id_empleado)
        VALUES (p_codigo_vuelo, p_empleado_id);

        COMMIT;
    ELSE
        RAISE_APPLICATION_ERROR(-20004, 'El empleado no puede ser asignado a la tripulación.');
    END IF;
END;
/



-- COMPRA DE BOLETOS
--ejecutar registro de aerolínea ( codigoaci, nombre, id_ciudad )
BEGIN
    compra_boleto ( TO_DATE('2024-12-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS') , 
                        1, 
                        3,
                        18472,
                        1234, 
                        1);
END;
/
                        
                        
                        
create or replace NONEDITIONABLE PROCEDURE compra_boleto (
    p_fecha               DATE,
    p_vuelo               INTEGER,
    p_asiento             INTEGER,
    p_empleado            INTEGER,
    p_pasajero            INTEGER,
    p_reserva             INTEGER
) AS
    v_boleto_id           INTEGER;
    v_asiento_disponible  INTEGER;
    v_pago_id             INTEGER;
BEGIN
    -- Verificar que el vuelo existe y no haya partido
    SELECT COUNT(*) INTO v_asiento_disponible
    FROM vuelo
    WHERE no_vuelo = p_vuelo
    AND estado != 'partido';

    IF v_asiento_disponible = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El vuelo no existe o ya ha partido.');
    END IF;

    -- Verificar disponibilidad del asiento
    SELECT COUNT(*) INTO v_asiento_disponible
    FROM boleto
    WHERE asientos_id_asientos = p_asiento
    AND vuelo_no_vuelo = p_vuelo
    AND estado = 0;

    IF v_asiento_disponible = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'El asiento no está disponible.');
    END IF;

    -- Registrar el pago (suponiendo que hay un procedimiento o tabla para manejar pagos)
    INSERT INTO pago (id_pago, fecha, metodo)
    VALUES (NULL, p_fecha, 'ventanilla') RETURNING id_pago INTO v_pago_id;

    -- Insertar el nuevo boleto
    INSERT INTO boleto (id_boleto, estado, asientos_id_asientos, vuelo_no_vuelo, 
                        empleado_id_empleado, pasajero_codigo_pasaporte, 
                        reserva_id_reserva, pago_id_pago)
    VALUES (NULL, 'comprado', p_asiento, p_vuelo, p_empleado, 
            p_pasajero, p_reserva, v_pago_id)
    RETURNING id_boleto INTO v_boleto_id;

    -- Actualizar el estado del asiento a no disponible
    UPDATE boleto
    SET estado = 'no disponible'
    WHERE asientos_id_asientos = p_asiento
    AND vuelo_no_vuelo = p_vuelo;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Boleto comprado con éxito. ID Boleto: ' || v_boleto_id);
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20003, 'Error en la compra del boleto: ' || SQLERRM);
END compra_boleto;



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
CREATE OR REPLACE PROCEDURE cancelar_reservacion (
    p_id_reserva IN NUMBER
) AS
BEGIN
    -- Cambiar el estado de todos los boletos relacionados con la reserva a 'Disponible'
    UPDATE boleto
    SET estado = 'Disponible'
    WHERE reserva_id_reserva = p_id_reserva;

    -- Eliminar la reservación
    DELETE FROM reserva
    WHERE id_reserva = p_id_reserva;

    -- (Opcional) Si deseas manejar la cancelación de otros elementos, puedes agregar más lógica aquí.

    COMMIT;  -- Confirmar los cambios realizados
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;  -- Revertir en caso de error
        RAISE;  -- Lanzar la excepción para manejo externo
END cancelar_reservacion;
/