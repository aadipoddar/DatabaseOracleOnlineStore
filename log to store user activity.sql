CREATE TABLE tbl_logs(
    log_id NUMBER(10) NOT NULL,
    tbl_name VARCHAR2(100),
    action VARCHAR2(100),
    added_date DATE
);

ALTER TABLE tbl_logs ADD CONSTRAINT pk_log_id PRIMARY KEY (log_id);

CREATE SEQUENCE seq_log_id
START WITH 1 
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE OR REPLACE TRIGGER trg_tbl_logs
BEFORE INSERT 
ON tbl_logs

FOR EACH ROW
BEGIN

:new.log_id := seq_log_id.nextval;
END;