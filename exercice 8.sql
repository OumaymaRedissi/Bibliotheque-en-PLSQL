--exercice8
CREATE OR REPLACE PROCEDURE P_MAJ_LIKES
AS
CURSOR ouv_curs IS SELECT IDO FROM OUVRAGE 
FOR UPDATE OF LIKES,DISLIKES NOWAIT;
CURSOR cop_curs (p_ido COPIE.IDO%TYPE) IS SELECT IDC FROM COPIE;
v_l NUMBER:=0;
v_d NUMBER:=0;
v_likes NUMBER:=0;
v_dislikes NUMBER:=0;
BEGIN
FOR ouv_rec IN ouv_curs LOOP
    FOR cop_rec IN cop_curs(ouv_rec.IDO) LOOP
        SELECT COUNT(*)INTO v_l FROM PRET
        WHERE AVIS='LIKE'AND IDC=cop_rec.IDC;
        v_likes:=v_likes+v_l;
        SELECT COUNT(*)INTO v_d FROM PRET
        WHERE AVIS='DISLIKE'AND IDC=cop_rec.IDC;
        v_dislikes:=v_dislikes+v_d;
    END LOOP;
    UPDATE OUVRAGE SET LIKES=LIKES+v_likes
    WHERE CURRENT OF ouv_curs;
    UPDATE OUVRAGE SET DISLIKES=DISLIKES+v_dislikes
    WHERE CURRENT OF ouv_curs;
END LOOP;
COMMIT;
END;
/