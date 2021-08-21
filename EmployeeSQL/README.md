SQL-CHALLENGE:

ERD image is found in /Images folder.  URL: https://app.quickdatabasediagrams.com/#/d/mh84ZS

BONUS CHALLENGE WAS ALSO COMPLETED. DB Password hidden by requiring user to have a DATABASE_URL environment variable set for the user's own database as explained below.

Necessary Setup 2 steps:
1.  The 'data/' folder contains the 6 .csv files containing data for the 6 tables.
    In 'schema.sql' there are 6 'COPY' command sections at the end of the file that need updating so that the correct 'data/' folder is used in the import.  The SQL 'copy' command only uses full paths, so anyone attempting to run the schema.sql needs to update the full path of these supporting files with the user's own full path to those files:

Here is one example of the 6 copy command sections that need updating in the 'schema.sql' file:  you will need to update the full path of the location where the Data/ files reside on your laptop.  Update the 6 'FROM' lines for successful import:
COPY titles(title_id, title)
FROM '/Users/henrytirado/git/usc_homework/sql-challenge/EmployeeSQL/Data/titles.csv'
DELIMITER ','
CSV HEADER;

2. For the bonus work, the Jupyter Notebook references a database URL that needs to be defined in the user's environment.  So you will need to set DATABASE_URL environment variable in your environment where you launch Jupyter notebook.  Here is what the line would look like in a .zshrc file for Mac. Substitute your db user name, your db password, and the db that you will use to import the tables.

export DATABASE_URL="postgresql://<your db username>:<your db password>@localhost:5432/<your db>"

========================================================
1. SCHEMA.SQL:
This SQL query will create tables in order:  titles, employees, departments, dept_manager, dept_emp, salaries.  That is because employees table has a foreign key dependency on titles, and dept_manager and dept_emp both have foreign key dependencies on employees and departments tables.  salaries table has a foreign key dependency on employees table.  For this same reason, the dropping of the tables employees, departments, and titles require a 'CASCADE' directive to get rid of dependent tables/keys when dropping those principle tables.

2. QUERIES.SQL:
These queries are straightforward.  Special consideration was taken for the hire_date and birth_date columns in employees table.  I marked these as type 'date' which meant that in some queries I had to use date-specific functions to choose the year (ie, EXTRACT) for comparison.  I used LEFT JOINs when doing multiple table joins to keep data from merges that had already happened.

3. BONUS (Jupyter Notebook):
- I had to import sqlalchemy libraries
- performed a command line installation of psycopg2 (pip install psycopg2-binary)
- As mentioned above, expectation is that the user define DATABASE_URL as an environment variable

Epilogue: the employee ID 499942 is for a person named April Foolsday.  Hence, the data was in fact an April Fool's Day joke.
