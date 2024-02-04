class SQLExecutor:
    def __init__(self, cursor):
        self.cursor = cursor

    def execute_queries(self, queries):
        for query in queries:
            self.cursor.execute(query)
            rows = self.cursor.fetchall()
            for row in rows:
                print(row)
