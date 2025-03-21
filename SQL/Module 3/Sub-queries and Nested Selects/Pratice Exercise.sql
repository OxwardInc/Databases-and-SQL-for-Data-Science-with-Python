SELECT AVG(SALARY) 
FROM (SELECT SALARY 
      FROM EMPLOYEES 
      ORDER BY SALARY 
      LIMIT 5) AS SALARY_TABLE;

SELECT * 
FROM EMPLOYEES 
WHERE EXTRACT(YEAR FROM AGE(B_DATE)) > (
    SELECT AVG(EXTRACT(YEAR FROM AGE(B_DATE))) 
    FROM EMPLOYEES
);


SELECT 
    EMPL_ID, 
    EXTRACT(YEAR FROM AGE(START_DATE)) AS YEARS_OF_SERVICE, 
    (SELECT AVG(EXTRACT(YEAR FROM AGE(START_DATE))) FROM JOB_HISTORY) AS AVG_YEARS_OF_SERVICE
FROM JOB_HISTORY;
