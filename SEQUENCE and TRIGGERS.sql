CREATE SEQUENCE seq_category_id
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


CREATE OR REPLACE TRIGGER trg_tbl_category
BEFORE INSERT
ON tbl_category
FOR EACH ROW
BEGIN
:new.category_id:=seq_category_id.nextval;
END;