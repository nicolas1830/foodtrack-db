import pyodbc

# Datos de conexión
server = "127.0.0.1,1433"
database = "foodtrack_db"
username = "dbeaver_user"
password = "110897Nca"

# Conexión a SQL Server
connection_string = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    f"SERVER={server};"
    f"DATABASE={database};"
    f"UID={username};"
    f"PWD={password};"
    "TrustServerCertificate=yes;"
)

try:
    conn = pyodbc.connect(connection_string)

    print("Conexión exitosa a SQL Server.")
    print(f"Base de datos: {database}")

    conn.close()

except pyodbc.Error as error:
    print("Error al conectar con SQL Server:")
    print(error)