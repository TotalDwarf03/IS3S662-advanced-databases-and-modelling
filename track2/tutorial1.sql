/* Tutorial 1: Why PL/SQL? */
/* This tutorial requires customers.sql */

/* 1: Hello World! */

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World!');
END;

/* 2: Assign query output to variable */

DECLARE
    customer_name CUSTOMERS.NAME%TYPE;
    customer_address CUSTOMERS.ADDRESS%TYPE;
    customer_salary CUSTOMERS.SALARY%TYPE;
BEGIN
    SELECT
        c.name,
        c.address,
        c.salary
    INTO customer_name, customer_address, customer_salary
    FROM CUSTOMERS c
    WHERE c.id = 1;

    DBMS_OUTPUT.PUT_LINE('Customer Name: ' || customer_name);
    DBMS_OUTPUT.PUT_LINE('Customer Address: ' || customer_address);
    DBMS_OUTPUT.PUT_LINE('Customer Salary: ' || customer_salary);
END;
