SET SERVEROUTPUT ON;

DECLARE
    v_status VARCHAR2(20) := 'PENDING';
BEGIN
    -- ILLEGAL
    GOTO branch_label;

    IF v_status = 'APPROVED' THEN
        <<branch_label>>
        DBMS_OUTPUT.PUT_LINE('Status successfully verified.');
    END IF;
END;
/