-- VER LOS TRIGGERS DE LA BASE DE DATOS
SELECT trigger_name
FROM user_triggers
WHERE table_name = 'PUERTA_EMBARQUE';


-- 3. REGISTRAR PUERTAS DE EMBARQUE
CREATE OR REPLACE TRIGGER trg_puerta_embarque_check
BEFORE INSERT ON puerta_embarque
FOR EACH ROW
DECLARE
    v_aeropuerto_exists INTEGER;
    v_terminal_exists INTEGER;
BEGIN
    -- Verificar si el aeropuerto asociado a la terminal existe
    SELECT COUNT(*)
    INTO v_aeropuerto_exists
    FROM aeropuerto
    WHERE codigo_iata = (SELECT aeropuerto_codigo_iata 
                         FROM terminal 
                         WHERE id_terminal = :NEW.terminal_id_terminal);
                         
    IF v_aeropuerto_exists = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error: El aeropuerto no existe.');
    END IF;

    -- Verificar si la terminal existe
    SELECT COUNT(*)
    INTO v_terminal_exists
    FROM terminal
    WHERE id_terminal = :NEW.terminal_id_terminal;
    
    -- Si la terminal no existe, crearla
    IF v_terminal_exists = 0 THEN
        INSERT INTO terminal (id_terminal, aeropuerto_codigo_iata)
        VALUES (:NEW.terminal_id_terminal, :NEW.terminal_id_terminal);
    END IF;
    
END;
/
