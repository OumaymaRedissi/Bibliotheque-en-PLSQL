--exercice10
CREATE OR REPLACE FUNCTION F_AVIS (p_titre IN OUVRAGE.TITRE%TYPE) RETURN VARCHAR
AS
v_chaine VARCHAR2(40);
v_l NUMBER;
v_d NUMBER;
BEGIN   
    SELECT LIKES,DISLIKES INTO v_l,v_d FROM OUVRAGE 
    WHERE TITRE=p_titre;
    v_chaine:='LIKES'||v_l||' '||'DISLIKES'||v_d;
    RETURN v_chaine ;
END;
/