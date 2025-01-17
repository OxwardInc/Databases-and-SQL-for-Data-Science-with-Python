SELECT F_NAME, L_NAME FROM EMPLOYEES ORDER BY F_NAME LIKE '%S';

SELECT * FROM EMPLOYEES ORDER BY B_DATE ASC;

SELECT DEP_ID, AVG(SALARY) FROM EMPLOYEES GROUP BY DEP_ID HAVING AVG(SALARY) >= 60000
	ORDER BY AVG(SALARY) DESC;