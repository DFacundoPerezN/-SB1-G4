import pandas as pd # type: ignore

# Mapa de países a sus IDs
paises_ids = {
    'Estados Unidos': 1,
    'Inglaterra': 2,
    'Alemania': 3,
    'Francia': 4,
    'Polonia': 5,
    'Chile': 6,
    'Rusia': 7,
    'Australia': 8,
    'Canada': 9,
    'Japon': 10,
    'China': 11,
}

def generar_inserts(input_csv, output_ordenes, output_vendedores):
    # Leer el archivo CSV
    df = pd.read_csv(input_csv, sep=';')  # Asegúrate de que el separador sea el correcto
    

    # Generar INSERT para la tabla Ordenes
    columnas_ordenes = ', '.join(['id_orden', 'linea_orden', 'fecha_orden', 'id_cliente', 'id_vendedor', 'id_producto', 'cantidad'])
    sentencia_ordenes = f"INSERT INTO Ordenes ({columnas_ordenes}) VALUES "
    valores_ordenes = []

    for index, row in df.iterrows():
        valores = ', '.join([str(row['id_orden']), str(row['linea_orden']), f"'{row['fecha_orden']}'", str(row['id_cliente']), str(row['id_vendedor']), str(row['id_producto']), str(row['cantidad'])])
        valores_ordenes.append(f"({valores})")
    
    sentencia_ordenes += ',\n'.join(valores_ordenes) + ";"
    
    # Guardar la sentencia para la tabla Ordenes
    with open(output_ordenes, 'w') as f_orden:
        f_orden.write(sentencia_ordenes)
    
    print(f"Sentencia SQL para Ordenes guardada en: {output_ordenes}")

    # Generar INSERT para la tabla Vendedores
    df_vendedores = df[['id_vendedor', 'nombre_vendedor', 'pais_vendedor']].drop_duplicates().reset_index(drop=True)
    df_vendedores['id_pais'] = (df_vendedores['pais_vendedor'].map(paises_ids))

    columnas_vendedores = 'id_vendedor, nombre_vendedor, id_pais'
    sentencia_vendedores = f"INSERT INTO Vendedores ({columnas_vendedores}) VALUES "
    valores_vendedores = []

    for index, row in df_vendedores.iterrows():
        if row['id_pais'] is not None:  # Asegurarse de que el país esté en el mapa
            nombre_vendedor = row['nombre_vendedor'].replace("'", "''")  # Escapar comillas simples
            valores_vendedores.append(f"({row['id_vendedor']}, '{nombre_vendedor}', {row['id_pais']})")
    
    sentencia_vendedores += ',\n'.join(valores_vendedores) + ";"
    
    # Guardar la sentencia para la tabla Vendedores
    with open(output_vendedores, 'w') as f_vendedor:
        f_vendedor.write(sentencia_vendedores)
    
    print(f"Sentencia SQL para Vendedores guardada en: {output_vendedores}")

# Parámetros
generar_inserts('Orden.csv', 'insert_ordenes.txt', 'insert_vendedores.txt')
