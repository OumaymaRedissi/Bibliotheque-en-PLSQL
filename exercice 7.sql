--exercice7
SET SERVEROUTPUT ON
ACCEPT s_idc PROMPT 'entrer IDC'
ACCEPT s_cin PROMPT 'entrer CIN'
ACCEPT s_avis PROMPT 'entrer votre avis'
CREATE OR REPLACE  PROCEDURE P_UPDATE_RETOUR(p_idc IN COPIE.IDC%TYPE, p_cin IN ETUDIANT.CIN%TYPE,p_avis IN PRET.AVIS%TYPE)
AS


BEGIN
       
        UPDATE PRET  SET AVIS=p_avis , DATER=SYSDATE ,IDB=(SELECT IDB FROM BIBLIO
                                                             WHERE NOM=(SELECT USER FROM DUAL)) 
        WHERE IDC=p_idc AND IDE=(SELECT IDE FROM ETUDIANT WHERE CIN=p_cin ) ; 
        

COMMIT;
DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
END;
/
EXECUTE P_UPDATE_RETOUR(&s_idc,&s_cin,&s_avis);
