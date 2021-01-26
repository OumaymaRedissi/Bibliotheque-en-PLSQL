--exercice2
CREATE OR REPLACE PROCEDURE P_CORR_INC
IS
     CURSOR p_curs IS 
                    SELECT C.ETAT
                    FROM  COPIE C, PRET P
                    WHERE C.IDC=P.IDC AND P.DATER IS NULL AND C.ETAT='D'
                    FOR UPDATE OF C.ETAT
                    NOWAIT;
BEGIN   
FOR p_rec IN p_curs LOOP
UPDATE COPIE SET ETAT='P'
WHERE CURRENT OF p_curs;
END LOOP;
COMMIT ;
END;

/
EXECUTE P_CORR_INC ;