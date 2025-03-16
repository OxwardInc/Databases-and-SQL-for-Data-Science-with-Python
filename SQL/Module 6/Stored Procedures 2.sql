CREATE OR REPLACE PROCEDURE UPDATE_SALEPRICE(animal_id INT, animal_health VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    IF animal_health = 'Bad' THEN
        UPDATE petsale
        SET saleprice = saleprice - (saleprice * 0.25)
        WHERE id = animal_id;

    ELSIF animal_health = 'Worse' THEN
        UPDATE petsale
        SET saleprice = saleprice - (saleprice * 0.5)
        WHERE id = animal_id;

    ELSE
        -- No discount applied
        UPDATE petsale
        SET saleprice = saleprice
        WHERE id = animal_id;
    END IF;
END;
$$;


CALL RETRIEVE_ALL();
CALL UPDATE_SALEPRICE(1, 'Bad');
CALL RETRIEVE_ALL();

CALL RETRIEVE_ALL();
CALL UPDATE_SALEPRICE(3, 'Worse');
CALL RETRIEVE_ALL();

DROP PROCEDURE UPDATE_SALEPRICE();