/* This script creates a table for customer data and inserts sample data */
/* The script is used in various tutorials */

DROP TABLE IF EXISTS CUSTOMERS;

CREATE TABLE CUSTOMERS(
    ID INT NOT NULL,
    NAME VARCHAR (20) NOT NULL,
    AGE INT NOT NULL,
    ADDRESS CHAR (25),
    SALARY DECIMAL (18, 2),
    PRIMARY KEY (ID)
);

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (1, 'Joseph', 34, 'Pontypridd', 1200.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (2, 'Jack', 26, 'Merthyr', 4000.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (3, 'Alan', 34, 'Cardiff', 2550.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (4, 'Stephan', 65, 'Newport', 3000.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (5, 'Richard', 23, 'Brecon', 8300.00 );

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY)
VALUES (6, 'Nick', 50, 'Aberdare', 2300.00 );

DECLARE
   row_count NUMBER;

BEGIN
   SELECT 
      COUNT(*)
   INTO row_count
   FROM CUSTOMERS;

   IF row_count = 6 THEN
      COMMIT;
      DBMS_OUTPUT.PUT_LINE('Committed changes successfully.');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Something went wrong while inserting. Changes not committed.');
   END IF;

END;