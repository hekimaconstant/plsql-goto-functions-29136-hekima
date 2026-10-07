SET SERVEROUTPUT ON;

DECLARE
    v_annual_sal NUMBER;
    v_years      NUMBER;
    v_tax        NUMBER;
    v_dept       VARCHAR2(100);
BEGIN
    DBMS_OUTPUT.PUT_LINE('=== TESTING B1: fn_annual_salary ===');
    v_annual_sal := fn_annual_salary(450000);
    DBMS_OUTPUT.PUT_LINE('Monthly: 450,000 -> Annual Salary: ' || v_annual_sal);


    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== TESTING B2: fn_years_of_service ===');
    v_years := fn_years_of_service(TO_DATE('2018-06-01', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Hire Date: 2018-06-01 -> Years of Service: ' || v_years);


    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== TESTING B3: fn_calculate_tax ===');
    v_tax := fn_calculate_tax(v_annual_sal);
    DBMS_OUTPUT.PUT_LINE('Annual Salary: ' || v_annual_sal || ' -> Tax Amount: ' || v_tax);


    DBMS_OUTPUT.PUT_LINE(CHR(10) || '=== TESTING B4: fn_dept_name ===');
    v_dept := fn_dept_name(10);
    DBMS_OUTPUT.PUT_LINE('Dept ID 10 -> ' || v_dept);


    v_dept := fn_dept_name(999); -- Non-existent ID
    DBMS_OUTPUT.PUT_LINE('Dept ID 999 -> ' || v_dept);
END;
/