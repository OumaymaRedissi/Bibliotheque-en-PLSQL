--exercice5
SET SERVEROUTPUT ON
ACCEPT s_ido PROMPT 'entrer IDO'
ACCEPT s_cin PROMPT 'entrer CIN'
CREATE OR REPLACE  PROCEDURE P_INSERT_PRET(p_ido IN OUVRAGE.IDO%TYPE, p_cin IN ETUDIANT.CIN%TYPE,p_out OUT NUMBER)
AS
v_date DATE:=SYSDATE;
CURSOR  copie_curs IS 
                    SELECT IDC FROM COPIE 
                    WHERE ETAT='D';
v_idc PRET.IDC%TYPE;
v_ide ETUDIANT.IDE%TYPE;

BEGIN
OPEN copie_curs;
IF (copie_curs%NOTFOUND) THEN 
                        p_out:=-1;
ELSE 
        p_out:=1;
        FETCH copie_curs INTO v_idc;
        SELECT IDE INTO v_ide FROM ETUDIANT WHERE CIN=p_cin;
        INSERT INTO PRET VALUES(v_idc,v_ide,v_date,NULL,NULL,NULL);
END IF;
CLOSE copie_curs;
DBMS_OUTPUT.PUT_LINE(p_out);
END;
/
VARIABLE g_out NUMBER ;
EXECUTE P_INSERT_PRET(&s_ido,&s_cin,:g_out);
DBMS_OUTPUT.PUT_LINE(:g_out);


