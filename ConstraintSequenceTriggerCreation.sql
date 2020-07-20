CREATE TABLE bankstatement (
	trans_id NUMBER(3) NOT NULL,
	dated DATE NOT NULL,
	details VARCHAR2(60) NOT NULL,
	paid_in NUMBER(8, 2),
	paid_out NUMBER(8, 2)
);

ALTER TABLE bankstatement ADD (
	CONSTRAINT bank_pk PRIMARY KEY ( id )
);

CREATE SEQUENCE bank_seq START WITH 100;

CREATE OR REPLACE TRIGGER bank_bir BEFORE
	INSERT ON bankstatement
	FOR EACH ROW
BEGIN
	SELECT
		bank_seq.NEXTVAL
	INTO:new.id
	FROM
		dual;

END;
/

SELECT
	*
FROM
	bankstatement
ORDER BY
	dated;
