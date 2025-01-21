/*
Write a query that displays the rounded integral cost of each rescue.
*/

SELECT ROUND(COST) FROM PETRESCUE;

-- The query could also be written as:

SELECT ROUND(COST, 0) FROM PETRESCUE;

-- In case the question was to round the value to 2 decimal places, the query would change to:

SELECT ROUND(COST, 2) FROM PETRESCUE;

/*
Write a query that displays the length of each animal name.
*/

SELECT LENGTH(ANIMAL) FROM PETRESCUE;

/*
Write a query that displays the animal name in each rescue in uppercase.
*/

SELECT UPPER(ANIMAL) FROM PETRESCUE;

/*
Just as easily, the user could ask for a lower case representation, and the query would be changed to:
*/

SELECT LOWER(ANIMAL) FROM PETRESCUE;