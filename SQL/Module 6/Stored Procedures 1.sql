-- Stored Procedure

CREATE OR REPLACE PROCEDURE  RETRIEVE_ALL()
LANGUAGE SQL
AS $$
	SELECT * FROM PETSALE;
$$;

-- Calling the Retrive_all procedure

CALL RETRIEVE_ALL();

--Dropping the Procedure

DROP PROCEDURE RETRIEVE_ALL();