from database.DatabaseConnector import DatabaseConnector
from sql.SQLExecutor import SQLExecutor
from sql.SQLFileReader import SQLFileReader
from sql.SQLParser import SQLParser


class DatabaseManager:
    def __init__(self, sql_file, server, database):
        try:
            self.sql_file_reader = SQLFileReader(sql_file)
            self.sql_parser = SQLParser()
            self.database_connector = DatabaseConnector(server, database)
            self.connection = self.database_connector.establish_connection()
            self.sql_executor = SQLExecutor(self.connection.cursor())
        except Exception as e:
            print(f"Error during DatabaseManager initialization: {e}")
            raise

    def execute_sql_file(self):
        sql_file_content = self.sql_file_reader.read_file()
        sql_commands = sql_file_content.split(";")
        formatted_queries = self.sql_parser.format_commands(sql_commands)

        self.sql_executor.execute_queries(formatted_queries)
        # Close the cursor and connection
        self.sql_executor.cursor.close()
        self.connection.close()
