Create table MP_Personas(
    ID Number(9),
    NUM Varchar2(9),
    VALSTS Varchar2(3),
    DZIM_DAT varchar2(10),
    Kategorija VARCHAR2(3),
    VARDS VARCHAR2(40),
    UZVARDS VARCHAR2(40),
    TIPS VARCHAR2(1),
    DZIMTE VARCHAR2(1),
    NODALAS_KODS NUMBER(4));
    
INSERT INTO MP_Personas
    (ID, NUM, VALSTS, Kategorija, VARDS, UZVARDS, TIPS, DZIMTE, NODALAS_KODS)
    SELECT ID, NUM, VALSTS, Kategorija, VARDS, UZVARDS, TIPS, DZIMTE, NODALAS_KODS FROM Personas
    where rownum <= 100000 ;
    
DECLARE
    GADS        Number NOT NULL:= 1;
    GADS1      Number NOT NULL:= -1;
    GADS2      Number NOT NULL:= -1;
    GADS3      Number NOT NULL:= -1;
    cursor PERSONAS_KUR is
        SELECT A.ID, A.Dzim_DAT
        FROM PERSONAS A
        where rownum <= 100000;
BEGIN    
    FOR ID in PERSONAS_KUR
    LOOP      
        :GADS := ID.DZIM_DAT;
        :GADS1 := SUBSTR(:GADS, 1, 4);
        :GADS2 := SUBSTR(:GADS, -2, 2);
        if :GADS2 = 0 then    
            :GADS3 := :GADS1 || '2000';
        else 
            :GADS3 := :GADS1 || '19'|| :GADS2;      
        end if; 
    
        UPDATE MP_PERSONAS
            SET DZIM_DAT = :GADS3
            WHERE ID = ID.ID;
   END LOOP;
END;