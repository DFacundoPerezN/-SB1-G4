import pandas as pd # type: ignore

def generar_insert_clientes_paises(input_csv, tabla_clientes, tabla_paises, output_clientes, output_paises):
    # Leer el archivo CSV
    df = pd.read_csv(input_csv, sep=';')

    # Eliminar duplicados de los países y crear un DataFrame
    paises_unicos = df[['pais']].drop_duplicates().reset_index(drop=True)
    paises_unicos['id_pais'] = paises_unicos.index + 1  # Crear un id_pais secuencial

    # Generar INSERT para la tabla Paises
    columnas_paises = 'id_pais, pais'
    sentencia_paises = f"INSERT INTO {tabla_paises} ({columnas_paises}) VALUES "
    valores_paises = []

    for index, row in paises_unicos.iterrows():
        pais = row['pais'].replace("'", "''")  # Escapar comillas simples
        id_pais = row['id_pais']
        valores_paises.append(f"({id_pais}, '{pais}')")
    
    sentencia_paises += ',\n'.join(valores_paises) + ";"
    
    # Guardar la sentencia para la tabla Paises
    with open(output_paises, 'w') as f_pais:
        f_pais.write(sentencia_paises)
    
    print(f"Sentencia SQL para Paises guardada en: {output_paises}")

    # Generar INSERT para la tabla Clientes (reemplazando el nombre del país con id_pais)
    df_clientes = df.copy()
    # Reemplazar el país en el DataFrame original por su correspondiente id_pais
    df_clientes = df_clientes.merge(paises_unicos[['pais', 'id_pais']], on='pais', how='left')
    df_clientes = df_clientes.drop(columns=['pais'])  # Eliminar la columna 'pais'

    # Reorganizar las columnas
    columnas_clientes = ', '.join(df_clientes.columns)
    sentencia_clientes = f"INSERT INTO {tabla_clientes} ({columnas_clientes}) VALUES "
    valores_clientes = []

    for index, row in df_clientes.iterrows():
        valores = ', '.join([f"'{str(val).replace("'", "''")}'" if isinstance(val, str) else str(val) for val in row])
        valores_clientes.append(f"({valores})")
    
    sentencia_clientes += ',\n'.join(valores_clientes) + ";"
    
    # Guardar la sentencia para la tabla Clientes
    with open(output_clientes, 'w') as f_client:
        f_client.write(sentencia_clientes)
    
    print(f"Sentencia SQL para Clientes guardada en: {output_clientes}")

# Parámetros
generar_insert_clientes_paises(
    'Cliente.csv',  # CSV de entrada
    'Clientes',     # Nombre de la tabla Clientes
    'Paises',       # Nombre de la tabla Paises
    'insert_clientes.txt',   # Archivo SQL de salida para Clientes
    'insert_paises.txt'      # Archivo SQL de salida para Paises
)
