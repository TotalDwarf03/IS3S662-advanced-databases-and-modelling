/* Tutorial 2: PLSQL Building Blocks */
/* This tutorial requires customers.sql */

/* 1a: Write a procedure to Insert a new record into the customer table */

CREATE OR REPLACE PROCEDURE insert_customer (
    customer_id NUMBER,
    customer_name VARCHAR2,
    customer_age NUMBER,
    customer_address CHAR,
    customer_salary NUMBER
) AS
    total_customers NUMBER;
BEGIN
    INSERT INTO CUSTOMERS c (
        c.ID,
        c.NAME,
        c.AGE,
        c.ADDRESS,
        c.SALARY
    )
    VALUES (
        customer_id,
        customer_name,
        customer_age,
        customer_address,
        customer_salary
    );

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Added customer.');
END;


/* 1b: Write a script to run the procedure and verify the update */

DECLARE
    new_id NUMBER;
    old_length NUMBER;
    new_length NUMBER;

BEGIN
    SELECT MAX(ID) + 1 INTO new_id FROM CUSTOMERS;

    SELECT COUNT(*) INTO old_length FROM CUSTOMERS;

    INSERT_CUSTOMER(
        new_id,
        'Kieran',
        21,
        'Bridgend',
        9999.00
    );

    SELECT COUNT(*) INTO new_length FROM CUSTOMERS;

    DBMS_OUTPUT.PUT_LINE('Old Customers Length: ' || old_length);
    DBMS_OUTPUT.PUT_LINE('New Customers Length: ' || new_length);
END;

-- SELECT *
-- FROM CUSTOMERS;

/* 
    2: Number Comparison from variables

    if a > b:
        first is greater than second
    if a < b:
        first is less than second
    if a == b:
        first is the same as second
*/

--- IF THEN ELSE

DECLARE
    a NUMBER := 2;
    b NUMBER := 2;
BEGIN
    

    IF a < b THEN
        DBMS_OUTPUT.PUT_LINE(a || ' is less than ' || b || '.');
    ELSIF a > b THEN
        DBMS_OUTPUT.PUT_LINE(a || ' is greater than ' || b || '.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(a || ' is equal to ' || b || '.');
    END IF;
END;

--- CASE

DECLARE
    a NUMBER := 2;
    b NUMBER := 1;
    comp_result VARCHAR2(30);
BEGIN
    comp_result :=  CASE
                        WHEN a < b THEN (a || ' is less than ' || b || '.')
                        WHEN a > b THEN (a || ' is greater than ' || b || '.')
                        ELSE (a || ' is equal to ' || b || '.')
                    END;

    DBMS_OUTPUT.PUT_LINE(comp_result);
END;

/* 3: Script that accepts single number. Display Hello World for that number of times. */

--- For Loop

DECLARE
    n NUMBER := 5;
BEGIN
    FOR x IN 1..n LOOP
      DBMS_OUTPUT.PUT_LINE('Hello World for the ' || x || ' time.');
    END LOOP;
END;

--- While Loop

DECLARE
    n NUMBER := 5;
    x NUMBER := 1;
BEGIN
    WHILE x <= n LOOP
      DBMS_OUTPUT.PUT_LINE('Hello World for the ' || x || ' time.');
      x := x + 1;
    END LOOP;
END;