CREATE OR REPLACE FUNCTION fn_calculate_tax (
    p_annual_sal IN NUMBER
) RETURN NUMBER IS
    v_tax NUMBER := 0;
BEGIN
    IF p_annual_sal IS NULL OR p_annual_sal <= 0 THEN
        RETURN 0;
    END IF;

    IF p_annual_sal <= 5000000 THEN
        v_tax := p_annual_sal * 0.10;
    ELSIF p_annual_sal <= 10000000 THEN
        v_tax := p_annual_sal * 0.15;
    ELSE
        v_tax := p_annual_sal * 0.20;
    END IF;

    RETURN ROUND(v_tax, 2);
END fn_calculate_tax;
/