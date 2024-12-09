French Learning Database

Before starting, ensure you have the following installed on your system:
   Node.js (for the React frontend)
   Python 3.8+ (for the Django backend)
   MySQL (for the database)
   pip (Python package manager)

Setup Instructions

1. Set Up the MySQL DATABASE
       mysql -u root -p
       CREATE DATABASE langu;
       mysql -u root -p langu < db_scripts/full_dump.sql

2. Set Up the Django Backend
     cd langu
     pip install -r ../requirements.txt

3. Set Up the React Frontend
     cd ../frontend
     npm install

4. Run the Project
     cd ../langu
     python manage.py runserver
     cd ../frontend
     npm run dev

5. Use application
     Go to 127.0.0.1:5173/ in order to use the application
     (I have not made the CSS adaptive so I hope it looks okay on your computer)
