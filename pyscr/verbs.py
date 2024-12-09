import mysql.connector
from mysql.connector import Error
import tkinter as tk
from tkinter import ttk
from tkinter import messagebox

def insert_conjugations_gui(verb_id):
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='langu',
            user='mark',
            password='password'
        )

        if connection.is_connected():
            # Assume we have 8 subjects and 6 tenses
            subj = [("I", "je"), ("you", "tu"), ("he", "il"), ("she", "elle"), 
                    ("we", "nous"), ("you (plural)", "vous"), ("they (masc.)", "ils"), 
                    ("they (fem.)", "elles")]
            num_subjects = len(subj)

            tense = ["present", "passé composé", "imparfait", "futur proche", "futur simple", "conditionnel"]
            num_tenses = len(tense)

            # Create the main window
            root = tk.Tk()
            root.title("Conjugation Input")

            # Create a Notebook widget for tabs
            notebook = ttk.Notebook(root)
            notebook.pack(expand=1, fill='both')

            # Dictionary to store Entry widgets
            entries = {}

            # Create a tab for each tense
            for tense_id in range(num_tenses):
                frame = ttk.Frame(notebook)
                notebook.add(frame, text=tense[tense_id])

                # Create table headers
                header_eng = tk.Label(frame, text="English Conjugation", font=('Arial', 12, 'bold'))
                header_fr = tk.Label(frame, text="French Conjugation", font=('Arial', 12, 'bold'))
                header_eng.grid(row=0, column=2, padx=5, pady=5)
                header_fr.grid(row=0, column=3, padx=5, pady=5)

                # For each subject, create labels and entry fields
                for subj_id in range(num_subjects):
                    # Subject labels
                    label_eng = tk.Label(frame, text=subj[subj_id][0], font=('Arial', 10))
                    label_eng.grid(row=subj_id+1, column=0, padx=5, pady=5, sticky='e')

                    # English conjugation entry
                    eng_entry = tk.Entry(frame, width=30)
                    eng_entry.grid(row=subj_id+1, column=2, padx=5, pady=5)
                    
                    label_fr = tk.Label(frame, text=subj[subj_id][1], font=('Arial', 10, 'italic'))
                    label_fr.grid(row=subj_id+1, column=1, padx=5, pady=5, sticky='e')
                    # French conjugation entry
                    fr_entry = tk.Entry(frame, width=30)
                    fr_entry.grid(row=subj_id+1, column=3, padx=5, pady=5)

                    # Store entries for later retrieval
                    entries[(tense_id, subj_id)] = (eng_entry, fr_entry)

            # Submit button
            def submit():
                try:
                    cursor = connection.cursor()
                    conjugations = []

                    for tense_id in range(num_tenses):
                        for subj_id in range(num_subjects):
                            eng_conj = entries[(tense_id, subj_id)][0].get().strip()
                            fr_conj = entries[(tense_id, subj_id)][1].get().strip()

                            if not eng_conj or not fr_conj:
                                raise ValueError(f"Empty conjugation at tense '{tense[tense_id]}', subject '{subj[subj_id][0]}'.")

                            # Adjusted subj_id and tense_id to match your database IDs
                            conjugations.append((verb_id, subj_id+1, tense_id+1, eng_conj, fr_conj))

                    # SQL query to insert data into 'conj' table
                    insert_query = """
                        INSERT INTO conj (verb_id, subj_id, tense_id, eng_conj, fr_conj)
                        VALUES (%s, %s, %s, %s, %s)
                    """

                    cursor.executemany(insert_query, conjugations)
                    connection.commit()

                    messagebox.showinfo("Success", "Conjugations inserted successfully.")
                    root.destroy()

                except ValueError as ve:
                    messagebox.showerror("Input Error", str(ve))
                except Error as e:
                    messagebox.showerror("Database Error", f"Error: {e}")

            submit_button = tk.Button(root, text="Submit", command=submit, bg='green', fg='white', font=('Arial', 12))
            submit_button.pack(pady=10)

            root.mainloop()

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection.is_connected():
            connection.close()




def insert_verb(eng_inf, fr_inf, group, verb_type, chapter):
    try:
        # Establish a database connection
        connection = mysql.connector.connect(
            host='localhost',         # Replace with your host
            database='langu', # Replace with your database name
            user='mark',     # Replace with your username
            password='password'  # Replace with your password
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # SQL query to insert data into 'verb' table
            insert_query = """
                INSERT INTO verb (eng_inf, fr_inf, `group`, type, chapter)
                VALUES (%s, %s, %s, %s, %s)
            """
            data_tuple = (eng_inf, fr_inf, group, verb_type, chapter)

            cursor.execute(insert_query, data_tuple)
            connection.commit()

            # Get the ID of the inserted verb
            verb_id = cursor.lastrowid
            print(f"Verb inserted successfully with verb_id = {verb_id}")

            return verb_id

    except Error as e:
        print(f"Error: {e}")
        return None

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

def insert_conjugations(verb_id):
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='langu',
            user='mark',
            password='password'
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # List to store conjugation data
            conjugations = []

            # Assume we have 8 subjects and 6 tenses
            num_subjects = 8
            subj = [("I", "je"), ("you", "tu"), ("he", "il"), ("she", "elle"), ("we", "nous"), ("yiz", "vous"), ("theym", "ils"), ("theyf", "elles")]
            num_tenses = 6
            tense = ["present", "passé composé", "imparfait", "future proche", "future simple", "conditionelle"]


            # Collect conjugation data
            for tense_id in range(0, num_tenses):
                print(tense[tense_id])
                for subj_id in range(0, num_subjects):
                    eng_conj = input(f"\t{subj[subj_id][0]} ")
                    fr_conj = input(f"\t{subj[subj_id][1]} ")
                    conjugations.append((verb_id, subj_id, tense_id, eng_conj, fr_conj))

            # SQL query to insert data into 'conj' table
            insert_query = """
                INSERT INTO conj (verb_id, subj_id, tense_id, eng_conj, fr_conj)
                VALUES (%s, %s, %s, %s, %s)
            """

            cursor.executemany(insert_query, conjugations)
            connection.commit()

            print("Conjugations inserted successfully.")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    # Collect verb data from the user
    eng_inf = input("Enter the English infinitive: ").strip()
    fr_inf = input("Enter the French infinitive: ").strip()
    group = input("Enter the verb group (1, 2, or 3): ").strip()
    verb_type = input("What type of verb is this?: ").strip()
    chapter = input("What chapter does this appear in?: ").strip()

    # Insert verb data into the database
    verb_id = insert_verb(eng_inf, fr_inf, group, verb_type, chapter)

    if verb_id:
        # Insert conjugation data
        insert_conjugations_gui(verb_id)

