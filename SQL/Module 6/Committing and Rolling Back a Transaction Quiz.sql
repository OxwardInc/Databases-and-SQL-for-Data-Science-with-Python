CREATE OR REPLACE PROCEDURE TRANSACTION_JAMES()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Begin transaction logic (PostgreSQL handles transaction per procedure call)

    -- Perform operations
    UPDATE BankAccounts
    SET Balance = Balance - (300 * 4)
    WHERE AccountName = 'James';

    UPDATE BankAccounts
    SET Balance = Balance + (300 * 4)
    WHERE AccountName = 'Shoe Shop';

    UPDATE ShoeShop
    SET Stock = Stock - 4
    WHERE Product = 'Trainers';

    UPDATE BankAccounts
    SET Balance = Balance - 150
    WHERE AccountName = 'Rose';

	UPDATE BankAccounts
    SET Balance = Balance + 150
    WHERE AccountName = 'Shoe Shop';

	UPDATE ShoeShop
    SET Stock = Stock - 1
    WHERE Product = 'Brogues';

    -- Commit is automatic at end of procedure if no error
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Transaction failed: %', SQLERRM;
        ROLLBACK;
        -- You can also rethrow error or handle it silently
END;
$$;

CALL TRANSACTION_JAMES();

SELECT * FROM BankAccounts;

SELECT * FROM ShoeShop;

