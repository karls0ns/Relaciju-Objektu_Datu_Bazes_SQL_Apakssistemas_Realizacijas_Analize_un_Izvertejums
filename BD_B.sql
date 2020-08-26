create or replace type  B_Nodala_TYPE as object ( 
    ID Number(4),
    Nod_KODS Number(4),
    NODALA VARCHAR2(100),
    ORGAN_KODS Number(9),
    PILSETA VARCHAR2(50),
    RAJONS VARCHAR2(50));

create or replace type  B_Persona_TYPE as object ( 
    ID Number(9),
    NUM Varchar2(9),
    VALSTS Varchar2(3),
    DZIM_DAT VARCHAR2(10),
    Kategorija VARCHAR2(3),
    VARDS VARCHAR2(40),
    UZVARDS VARCHAR2(40),
    TIPS VARCHAR2(1),
    DZIMTE VARCHAR2(1),
    NODALAS_KODS NUMBER(4));

create or replace type  B_Personas as table of   B_Persona_TYPE; 

create table B_SISTEMA(
    Nodala          B_Nodala_TYPE,
    Personas        B_Personas)
    nested table Personas store as B_IEK_TAB;

--Nodalu ierakstîðana tabulâ
DECLARE
    cursor NODALAS_KUR is
        SELECT A.ID,A.NOD_KODS,A.NODALA,A.ORGAN_KODS,A.PILSETA,A.RAJONS
        FROM NodalaS A;
BEGIN    
    FOR ID in NODALAS_KUR
    LOOP   
        INSERT INTO B_SISTEMA values( 
        B_Nodala_TYPE(ID.ID,ID.NOD_KODS,ID.NODALA,ID.ORGAN_KODS,ID.PILSETA,ID.RAJONS),
        B_Personas(B_Persona_TYPE(0,Null,Null,Null,NULL,Null,Null,Null,NUll,Null)));
    END LOOP;
END;
--Nodalu ierakstîðana tabulâ beigas


--Personu ierakstîðana tabulâ
DECLARE
    cursor Personas_KUR is
        SELECT A.ID,A.NUM,A.VALSTS,A.DZIM_DAT,A.Kategorija,A.VARDS,A.UZVARDS,A.TIPS,A.DZIMTE,A.NODALAS_KODS
        FROM Personas A
        where rownum <= 100000;
    BEGIN    
        FOR ID in Personas_KUR
        LOOP   
                insert into TABLE(
                select A.PERSONAS
                    from  B_SISTEMA A
                    where A.NODALA.Nod_KODS = ID.NODALAS_KODS)
                    values (B_Persona_TYPE(ID.ID,ID.NUM,ID.VALSTS,ID.DZIM_DAT,ID.Kategorija,ID.VARDS,ID.UZVARDS,ID.TIPS,ID.DZIMTE,ID.NODALAS_KODS));
        END LOOP;
END;
--Personu ierakstîðana tabulâ beigas  


SET SERVEROUTPUT ON;

begin
DBMS_OUTPUT.PUT_LINE('age');
end;