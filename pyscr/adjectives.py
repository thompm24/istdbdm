import tkinter as tk
from tkinter import messagebox
import mysql.connector
from mysql.connector import Error

def connect_to_database():
    """Establish a connection to the database."""
    try:
        connection = mysql.connector.connect(
            host='localhost',  # Change as per your MySQL host
            user='mark',       # Change to your MySQL username
            password='password',  # Change to your MySQL password
            database='langu'  # Change to your database name
        )
        return connection
    except Error as e:
        messagebox.showerror("Database Error", f"Error connecting to the database: {e}")
        return None

def insert_adj(adj_en):
    """Insert a record into the adj table."""
    try:
        cursor = connection.cursor()
        query = "INSERT INTO adj (adj_en) VALUES (%s)"
        cursor.execute(query, (adj_en,))
        connection.commit()
        adj_id = cursor.lastrowid
        return adj_id
    except Error as e:
        messagebox.showerror("Insert Error", f"Error inserting into adj table: {e}")
        return None

def insert_adj_agr(adj_id, gender, plural, adj_fr):
    """Insert a record into the adj_agr table."""
    try:
        cursor = connection.cursor()
        query = """
        INSERT INTO adj_agr (adj_id, gender, plural, adj_fr)
        VALUES (%s, %s, %s, %s)
        """
        cursor.execute(query, (adj_id, gender, plural, adj_fr))
        connection.commit()
    except Error as e:
        messagebox.showerror("Insert Error", f"Error inserting into adj_agr table: {e}")

def add_adjective():
    """Handle adding a new adjective and its 4 forms."""
    adj_en = adj_entry.get().strip()
    if not adj_en:
        messagebox.showwarning("Input Error", "Please enter the English adjective.")
        return

    forms = {
        "Masculine": masc_entry.get().strip(),
        "Feminine": fem_entry.get().strip(),
        "Masculine Plural": masc_plural_entry.get().strip(),
        "Feminine Plural": fem_plural_entry.get().strip(),
    }

    # Check if all forms are provided
    if not all(forms.values()):
        messagebox.showwarning("Input Error", "Please fill in all 4 forms of the adjective.")
        return

    adj_id = insert_adj(adj_en)
    if not adj_id:
        return

    # Insert all 4 forms into adj_agr
    gender_plural_map = [
        ("M", False, forms["Masculine"]),
        ("F", False, forms["Feminine"]),
        ("M", True, forms["Masculine Plural"]),
        ("F", True, forms["Feminine Plural"]),
    ]

    for gender, plural, adj_fr in gender_plural_map:
        insert_adj_agr(adj_id, gender, plural, adj_fr)

    messagebox.showinfo("Success", f"Adjective '{adj_en}' and its forms added successfully.")

# Create the main Tkinter window
root = tk.Tk()
root.title("French Adjective Entry")

connection = connect_to_database()
if not connection:
    root.destroy()

# UI for entering adjective information
tk.Label(root, text="English Adjective:").grid(row=0, column=0, padx=10, pady=5, sticky='e')
adj_entry = tk.Entry(root, width=30)
adj_entry.grid(row=0, column=1, padx=10, pady=5)

tk.Label(root, text="French Forms:").grid(row=1, column=0, padx=10, pady=5, sticky='w')

tk.Label(root, text="Masculine:").grid(row=2, column=0, padx=10, pady=5, sticky='e')
masc_entry = tk.Entry(root, width=30)
masc_entry.grid(row=2, column=1, padx=10, pady=5)

tk.Label(root, text="Feminine:").grid(row=3, column=0, padx=10, pady=5, sticky='e')
fem_entry = tk.Entry(root, width=30)
fem_entry.grid(row=3, column=1, padx=10, pady=5)

tk.Label(root, text="Masculine Plural:").grid(row=4, column=0, padx=10, pady=5, sticky='e')
masc_plural_entry = tk.Entry(root, width=30)
masc_plural_entry.grid(row=4, column=1, padx=10, pady=5)

tk.Label(root, text="Feminine Plural:").grid(row=5, column=0, padx=10, pady=5, sticky='e')
fem_plural_entry = tk.Entry(root, width=30)
fem_plural_entry.grid(row=5, column=1, padx=10, pady=5)

tk.Button(root, text="Add Adjective", command=add_adjective).grid(row=6, column=0, columnspan=2, pady=10)

# Run the Tkinter main loop
root.mainloop()

# Close the connection on exit
if connection:
    connection.close()

