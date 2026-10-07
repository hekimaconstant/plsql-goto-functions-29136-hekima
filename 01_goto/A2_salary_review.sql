SET SERVEROUTPUT ON;

DECLARE
    v_emp_id     NUMBER := 102;
    v_emp_name   VARCHAR2(100);
    v_salary     NUMBER;
    v_category   VARCHAR2(50);
BEGIN
    SELECT first_name || ' ' || last_name, salary
    INTO v_emp_name, v_salary
    FROM employees
    WHERE employee_id = v_emp_id;

    IF v_salary < 500000 THEN
        GOTO low_band;
    ELSIF v_salary BETWEEN 500000 AND 1000000 THEN
        GOTO mid_band;
    ELSE
        GOTO high_band;
    END IF;

    <<low_band>>
    v_category := 'Junior Level Band';
    GOTO print_output;

    <<mid_band>>
    v_category := 'Mid Level Band';
    GOTO print_output;

    <<high_band>>
    v_category := 'Senior Executive Band';
    GOTO print_output;

    <<print_output>>
    DBMS_OUTPUT.PUT_LINE('Employee: ' || v_emp_name);
    DBMS_OUTPUT.PUT_LINE('Salary: RWF ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('Category: ' || v_category);
END;
/