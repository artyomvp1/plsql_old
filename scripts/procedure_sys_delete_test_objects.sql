CREATE OR REPLACE PROCEDURE sys_delete_test_objects 
AS
    v_user VARCHAR2(20) ;
    v_cur SYS_REFCURSOR ;
    v_rec all_objects%ROWTYPE ;

BEGIN
    SELECT user
    INTO v_user
    FROM DUAL ;
    --
    OPEN v_cur FOR
        SELECT *
        FROM all_objects
        WHERE owner LIKE v_user
        AND object_name LIKE 'TEST%' ;
    --
    LOOP
        FETCH v_cur INTO v_rec ;
        EXIT WHEN v_cur%NOTFOUND ;
            EXECUTE IMMEDIATE 'DROP ' || v_rec.object_type || ' ' || v_rec.object_name ;
            DBMS_OUTPUT.PUT_LINE(INITCAP(v_rec.object_type) || ' ' || v_rec.object_name || ' is being deleted by ' || v_user) ;
    END LOOP ;
    --
    CLOSE v_cur ;

END ;
