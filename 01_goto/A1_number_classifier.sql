SET SERVEROUTPUT ON;

DECLARE
    v_num NUMBER := 3;
BEGIN
    IF v_num > 0 THEN
        GOTO pos_label;
    ELSIF v_num < 0 THEN
        GOTO neg_label;
    ELSE
        GOTO zero_label;
    END IF;

    <<pos_label>>
    DBMS_OUTPUT.PUT_LINE('Number ' || v_num || ' is POSITIVE.');
    GOTO process_end;

    <<neg_label>>
    DBMS_OUTPUT.PUT_LINE('Number ' || v_num || ' is NEGATIVE.');
    GOTO process_end;

    <<zero_label>>
    DBMS_OUTPUT.PUT_LINE('Number ' || v_num || ' is ZERO.');
    GOTO process_end;

    <<process_end>>
    DBMS_OUTPUT.PUT_LINE('Execution finished.');
END;
/