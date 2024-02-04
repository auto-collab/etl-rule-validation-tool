import pyodbc


class DatabaseConnector:
    def __init__(self, server, database):
        self.server = server
        self.database = database

    def establish_connection(self):
        connection_string = (
            f"Driver={{SQL Server}};"
            f"Server={self.server};"
            f"Database={self.database};"
            "Integrated Secrity=SSPI;"
        )
        return pyodbc.connect(connection_string)
