CREATE TABLE tbl_product(
    product_id NUMBER(10) NOT NULL,
    category_id NUMBER(10) NOT NULL,
    product_title VARCHAR2(100) NOT NULL,
    product_description VARCHAR2(250),
    rate NUMBER(10,2),
    qty NUMBER(10),
    mfg_date DATE,
    exp_date DATE
);

ALTER TABLE tbl_product ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);

ALTER TABLE tbl_product ADD CONSTRAINT fk_product_id FOREIGN KEY (category_id); REFERENCES tbl_category(category_id);


CREATE SEQUENCE seq_product_id
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


CREATE OR REPLACE TRIGGER trg_tbl_product
BEFORE INSERT 
ON tbl_product
FOR EACH ROW
BEGIN
:new.product_id:=seq_product_id.nextval;
END;