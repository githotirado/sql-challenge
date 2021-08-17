SQL-CHALLENGE:

ERD diagram: https://app.quickdatabasediagrams.com/#/d/mh84ZS
Also located in /Images folder.

Necessary Setup: the schema.sql file drops and creates the necessary tables in the right order (tables with primary keys first, tables with foreign keys last), but it also contains 6 'copy' commands at the end of the file allowing the SQL to import the necessary .csv files.  To run schema.sql, one will need to change the author's home directory location of those supporting files with the user's own full path to those files.  

Here is one example of the 6 copy sections that need updating.  In the FROM line you will need to update the full path of the loation where the Data/ files reside on your laptop.  Update for the 6 COPY sections:
COPY titles(title_id, title)
FROM '/Users/henrytirado/git/usc_homework/sql-challenge/EmployeeSQL/Data/titles.csv'
DELIMITER ','
CSV HEADER;

The 'copy' command expects full path to each file imported.  Each file requires mentioning the delimiter as well as the presence of a header row.

1. SCHEMA.SQL:
This SQL query will create tables in order:  titles, employees, departments, dept_manager, dept_emp, salaries.  That is because employees table has a foreign key dependency on titles, and dept_manager and dept_emp both have foreign key dependencies on employees and departments tables.  salaries table has a foreign key dependency on employees table.  For this same reason, the dropping of the tables employees, departments, and titles require a 'CASCADE' directive to get rid of dependent tables/keys when dropping those principle tables.

2. QUERIES.SQL:
These queries are straightforward.  Special consideration was taken for the hire_date and birth_date columns in employees table.  I marked these as type 'date' which meant that in some queries I had to use date-specific functions to choose the year (ie, EXTRACT) for comparison.  I used LEFT JOINs when doing multiple table joins to keep data from merges that had already happened.

3. BONUS (Jupyter Notebook):
- had to import sqlalchemy libraries
- perform a command line installation of psycopg2 (pip install psycopg2-binary)
- have yet to compensate for the password of user 'postgres' in the command line within Jupyter notebook
- Person running this must compensate for the user name, password, and database being used in the connection string.

Epilogue: the employee ID 499942 is for a person named April Foolsday.  Hence, the data was in fact an April Fool's Day joke.