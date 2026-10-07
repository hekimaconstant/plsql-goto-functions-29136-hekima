CREATE OR REPLACE FUNCTION fn_annual_salary (
    p_monthly_sal IN NUMBER
) RETURN NUMBER IS
BEGIN
    RETURN NVL(p_monthly_sal, 0) * 12;
END fn_annual_salary;
/