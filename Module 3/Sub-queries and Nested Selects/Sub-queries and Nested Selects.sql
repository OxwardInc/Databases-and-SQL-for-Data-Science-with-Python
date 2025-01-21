-- It won't work
SELECT * 
FROM EMPLOYEES 
WHERE salary < AVG(salary);

-- The better way to wrrite the query
SELECT * FROM EMPLOYEES WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);


/*
Now, consider executing a query that retrieves all employee records with 
EMP_ID, SALARY, and maximum salary as MAX_SALARY in every row. For this, 
the maximum salary must be queried and used as one of the columns. This 
can be done using the query below.
*/

SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY FROM EMPLOYEES;

/*
Now, consider that you wish to extract the first and last names of the 
oldest employee. Since the oldest employee will be the one with the 
smallest date of birth, the query can be written as:
*/

SELECT F_NAME, L_NAME, (SELECT MIN(B_DATE) FROM EMPLOYEES) FROM EMPLOYEES;


/*
You may also use sub-queries to create derived tables, which can then be 
used to query specific information. Say you want to know the average salary 
of the top 5 earners in the company. You will first have to extract a table 
of the top five salaries as a table. From that table, you can query the 
average value of the salary. The query can be written as follows.
*/

SELECT AVG(SALARY) FROM (SELECT SALARY FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 5)
AS SALARY_TABLE;

