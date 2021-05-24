--Trigger to capture User Activity and input on logs table

CREATE OR REPLACE TRIGGER trg_user_activity
AFTER INSERT OR UPDATE OR DELETE
ON tbl_product

FOR EACH ROW

BEGIN 

IF DELETING THEN 
    --Insert data in tbl_logs
    INSERT INTO tbl_logs
    (tbl_name,action,added_date)
    VALUES
    ('tbl_product', 'DELETE',SYSDATE);
END IF;

IF UPDATING THEN
    --INSERTING VALUES in tbl_logs
    INSERT INTO tbl_logs
    (tbl_name,action,added_date)
    VALUES
    ('tbl_product', 'UPDATE',SYSDATE);
END IF;

IF INSERTING THEN
    --INSERTING VALUES in tbl_logs
    INSERT INTO tbl_logs
    (tbl_name,action,added_date)
    VALUES
    ('tbl_product', 'INSERT',SYSDATE);
END IF;

END;