--exercice1
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE P_AFF_INC
IS
     CURSOR p_curs IS 
                    SELECT O.TITRE, P.IDC, C.ETAT, P.DATEP, P.DATER
                    FROM OUVRAGE O, COPIE C, PRET P
                    WHERE O.IDO=C.IDO AND P.IDC=C.IDC AND C.ETAT='D' AND P.DATER IS NULL;
BEGIN   
DBMS_OUTPUT.PUT_LINE ('La liste de copies ayant état D') ;
DBMS_OUTPUT.PUT_LINE ('TITRE| IDC| ETAT| DATEP| DATER') ;
FOR p_rec IN p_curs LOOP
    DBMS_OUTPUT.PUT_LINE('----------------------') ;
    DBMS_OUTPUT.PUT_LINE(p_rec.TITRE||' '|| p_rec.IDC||' ' || p_rec.ETAT||' '|| p_rec.DATEP||' '|| p_rec.DATER) ;
    END LOOP;
END;
/
EXECUTE P_AFF_INC ;