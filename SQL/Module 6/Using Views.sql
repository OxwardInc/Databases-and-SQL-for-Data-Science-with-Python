-- Create a View

CREATE VIEW EPSALARY AS
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, SALARY
FROM EMPLOYEES;

-- Using SELECT, query the EMPSALARY view to retrieve all the records. 
-- Use the following statement.

SELECT * FROM EPSALARY;

-- Update a View

CREATE OR REPLACE VIEW EMPSALARY AS
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, JOB_TITLE,
MIN_SALARY, MAX_SALARY
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

-- Running the View

SELECT * FROM EMPSALARY;

-- Drop a view
DROP VIEW EMPSALARY;