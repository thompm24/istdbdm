import mysql.connector





# Establish the connection
try:
    connection = mysql.connector.connect(
        host="localhost",        # Replace with your MySQL host
        user="your_username",    # Replace with your MySQL username
        password="your_password", # Replace with your MySQL password
        database="your_database" # Replace with your target database
    )
    if connection.is_connected():
        print("Connection successful!")

except mysql.connector.Error as err:
    print(f"Error: {err}")
    exit()

# Insert data into the database
try:
    # Create a cursor object
    cursor = connection.cursor()

    # Your SQL INSERT query
    query = "INSERT INTO your_table (column1, column2, column3) VALUES (%s, %s, %s)"
    values = ("value1", "value2", "value3")  # Replace with your actual values

    # Execute the query
    cursor.execute(query, values)

    # Commit the changes
    connection.commit()
    print(f"Inserted {cursor.rowcount} row(s) into the table.")

except mysql.connector.Error as err:
    print(f"Error while inserting data: {err}")

finally:
    # Close the connection
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("Connection closed.")

