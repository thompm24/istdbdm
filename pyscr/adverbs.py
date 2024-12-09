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

def insert_adv(adv_fr, adv_en, adv_type):
    """Insert a record into the adv table."""
    try:
        cursor = connection.cursor()
        query = "INSERT INTO adv (adv_fr, adv_en, `type`) VALUES (%s, %s, %s)"
        cursor.execute(query, (adv_fr, adv_en, adv_type))
        connection.commit()
        adv_id = cursor.lastrowid
        return adv_id
    except Error as e:
        messagebox.showerror("Insert Error", f"Error inserting into adv table: {e}")
        return None

def add_adverb():
    """Handle adding a new adverb."""
    adv_en = adv_en_entry.get().strip()
    adv_fr = adv_fr_entry.get().strip()
    adv_type = adv_type_var.get()

    if not adv_en or not adv_fr or adv_type == "Select Type":
        messagebox.showwarning("Input Error", "Please fill in all fields and select a type.")
        return

    adv_id = insert_adv(adv_fr, adv_en, adv_type)
    if adv_id:
        messagebox.showinfo("Success", f"Adverb '{adv_en}' ('{adv_fr}') added successfully.")

# Create the main Tkinter window
root = tk.Tk()
root.title("French Adverb Entry")

connection = connect_to_database()
if not connection:
    root.destroy()

# UI for entering adverb information
tk.Label(root, text="English Adverb:").grid(row=0, column=0, padx=10, pady=5, sticky='e')
adv_en_entry = tk.Entry(root, width=30)
adv_en_entry.grid(row=0, column=1, padx=10, pady=5)

tk.Label(root, text="French Adverb:").grid(row=1, column=0, padx=10, pady=5, sticky='e')
adv_fr_entry = tk.Entry(root, width=30)
adv_fr_entry.grid(row=1, column=1, padx=10, pady=5)

tk.Label(root, text="Type:").grid(row=2, column=0, padx=10, pady=5, sticky='e')
adv_type_var = tk.StringVar(value="Select Type")
adv_type_menu = tk.OptionMenu(root, adv_type_var, "manner", "time", "place", "degree", "frequency", "negation")
adv_type_menu.grid(row=2, column=1, padx=10, pady=5, sticky='w')

tk.Button(root, text="Add Adverb", command=add_adverb).grid(row=3, column=0, columnspan=2, pady=10)

# Run the Tkinter main loop
root.mainloop()

# Close the connection on exit
if connection:
    connection.close()

