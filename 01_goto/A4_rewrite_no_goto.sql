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

    -- eliminates goto
    IF v_salary < 500000 THEN
        v_category := 'Junior Level Band';
    ELSIF v_salary BETWEEN 500000 AND 1000000 THEN
        v_category := 'Mid Level Band';
    ELSE
        v_category := 'Senior Executive Band';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Employee: ' || v_emp_name);
    DBMS_OUTPUT.PUT_LINE('Salary: RWF ' || v_salary);
    DBMS_OUTPUT.PUT_LINE('Category: ' || v_category);
END;
/