/*
Write a query that displays the rescue date.
*/

SELECT EXTRACT(DAY FROM RESCUEDATE) FROM PETRESCUE;

-- In case the query was asking for MONTH of rescue, the query would change to:

SELECT EXTRACT(MONTH FROM RESCUEDATE) FROM PETRESCUE;

-- In case the query was asking for YEAR of rescue, the query would change to:


SELECT EXTRACT(YEAR FROM RESCUEDATE) FROM PETRESCUE;

/*
Animals rescued should see the vet within three days of arrival. 
Write a query that displays the third day of each rescue.
*/

SELECT RESCUEDATE, RESCUEDATE + INTERVAL '3 DAYS' FROM PETRESCUE;

/*
If the question was to add 2 months to the date, the query would change to:
*/

SELECT RESCUEDATE, RESCUEDATE + INTERVAL '2 MONTHS' FROM PETRESCUE;


/*
Similarly, we can retrieve a date before the one given in the column by a 
given number using the function DATE_SUB. By modifying the same example, 
the following query would provide the date 3 days before the rescue.
*/

SELECT RESCUEDATE, RESCUEDATE - INTERVAL '3 DAYS' FROM PETRESCUE;

/*
Write a query that displays the length of time the animals have been 
rescued, for example, the difference between the current date and the 
rescue date.
*/

SELECT CURRENT_DATE - RESCUEDATE AS "Day Difference" FROM PETRESCUE;

/*
CURRENT_DATE is also an inbuilt function that returns the present date as 
known to the server.

To present the output in a YYYY-MM-DD format, another function 
FROM_DAYS(number_of_days)can be used. This function takes a number of days 
and returns the required formatted output. The query above would thus be 
modified to
*/

SELECT CURRENT_DATE, RESCUEDATE, CURRENT_DATE - (CURRENT_DATE - RESCUEDATE)
	AS "Date From Days" FROM PETRESCUE;