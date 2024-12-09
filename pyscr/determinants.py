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

def insert_determinant(det_en):
    """Insert a record into the determinant table."""
    try:
        cursor = connection.cursor()
        query = "INSERT INTO determinant (det_en) VALUES (%s)"
        cursor.execute(query, (det_en,))
        connection.commit()
        det_id = cursor.lastrowid
        return det_id
    except Error as e:
        messagebox.showerror("Insert Error", f"Error inserting into determinant table: {e}")
        return None

def insert_det_agr(det_id, gender, plural, det_fr):
    """Insert a record into the det_agr table."""
    try:
        cursor = connection.cursor()
        query = """
        INSERT INTO det_agr (det_id, gender, plural, det_fr)
        VALUES (%s, %s, %s, %s)
        """
        cursor.execute(query, (det_id, gender, plural, det_fr))
        connection.commit()
    except Error as e:
        messagebox.showerror("Insert Error", f"Error inserting into det_agr table: {e}")

def add_determinant():
    """Handle adding a new determinant and its 4 forms."""
    det_en = det_entry.get().strip()
    if not det_en:
        messagebox.showwarning("Input Error", "Please enter the English determinant.")
        return

    forms = {
        "Masculine": masc_entry.get().strip(),
        "Feminine": fem_entry.get().strip(),
        "Masculine Plural": masc_plural_entry.get().strip(),
        "Feminine Plural": fem_plural_entry.get().strip(),
    }

    # Check if all forms are provided
    if not all(forms.values()):
        messagebox.showwarning("Input Error", "Please fill in all 4 forms of the determinant.")
        return

    det_id = insert_determinant(det_en)
    if not det_id:
        return

    # Insert all 4 forms into det_agr
    gender_plural_map = [
        ("M", False, forms["Masculine"]),
        ("F", False, forms["Feminine"]),
        ("M", True, forms["Masculine Plural"]),
        ("F", True, forms["Feminine Plural"]),
    ]

    for gender, plural, det_fr in gender_plural_map:
        insert_det_agr(det_id, gender, plural, det_fr)

    messagebox.showinfo("Success", f"Determinant '{det_en}' and its forms added successfully.")

# Create the main Tkinter window
root = tk.Tk()
root.title("French Determinant Entry")

connection = connect_to_database()
if not connection:
    root.destroy()

# UI for entering determinant information
tk.Label(root, text="English Determinant:").grid(row=0, column=0, padx=10, pady=5, sticky='e')
det_entry = tk.Entry(root, width=30)
det_entry.grid(row=0, column=1, padx=10, pady=5)

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

tk.Button(root, text="Add Determinant", command=add_determinant).grid(row=6, column=0, columnspan=2, pady=10)

# Run the Tkinter main loop
root.mainloop()

# Close the connection on exit
if connection:
    connection.close()

