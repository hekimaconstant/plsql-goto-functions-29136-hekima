CREATE OR REPLACE FUNCTION fn_dept_name (
    p_dept_id IN NUMBER
) RETURN VARCHAR2 IS
    v_dept_name departments.department_name%TYPE;
BEGIN
    SELECT department_name
    INTO v_dept_name
    FROM departments
    WHERE department_id = p_dept_id;

    RETURN v_dept_name;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Department Not Found';
    WHEN OTHERS THEN
        RETURN 'Error Retrieving Department';
END fn_dept_name;
/