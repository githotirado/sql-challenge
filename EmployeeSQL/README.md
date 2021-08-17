
Setup: the schema.sql file drops and creates the necessary tables in the right order, but it also contains 'copy' commands allowing the SQL to import the necessary .csv files.  But the person running the SQL file will need to change the author's home directory location of those supporting files with the user's own full path to those files.  



The 'copy' command expects full path to each file imported.  Each file requires mentioning the delimiter as well as the presence of a header row; hence the 6 copy commands at the tail end.

PASSWORD: 

SCHEMA.SQL:
This SQL query will create tables in order:  titles, employees, departments, dept_manager, dept_emp, salaries.  That is because employees table has a foreign key dependency on titles, and dept_manager and dept_emp both have foreign key dependencies on employees and departments tables.  salaries table has a foreign key dependency on employees table.  For this same reason, the dropping of tables employees, departments, and titles require a 'cascade' directive to get rid of dependent tables/keys when dropping those principle tables.

QUERIES.SQL

For the Bonus section,
- had to import sqlalchemy libraries
- perform a command line installation of psycopg2 (pip install psycopg2-binary)

Epilogue: the employee ID 499942 is for a person named April Foolsday.  Hence, the data was in fact an April Fool's Day joke.