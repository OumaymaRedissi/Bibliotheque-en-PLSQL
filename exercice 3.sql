--exercice3
SET SERVEROUTPUT ON
SET VERIFY ON
ACCEPT s_cin PROMPT 'entrer CIN' 
CREATE OR REPLACE PROCEDURE P_AFF_PRETS(s_cin IN ETUDIANT.CIN%TYPE)
IS
     CURSOR p_curs IS 
                    SELECT  E.IDE, E.CIN , C.IDC, O.TITRE, P.DATEP, P.DATER
                    FROM  COPIE C, PRET P ,ETUDIANT E, OUVRAGE O
                    WHERE C.IDC=P.IDC AND P.IDE=E.IDE AND O.IDO=C.IDO AND E.CIN = '&s_cin';
BEGIN   
DBMS_OUTPUT.PUT_LINE ('La liste des etudiants') ;
DBMS_OUTPUT.PUT_LINE ('IDE| CIN| IDC| IDC| TITRE| DATEP| DATER') ;
FOR p_rec IN p_curs LOOP
    DBMS_OUTPUT.PUT_LINE('----------------------') ;
    DBMS_OUTPUT.PUT_LINE(p_rec.IDE ||' '|| p_rec.CIN||' '|| p_rec.IDC||' '|| p_rec.IDC||' '|| p_rec.TITRE||' '|| p_rec.DATEP||' '|| p_rec.DATER) ;
    END LOOP;
END;
/
EXECUTE P_AFF_PRETS (&s_cin);