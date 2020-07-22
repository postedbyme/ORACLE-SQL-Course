CREATE TABLE bankStatement 
(
  trans_id     NUMBER(3)    NOT NULL,
  dated        DATE         NOT NULL,
  Details      VARCHAR2(60) NOT NULL,
  paid_in      NUMBER(8,2),
  paid_out     NUMBER(8,2)
  );

ALTER TABLE bankStatement ADD (
  CONSTRAINT bank_pk PRIMARY KEY (ID));

CREATE SEQUENCE bank_seq START WITH 100;

CREATE OR REPLACE TRIGGER bank_bir 
BEFORE INSERT ON bankStatement 
FOR EACH ROW

BEGIN
  SELECT bank_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

SELECT * FROM bankStatement ORDER BY DATED;