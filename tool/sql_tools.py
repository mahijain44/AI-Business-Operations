
from database.connection import execute_query


def run_sql_query(query):
    return execute_query(query)


result = run_sql_query(
    "SELECT product_name, price FROM products"
)

print(result)