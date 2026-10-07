CREATE OR REPLACE FUNCTION fn_validate_payroll (
    p_emp_id IN NUMBER
) RETURN VARCHAR2 IS
    v_salary     employees.salary%TYPE;
    v_dept_id    employees.department_id%TYPE;
    v_dept_count NUMBER;
BEGIN
    SELECT salary, department_id
    INTO v_salary, v_dept_id
    FROM employees
    WHERE employee_id = p_emp_id;

    IF v_salary IS NULL OR v_salary <= 0 THEN
        RETURN 'INVALID: Invalid or Missing Salary';
    END IF;

    IF v_dept_id IS NULL THEN
        RETURN 'INVALID: Unassigned Department';
    END IF;

    SELECT COUNT(*)
    INTO v_dept_count
    FROM departments
    WHERE department_id = v_dept_id;

    IF v_dept_count = 0 THEN
        RETURN 'INVALID: Non-existent Department FK';
    END IF;

    RETURN 'VALID';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID: Employee Not Found';
    WHEN OTHERS THEN
        RETURN 'INVALID: Verification Error';
END fn_validate_payroll;
/