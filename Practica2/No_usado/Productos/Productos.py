import pandas as pd # type: ignore

def generar_insert_productos_categorias(input_csv, tabla_productos, tabla_categorias, output_productos, output_categorias):
    # Leer el archivo CSV
    df = pd.read_csv(input_csv, sep=';')

    # Eliminar duplicados de las categorías
    categorias_unicas = df[['id_categoria', 'categoria']].drop_duplicates()

    # Generar INSERT para la tabla Categorias
    columnas_categorias = 'id_categoria, categoria'
    sentencia_categorias = f"INSERT INTO {tabla_categorias} ({columnas_categorias}) VALUES "
    valores_categorias = []
    
    for index, row in categorias_unicas.iterrows():
        id_categoria = row['id_categoria']
        categoria = row['categoria'].replace("'", "''")  # Escapar comillas simples
        valores_categorias.append(f"({id_categoria}, '{categoria}')")
    
    sentencia_categorias += ',\n'.join(valores_categorias) + ";"
    
    # Guardar la sentencia para la tabla Categorias
    with open(output_categorias, 'w') as f_cat:
        f_cat.write(sentencia_categorias)
    
    print(f"Sentencia SQL para Categorias guardada en: {output_categorias}")

    # Generar INSERT para la tabla Productos (sin la columna 'categoria')
    df_productos = df.drop(columns=['categoria'])  # Eliminar la columna 'categoria' para la tabla Productos
    columnas_productos = ', '.join(df_productos.columns)
    sentencia_productos = f"INSERT INTO {tabla_productos} ({columnas_productos}) VALUES "
    valores_productos = []
    
    for index, row in df_productos.iterrows():
        valores = ', '.join([f"'{str(val).replace("'", "''")}'" if isinstance(val, str) else str(val) for val in row])
        valores_productos.append(f"({valores})")
    
    sentencia_productos += ',\n'.join(valores_productos) + ";"
    
    # Guardar la sentencia para la tabla Productos
    with open(output_productos, 'w') as f_prod:
        f_prod.write(sentencia_productos)
    
    print(f"Sentencia SQL para Productos guardada en: {output_productos}")

# Parámetros
generar_insert_productos_categorias(
    'Producto.csv',  # CSV de entrada
    'Productos',      # Nombre de la tabla Productos
    'Categorias',     # Nombre de la tabla Categorias
    'insert_productos.txt',   # Archivo SQL de salida para Productos
    'insert_categorias.txt'   # Archivo SQL de salida para Categorias
)
