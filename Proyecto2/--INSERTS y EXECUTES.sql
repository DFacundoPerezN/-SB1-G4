--INSERTS y EXECUTES

--Ingresar paises
INSERT INTO ciudad (id_ciudad, nombre, pais) values ( 1, 'Tijuana', 'Mexico' );
INSERT INTO ciudad (id_ciudad, nombre, pais) values ( 2, 'California', 'Estados Unidos' );
INSERT INTO ciudad (id_ciudad, nombre, pais) values ( 3, 'Bogota', 'Colombia' );

SELECT * FROM aerolinea;

--ejecutar registro de aerolínea ( codigoaci, nombre, id_ciudad )
EXECUTE RegistrarAerolinea('AL1256', 'Rapido', 1);

--ejecutar registro de aeropuerto ( codigo_iata, nombre, direccion, pista_extendida, servicio_aduanero, id_ciudad )
EXECUTE RegistroAeropuerto('GT001','Todo Mundo','zona 10','1','1',1);
EXECUTE RegistroAeropuerto('USA244','Vuelo99','Arizona 33-2','1','1',2);

--ejecutar registro de PuertaEmbarque ( codigo_iata, terminal, listaPuertasEmbarque )
EXECUTE PuertaEmbarque( 'GT001' , '1' , 'Pe01,Pe02,Pe03');

--PROCEDIMIENTO PARA REGISTRAR AVION(matricula, modelo, capacidad, estado, alcance, aerolinea, A.Primera_clase, A.clase_ejecutaiva, A.clase_economica )
EXECUTE RegistraAvion( 'XL418', 'Toyota', 90, '0', 40, 3, 30,30,30 );

--PROCEDIMIENTO PARA REGISTRAR AVION(matricula, modelo, capacidad, estado, alcance, aerolinea, A.Primera_clase, A.clase_ejecutaiva, A.clase_economica )
EXECUTE RegistraAvion( 'XL418', 'Toyota', 90, '0', 40, 3, 30,30,30 );

--PROCEDIMIENTO PARA REGISTRA LAS RUTAS ( tiempovuelo, distancia, origen, destino )
EXECUTE RegistrarRutas( 4005, '10052' , 3 , 2  );