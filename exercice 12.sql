SET SERVEROUTPUT ON;
DECLARE
CURSOR c_user IS SELECT username FROM  sys.all_users ORDER BY username;
CURSOR c_obj IS SELECT OBJECT_NAME,OBJECT_TYPE FROM user_objects ;

BEGIN
DBMS_OUTPUT.PUT_LINE('Utilisateurs------------');
FOR rec in c_user 
LOOP
DBMS_OUTPUT.PUT_LINE(rec.username);
END LOOP;
DBMS_OUTPUT.PUT_LINE('Objets-----------------');
FOR rec in c_obj 
LOOP
DBMS_OUTPUT.PUT_LINE(rec.OBJECT_NAME||' '||rec.OBJECT_TYPE);
END LOOP;

END;
/


