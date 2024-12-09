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

def insert_noun(noun_fr, noun_en, gender, plural, is_countable, is_animate, can_be_agent, can_be_patient, is_location):
    """Insert a record into the noun table."""
    try:
        cursor = connection.cursor()
        query = """
        INSERT INTO noun (noun_fr, noun_english, gender, plural, is_countable, is_animate, can_be_agent, can_be_patient, is_location)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(query, (noun_fr, noun_en, gender, plural, is_countable, is_animate, can_be_agent, can_be_patient, is_location))
        connection.commit()
        noun_id = cursor.lastrowid
        return noun_id
    except Error as e:
        messagebox.showerror("Insert Error", f"Error inserting into noun table: {e}")
        return None

def add_noun():
    """Handle adding a new noun."""
    noun_en = noun_en_entry.get().strip()
    noun_fr = noun_fr_entry.get().strip()
    gender = gender_var.get()
    plural = plural_var.get()

    if not noun_en or not noun_fr or gender == "Select Gender" or plural == "Select Plural":
        messagebox.showwarning("Input Error", "Please fill in all fields and select gender and plural options.")
        return

    is_countable = 1 if countable_var.get() else 0
    is_animate = 1 if animate_var.get() else 0
    can_be_agent = 1 if agent_var.get() else 0
    can_be_patient = 1 if patient_var.get() else 0
    is_location = 1 if location_var.get() else 0
    plural_value = 1 if plural == "Yes" else 0

    noun_id = insert_noun(noun_fr, noun_en, gender, plural_value, is_countable, is_animate, can_be_agent, can_be_patient, is_location)
    if noun_id:
        messagebox.showinfo("Success", f"Noun '{noun_en}' ('{noun_fr}') added successfully.")

# Create the main Tkinter window
root = tk.Tk()
root.title("French Noun Entry")

connection = connect_to_database()
if not connection:
    root.destroy()

# UI for entering noun information
tk.Label(root, text="English Noun:").grid(row=0, column=0, padx=10, pady=5, sticky='e')
noun_en_entry = tk.Entry(root, width=30)
noun_en_entry.grid(row=0, column=1, padx=10, pady=5)

tk.Label(root, text="French Noun:").grid(row=1, column=0, padx=10, pady=5, sticky='e')
noun_fr_entry = tk.Entry(root, width=30)
noun_fr_entry.grid(row=1, column=1, padx=10, pady=5)

tk.Label(root, text="Gender:").grid(row=2, column=0, padx=10, pady=5, sticky='e')
gender_var = tk.StringVar(value="Select Gender")
gender_menu = tk.OptionMenu(root, gender_var, "M", "F", "N")
gender_menu.grid(row=2, column=1, padx=10, pady=5, sticky='w')

tk.Label(root, text="Plural:").grid(row=3, column=0, padx=10, pady=5, sticky='e')
plural_var = tk.StringVar(value="Select Plural")
plural_menu = tk.OptionMenu(root, plural_var, "Yes", "No")
plural_menu.grid(row=3, column=1, padx=10, pady=5, sticky='w')

# Additional boolean attributes
countable_var = tk.IntVar()
tk.Checkbutton(root, text="Countable", variable=countable_var).grid(row=4, column=0, columnspan=2, sticky='w')

animate_var = tk.IntVar()
tk.Checkbutton(root, text="Animate", variable=animate_var).grid(row=5, column=0, columnspan=2, sticky='w')

agent_var = tk.IntVar()
tk.Checkbutton(root, text="Can Be Agent", variable=agent_var).grid(row=6, column=0, columnspan=2, sticky='w')

patient_var = tk.IntVar()
tk.Checkbutton(root, text="Can Be Patient", variable=patient_var).grid(row=7, column=0, columnspan=2, sticky='w')

location_var = tk.IntVar()
tk.Checkbutton(root, text="Is Location", variable=location_var).grid(row=8, column=0, columnspan=2, sticky='w')

tk.Button(root, text="Add Noun", command=add_noun).grid(row=9, column=0, columnspan=2, pady=10)

# Run the Tkinter main loop
root.mainloop()

# Close the connection on exit
if connection:
    connection.close()

