CREATE OR REPLACE PROCEDURE transaction_rose()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Begin transaction logic (PostgreSQL handles transaction per procedure call)

    -- Perform operations
    UPDATE BankAccounts
    SET Balance = Balance - 200
    WHERE AccountName = 'Rose';

    UPDATE BankAccounts
    SET Balance = Balance + 200
    WHERE AccountName = 'Shoe Shop';

    UPDATE ShoeShop
    SET Stock = Stock - 1
    WHERE Product = 'Boots';

    UPDATE BankAccounts
    SET Balance = Balance - 300
    WHERE AccountName = 'Rose';

    -- Commit is automatic at end of procedure if no error
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Transaction failed: %', SQLERRM;
        ROLLBACK;
        -- You can also rethrow error or handle it silently
END;
$$;


CALL TRANSACTION_ROSE();

SELECT * FROM BankAccounts;

SELECT * FROM ShoeShop;



/*
Observe that the transaction has been executed. But when we observe the 
tables, no changes have permanently been saved through COMMIT. All the 
possible changes happened might have been undone through ROLLBACK since 
the whole transaction fails due to the failure of a SQL statement or more. 
Let's go through the possible reason behind the failure of the transaction 
and how COMMIT - ROLLBACK works on a stored procedure:

The first three UPDATEs should run successfully. Both the balance of Rose 
and ShoeShop should have been updated in the BankAccounts table. The 
current balance of Rose should stand at 300 - 200 (price of a pair of Boots) = 100. 
The current balance of ShoeShop should stand at 124,200 + 200 = 124,400. 
The stock of Boots should also be updated in the ShoeShop table after the 
successful purchase for Rose, 11 - 1 = 10.

The last UPDATE statement tries to buy Rose a pair of Trainers, but her 
balance becomes insufficient (Current balance of Rose: 100 < Price of 
Trainers: 300) after buying a pair of Boots. So, the last UPDATE statement 
fails. Since the whole transaction fails if any of the SQL statements fail,
the transaction won't be committed.

*/
