-- Raise cutsom error is expiery date is earlier than mfg date

CREATE OR REPLACE TRIGGER trg_chk_exp_mfg_date
BEFORE INSERT OR UPDATE 
ON tbl_product

FOR EACH ROW 
BEGIN 

IF :new.mfg_date> :new.exp_date THEN 

raise_applicaton_error(-20111, 'Sorry Expiry Date cannot be earlier than Manufacture Date');
END IF;

END;