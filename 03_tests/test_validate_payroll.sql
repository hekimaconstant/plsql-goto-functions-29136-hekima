SET SERVEROUTPUT ON;

DECLARE
    v_status VARCHAR2(100);
BEGIN
    DBMS_OUTPUT.PUT_LINE('         PAYROLL VALIDATION TEST RESULTS          ');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');

    FOR emp IN (
        SELECT employee_id, first_name || ' ' || last_name AS full_name 
        FROM employees 
        ORDER BY employee_id
    ) LOOP
        v_status := fn_validate_payroll(emp.employee_id);
        DBMS_OUTPUT.PUT_LINE('Emp ID ' || emp.employee_id || ' (' || emp.full_name || '): ' || v_status);
    END LOOP;

    -- Test non-existent employee ID
    v_status := fn_validate_payroll(9999);
    DBMS_OUTPUT.PUT_LINE('Emp ID 9999 (Non-existent): ' || v_status);
    
END;
/