CREATE TABLE tbl_category(
    category_id NUMBER(10) NOT NULL,
    category_title VARCHAR2(100)
);

ALTER TABLE tbl_category ADD CONSTRAINT pk_category_id PRIMARY KEY (category_id);