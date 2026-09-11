import mysql.connector


def get_connection():
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Prakashrenu**90",
        database="business_operations"
    )

    return connection
def execute_query(query):
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    cursor.execute(query)
    result = cursor.fetchall()

    cursor.close()
    connection.close()

    return result

connection = get_connection()

print("Connected to MySQL!")

connection.close()
# result = execute_query(
#     "SELECT * FROM products"
# )

# print(result)