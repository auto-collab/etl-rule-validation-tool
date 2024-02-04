import sqlparse
import pyodbc
# from database.DatabaseManager import DatabaseManager

# if __name__ == "__main__":
#     # Example usage
#     sql_file = "rules/SQLQuery1.sql"
#     server_name = "MC-COMPUTER"
#     database_name = "superhero"
#
#     manager = DatabaseManager(sql_file, server_name, database_name)
#     manager.execute_sql_file()


# Open and read the file as a single buffer
fd = open('rules/SQLQuery1.sql', 'r')
sqlFile = fd.read()
fd.close()

# Save queries into a list
sqlCommands = sqlFile.split(';')

for command in sqlCommands:
    queries = sqlparse.format(command)
    print(queries)


# Establish a connection
connection = pyodbc.connect(
    "Driver={ODBC Driver 18 for SQL Server};"
    "Server=MC-COMPUTER, 1433;"
    "Database=superhero;"
    "Uid=DockerUser;"
    "Pwd=DockerTest123;"
    "TrustServerCertificate=no;"
    # "Trusted_Connection=yes;"
    # "User Id=DockerUser;"
    # "Password=DockerTest123;"
    "Encrypt=no;"
)

# Create a cursor
cursor = connection.cursor()

for sql in sqlCommands:
    cursor.execute(sql)

    # Fetch and process results
    rows = cursor.fetchall()
    for row in rows:
        print(row)

# Close the cursor and connection
cursor.close()
connection.close()
