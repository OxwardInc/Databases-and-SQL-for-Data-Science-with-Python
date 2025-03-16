/*
Let us see some examples of JOINS being used to query the data.

Retrieve the names and job start dates of all employees who work for 
department number 5.
We need to use the Inner join operation with the EMPLOYEES table as the 
left table and the JOB_HISTORY table as the right table. The join will be 
made over employee ID, and the query response will be filtered for the 
Department ID value 5.
The query for this question will be as shown below.

*/

SELECT E.F_NAME, E.L_NAME, JH.START_DATE
FROM EMPLOYEES AS E
INNER JOIN JOB_HISTORY AS JH
ON E.EMP_ID=JH.EMPL_ID
WHERE E.DEP_ID='5';

/*
Retrieve employee ID, last name, department ID, and department name for all
employees.
For this, you must use the Left Outer Join operation with the EMPLOYEES 
table as the left table and the DEPARTMENTS table as the right table. The 
join will happen on the Department ID.

Left join query retrieves all employees, including their department 
details if available. If an employee does not belong to any department, 
the department fields will be NULL.

The query will be written as follows:
*/

SELECT E.EMP_ID, E.L_NAME, E.DEP_ID, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID=D.DEPT_ID_DEP;

/*
Retrieve the First name, Last name, and Department name of all employees.
For this, you will use the Full Outer Join operation with the EMPLOYEES 
table as the left table and the DEPARTMENTS table as the right table. A 
full outer join in MySQL is implemented as a UNION of left and right outer 
joins.

Full Outer Join query retrieves all employees and departments, showing all 
combinations. If an employee is not associated with a department, or a 
department has no employees, the missing fields will be NULL.

The query will be written as shown below.
*/

SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
LEFT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID = D.DEPT_ID_DEP

UNION

SELECT E.F_NAME, E.L_NAME, D.DEP_NAME
FROM EMPLOYEES AS E
RIGHT OUTER JOIN DEPARTMENTS AS D
ON E.DEP_ID = D.DEPT_ID_DEP;