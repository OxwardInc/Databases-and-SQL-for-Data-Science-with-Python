/*
Retrieve only the EMPLOYEES records corresponding to jobs in the JOBS table.
For such a question, you can implement the sub-query in the WHERE clause, 
such that the overlapping column of JOD ID can identify the required entries.
*/

SELECT * FROM EMPLOYEES WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS);

/*
Retrieve JOB information for employees earning over $70,000.
For this example, retrieve the details from the JOBS table, which has 
common IDs with those available in the EMPLOYEES table, provided the salary
in the EMPLOYEES table is greater than $70,000. You can write the query as:
*/

SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, JOB_IDENT FROM JOBS
WHERE JOB_IDENT IN(SELECT JOB_ID FROM EMPLOYEES WHERE SALARY > 70000);